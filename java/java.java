import java.io.IOException;

import org.apache.hc.client5.http.auth.AuthScope;
import org.apache.hc.client5.http.auth.UsernamePasswordCredentials;
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.config.RequestConfig;
import org.apache.hc.client5.http.impl.auth.BasicCredentialsProvider;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.HttpHost;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.util.Timeout;

class DataCorsaProxyExample {
    private static String env(String name, String fallback) {
        String value = System.getenv(name);
        return value == null || value.isBlank() ? fallback : value;
    }

    public static void main(String[] args) throws IOException {
        String targetUrl = env("DATACORSA_TARGET_URL", "https://ip.datacorsa.com/json");
        String proxyUser = env("DATACORSA_USER", "username");
        String proxyPass = env("DATACORSA_PASS", "password");

        HttpHost proxy = new HttpHost("https", "gw.datacorsa.com", 11443);
        BasicCredentialsProvider credentials = new BasicCredentialsProvider();
        credentials.setCredentials(
                new AuthScope(proxy),
                new UsernamePasswordCredentials(proxyUser, proxyPass.toCharArray()));

        RequestConfig requestConfig = RequestConfig.custom()
                .setProxy(proxy)
                .setResponseTimeout(Timeout.ofSeconds(30))
                .build();

        try (CloseableHttpClient client = HttpClients.custom()
                .setDefaultCredentialsProvider(credentials)
                .setDefaultRequestConfig(requestConfig)
                .build()) {
            HttpGet request = new HttpGet(targetUrl);
            try (CloseableHttpResponse response = client.execute(request)) {
                System.out.println(EntityUtils.toString(response.getEntity()));
            }
        }
    }
}
