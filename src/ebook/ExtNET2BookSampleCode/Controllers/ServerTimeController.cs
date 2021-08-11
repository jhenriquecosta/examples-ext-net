using System;
using System.Web.Mvc;
using Ext.Net;
using Ext.Net.MVC;

namespace ExtNET2BookSampleCode.Controllers
{
	[DirectController]
	public class ServerTimeController : Controller
	{
		//
		// GET: /ServerTime/
		public ActionResult Index()
		{
			return View();
		}

		//
		// GET: /ServerTime/GetTime
		public ActionResult GetTime()
		{
			new Window("Server time", Icon.Time)
			{
				ID = "MyWindow",
				Html = string.Format("Server time is {0}", DateTime.Now)
			}.Render();

			return this.Direct();

			// or instead of .Render()
			//X.Js.AddScript(window.ToScript());
			//return this.Direct();    

			// or
			//var window = new Window("Server time", Icon.Time)
			//{
			//    ID = "MyWindow",
			//    Html = string.Format("Server time is {0}", DateTime.Now)
			//};

			//return new DirectResult(window.ToScript());
		}

		[DirectMethod]
		public ActionResult GetServerTime()
		{
			var label = this.GetCmp<Label>("Label1");
			label.Text = DateTime.Now.ToLongTimeString();

			return this.Direct();
		}
	}
}
