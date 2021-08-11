using System;
using System.Collections.Generic;

namespace ExtNET2BookSampleCode.Data.Grids.Shared
{
	public class CompanyData
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public double Price { get; set; }
		public double Change { get; set; }
		public double PercentChange { get; set; }
		public DateTime LastChange { get { return DateTime.Now; } }

		// these two are not typically populated;
		// only some data has populated this
		// only used for the Row Expander example
		// chapter assumes all data rows would set this too
		// but just to save time coding the example and
		// creating images, only selected rows have this set.
		public string Description { get; set; }
		public string Symbol { get; set; }

		public CompanyData(int id, string name, double price, double change, double percentChange)
		{
			Id = id;
			Name = name;
			Price = price;
			Change = change;
			PercentChange = percentChange;

			// to recreate screenshots use this date: "9/1 12:00am"
			// LastChange = DateTime.ParseExact(lastChanged, "M/d hh:mmtt", CultureInfo.InvariantCulture);
		}

		public static List<CompanyData> GetData()
		{
			const string lorum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque interdum gravida justo, a vulputate ligula ullamcorper nec. Vivamus tincidunt pulvinar elit. Cras in ipsum dolor. Etiam imperdiet nisi feugiat diam suscipit sit amet adipiscing mi convallis. Phasellus eros orci, ullamcorper ut tempor vitae, accumsan id tellus. Vivamus faucibus metus at orci sodales semper. Fusce nunc nisl, ornare et interdum ut, luctus et velit. Fusce augue lorem, posuere sed vulputate a, facilisis non orci.";

			return new List<CompanyData>
			{
			    new CompanyData(1, "3m Co", 71.72, 0.02, 0.03),
			    new CompanyData(2, "Alcoa Inc", 29.01, 0.42, 1.47),
			    new CompanyData(3, "Altria Group Inc", 83.81, 0.28, 0.34),
			    new CompanyData(4, "American Express Company", 52.55, 0.01, 0.02) {Symbol = "AXP", Description = lorum},
			    new CompanyData(5, "American International Group, Inc.", 64.13, 0.31, 0.49),
			    new CompanyData(6, "AT&T Inc.", 31.61, -0.48, -1.54) {Symbol = "ATT", Description = lorum},
			    new CompanyData(7, "Boeing Co.", 75.43, 0.53, 0.71),
			    new CompanyData(8, "Caterpillar Inc.", 67.27, 0.92, 1.39),
			    new CompanyData(9, "Citigroup, Inc.", 49.37, 0.02, 0.04),
			    new CompanyData(10, "E.I. du Pont de Nemours and Company", 40.48, 0.51, 1.28),
			    new CompanyData(11, "Exxon Mobil Corp", 68.1, -0.43, -0.64),
			    new CompanyData(12, "General Electric Company", 34.14, -0.08, -0.23),
			    new CompanyData(13, "General Motors Corporation", 30.27, 1.09, 3.74),
			    new CompanyData(14, "Hewlett-Packard Co.", 36.53, -0.03, -0.08),
			    new CompanyData(15, "Honeywell Intl Inc", 38.77, 0.05, 0.13),
			    new CompanyData(16, "Intel Corporation", 19.88, 0.31, 1.58),
			    new CompanyData(17, "International Business Machines", 81.41, 0.44, 0.54),
			    new CompanyData(18, "Johnson & Johnson", 64.72, 0.06, 0.09),
			    new CompanyData(19, "JP Morgan & Chase & Co", 45.73, 0.07, 0.15),
			    new CompanyData(20, "McDonald\"s Corporation", 36.76, 0.86, 2.40),
			    new CompanyData(21, "Merck & Co., Inc.", 40.96, 0.41, 1.01),
			    new CompanyData(22, "Microsoft Corporation", 25.84, 0.14, 0.54),
			    new CompanyData(23, "Pfizer Inc", 27.96, 0.4, 1.45),
			    new CompanyData(24, "The Coca-Cola Company", 45.07, 0.26, 0.58),
			    new CompanyData(25, "The Home Depot, Inc.", 34.64, 0.35, 1.02),
			    new CompanyData(26, "The Procter & Gamble Company", 61.91, 0.01, 0.02),
			    new CompanyData(27, "United Technologies Corporation", 63.26, 0.55, 0.88),
			    new CompanyData(28, "Verizon Communications", 35.57, 0.39, 1.11),
			    new CompanyData(29, "Wal-Mart Stores, Inc.", 45.45, 0.73, 1.63)
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