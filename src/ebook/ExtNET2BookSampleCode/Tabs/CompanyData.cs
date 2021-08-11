using System;
using System.Collections.Generic;
using System.Globalization;

namespace ExtNET2BookSampleCode.Tabs
{
	public class CompanyData
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public double Price { get; set; }
		public double Change { get; set; }
		public double PercentChange { get; set; }
		public DateTime LastChange { get; set; }

		// these two are not typically populated; only used for the Row Expander example
		public string Description { get; set; }
		public string Symbol { get; set; }

		public CompanyData(int id, string name, double price, double change, double percentChange, string lastChanged)
		{
			Id = id;
			Name = name;
			Price = price;
			Change = change;
			PercentChange = percentChange;
			LastChange = DateTime.ParseExact(lastChanged, "M/d hh:mmtt", CultureInfo.InvariantCulture);
		}

		public static List<CompanyData> GetData()
		{
			const string lorum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque interdum gravida justo, a vulputate ligula ullamcorper nec. Vivamus tincidunt pulvinar elit. Cras in ipsum dolor. Etiam imperdiet nisi feugiat diam suscipit sit amet adipiscing mi convallis. Phasellus eros orci, ullamcorper ut tempor vitae, accumsan id tellus. Vivamus faucibus metus at orci sodales semper. Fusce nunc nisl, ornare et interdum ut, luctus et velit. Fusce augue lorem, posuere sed vulputate a, facilisis non orci.";

			return new List<CompanyData>
			{
			    new CompanyData(1, "3m Co", 71.72, 0.02, 0.03, "9/1 12:00am"),
			    new CompanyData(2, "Alcoa Inc", 29.01, 0.42, 1.47, "9/1 12:00am"),
			    new CompanyData(3, "Altria Group Inc", 83.81, 0.28, 0.34, "9/1 12:00am"),
			    new CompanyData(4, "American Express Company", 52.55, 0.01, 0.02, "9/1 12:00am") {Symbol = "AXP", Description = lorum},
			    new CompanyData(5, "American International Group, Inc.", 64.13, 0.31, 0.49, "9/1 12:00am"),
			    new CompanyData(6, "AT&T Inc.", 31.61, -0.48, -1.54, "9/1 12:00am"),
			    new CompanyData(7, "Boeing Co.", 75.43, 0.53, 0.71, "9/1 12:00am"),
			    new CompanyData(8, "Caterpillar Inc.", 67.27, 0.92, 1.39, "9/1 12:00am"),
			    new CompanyData(9, "Citigroup, Inc.", 49.37, 0.02, 0.04, "9/1 12:00am"),
			    new CompanyData(10, "E.I. du Pont de Nemours and Company", 40.48, 0.51, 1.28, "9/1 12:00am"),
			    new CompanyData(11, "Exxon Mobil Corp", 68.1, -0.43, -0.64, "9/1 12:00am"),
			    new CompanyData(12, "General Electric Company", 34.14, -0.08, -0.23, "9/1 12:00am"),
			    new CompanyData(13, "General Motors Corporation", 30.27, 1.09, 3.74, "9/1 12:00am"),
			    new CompanyData(14, "Hewlett-Packard Co.", 36.53, -0.03, -0.08, "9/1 12:00am"),
			    new CompanyData(15, "Honeywell Intl Inc", 38.77, 0.05, 0.13, "9/1 12:00am"),
			    new CompanyData(16, "Intel Corporation", 19.88, 0.31, 1.58, "9/1 12:00am"),
			    new CompanyData(17, "International Business Machines", 81.41, 0.44, 0.54, "9/1 12:00am"),
			    new CompanyData(18, "Johnson & Johnson", 64.72, 0.06, 0.09, "9/1 12:00am"),
			    new CompanyData(19, "JP Morgan & Chase & Co", 45.73, 0.07, 0.15, "9/1 12:00am"),
			    new CompanyData(20, "McDonald\"s Corporation", 36.76, 0.86, 2.40, "9/1 12:00am"),
			    new CompanyData(21, "Merck & Co., Inc.", 40.96, 0.41, 1.01, "9/1 12:00am"),
			    new CompanyData(22, "Microsoft Corporation", 25.84, 0.14, 0.54, "9/1 12:00am"),
			    new CompanyData(23, "Pfizer Inc", 27.96, 0.4, 1.45, "9/1 12:00am"),
			    new CompanyData(24, "The Coca-Cola Company", 45.07, 0.26, 0.58, "9/1 12:00am"),
			    new CompanyData(25, "The Home Depot, Inc.", 34.64, 0.35, 1.02, "9/1 12:00am"),
			    new CompanyData(26, "The Procter & Gamble Company", 61.91, 0.01, 0.02, "9/1 12:00am"),
			    new CompanyData(27, "United Technologies Corporation", 63.26, 0.55, 0.88, "9/1 12:00am"),
			    new CompanyData(28, "Verizon Communications", 35.57, 0.39, 1.11, "9/1 12:00am"),
			    new CompanyData(29, "Wal-Mart Stores, Inc.", 45.45, 0.73, 1.63, "9/1 12:00am")
	       };
		}
	}

	public class PriceHistory
	{
		public DateTime Date { get; set; }
		public double Price { get; set; }
		public double PercentChange { get; set; }
	}
}