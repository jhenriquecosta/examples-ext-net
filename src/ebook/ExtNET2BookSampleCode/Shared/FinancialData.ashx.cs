using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Shared
{
	public class FinancialData : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "application/json";

			var requestParams = new StoreRequestParameters(context);

			int start = requestParams.Start;
			int limit = requestParams.Limit;

			Paging<CompanyData> data = GetData(start, limit);

			context.Response.Write(JSON.Serialize(data));
		}

		private Paging<CompanyData> GetData(int start, int limit)
		{
			var data = CompanyData.GetData();

			int numberToGet = start + limit > data.Count ? data.Count - start : limit;

			return new Paging<CompanyData>(data.GetRange(start, numberToGet), data.Count);
		}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}