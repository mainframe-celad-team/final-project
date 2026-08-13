using ServiceStack.Text;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIdevises
{
    internal class CSVExporter : Exporter
    {
        public override string Extension => "csv" ;

        protected override string GenererContenu(List<Cotation> cotations)
        {
            
          string data=  CsvSerializer.SerializeToCsv(cotations);

            return data;






        }
    }
}
