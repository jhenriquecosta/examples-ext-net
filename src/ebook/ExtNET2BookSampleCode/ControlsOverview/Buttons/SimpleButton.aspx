<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>A simple button</title>
		<style>
			body { padding: 10px; }
			
			.icon-paste-large { background-image: url(../../images/iconPasteLarge.png); }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Button runat="server" Text="Click Me!" />
		<ext:Button runat="server" Text="Click Me!" Icon="Add" />
		<ext:Button runat="server" Text="Change case">
			<Menu>
				<ext:Menu>
					<Items>
						<ext:MenuItem Text="Lower case" Icon="TextLowercase" />
						<ext:MenuItem Text="Upper case" Icon="TextUppercase" />
						<ext:MenuSeparator />
						<ext:MenuItem Text="Title case" />
					</Items>
				</ext:Menu>
			</Menu>
		</ext:Button>
		<ext:SplitButton runat="server" Text="Paste" Icon="PastePlain">
			<Menu>
				<ext:Menu>
					<Items>                    
						<ext:MenuItem Text="Paste Plain Text" />
						<ext:MenuItem Text="Paste with Merge" />
						<ext:MenuSeparator />
						<ext:MenuItem Text="Paste Special..." />
					</Items>
				</ext:Menu>
			</Menu>
		</ext:SplitButton>
		<ext:SplitButton runat="server" Text="Paste" IconCls="icon-paste-large" Scale="Large" IconAlign="Top" ArrowAlign="Bottom" Width="64">
			<Menu>
				<ext:Menu>
					<Items>                    
						<ext:MenuItem Text="Paste Plain Text" />
						<ext:MenuItem Text="Paste with Merge" />
						<ext:MenuSeparator />
						<ext:MenuItem Text="Paste Special..." />
					</Items>
				</ext:Menu>
			</Menu>
		</ext:SplitButton>
		<ext:Button runat="server" Text="Click Me!" ToolTip="Tooltip text" />
		<ext:Button runat="server" Text="Click Me!">
			<ToolTips>
				<ext:ToolTip Title="My title" Html="Some text" ConstrainPosition="true" Cls="my-custom-class" />
			</ToolTips>
		</ext:Button>
	</body>
</html>
