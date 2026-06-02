# DataCorsa with Bash and cURL

[Main repository](../README.md)

## Overview

This directory contains a compact shell example for checking a DataCorsa proxy connection from any terminal that has `curl`. It can use the HTTPS proxy gateway or the SOCKS5 gateway and prints the response from the DataCorsa IP-check endpoint.

## Prerequisites

- A shell such as Bash, Zsh, PowerShell, or Command Prompt.
- `curl` installed and available on your `PATH`.
- A DataCorsa account and proxy credentials from [DataCorsa](https://www.datacorsa.com/en/contact/).

## Gateway Details

| Mode | Endpoint |
| --- | --- |
| HTTP(S) proxy | `https://gw.datacorsa.com:11443` |
| SOCKS5 proxy | `gw.datacorsa.com:11444` |
| Test URL | `https://ip.datacorsa.com/json` |

The `https://` scheme on the HTTP(S) proxy is intentional: the client opens a TLS connection to the proxy gateway before tunneling your target request.

Use the account-specific host, port, and username format provided by DataCorsa if they differ from the placeholders above.

## Installation

Download the example from this repository:

```bash
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/shell/shell.sh > shell.sh
chmod +x shell.sh
```

You can also copy `shell.sh` directly from this directory.

## Configuration

Set your credentials as environment variables:

```bash
export DATACORSA_USER="username"
export DATACORSA_PASS="password"
```

To test a different URL, set `DATACORSA_TARGET_URL`:

```bash
export DATACORSA_TARGET_URL="https://ip.datacorsa.com/json"
```

## Usage

Run through the HTTPS proxy gateway:

```bash
./shell.sh https
```

Run through the SOCKS5 gateway:

```bash
./shell.sh socks5
```

If the proxy is authenticated correctly, the response should include the exit IP and location details for the DataCorsa route.

## Need Help?

- Website: [https://www.datacorsa.com/](https://www.datacorsa.com/)
- Contact: [https://www.datacorsa.com/en/contact/](https://www.datacorsa.com/en/contact/)
- Email: [datacorsa.service@gmail.com](mailto:datacorsa.service@gmail.com)
