using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIdevises
{
    internal class ExportOrchestrator
    {
        private readonly FrankfurterClient _client;
        private readonly CotationMapper _mapper;
        private readonly List<Exporter> _exporters;

        public ExportOrchestrator(
            FrankfurterClient client,
            CotationMapper mapper,
            List<Exporter> exporters)
        {
            _client = client;
            _mapper = mapper;
            _exporters = exporters;
        }
        public async Task RunOrchestratorAsync()
        {
            var menu = new MenuSelection();
            List<Exporter> exportersChoisis = menu.DemanderFormats(_exporters);

            if (exportersChoisis.Count == 0)
            {
                Console.WriteLine("Aucun format d'exportation choisi. Fin du programme.");
                return;
            }

            var rates = await _client.GetRatesAsync("USD");

            var cotations = _mapper.Map(rates);

            if (cotations.Count == 0)
            {
                Console.WriteLine("Aucune cotation à exporter.");
                return;
            }
            
            DateOnly dateExecution = DateOnly.FromDateTime(DateTime.Now);

            foreach (var exporter in _exporters)
            {
                exporter.ExporterVersFichier(cotations, dateExecution);
            }
        }
    }
}
