<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Shared.Trees" %>

<script runat="server">
protected void Page_Load(object sender, EventArgs e)
{
	string startingPath = Server.MapPath("~/images");

	Node rootNode = new FolderTreeNodes().CreateTreeNode(startingPath);
	rootNode.Expanded = true;
	rootNode.Children[0].Expanded = true;
	IconFolderTree.Root.Add(rootNode);
}
</script>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Title</title>
		<style>
			body { padding:10px; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" />
		
		<ext:TreePanel ID="IconFolderTree" runat="server"
					   Width="250" height="250"
		               Icon="Pictures" Title="Icons" AutoScroll="true" />
	</body>
</html>
