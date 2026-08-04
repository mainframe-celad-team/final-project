using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;
using System.Net.Http.Json;

namespace APIdevises
{
    internal class FrankfurterClient
    {
        private readonly HttpClient _http = new HttpClient();
        private readonly string _baseUrl;

        public FrankfurterClient(string baseUrl)
        {
            _baseUrl = baseUrl;
        }

        public async Task<List<RateDto>> GetRatesAsync(string baseCurrency = "USD")
        {
            string url = $"{_baseUrl}?base={baseCurrency}";
            List<RateDto>? rates = await _http.GetFromJsonAsync<List<RateDto>>(url);
            return rates ?? new List<RateDto>();
        }
    }
}