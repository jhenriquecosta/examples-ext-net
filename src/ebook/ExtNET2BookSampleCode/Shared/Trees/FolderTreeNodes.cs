using System.Linq;
using System.IO;
using Ext.Net;

namespace ExtNET2BookSampleCode.Shared.Trees
{
	public class FolderTreeNodes
	{
		public Node CreateTreeNode(string path)
		{
			int lastSeparatorPos = path.LastIndexOf(Path.DirectorySeparatorChar) + 1;
			string directoryName = path.Substring(lastSeparatorPos);

			var dirs = new DirectoryInfo(path).GetDirectories()
				.OrderBy(info => info.Name, new NaturalOrderComparer());

			var node = new Node
			{
				Text = directoryName,
				Leaf = !dirs.Any()
			};

			foreach (DirectoryInfo subDir in dirs)
			{
				node.Children.Add(CreateTreeNode(subDir.FullName));
			}

			return node;
		}
	}
}