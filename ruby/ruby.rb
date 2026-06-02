require "base64"
require "openssl"
require "socket"
require "uri"

def env(name, fallback)
  value = ENV[name]
  value.nil? || value.empty? ? fallback : value
end

def read_headers(io)
  buffer = +""
  buffer << io.readpartial(1024) until buffer.include?("\r\n\r\n")
  buffer
end

def read_all(io)
  body = +""
  loop { body << io.readpartial(1024) }
rescue EOFError
  body
end

target = URI(env("DATACORSA_TARGET_URL", "https://ip.datacorsa.com/json"))
unless %w[http https].include?(target.scheme)
  warn "DATACORSA_TARGET_URL must use http or https"
  exit 1
end

proxy_host = "gw.datacorsa.com"
proxy_port = 11_443
proxy_user = env("DATACORSA_USER", "username")
proxy_pass = env("DATACORSA_PASS", "password")

tcp = TCPSocket.new(proxy_host, proxy_port)
proxy_tls = OpenSSL::SSL::SSLSocket.new(tcp)
proxy_tls.hostname = proxy_host if proxy_tls.respond_to?(:hostname=)
proxy_tls.sync_close = true
proxy_tls.connect

target_host = "#{target.host}:#{target.port}"
auth = Base64.strict_encode64("#{proxy_user}:#{proxy_pass}")
proxy_tls.write(
  "CONNECT #{target_host} HTTP/1.1\r\n" \
  "Host: #{target_host}\r\n" \
  "Proxy-Authorization: Basic #{auth}\r\n" \
  "Connection: keep-alive\r\n\r\n"
)

connect_headers = read_headers(proxy_tls)
unless connect_headers.start_with?("HTTP/1.1 200", "HTTP/1.0 200")
  warn connect_headers.lines.first
  exit 1
end

target_io = if target.scheme == "https"
  ssl = OpenSSL::SSL::SSLSocket.new(proxy_tls)
  ssl.hostname = target.host if ssl.respond_to?(:hostname=)
  ssl.sync_close = true
  ssl.connect
  ssl
else
  proxy_tls
end

path = target.query ? "#{target.path}?#{target.query}" : target.path
path = "/" if path.empty?
target_io.write(
  "GET #{path} HTTP/1.1\r\n" \
  "Host: #{target.host}\r\n" \
  "User-Agent: datacorsa-ruby-example/1.0\r\n" \
  "Accept: application/json\r\n" \
  "Connection: close\r\n\r\n"
)

response = read_all(target_io)
puts response.split("\r\n\r\n", 2).last
