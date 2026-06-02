package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"net/url"
	"os"
)

func env(name, fallback string) string {
	if value := os.Getenv(name); value != "" {
		return value
	}
	return fallback
}

func main() {
	targetURL := env("DATACORSA_TARGET_URL", "https://ip.datacorsa.com/json")
	proxyUser := env("DATACORSA_USER", "username")
	proxyPass := env("DATACORSA_PASS", "password")

	proxyURL := &url.URL{
		Scheme: "https",
		User:   url.UserPassword(proxyUser, proxyPass),
		Host:   "gw.datacorsa.com:11443",
	}

	client := &http.Client{
		Transport: &http.Transport{
			Proxy: http.ProxyURL(proxyURL),
		},
	}

	response, err := client.Get(targetURL)
	if err != nil {
		log.Fatal(err)
	}
	defer response.Body.Close()

	var payload map[string]any
	if err := json.NewDecoder(response.Body).Decode(&payload); err != nil {
		log.Fatal(err)
	}

	fmt.Println(payload)
}
