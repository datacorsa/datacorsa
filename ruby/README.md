# DataCorsa with Ruby

[Main repository](../README.md)

## Overview

This Ruby example uses the standard `socket` and `openssl` libraries to connect to DataCorsa's HTTPS proxy gateway, open a `CONNECT` tunnel, and request the IP-check endpoint.

## Prerequisites

- Ruby 3.0 or newer.
- A DataCorsa account and proxy credentials from [DataCorsa](https://www.datacorsa.com/en/contact/).

## Gateway Details

| Mode | Endpoint |
| --- | --- |
| HTTP(S) proxy | `https://gw.datacorsa.com:11443` |
| Test URL | `https://ip.datacorsa.com/json` |

Ruby's built-in `Net::HTTP::Proxy` accepts proxy host and port separately, but it does not clearly express an HTTPS proxy URI. This example uses a lower-level TLS connection so the `https://` proxy gateway behavior is explicit.

Use the account-specific host, port, and username format provided by DataCorsa if they differ from the placeholders above.

## Installation

Download the example:

```bash
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/ruby/ruby.rb > ruby.rb
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

Run the file:

```bash
ruby ruby.rb
```

A working connection prints the IP-check response received through DataCorsa.

## Need Help?

- Website: [https://www.datacorsa.com/](https://www.datacorsa.com/)
- Contact: [https://www.datacorsa.com/en/contact/](https://www.datacorsa.com/en/contact/)
- Email: [datacorsa.service@gmail.com](mailto:datacorsa.service@gmail.com)
