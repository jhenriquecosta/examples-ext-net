using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Data.DataView.Simple.ServerRevealingMoreDataLater
{
	public class EmployeesRetriever : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "application/json";

			var requestParams = new StoreRequestParameters(context);

			int start = requestParams.Start;
			int limit = requestParams.Limit;
			string firstNameFilter = requestParams.Filter.Length > 0 ? requestParams.Filter[0].Value : null;
			bool sortByLastNameDescending = requestParams.Sort.Length > 0;

			Paging<Employee> employees = GetData(firstNameFilter, start, limit, sortByLastNameDescending);

			context.Response.Write(JSON.Serialize(employees));
		}

		private Paging<Employee> GetData(string firstNameFilter, int start, int limit, bool sortByLastNameDescending)
		{
			var employees = string.IsNullOrWhiteSpace(firstNameFilter)
								? Employee.Employees
								: Employee.Employees.FindAll(employee => employee.FirstName.Contains(firstNameFilter));

			int totalNumber = employees.Count;

			if (sortByLastNameDescending)
			{
				employees.Sort((employee1, employee2) => employee2.LastName.CompareTo(employee1.LastName));
			}

			int numberToGet = start + limit > totalNumber ? totalNumber - start : limit;

			return new Paging<Employee>(employees.GetRange(start, numberToGet), totalNumber);
		}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}