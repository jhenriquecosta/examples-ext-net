using System.Web.Mvc;

namespace ExtNET2BookSampleCode.Custom.Components
{
	// Builder Factory core implementation goes here
	// As each component is created you might want to add
	// their own part of BuilderFactory into other partial
	// classes that are located nearer to the rest of that
	// component's code
	// Or you could just add them here without needing to
	// make this partial (but then it could get very large
	// depending how many components you are creating)
	public partial class BuilderFactory
	{
		public HtmlHelper HtmlHelper { get; set; }
	}
}