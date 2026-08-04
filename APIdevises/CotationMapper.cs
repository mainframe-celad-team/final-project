using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIdevises
{
    internal class CotationMapper
    {
        public List<Cotation> Map(List<RateDto> dtos)
        {
            var cotations = new List<Cotation>();

            foreach (var dto in dtos)
            {
                if (dto.Quote is null || dto.Rate is null || dto.Date is null)
                {
                    continue;
                }

                var cotation = new Cotation
                {
                    Code = dto.Quote,
                    Value = dto.Rate.Value,
                    Date = dto.Date.Value
                };

                cotations.Add(cotation);
            }

            return cotations;
        }
    }
}