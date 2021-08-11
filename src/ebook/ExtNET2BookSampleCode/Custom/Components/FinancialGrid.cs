using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.UI;
using System.Xml.Serialization;
using Ext.Net;
using Newtonsoft.Json;
using JsonReader = Ext.Net.JsonReader;

[assembly: WebResource("ExtNET2BookSampleCode.Custom.Components.Resources.FinancialGrid.js", "text/javascript")]
[assembly: WebResource("ExtNET2BookSampleCode.Custom.Components.Resources.FinancialGrid.css", "text/css", PerformSubstitution = true)]

namespace ExtNET2BookSampleCode.Custom.Components
{
	public partial class FinancialGrid : GridPanelBase
	{
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
				const string ns = "ExtNET2BookSampleCode.Custom.Components.Resources.FinancialGrid.";

				List<ResourceItem> baseList = base.Resources;
				baseList.Capacity += 2;

				baseList.Add(new ClientScriptItem(typeof(FinancialGrid), ns + "js", ""));
				baseList.Add(new ClientStyleItem(typeof(FinancialGrid), ns + "css", ""));

				return baseList;
			}
		}

		private FinancialGridListeners _listeners;

		[NotifyParentProperty(true)]
		[PersistenceMode(PersistenceMode.InnerProperty)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public FinancialGridListeners Listeners
		{
			get { return _listeners ?? (_listeners = new FinancialGridListeners()); }
		}

		private FinancialGridDirectEvents _directEvents;

		[NotifyParentProperty(true)]
		[PersistenceMode(PersistenceMode.InnerProperty)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public FinancialGridDirectEvents DirectEvents
		{
			get { return _directEvents ?? (_directEvents = new FinancialGridDirectEvents(this)); }
		}

		[Browsable(false)]
		[EditorBrowsable(EditorBrowsableState.Never)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
		[XmlIgnore]
		[JsonIgnore]
		public override ConfigOptionsCollection ConfigOptions
		{
			get
			{
				ConfigOptionsCollection list = base.ConfigOptions;

				list.Add("listeners",
					new ConfigOption("Listeners",
						new SerializationOptions("listeners",
							JsonMode.Object),
						null,
						Listeners));

				list.Add("directEvents",
					new ConfigOption("DirectEvents",
						new SerializationOptions("directEvents",
							JsonMode.Object),
						null,
						DirectEvents));

				return list;
			}
		}

		protected override void OnInit(EventArgs e)
		{
			Title = string.IsNullOrWhiteSpace(Title) ? "Simple Grid" : Title;
			Store.Add(BuildStore());
			ColumnModel.Columns.Add(BuildColumnModel());
			SelectionModel.Add(new RowSelectionModel());
			BottomBar.Add(new PagingToolbar());

			base.OnInit(e);
		}

		private Store BuildStore()
		{
			return new Store
			{
				PageSize = 10,
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
	}
}