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

        public void ExporterVersFichier(List<Cotation> cotations, DateOnly date, string outputPath)
        {
            Directory.CreateDirectory(outputPath);
            string nomFichier = $"Cotations-{date:yyyyMMdd}.{Extension}";
            string cheminComplet = Path.GetFullPath(Path.Combine(outputPath, nomFichier));
            string contenu = GenererContenu(cotations);
            File.WriteAllText(cheminComplet, contenu);
            Console.WriteLine($"Fichier généré : {cheminComplet}");
        }
    }
}
