using System.Collections.Generic;
using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Ajax.DirectMethods.WebServices
{
	public class Handler : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "application/json";

			var scoreCard = new List<Browsers>
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

			context.Response.Write(JSON.Serialize(scoreCard));
		}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}