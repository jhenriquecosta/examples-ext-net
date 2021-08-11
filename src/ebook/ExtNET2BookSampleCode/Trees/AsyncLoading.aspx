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
		
		<ext:TreePanel Id="IconFolderTree"
			runat="server" Width="250" height="250"
			Icon="Pictures" Title="Icons" AutoScroll="true">
			<Root>
				<ext:Node NodeID="Root" Text="icons" Expanded="true" />
			</Root>
			<Store>
				<ext:TreeStore runat="server">
					<Proxy>
						<ext:AjaxProxy Url="/IconTree/GetSubDirectories" />
					</Proxy>
				</ext:TreeStore>
			</Store>
		</ext:TreePanel>
	</body>
</html>
