using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Data.ComboBox.HtmlSelect
{
	public class CountryData : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "application/json";

			var requestParams = new StoreRequestParameters(context);

			int start = requestParams.Start;
			int limit = requestParams.Limit;

			var data = CountryInfo.GetData(start, limit);
			var total = CountryInfo.TotalDataCount;

			var countries = new Paging<CountryInfo>(data, total);

			context.Response.Write(JSON.Serialize(countries));
		}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}