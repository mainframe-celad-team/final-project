using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIdevises
{
    internal class RateDto
    {
        public DateOnly? Date { get; set; }
        public string? Base { get; set; }
        public string? Quote { get; set; }
        public decimal? Rate { get; set; }
    }
}
