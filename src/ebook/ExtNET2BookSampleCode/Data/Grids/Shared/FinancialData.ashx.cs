using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Data.Grids.Shared
{
	public class FinancialData : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "application/json";

			var requestParams = new StoreRequestParameters(context);

			int start = requestParams.Start;
			int limit = requestParams.Limit;

			string filters = context.Request["filter"];
			FilterConditions conditions = null;

			if (!string.IsNullOrWhiteSpace(filters))
			{
				conditions = new FilterConditions(filters);
			}

			Paging<CompanyData> data = GetData(start, limit, conditions);

			context.Response.Write(JSON.Serialize(data));
		}

		private Paging<CompanyData> GetData(int start, int limit, FilterConditions conditions)
		{
			var data = CompanyData.GetData();

			// apply conditions first then return paged from the filtered set

			int numberToGet = start + limit > data.Count ? data.Count - start : limit;

			return new Paging<CompanyData>(data.GetRange(start, numberToGet), data.Count);
		}

		// Used by the client side paging example
		private Paging<CompanyData> GetData()
		{
			var data = CompanyData.GetData();

			return new Paging<CompanyData>(data, data.Count);
		}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}