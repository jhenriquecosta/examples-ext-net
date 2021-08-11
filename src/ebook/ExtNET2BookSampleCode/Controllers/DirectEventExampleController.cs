using System.Web.Mvc;
using Ext.Net;
using Ext.Net.MVC;

namespace ExtNET2BookSampleCode.Controllers
{
	public class DirectEventExampleController : Controller
	{
		//
		// GET: /DirectEventExample/
		public ActionResult Index()
		{
			return View();
		}

		//
		// GET: /DirectEventExample/Notify/
		public ActionResult Notify(string message)
		{
			var config = new NotificationConfig
			{
				Icon = Icon.Accept,
				Title = "Working",
				Html = message
			};

			X.Msg.Notify(config).Show();

			return this.Direct();
		}
	}
}
