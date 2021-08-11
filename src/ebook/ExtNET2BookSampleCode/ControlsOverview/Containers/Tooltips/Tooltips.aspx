<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head id="Head1" runat="server">
		<title>Tooltip example</title>
		<style>
			body { padding: 10px; }
			
			.my-custom-class p { line-height:1.6; }
			.my-custom-class a { color:#00f; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Button runat="server" Text="Hover over me" ToolTip="Tooltip text" />

		<ext:Button runat="server" Text="Hover over me">
			<ToolTips>
				<ext:ToolTip
					Anchor="right"
					Width="318"
					Title="My title"
					ConstrainPosition="true"
					Cls="my-custom-class"
					AutoHide="false"
					MinWidth="318"
					Closable="true">
					<Content>
						<p>Html including <a href="http://www.ext.net">links</a> and images:</p>
						<p><img src="<%= ResolveUrl("~/images/rotary-phone.jpg") %>" alt="Not so long ago...!" height="240" width="305" /></p>
					</Content>
				</ext:ToolTip>
			</ToolTips>
		</ext:Button>
		
		<ext:Button runat="server" Id="Btn1" Text="Hover over me" />
		<ext:ToolTip runat="server" Html="<p>Some text</p>" Target="#{Btn1}" />
	</body>
</html>
