using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIdevises
{
    internal class Cotation
    {
        public required string  Code { get; init; }
        public required decimal Value { get; init; }
        public required DateOnly Date { get; init; }
    }
}
