import os

import requests


TARGET_URL = os.getenv("DATACORSA_TARGET_URL", "https://ip.datacorsa.com/json")
PROXY_USER = os.getenv("DATACORSA_USER", "username")
PROXY_PASS = os.getenv("DATACORSA_PASS", "password")
PROXY_URL = f"https://{PROXY_USER}:{PROXY_PASS}@gw.datacorsa.com:11443"


def main() -> None:
    proxies = {
        "http": PROXY_URL,
        "https": PROXY_URL,
    }
    response = requests.get(TARGET_URL, proxies=proxies, timeout=30)
    response.raise_for_status()
    print(response.text)


if __name__ == "__main__":
    main()
