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
        string outputPath = config["Export:OutputPath"] ?? "export";

        var client = new FrankfurterClient(baseUrl);
        var mapper = new CotationMapper();
        var exporters = new List<Exporter>
        {
            new JsonExporter(),
            new XmlExporter(),
            new CSVExporter(),
            new TSOExporter()
        };

        var orchestrator = new ExportOrchestrator(client, mapper, exporters, outputPath);
        await orchestrator.RunOrchestratorAsync();
    }
}
