using APIdevises;
using Microsoft.Extensions.Configuration;

internal class Program
{
    private static async Task Main(string[] args)
    {
        IConfiguration config = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json")
            .Build();

        string baseUrl = config["Frankfurter:BaseUrl"] 
            ?? throw new InvalidOperationException("Configuration manquante : Frankfurter:BaseUrl");

        var client = new FrankfurterClient(baseUrl);
        List<RateDto> rates = await client.GetRatesAsync("USD");

        Console.WriteLine($"Nombre de taux reçus : {rates.Count}");

        foreach (var r in rates.Take(5))
        {
            Console.WriteLine($"{r.Quote} = {r.Rate} (base {r.Base}, {r.Date})");
        }


        var cotationMapper = new CotationMapper();
        var cotations = cotationMapper.Map(rates);
        Console.WriteLine($"Nombre de cotations mappées : {cotations.Count}");



        foreach (var c in cotations.Take(5))
        {
            Console.WriteLine($"{c.Code} = {c.Value} (date : {c.Date})");
        }
    }
}