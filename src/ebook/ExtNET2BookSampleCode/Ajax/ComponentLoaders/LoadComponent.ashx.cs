using System.Collections.Generic;
using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Ajax.ComponentLoaders
{
	public class LoadComponent : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "application/json";

			ComponentLoader.Render(new List<AbstractComponent>
			{ 
				new Panel { Title="Item 1", Icon = Icon.UserBrown },
				new Panel { Title="Item 2", Icon = Icon.UserGray },
				new Panel { Title="Item 3", Icon = Icon.UserGreen }
			});
		}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}