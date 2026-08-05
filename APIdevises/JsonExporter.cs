using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace APIdevises
{
    internal class JsonExporter : Exporter
    {
        protected override string Extension => "json";

        protected override string GenererContenu(List<Cotation> cotations)
        {
            return JsonSerializer.Serialize(cotations, new JsonSerializerOptions
            {
                WriteIndented = true
            });

        }
    }
}
