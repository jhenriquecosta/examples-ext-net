using System.Collections.Generic;
using Ext.Net;

namespace ExtNET2BookSampleCode.Custom.Builder
{
	public class FinancialGridBuilder
	{
		private const int InitialPageSize = 10;
		private const string GridId = "FinancialGrid";

		public GridPanel Build()
		{
			return new GridPanel
			{
				ID = GridId,
				Title = "Simple Grid",
				Store = { BuildStore() },
				ColumnModel =
				{
					Columns = { BuildColumnModel() }
				},
				SelectionModel =
				{
					new RowSelectionModel()	
				},
				BottomBar = { new PagingToolbar() }
			};
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
				new Column { Text="Change", DataIndex="Change", Width=50, Renderer = { Fn = "MyApp.change" } },
				new Column { Text="Change", DataIndex="PctChange", Width=50, Renderer = { Fn = "MyApp.pctChange" } },
				new DateColumn { Text = "Last Updated", DataIndex = "LastChange", Format="yyyy-MM-dd hh:mmtt", Width=130 }
			};
		}
	}
}