# DataCorsa with Python

<p align="center">
  <a href="https://www.datacorsa.com/"><img src="../assets/banner.svg" alt="DataCorsa"></a>
</p>

<p align="center">
  <a href="https://github.com/datacorsa/datacorsa">Main repository</a>
</p>

## Overview

These examples show how to send a request through DataCorsa from Python with `requests`. Use `python.py` for the HTTPS proxy gateway and `pythonsocks5h.py` for SOCKS5 with remote DNS resolution.

## Prerequisites

- Python 3.8 or newer.
- A DataCorsa account and proxy credentials from [DataCorsa](https://www.datacorsa.com/).

## Gateway Details

| Mode | Endpoint |
| --- | --- |
| HTTP(S) proxy | `https://gw.datacorsa.com:11443` |
| SOCKS5 proxy | `socks5h://gw.datacorsa.com:11444` |
| Test URL | `https://ip.datacorsa.com/json` |

The HTTP(S) example uses `https://` in the proxy URL because DataCorsa expects clients to connect to the proxy gateway over TLS on port `11443`.

## Installation

Create a small virtual environment and install the HTTP client:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install requests
```

For SOCKS5 support, install the SOCKS extra:

```bash
pip install "requests[socks]"
```

Download the examples:

```bash
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/python/python.py > python.py
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/python/pythonsocks5h.py > pythonsocks5h.py
```

## Configuration

Export your credentials before running either file:

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
python python.py
```

Run through SOCKS5:

```bash
python pythonsocks5h.py
```

A successful run prints the IP-check JSON returned through the DataCorsa exit node.

## Need Help?

- Website: [https://www.datacorsa.com/](https://www.datacorsa.com/)
- Email: [datacorsa.service@gmail.com](mailto:datacorsa.service@gmail.com)
