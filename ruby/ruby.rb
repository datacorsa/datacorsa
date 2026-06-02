require "net/http"
require "uri"

def env(name, fallback)
  value = ENV[name]
  value.nil? || value.empty? ? fallback : value
end

target_uri = URI(env("DATACORSA_TARGET_URL", "https://ip.datacorsa.com/json"))
proxy_host = "gw.datacorsa.com"
proxy_port = 11_443
proxy_user = env("DATACORSA_USER", "username")
proxy_pass = env("DATACORSA_PASS", "password")

proxy_class = Net::HTTP::Proxy(proxy_host, proxy_port, proxy_user, proxy_pass)
request = Net::HTTP::Get.new(target_uri)

response = proxy_class.start(target_uri.host, target_uri.port, use_ssl: target_uri.scheme == "https") do |http|
  http.request(request)
end

puts response.body
