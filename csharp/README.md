# DataCorsa with C#

<p align="center">
  <a href="https://www.datacorsa.com/"><img src="../assets/banner.svg" alt="DataCorsa"></a>
</p>

<p align="center">
  <a href="https://github.com/datacorsa/datacorsa">Main repository</a>
</p>

## Overview

This C# example creates an `HttpClient` with a `WebProxy` and requests DataCorsa's IP-check endpoint through the HTTPS proxy gateway.

## Prerequisites

- .NET 6 or newer.
- A DataCorsa account and proxy credentials from [DataCorsa](https://www.datacorsa.com/).

## Gateway Details

| Mode | Endpoint |
| --- | --- |
| HTTP(S) proxy | `https://gw.datacorsa.com:11443` |
| Test URL | `https://ip.datacorsa.com/json` |

The `WebProxy` address includes `https://` so the .NET handler knows to connect to DataCorsa's proxy gateway over TLS.

## Installation

Download the example:

```bash
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/csharp/csharp.cs > csharp.cs
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

Create a console project and replace `Program.cs` with this example, or compile it in your preferred C# environment:

```bash
dotnet new console -n datacorsa-csharp
cp csharp.cs datacorsa-csharp/Program.cs
dotnet run --project datacorsa-csharp
```

The program prints the body returned through DataCorsa.

## Need Help?

- Website: [https://www.datacorsa.com/](https://www.datacorsa.com/)
- Email: [datacorsa.service@gmail.com](mailto:datacorsa.service@gmail.com)
