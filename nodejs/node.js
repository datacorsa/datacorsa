const axios = require("axios");

const targetUrl = process.env.DATACORSA_TARGET_URL || "https://ip.datacorsa.com/json";
const proxyUser = process.env.DATACORSA_USER || "username";
const proxyPass = process.env.DATACORSA_PASS || "password";

async function run() {
  const response = await axios.get(targetUrl, {
    proxy: {
      protocol: "https",
      host: "gw.datacorsa.com",
      port: 11443,
      auth: {
        username: proxyUser,
        password: proxyPass,
      },
    },
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
