using System.Web.Mvc;

namespace ExtNET2BookSampleCode.Custom.Components
{
	//
	// For MVC purposes this starts off our custom
	// MyApp "namespace" for cleaner Razor syntax
	// so that we can eventually do @Html.MyApp().etc
	//
	public class MyApp
	{
	}

	//
	// Extension methods to add MyApp into the HtmlHelper class
	// so that you can do @Html.MyApp()
	//
	public static class MyAppExtensions
	{
		public static BuilderFactory MyApp(this HtmlHelper helper)
		{
			return new BuilderFactory { HtmlHelper = helper };
		}
	}
}