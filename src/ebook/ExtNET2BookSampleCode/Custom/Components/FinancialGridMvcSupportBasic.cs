using System.Web;
using System.Web.Mvc;
using Ext.Net;

namespace ExtNET2BookSampleCode.Custom.Components
{
	public class ControlRender : IHtmlString
	{
		public ControlRender(BaseControl control)
		{
			Control = control;
		}

		public BaseControl Control { get; private set; }

		public string ToHtmlString()
		{
			return Control.SelfRender();
		}

		public ControlRender Height(int height)
		{
			Control.Height = height;
			return this;
		}

		public ControlRender Width(int width)
		{
			Control.Width = width;
			return this;
		}
	}

	public static class FinancialGridBasicMvcExtensions
	{
		public static IHtmlString FinancialGridBasic(this HtmlHelper helper, int height, int width)
		{
			return new ControlRender(new FinancialGrid { Height = height, Width = width });
		}

		public static ControlRender FinancialGridBasic(this HtmlHelper helper)
		{
			return new ControlRender(new FinancialGrid());
		}
	}
}