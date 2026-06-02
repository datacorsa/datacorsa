# DataCorsa with Ruby

<p align="center">
  <a href="https://www.datacorsa.com/"><img src="../assets/banner.svg" alt="DataCorsa"></a>
</p>

<p align="center">
  <a href="https://github.com/datacorsa/datacorsa">Main repository</a>
</p>

## Overview

This Ruby example uses `Net::HTTP::Proxy` to route an HTTPS request through DataCorsa and print the IP-check response.

## Prerequisites

- Ruby 3.0 or newer.
- A DataCorsa account and proxy credentials from [DataCorsa](https://www.datacorsa.com/).

## Gateway Details

| Mode | Endpoint |
| --- | --- |
| HTTP(S) proxy | `gw.datacorsa.com:11443` |
| Test URL | `https://ip.datacorsa.com/json` |

Ruby's built-in `Net::HTTP::Proxy` accepts proxy host and port separately. If your deployment must connect to the proxy gateway itself with an explicit `https://` proxy URI, verify support in your Ruby/runtime version or use a client library that supports HTTPS proxy URLs directly.

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
- Email: [datacorsa.service@gmail.com](mailto:datacorsa.service@gmail.com)
