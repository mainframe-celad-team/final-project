using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIdevises
{
    internal class TSOExporter : Exporter
    {
        public override string Extension => "data";

        protected override string GenererContenu(List<Cotation> cotations)
        {
            string contenu = "";
            foreach (var cotation in cotations)
            {
                string value = ((long)(cotation.Value * 1_000_000)).ToString("D14");
                contenu += $"{cotation.Code}{value}{cotation.Date:yyyy-MM-dd}\n";
            }
            return contenu;
        }
    }
}
