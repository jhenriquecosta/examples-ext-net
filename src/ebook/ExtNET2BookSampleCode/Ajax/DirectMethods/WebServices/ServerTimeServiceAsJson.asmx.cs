using System;
using System.Collections.Generic;
using System.Web.Script.Services;
using System.Web.Services;

namespace ExtNET2BookSampleCode.Ajax.DirectMethods.WebServices
{
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	[ScriptService]
	public class ServerTimeServiceAsJson : WebService
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

		[WebMethod]
		public List<Browsers> GetHtml5BrowserScoreCard()
		{
			return new List<Browsers>
			{
				new Browsers {Name = "IE", Version = 6, Grade = BrowserGrade.Poor},
				new Browsers {Name = "IE", Version = 7, Grade = BrowserGrade.Poor},
				new Browsers {Name = "IE", Version = 8, Grade = BrowserGrade.Poor},
				new Browsers {Name = "IE", Version = 9, Grade = BrowserGrade.Okay},
				new Browsers {Name = "IE", Version = 10, Grade = BrowserGrade.Good},
				new Browsers {Name = "Firefox", Version = 14, Grade = BrowserGrade.Good},
				new Browsers {Name = "Chrome", Version = 17, Grade = BrowserGrade.Good},
				new Browsers {Name = "Opera", Version = 11, Grade = BrowserGrade.Good},
				new Browsers {Name = "Safari", Version = 5, Grade = BrowserGrade.Good}
			};
		}
	}
}
