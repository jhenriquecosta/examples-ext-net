using System.Collections.Generic;
using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Data.XTemplates.Basic
{
	public class DataUpdaterMultiple : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			// context.Response.ContentType = "application/json";

			var items = new List<TemplateData>();

			for (int i = 1; i < 11; i++)
			{
				items.Add(new TemplateData
				{
					FirstName = "First Name " + i,
					LastName = "Last Name " + i,
					Info1 = "Info 1." + i,
					Info2 = "Info 2." + i
				});
			}

			// context.Response.Write(JSON.Serialize(items));

			// This can be more elegant than the raw context.Response approach
			// but I leave it in here so you can see what is going on under the hoods

			new DirectResponse { Result = items }.Return();
		}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}