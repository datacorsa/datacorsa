<p align="center">
  <a href="https://www.datacorsa.com/"><img src="assets/banner.svg" alt="DataCorsa — Global Proxy & Web Data Infrastructure"></a>
</p>

<h2 align="center">
  Global Proxy Network & Web Data Infrastructure
</h2>

<p align="center">
Access 150M+ high-quality residential, ISP, datacenter and mobile IPs across 195+ countries with <a href="https://www.datacorsa.com/">DataCorsa</a> — the all-in-one proxy and web data platform for large-scale scraping, multi-account management, ad verification, and AI training data.
</p>

## List of contents

- [What is DataCorsa?](#what-is-datacorsa)
- [How does it work?](#how-does-it-work)
- [Getting started](#getting-started)
- [Quick example](#quick-example)
- [Types](#types)
- [Locations](#locations)
- [Use cases](#use-cases)
- [Integrations](#integrations)
- [License](#license)
- [Contact](#contact)

## What is DataCorsa?

[DataCorsa](https://www.datacorsa.com/) is a global proxy network and web data infrastructure platform. We aggregate the world's top proxy resources behind a single unified API — 150M+ real residential IPs, carrier-grade static ISP IPs, real 4G/5G mobile devices, and a high-performance datacenter pool — all reachable from one gateway.

You can use rotating proxies that change with every new request, or sticky IP sessions that hold the same IP for up to 7 days. On top of the network we ship higher-level products such as the AI-powered **Web Unblocker** and a fully managed **Scraper API**, so you can go from "I need this site's data" to structured JSON without writing your own anti-bot stack.

Looking for static residential IPs instead? Check out our [ISP proxies](https://www.datacorsa.com/products/isp-proxies). Need raw speed for in-house targets? Our [datacenter proxies](https://www.datacorsa.com/products/datacenter-proxies) offer sub-second responses with unlimited bandwidth.

## How does it work?

Getting started with DataCorsa is simple. From the [dashboard](https://www.datacorsa.com/) you pick a product (residential, ISP, mobile, datacenter), a session type (rotating or sticky), and an optional geo target (country, state, city, ZIP, ASN). The system gives you an endpoint in `host:port` format you can drop straight into your code or scraping tool.

There are 2 authentication options: **username:password** and **whitelisted IP**. Username/password works from anywhere; IP whitelisting lets you skip auth entirely when running from a fixed server. See the [quick start guide](https://www.datacorsa.com/resources/docs) for the full setup walkthrough.

## Getting started

1. [Register for a DataCorsa account](https://www.datacorsa.com/).
2. [Choose a plan](https://www.datacorsa.com/pricing).
3. Generate your proxy endpoint from the dashboard.
4. Drop the endpoint + credentials into your code (see [Integrations](#integrations)).

<br>

## Quick example

Test your credentials against our IP-check endpoint with a single `curl`:

```bash
# HTTP(S) proxy
curl -x https://gw.datacorsa.com:11443 -U "username:password" https://ip.datacorsa.com/json

# SOCKS5 proxy
curl --socks5-hostname gw.datacorsa.com:11444 -U "username:password" https://ip.datacorsa.com/json
```

If everything is wired up, you'll see a JSON response with the exit IP, country, city and ASN — confirmation that your request just left DataCorsa from a real residential device.

## Types

<p align="center">
  <img src="assets/proxy-types.svg" alt="DataCorsa proxy product lineup">
</p>

### Residential

Residential proxies use IPs from real home broadband devices assigned by ISPs around the world. They sit between your scraper and the target site and make traffic indistinguishable from a regular user on a regular device. Perfect for bypassing IP blocks, rate limits, and CAPTCHAs on hard targets.

### ISP

ISP proxies are static residential IPs hosted in datacenters but registered to consumer ISPs. They combine the trust of a real residential IP with the bandwidth and uptime of a datacenter — ideal for long-lived sessions, account management, and ad-tech workloads.

### Datacenter

High-performance datacenter IPs with sub-second response and unlimited bandwidth. The best price-per-request for large-scale crawling of friendlier targets, internal tools, and uptime / availability monitoring.

### Mobile

A mobile proxy is an exit out of a real mobile device on a real mobile carrier (4G/5G). They post the highest success rates against the most aggressive anti-bot systems, with carrier-, city-, and ASN-level targeting across 700+ ASNs (Verizon, T-Mobile, O2, EE, and more).

### Web Unblocker

An AI-powered unblocking engine. You send a target URL, we handle browser fingerprinting, JS rendering, CAPTCHA solving, and IP rotation — and return the rendered HTML (or structured fields). Pay per successful request, not per attempt.

### Scraper API

End-to-end data collection as a service. Ready-made templates for popular sites, RESTful API, async batch jobs, structured JSON / CSV output, and SDKs for the major languages.

## Locations

DataCorsa covers 195+ countries and regions worldwide — UK, US, Germany, India, Canada, Japan, Brazil, and many more — with city-, state-, ZIP-, ISP- and ASN-level targeting. [See the full list](https://www.datacorsa.com/resources/global-proxies).

<p align="center">
  <img src="assets/locations.svg" alt="DataCorsa global IP coverage">
</p>

## Use cases

- **E-commerce** — price and inventory monitoring on Amazon, eBay, Shopify, and regional marketplaces.
- **SEO** — multi-region keyword rank tracking and SERP snapshotting on Google, Bing, Baidu.
- **Ad verification** — verify placement, creative, and geo-targeting; detect ad fraud.
- **AI training data** — high-volume, high-quality web data for LLMs, NLP, and computer vision.
- **Market research** — sentiment, reviews, and competitor analysis at scale.
- **Travel** — global flight and hotel price aggregation.
- **Brand protection** — counterfeit listing detection across marketplaces.
- **Cybersecurity research** — region-aware threat intelligence and phishing-site discovery.

## Integrations

This repository contains minimal working integration examples for the most common languages and tools. Each subdirectory has its own README with prerequisites, setup, and a "run this and you should see your exit IP" walkthrough.

- [Bash / cURL](./shell)
- [C#](./csharp)
- [Go](./golang)
- [Java](./java)
- [Node.js](./nodejs) — HTTP(S) and SOCKS5
- [PHP](./php) — HTTP(S) and SOCKS5
- [Python](./python) — HTTP(S) and SOCKS5
- [Ruby](./ruby)

Tested and compatible with Puppeteer, Playwright, Selenium, Scrapy, Beautiful Soup, Cheerio.js, and any HTTP client that speaks standard HTTP(S) or SOCKS5 proxies.

## License

All code in this repository is released under the [MIT License](./LICENSE).

## Contact

- 🌐 Website — [https://www.datacorsa.com/](https://www.datacorsa.com/)
- ✉️ Email — [datacorsa.service@gmail.com](mailto:datacorsa.service@gmail.com)
- 📚 Docs — [https://www.datacorsa.com/resources/docs](https://www.datacorsa.com/resources/docs)
