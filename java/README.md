# DataCorsa with Java

[Main repository](../README.md)

## Overview

This Java example uses Apache HttpClient 5 to make a request through DataCorsa's HTTPS proxy gateway.

## Prerequisites

- Java 11 or newer.
- Apache HttpClient 5.
- A DataCorsa account and proxy credentials from [DataCorsa](https://www.datacorsa.com/en/contact/).

## Gateway Details

| Mode | Endpoint |
| --- | --- |
| HTTP(S) proxy | `https://gw.datacorsa.com:11443` |
| Test URL | `https://ip.datacorsa.com/json` |

The sample constructs the proxy as `new HttpHost("https", "gw.datacorsa.com", 11443)`, which tells Apache HttpClient to connect to the proxy gateway with TLS.

Use the account-specific host, port, and username format provided by DataCorsa if they differ from the placeholders above.

## Installation

Download the example:

```bash
curl https://raw.githubusercontent.com/datacorsa/datacorsa/main/java/java.java > java.java
```

For Maven projects, add Apache HttpClient 5:

```xml
<dependency>
  <groupId>org.apache.httpcomponents.client5</groupId>
  <artifactId>httpclient5</artifactId>
  <version>5.3.1</version>
</dependency>
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

Compile and run the example inside a project that has HttpClient 5 on the classpath. For a Maven project, use your normal `mvn compile` / `mvn exec:java` flow. If you compile manually, include HttpClient and its transitive dependencies in `-cp`:

```bash
javac -cp "path/to/httpclient5.jar:path/to/httpcore5.jar:..." java.java
java -cp ".:path/to/httpclient5.jar:path/to/httpcore5.jar:..." \
  -Djdk.http.auth.tunneling.disabledSchemes="" \
  DataCorsaProxyExample
```

Some Java runtimes disable Basic authentication for HTTPS tunneling by default. Passing `-Djdk.http.auth.tunneling.disabledSchemes=""` allows the proxy credentials to be sent during tunnel setup.

The output should be the response body from the DataCorsa IP-check endpoint.

## Need Help?

- Website: [https://www.datacorsa.com/](https://www.datacorsa.com/)
- Contact: [https://www.datacorsa.com/en/contact/](https://www.datacorsa.com/en/contact/)
- Email: [datacorsa.service@gmail.com](mailto:datacorsa.service@gmail.com)
