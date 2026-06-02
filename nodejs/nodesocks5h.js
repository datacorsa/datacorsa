const axios = require("axios");
const { SocksProxyAgent } = require("socks-proxy-agent");

const targetUrl = process.env.DATACORSA_TARGET_URL || "https://ip.datacorsa.com/json";
const proxyUser = encodeURIComponent(process.env.DATACORSA_USER || "username");
const proxyPass = encodeURIComponent(process.env.DATACORSA_PASS || "password");
const proxyUrl = `socks5h://${proxyUser}:${proxyPass}@gw.datacorsa.com:11444`;
const proxyAgent = new SocksProxyAgent(proxyUrl);

async function run() {
  const response = await axios.get(targetUrl, {
    httpAgent: proxyAgent,
    httpsAgent: proxyAgent,
    proxy: false,
    timeout: 30000,
  });

  console.log(response.data);
}

run().catch((error) => {
  if (error.response) {
    console.error(error.response.status, error.response.data);
  } else {
    console.error(error.message);
  }
  process.exitCode = 1;
});
