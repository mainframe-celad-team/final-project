using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;

namespace APIdevises
{
    internal class XmlExporter : Exporter
    {
        public override string Extension => "xml";

        protected override string GenererContenu(List<Cotation> cotations)
        {
            List<CotationXml> cotationsXml = new List<CotationXml>();
            foreach (Cotation c in cotations)
            {
                cotationsXml.Add(new CotationXml 
                {
                    Code = c.Code,
                    Value = c.Value,
                    Date = c.Date.ToString("yyyy-MM-dd"),
                });
            }
            XmlSerializer ser = new XmlSerializer(typeof(List<CotationXml>));
            using (StringWriter sw = new StringWriter())
            {
                ser.Serialize(sw, cotationsXml);
                return sw.ToString();
            }
        }
    }
}
