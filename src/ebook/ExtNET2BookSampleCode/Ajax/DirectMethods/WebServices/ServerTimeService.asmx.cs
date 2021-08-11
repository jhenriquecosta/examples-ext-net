using System;
using System.Web.Services;

namespace ExtNET2BookSampleCode.Ajax.DirectMethods.WebServices
{
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	public class ServerTimeService : WebService
	{
		[WebMethod]
		public string Echo(string something)
		{
			return something;
		}

		[WebMethod]
		public DateTime GetRelativeServerTime(int hours)
		{
			return DateTime.Now.AddHours(hours);
		}
	}
}
