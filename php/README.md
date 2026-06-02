# DataCorsa with PHP

<p align="center">
  <a href="https://www.datacorsa.com/"><img src="../assets/banner.svg" alt="DataCorsa"></a>
</p>

<p align="center">
  <a href="https://github.com/datacorsa/datacorsa">Main repository</a>
</p>

## Overview

These PHP examples use cURL to request the DataCorsa IP-check endpoint through either the HTTPS proxy gateway or the SOCKS5 gateway.

## Prerequisites

- PHP with the cURL extension enabled.
- A DataCorsa account and proxy credentials from [DataCorsa](https://www.datacorsa.com/).

## Gateway Details

| Mode | Endpoint |
| --- | --- |
| HTTP(S) proxy | `https://gw.datacorsa.com:11443` |
| SOCKS5 proxy | `gw.datacorsa.com:11444` |
| Test URL | `https://ip.datacorsa.com/json` |

The HTTPS proxy example passes `https://gw.datacorsa.com:11443` to `CURLOPT_PROXY`, so your PHP/cURL build must support HTTPS proxies.

## Installation

Download both examples:

```bash
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/php/php.php > php.php
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/php/phpsocks5h.php > phpsocks5h.php
```

## Configuration

Set your credentials:

```bash
export DATACORSA_USER="username"
export DATACORSA_PASS="password"
```

Optional:

```bash
export DATACORSA_TARGET_URL="https://ip.datacorsa.com/json"
```

## Usage

Run the HTTPS proxy example from the command line:

```bash
php php.php
```

Run the SOCKS5 example:

```bash
php phpsocks5h.php
```

The response should show the DataCorsa exit IP and related location metadata.

## Need Help?

- Website: [https://www.datacorsa.com/](https://www.datacorsa.com/)
- Email: [datacorsa.service@gmail.com](mailto:datacorsa.service@gmail.com)
