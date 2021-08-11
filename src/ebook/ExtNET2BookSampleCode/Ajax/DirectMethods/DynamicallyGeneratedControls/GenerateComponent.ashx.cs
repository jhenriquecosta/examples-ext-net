using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Ajax.DirectMethods.DynamicallyGeneratedControls
{
	public class GenerateComponent : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			string containerId = context.Request["container"];

			new Panel { Title = "Hello" }.AddTo(containerId);

			// or
			// var panel = new Panel { Title = "Hello" }
			// panel.InsertTo(0, containerId);
			// 

			// or
			// panel.AddTo(containerId);
			// panel.InsertTo(0, containerId);

			// or
			// new Panel { Title = "Hello" }.Render(containerId, 0, RenderMode.InsertTo);
			// new Panel { Title = "Hello" }.Render(containerId, RenderMode.AddTo);
			// etc.

			new DirectResponse().Return();
		}

		// alternative:
		//public void ProcessRequest(HttpContext context)
		//{
		//    string containerId = context.Request["container"];

		//    var panel = new Panel { Title = "Hello" };

		//    string js = panel.ToScript(RenderMode.AddTo, containerId);

		//    // alternative examples
		//    // string js = panel.ToScript(RenderMode.InsertTo, containerId, 0);

		//    new DirectResponse(js).Return();
		//}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}