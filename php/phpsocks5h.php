<?php

$targetUrl = getenv('DATACORSA_TARGET_URL') ?: 'https://ip.datacorsa.com/json';
$proxyUser = getenv('DATACORSA_USER') ?: 'username';
$proxyPass = getenv('DATACORSA_PASS') ?: 'password';

$handle = curl_init($targetUrl);
curl_setopt_array($handle, [
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_PROXYTYPE => CURLPROXY_SOCKS5_HOSTNAME,
    CURLOPT_PROXY => 'gw.datacorsa.com:11444',
    CURLOPT_PROXYUSERPWD => $proxyUser . ':' . $proxyPass,
    CURLOPT_TIMEOUT => 30,
]);

$body = curl_exec($handle);

if ($body === false) {
    fwrite(STDERR, curl_error($handle) . PHP_EOL);
    curl_close($handle);
    exit(1);
}

curl_close($handle);
echo $body . PHP_EOL;
