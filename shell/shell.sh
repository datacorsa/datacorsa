#!/usr/bin/env bash
set -euo pipefail

mode="${1:-https}"
target_url="${DATACORSA_TARGET_URL:-https://ip.datacorsa.com/json}"
proxy_user="${DATACORSA_USER:-username}"
proxy_pass="${DATACORSA_PASS:-password}"

case "$mode" in
  https)
    curl --proxy "https://gw.datacorsa.com:11443" \
      --proxy-user "${proxy_user}:${proxy_pass}" \
      "$target_url"
    ;;
  socks5)
    curl --socks5-hostname "gw.datacorsa.com:11444" \
      --proxy-user "${proxy_user}:${proxy_pass}" \
      "$target_url"
    ;;
  *)
    printf 'Usage: %s [https|socks5]\n' "$0" >&2
    exit 2
    ;;
esac
