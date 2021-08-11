using System;
using System.Web.UI;
using Ext.Net;

namespace ExtNET2BookSampleCode.ControlsOverview.Toolbars
{
	public partial class ToolbarFromCodeBehind : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Window1.TopBar.Add(new Toolbar
			{
				EnableOverflow = true,
				Items =
				{
					new Button
					{
						Text = "More options",
						Menu = { GetMoreOptionsMenu() }
					}
				}
			});
		}

		private Menu GetMoreOptionsMenu()
		{
			return new Menu
			{
				Items = { GetDateChooser() }
			};
		}

		private MenuItem GetDateChooser()
		{
			return new MenuItem
			{
				Text = "Choose a Date",
				Icon = Icon.Calendar,
				Menu = { GetDateMenu() }
			};
		}

		private DateMenu GetDateMenu()
		{
			return new DateMenu
			{
				Listeners =
				{
					Select =
					{
						Fn = "MyApp.onDateSelected"
					}
				}
			};
		}
	}
}