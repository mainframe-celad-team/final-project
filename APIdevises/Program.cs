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
        var exporters = new List<Exporter>
        {
            new JsonExporter(),
            new XmlExporter(),
            new CSVExporter()
             
        };

        var orchestrator = new ExportOrchestrator(client, mapper, exporters);
        await orchestrator.RunOrchestratorAsync();
    }
}
