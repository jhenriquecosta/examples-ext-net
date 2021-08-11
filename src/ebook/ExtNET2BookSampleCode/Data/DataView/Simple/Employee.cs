using System;
using System.Collections.Generic;

namespace ExtNET2BookSampleCode.Data.DataView.Simple
{
	public class Employee
	{
		public int Id { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public bool IsManager { get; set; }
		public DateTime DateOfBirth { get; set; }
		public int Age
		{
			get { return DateTime.Today.Year - DateOfBirth.Year; }
		}

		// Helper just for re-use purpose; wouldn't really do this!
		public static List<Employee> Employees
		{
			get
			{
				return new List<Employee>
				{
					new Employee { Id = 101, FirstName = "Jane", LastName = "Smith", DateOfBirth = new DateTime(1972, 1, 2), IsManager = true },
					new Employee { Id = 102, FirstName = "Fred", LastName = "Cane", DateOfBirth = new DateTime(1981, 2, 12), IsManager = false },
					new Employee { Id = 103, FirstName = "Sam", LastName = "Wise", DateOfBirth = new DateTime(1985, 5, 31), IsManager = false },
					new Employee { Id = 104, FirstName = "Anne", LastName = "Cole", DateOfBirth = new DateTime(1972, 3, 2), IsManager = false },
					new Employee { Id = 105, FirstName = "Lisa", LastName = "Shaw", DateOfBirth = new DateTime(1974, 10, 13), IsManager = false },
					new Employee { Id = 106, FirstName = "Tom", LastName = "Goldsmith", DateOfBirth = new DateTime(1962, 7, 9), IsManager = true },
					new Employee { Id = 107, FirstName = "Kelly", LastName = "Lane", DateOfBirth = new DateTime(1984, 8, 12), IsManager = false },
					new Employee { Id = 108, FirstName = "Mary", LastName = "Smith", DateOfBirth = new DateTime(1971, 4, 23), IsManager = false },
					new Employee { Id = 109, FirstName = "Bob", LastName = "Hunter", DateOfBirth = new DateTime(1954, 1, 26), IsManager = false },
					new Employee { Id = 110, FirstName = "Joe", LastName = "Bloggs", DateOfBirth = new DateTime(1965, 5, 2), IsManager = false },
					new Employee { Id = 111, FirstName = "Jon", LastName = "Doe", DateOfBirth = new DateTime(1974, 12, 8), IsManager = false },
				};
			}
		}

		// Just for the object data source example
		public static List<Employee> GetData(int start, int limit, out int totalCount)
		{
			totalCount = Employees.Count;

			int numberToGet = start + limit > totalCount ? totalCount - start : limit;

			return Employees.GetRange(start, numberToGet);
		}
	}
}