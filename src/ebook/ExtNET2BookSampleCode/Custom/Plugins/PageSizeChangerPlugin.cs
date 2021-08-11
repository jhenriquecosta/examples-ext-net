using System.Collections.Generic;
using System.Web.UI;
using Ext.Net;

[assembly: WebResource("ExtNET2BookSampleCode.Custom.Plugins.Resources.PageSizeChanger.js", "text/javascript")]

namespace ExtNET2BookSampleCode.Custom.Plugins
{
	public class PageSizeChangerPlugin : Plugin
	{
		protected override List<ResourceItem> Resources
		{
			get
			{
				const string resourcePath = "ExtNET2BookSampleCode.Custom.Plugins.Resources.PageSizeChanger.js";

				List<ResourceItem> baseList = base.Resources;
				baseList.Capacity += 1;

				baseList.Add(new ClientScriptItem(typeof(PageSizeChangerPlugin), resourcePath, ""));

				return baseList;
			}
		}

		public override string InstanceOf
		{
			get { return "Ext.ux.plugin.PageSizeChanger"; }
		}
	}
}