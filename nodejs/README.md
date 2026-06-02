# DataCorsa with Node.js

<p align="center">
  <a href="https://www.datacorsa.com/"><img src="../assets/banner.svg" alt="DataCorsa"></a>
</p>

<p align="center">
  <a href="https://github.com/datacorsa/datacorsa">Main repository</a>
</p>

## Overview

These examples use Axios to confirm that Node.js traffic is leaving through DataCorsa. `node.js` covers the HTTPS proxy gateway, and `nodesocks5h.js` covers SOCKS5 with hostname resolution performed by the proxy.

## Prerequisites

- Node.js 18 or newer.
- A DataCorsa account and proxy credentials from [DataCorsa](https://www.datacorsa.com/).

## Gateway Details

| Mode | Endpoint |
| --- | --- |
| HTTP(S) proxy | `https://gw.datacorsa.com:11443` |
| SOCKS5 proxy | `socks5h://gw.datacorsa.com:11444` |
| Test URL | `https://ip.datacorsa.com/json` |

The HTTPS proxy sample sets Axios `proxy.protocol` to `https`, which tells Axios to use TLS when connecting to the proxy gateway.

## Installation

Create a project and install the dependencies:

```bash
npm init -y
npm install axios socks-proxy-agent
```

Download the examples:

```bash
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/nodejs/node.js > node.js
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/nodejs/nodesocks5h.js > nodesocks5h.js
```

## Configuration

Set your proxy username and password:

```bash
export DATACORSA_USER="username"
export DATACORSA_PASS="password"
```

Optional:

```bash
export DATACORSA_TARGET_URL="https://ip.datacorsa.com/json"
```

## Usage

Run through the HTTPS proxy gateway:

```bash
node node.js
```

Run through SOCKS5:

```bash
node nodesocks5h.js
```

The output should be the JSON body returned by the DataCorsa IP-check endpoint.

## Need Help?

- Website: [https://www.datacorsa.com/](https://www.datacorsa.com/)
- Email: [datacorsa.service@gmail.com](mailto:datacorsa.service@gmail.com)
