using System.IO;
using System.Linq;
using System.Web.Mvc;
using Ext.Net;
using Ext.Net.MVC;
using ExtNET2BookSampleCode.Shared.Trees;

namespace ExtNET2BookSampleCode.Controllers
{
	public class IconTreeController : Controller
	{
		public static string StartingPath
		{
			// put lots of images/directories in here to see it run with more examples
			get { return System.Web.HttpContext.Current.Server.MapPath("~/images"); }
		}

		public static void SetNodeCustomAttributes(Node node, DirectoryInfo dirInfo)
		{
			string lastMod = dirInfo.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss");
			string numFiles = dirInfo.GetFiles().Length.ToString();
			string numSubDirs = dirInfo.GetDirectories().Length.ToString();

			node.AttributesObject = new
			{
				lastMod,
				numFiles,
				numSubDirs
			};

			// or the longer way:
			//var attrs = new[]
			//{
			//    new ConfigItem("lastMod", lastMod, ParameterMode.Value),
			//    new ConfigItem("numFiles", numFiles, ParameterMode.Raw),
			//    new ConfigItem("numSubDirs", numSubDirs, ParameterMode.Raw)
			//};
			//node.CustomAttributes.AddRange(attrs);
		}

		//
		// GET: /IconTree/GetSubDirectories
		//
		public StoreResult GetSubDirectories(string node)
		{
			var path = node == "Root" ? StartingPath : Path.Combine(StartingPath, node);
			var dirs = new DirectoryInfo(path).GetDirectories()
				.OrderBy(info => info.Name, new NaturalOrderComparer());

			var nodes = new NodeCollection(false);

			foreach (DirectoryInfo subDir in dirs)
			{
				var childNode = new Node
				{
					NodeID = subDir.FullName.Substring(StartingPath.Length + 1),
					Text   = subDir.Name,
					Leaf   = subDir.GetDirectories().Length == 0
				};
				SetNodeCustomAttributes(childNode, subDir);
				nodes.Add(childNode);
			}

			return this.Store(nodes);
			
			// or less elegant: return this.Content(nodes.ToJson(), "application/json");
			// and ensure method return a ContentResult
		}
	}
}
