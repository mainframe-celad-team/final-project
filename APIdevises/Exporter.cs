using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIdevises
{
    internal abstract class Exporter
    {
        public abstract string Extension { get; }

        protected abstract string GenererContenu(List<Cotation> cotations);

        public void ExporterVersFichier(List<Cotation> cotations, DateOnly date)
        {
            string nomFichier = $"Cotations-{date:yyyyMMdd}.{Extension}";
            string contenu = GenererContenu(cotations);
            File.WriteAllText(nomFichier, contenu);
            Console.WriteLine($"Fichier généré : {nomFichier}");
        }

    }
}
