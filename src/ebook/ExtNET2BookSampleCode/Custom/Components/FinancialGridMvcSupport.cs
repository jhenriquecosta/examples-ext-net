using System.Web.Mvc;
using Ext.Net;

namespace ExtNET2BookSampleCode.Custom.Components
{
	public partial class FinancialGrid
	{
		public FinancialGrid()
		{
		}
		
		public FinancialGrid(Config config)
		{
			Apply(config);
		}

		public Builder ToBuilder()
		{
			return new BuilderFactory().FinancialGrid(this);
		}

		public class Builder : Builder<FinancialGrid, Builder>
		{
			public Builder() : base(new FinancialGrid()) { }

			public Builder(FinancialGrid component) : base(component) { }

			public Builder(Config config) : base(new FinancialGrid(config)) { }
		}

		new public class Config : GridPanelBase.Config
		{
			public static implicit operator Builder(Config config)
			{
				return new Builder(config);
			}

			private FinancialGridListeners _listeners;

			public FinancialGridListeners Listeners
			{
				get { return _listeners ?? (_listeners = new FinancialGridListeners()); }
			}

			private FinancialGridDirectEvents _directEvents;

			public FinancialGridDirectEvents DirectEvents
			{
				get { return _directEvents ?? (_directEvents = new FinancialGridDirectEvents()); }
			}
		}
	}

	public partial class BuilderFactory
	{
		public FinancialGrid.Builder FinancialGrid()
		{
			return FinancialGrid(new FinancialGrid
			{
				ViewContext = HtmlHelper != null ? HtmlHelper.ViewContext : null
			});
		}

		public FinancialGrid.Builder FinancialGrid(FinancialGrid component)
		{
			component.ViewContext = HtmlHelper != null ? HtmlHelper.ViewContext : null;
			return new FinancialGrid.Builder(component);
		}
	}

	public static class FinancialGridMvcExtensions
	{
		public static FinancialGrid.Builder FinancialGrid(this HtmlHelper helper)
		{
			return new BuilderFactory { HtmlHelper = helper }.FinancialGrid();
		}
	}
}