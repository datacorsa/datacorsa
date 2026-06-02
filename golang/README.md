# DataCorsa with Go

<p align="center">
  <a href="https://www.datacorsa.com/"><img src="../assets/banner.svg" alt="DataCorsa"></a>
</p>

<p align="center">
  <a href="https://github.com/datacorsa/datacorsa">Main repository</a>
</p>

## Overview

This Go example builds an `http.Client` with a DataCorsa proxy URL and requests the IP-check endpoint. It is intentionally small so you can reuse the `Transport` setup in crawlers, CLIs, workers, and services.

## Prerequisites

- Go 1.18 or newer.
- A DataCorsa account and proxy credentials from [DataCorsa](https://www.datacorsa.com/).

## Gateway Details

| Mode | Endpoint |
| --- | --- |
| HTTP(S) proxy | `https://gw.datacorsa.com:11443` |
| Test URL | `https://ip.datacorsa.com/json` |

The proxy URL scheme is `https`, which means Go establishes a TLS connection to the DataCorsa proxy gateway before sending the request through it.

## Installation

Download the example:

```bash
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/golang/golang.go > golang.go
```

## Configuration

Export your credentials:

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
go run golang.go
```

The program prints the decoded JSON response from DataCorsa's IP-check endpoint.

## Need Help?

- Website: [https://www.datacorsa.com/](https://www.datacorsa.com/)
- Email: [datacorsa.service@gmail.com](mailto:datacorsa.service@gmail.com)
