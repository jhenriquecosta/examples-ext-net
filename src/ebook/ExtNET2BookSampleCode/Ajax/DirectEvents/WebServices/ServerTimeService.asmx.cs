using System;
using System.Web.Services;
using Ext.Net;

namespace ExtNET2BookSampleCode.Ajax.DirectEvents.WebServices
{
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	public class ServerTimeService : WebService
	{
		[WebMethod]
		public DirectResponse GetServerTime()
		{
			X.Js.Alert("Server time is " + DateTime.Now);

			return new DirectResponse();

			// or 
			//return new DirectResponse
			//{
			//    Script = string.Format("alert('Server time is {0}');", DateTime.Now)
			//};
		}

		[WebMethod]
		public DirectResponse GetRelativeServerTime(int hours)
		{
			return new DirectResponse
			{
				ExtraParamsResponse = JSON.Serialize(new
				{
					relativeTime = DateTime.Now.AddHours(hours)
				})
			};

			// or
			//var response = new DirectResponse();
			//var responseParams = new ParameterCollection
			//{
			//    new Parameter("relativeTime", DateTime.Now.AddHours(hours).ToString())
			//};
			//response.ExtraParamsResponse = responseParams.ToJson();
			//return response;
		}

		[WebMethod]
		public DirectResponse GetServerTimeWindow()
		{
			new Window("Server time", Icon.Time)
			{
				ID = "MyWindow",
				Html = DateTime.Now.ToString()
			}.Render();

			return new DirectResponse();
		}
	}
}
