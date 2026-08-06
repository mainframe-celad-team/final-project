using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIdevises
{
    public class CotationXml
    {
        public required string  Code { get; init; }
        public required decimal Value { get; init; }
        public required string Date { get; init; }

    }
}
