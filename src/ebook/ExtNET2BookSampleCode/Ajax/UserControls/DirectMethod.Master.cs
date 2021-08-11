using System.Web.UI;
using Ext.Net;

namespace ExtNET2BookSampleCode.Ajax.UserControls
{
	[DirectMethodProxyID(IDMode = DirectMethodProxyIDMode.None)]
	public partial class DirectMethod : MasterPage
	{
		[DirectMethod]
		public void HelloMasterPage()
		{
			X.Msg.Alert("Message", "Hello from MasterPage").Show();
		}
	}
}