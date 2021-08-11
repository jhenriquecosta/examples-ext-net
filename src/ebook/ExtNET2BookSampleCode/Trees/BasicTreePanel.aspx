<%@ Page Language="C#" %>

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
		
		<p>This is the default look:</p>

		<ext:TreePanel
			runat="server" Width="250" height="250"
			Icon="Pictures" Title="Icons" AutoScroll="true">
			<Root>
				<ext:Node Text="icons" Expanded="true">
					<Children>
						<ext:Node Text="16x16" Expanded="true">
							<Children>
								<ext:Node Text="actions" Leaf="true" />
								<ext:Node Text="apps" Leaf="true" />
								<ext:Node Text="devices" Leaf="true" />
								<ext:Node Text="filesystems" Leaf="true" />
								<ext:Node Text="mimetypes" Leaf="true" />
							</Children>
						</ext:Node>
						<ext:Node Text="22x22" />
						<ext:Node Text="24x24" />
						<ext:Node Text="32x32" />
						<ext:Node Text="48x48" />
						<ext:Node Text="64x64" />
						<ext:Node Text="128x128" />
					</Children>
				</ext:Node>
			</Root>
		</ext:TreePanel>
		
		<p>The next TreePanel hides the root node and uses custom icons</p>

		<ext:TreePanel
			runat="server" Width="250" height="250"
			Icon="Pictures" Title="Icons" AutoScroll="true" RootVisible="false">
			<Root>
				<ext:Node Text="icons" Expanded="true">
					<Children>
						<ext:Node Text="16x16" Icon="Folder" Expanded="true">
							<Children>
								<ext:Node Text="actions" Leaf="true" Icon="Picture" />
								<ext:Node Text="apps" Leaf="true" Icon="Picture" />
								<ext:Node Text="devices" Leaf="true" Icon="Picture" />
								<ext:Node Text="filesystems" Leaf="true" Icon="Picture" />
								<ext:Node Text="mimetypes" Leaf="true" Icon="Picture" />
							</Children>
						</ext:Node>
						<ext:Node Text="22x22" Icon="Folder" />
						<ext:Node Text="24x24" Icon="Folder" />
						<ext:Node Text="32x32" Icon="Folder" />
						<ext:Node Text="48x48" Icon="Folder" />
						<ext:Node Text="64x64" Icon="Folder" />
						<ext:Node Text="128x128" Icon="Folder" />
					</Children>
				</ext:Node>
			</Root>
		</ext:TreePanel>
	</body>
</html>
