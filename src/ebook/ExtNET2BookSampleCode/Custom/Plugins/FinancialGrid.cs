using System;
using System.Collections.Generic;
using System.Web.UI;
using Ext.Net;
using JsonReader = Ext.Net.JsonReader;

[assembly: WebResource("ExtNET2BookSampleCode.Custom.Plugins.Resources.FinancialGrid.js", "text/javascript")]
[assembly: WebResource("ExtNET2BookSampleCode.Custom.Plugins.Resources.FinancialGrid.css", "text/css", PerformSubstitution = true)]

namespace ExtNET2BookSampleCode.Custom.Plugins
{
	public class FinancialGridPluginExample : GridPanel
	{
		private const int InitialPageSize = 10;

		public override string InstanceOf
		{
			get { return "MyApp.FinancialGrid"; }
		}

		public override string XType
		{
			get { return "financialgrid"; }
		}

		protected override List<ResourceItem> Resources
		{
			get
			{
				const string ns = "ExtNET2BookSampleCode.Custom.Plugins.Resources.FinancialGrid.";

				List<ResourceItem> baseList = base.Resources;
				baseList.Capacity += 2;

				baseList.Add(new ClientScriptItem(typeof(FinancialGridPluginExample), ns + "js", ""));
				baseList.Add(new ClientStyleItem(typeof(FinancialGridPluginExample), ns + "css", ""));

				return baseList;
			}
		}

		protected override void OnInit(EventArgs e)
		{
			Title = string.IsNullOrWhiteSpace(Title) ? "Simple Grid" : Title;
			Store.Add(BuildStore());
			ColumnModel.Columns.Add(BuildColumnModel());
			SelectionModel.Add(new RowSelectionModel());
			BottomBar.Add(BuildBottomBar());

			base.OnInit(e);
		}

		private Store BuildStore()
		{
			return new Store
			{
				PageSize = InitialPageSize,
				Model =
				{
					new Model
					{
						Fields =
						{
							new ModelField("Company") { Mapping = "Name" },
							new ModelField("Price", ModelFieldType.Float),
							new ModelField("Change", ModelFieldType.Float),
							new ModelField("PctChange", ModelFieldType.Float) { Mapping="PercentChange" },
							new ModelField("LastChange", ModelFieldType.Date, "yyyy-MM-ddTHH:mm:ss"),
							new ModelField("Symbol")
						}
					}
				},
				Proxy =
				{
					new AjaxProxy
					{
						Url = "~/Shared/FinancialData.ashx",
						Reader =
						{
							new JsonReader { Root = "data" }
						}
					}
				}
			};
		}

		private IEnumerable<ColumnBase> BuildColumnModel()
		{
			return new ItemsCollection<ColumnBase>
			{
				new RowNumbererColumn(),
				new Column { Text="Company", DataIndex="Company", Flex=1 },
				new Column
				{
					Text = "Price",
					DataIndex = "Price",
					Width = 50,
					Renderer = { Format = RendererFormat.UsMoney }
				},
				new Column { Text="Change", DataIndex="Change", Width=50, Renderer = { Handler = "return this.change.apply(this, arguments);" } },
				new Column { Text="Change", DataIndex="PctChange", Width=50, Renderer = { Handler = "return this.pctChange.apply(this, arguments);" } },
				new DateColumn { Text = "Last Updated", DataIndex = "LastChange", Format="yyyy-MM-dd hh:mmtt", Width=130 }
			};
		}

		private PagingToolbar BuildBottomBar()
		{
			return new PagingToolbar
			{
				Plugins =
				{
					new PageSizeChangerPlugin()
					//new GenericPlugin
					//{
					//    InstanceName = "Ext.ux.plugin.PageSizeChanger",
					//    Path = "~/Plugins/Resources/PageSizeChanger.js",
					//    CustomConfig =
					//    {
					//        // new ConfigItem("labelText", "Custom label:", ParameterMode.Value)
					//    }
					//}
				}
			};
		}

		private PagingToolbar BuildBottomBarNotUsingPlugin()
		{
			return new PagingToolbar
			{
				Items =
			    {
			       	new ToolbarSeparator(),
					new ComboBox
					{
						FieldLabel = "Page size",
						Width = 100,
						LabelWidth = 55,
						Value = Convert.ToString(InitialPageSize),
						Items =
						{
							new ListItem("10"),
							new ListItem("15"),
							new ListItem("20")
						}
					},
					new Button
					{
						Text = "Change",
						Listeners =
						{
							Click =
							{
								Handler = "var grid = this.up('financialgrid')," +
								          "	   pageSize = this.prev('combobox').getValue();" + 
								          "grid.changePageSize.call(grid, pageSize);"
							}
						}
					}
			    }
			};			
		}
	}
}