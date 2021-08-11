using System;
using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Data.XTemplates.Basic
{
	public class TemplateData
	{
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string Info1 { get; set; }
		public string Info2 { get; set; }
	}

	public class DataUpdater : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			var data = new TemplateData
			{
				FirstName = "Joe",
				LastName = "Bloggs1",
				Info1 = DateTime.Now.ToLongDateString(),
				Info2 = DateTime.Now.ToLongTimeString()
			};

			new DirectResponse { Result = data }.Return();

			// Alternative:
			//context.Response.ContentType = "application/json";

			//var data = new TemplateData
			//{
			//    FirstName = "Joe",
			//    LastName = "Bloggs1",
			//    Info1 = DateTime.Now.ToLongDateString(),
			//    Info2 = DateTime.Now.ToLongTimeString()
			//};

			//context.Response.Write(JSON.Serialize(data));
		}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}