using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Data.DataView.Simple.ServerPaging
{
	public class EmployeesRetriever : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "application/json";

			var requestParams = new StoreRequestParameters(context);

			int start = requestParams.Start;
			int limit = requestParams.Limit;

			Paging<Employee> employees = GetData(start, limit);

			context.Response.Write(JSON.Serialize(employees));
		}

		private Paging<Employee> GetData(int start, int limit)
		{
			var employees = Employee.Employees;
			int totalNumber = employees.Count;
			int numberToGet = start + limit > totalNumber ? totalNumber - start : limit;
			return new Paging<Employee>(Employee.Employees.GetRange(start, numberToGet), totalNumber);
		}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}