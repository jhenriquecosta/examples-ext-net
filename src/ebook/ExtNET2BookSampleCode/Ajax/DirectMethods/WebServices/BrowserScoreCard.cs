namespace ExtNET2BookSampleCode.Ajax.DirectMethods.WebServices
{
	public enum BrowserGrade
	{
		Poor,
		Okay,
		Good
	};

	public class Browsers
	{
		public string Name { get; set; }
		public int Version { get; set; }
		public BrowserGrade Grade { get; set; }
	}

}