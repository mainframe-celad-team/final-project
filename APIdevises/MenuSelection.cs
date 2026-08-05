using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIdevises
{
    internal class MenuSelection
    {
        public List<Exporter> DemanderFormats(List<Exporter> exportersDisponibles)
        {
            Console.WriteLine("Formats disponibles :");

            for (int i = 0; i < exportersDisponibles.Count; i++)
            {
                string extension = exportersDisponibles[i].Extension.ToUpper();
                Console.WriteLine($"  {i + 1}. {extension}");
            }

            Console.Write("Votre choix (ex: 1,2,etc...) : ");
            string? saisie = Console.ReadLine();

            List<int> selections = new List<int>();
            if (!string.IsNullOrEmpty(saisie))
            {
                string[] parties = saisie.Split(',');
                foreach (string partie in parties)
                {
                    if (int.TryParse(partie.Trim(), out int index))
                    {
                        selections.Add(index - 1);
                    }
                }
            }

            List<Exporter> exportersChoisis = new List<Exporter>();
            foreach (int index in selections)
            {
                if (index >= 0 && index < exportersDisponibles.Count)
                {
                    exportersChoisis.Add(exportersDisponibles[index]);
                }
            }
            return exportersChoisis;
        }
    }
}
         
