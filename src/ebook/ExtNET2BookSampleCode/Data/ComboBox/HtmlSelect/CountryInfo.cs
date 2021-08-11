using System.Collections.Generic;
using Ext.Net;

namespace ExtNET2BookSampleCode.Data.ComboBox.HtmlSelect
{
	public class CountryInfo
	{
		public string IconClass
		{
			get { return ResourceManager.GetIconClassName(Icon); }
		}

		public Icon Icon { get; set; }
		public string Name { get; set; }
		public double Gdp { get; set; }
		public int Population { get; set; }

		private static readonly List<CountryInfo> Data = new List<CountryInfo>
		{
		    new CountryInfo { Icon = Icon.FlagCa, Name = "Canada", Gdp = 1.4, Population = 34 },
		    new CountryInfo { Icon = Icon.FlagFr, Name = "France", Gdp = 2.3, Population = 63 },
		    new CountryInfo { Icon = Icon.FlagDe, Name = "Germany", Gdp = 3.2, Population = 83 },
		    new CountryInfo { Icon = Icon.FlagGb, Name = "United Kingdom", Gdp = 2.3, Population = 63 },
		    new CountryInfo { Icon = Icon.FlagUs, Name = "United States of America", Gdp = 15.0, Population = 313},
		    new CountryInfo { Icon = Icon.FlagIt, Name = "Italy", Gdp = 2.0, Population = 59},
		    new CountryInfo { Icon = Icon.FlagJp, Name = "Japan", Gdp = 4.4, Population = 127},
		    new CountryInfo { Icon = Icon.FlagRu, Name = "Russia", Gdp = 2.8, Population = 143},
		    new CountryInfo { Icon = Icon.FlagCn, Name = "China", Gdp = 10.1, Population = 1348},
		    new CountryInfo { Icon = Icon.FlagIn, Name = "India", Gdp = 3.9, Population = 1242}
		};

		public static List<CountryInfo> GetData(int start, int limit)
		{
			return Data.GetRange(start, limit);
		}

		public static int TotalDataCount
		{
			get { return Data.Count; }
		}
	}
}