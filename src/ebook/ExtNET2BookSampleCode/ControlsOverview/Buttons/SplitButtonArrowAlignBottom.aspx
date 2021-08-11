<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head id="Head1" runat="server">
		<title>A simple button</title>
		<style>
			body { padding: 10px; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:SplitButton runat="server" Text="Paste" ArrowAlign="Bottom" Width="64">
			<Menu>
				<ext:Menu runat="server">
					<Items>                    
						<ext:MenuItem runat="server" Text="Paste Plain Text" />
						<ext:MenuItem runat="server" Text="Paste with Merge" />
						<ext:MenuSeparator runat="server" />
						<ext:MenuItem runat="server" Text="Paste Special..." />
					</Items>
				</ext:Menu>
			</Menu>
		</ext:SplitButton>
	</body>
</html>

