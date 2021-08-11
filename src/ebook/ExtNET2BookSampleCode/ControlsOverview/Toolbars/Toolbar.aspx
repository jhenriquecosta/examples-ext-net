<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
		<style>
			body { padding: 10px; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		
		<ext:Toolbar runat="server">
			<Items>
				<ext:SplitButton Text="Paste" Icon="PastePlain">
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
				<ext:Button Tooltip="Cut" Icon="Cut" />
				<ext:Button Tooltip="Copy" Icon="PageWhiteCopy" />
				<ext:ToolbarSeparator />
				<ext:Button Text="Change case">
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
			</Items>
		</ext:Toolbar>
	</body>
</html>
