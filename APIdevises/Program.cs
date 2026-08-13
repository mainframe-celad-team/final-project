using System.Reflection;
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
        var mapper = new CotationMapper();
        var exporters = Assembly.GetExecutingAssembly()
            .GetTypes()
            .Where(t => t.IsSubclassOf(typeof(Exporter)) && !t.IsAbstract)
            .Select(t => (Exporter)Activator.CreateInstance(t)!)
            .ToList();
        var orchestrator = new ExportOrchestrator(client, mapper, exporters);
        await orchestrator.RunOrchestratorAsync();
    }
}
