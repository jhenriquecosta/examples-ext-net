using System;
using System.Collections.Generic;
using System.Web;
using Ext.Net;

namespace ExtNET2BookSampleCode.Data.Grids.Shared
{
	public class FinancialDataUpdate : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			var response = new StoreResponseData();
			var dataHandler = new StoreDataHandler(context);

			List<Dictionary<string, object>> data = dataHandler.ObjectData<Dictionary<string, object>>();

			foreach (Dictionary<string, object> list in data)
			{
				try
				{
					// update system with list values
					
					// as example only if the update process modified some data that had been
					// submitted (maybe as part of some business rules, then it would be
					// sent back as part of the response, and the store will automatically
					// reload these updated values for you:
					if (list.ContainsKey("Price"))
					{
						list["Price"] = 10.00;
					}
					if (list.ContainsKey("Company"))
					{
						list["Name"] = list["Company"] + " blah blah blah";
						list.Remove("Company");
					}

					// return the data as response
					response.Data = JSON.Serialize(data);
				}
				catch (Exception e)
				{
					// logging, etc.
					response.Success = false;
					response.Message = e.Message;
				}
			}

			response.Return();
		}

		public bool IsReusable
		{
			get { return false; }
		}
	}
}