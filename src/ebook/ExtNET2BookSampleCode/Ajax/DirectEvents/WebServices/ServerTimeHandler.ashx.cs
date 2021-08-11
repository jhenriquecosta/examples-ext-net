using System;
using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Ajax.DirectEvents.WebServices
{
	public class ServerTimeHandler : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			new Window("Server time", Icon.Time)
			{
				ID = "MyWindow",
				Html = DateTime.Now.ToString()
			}.Render();

			new DirectResponse().Return();
		}

		// Alternative:
		//public void ProcessRequest(HttpContext context)
		//{
		//    var window = new Window("Server time", Icon.Time)
		//    {
		//        ID = "MyWindow",
		//        Html = DateTime.Now.ToString()
		//    };

		//    new DirectResponse(window.ToScript()).Return();
		//}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}