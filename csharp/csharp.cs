using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

class Program
{
    static async Task Main()
    {
        string targetUrl = Environment.GetEnvironmentVariable("DATACORSA_TARGET_URL")
            ?? "https://ip.datacorsa.com/json";
        string proxyUser = Environment.GetEnvironmentVariable("DATACORSA_USER") ?? "username";
        string proxyPass = Environment.GetEnvironmentVariable("DATACORSA_PASS") ?? "password";

        var proxy = new WebProxy("https://gw.datacorsa.com:11443")
        {
            UseDefaultCredentials = false,
            Credentials = new NetworkCredential(proxyUser, proxyPass)
        };

        using var handler = new HttpClientHandler
        {
            Proxy = proxy,
            UseProxy = true
        };

        using var client = new HttpClient(handler);
        string body = await client.GetStringAsync(targetUrl);
        Console.WriteLine(body);
    }
}
