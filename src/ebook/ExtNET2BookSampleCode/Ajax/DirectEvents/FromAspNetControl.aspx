<%@ Page Language="C#" %>

<script runat="server">
	protected void MyServerMethod(object sender, DirectEventArgs e)
	{
		X.Msg.Alert("DirectEvent", "Event received").Show();
	}
</script>
<!DOCTYPE html>
<html>
	<head id="Head1" runat="server">
		<title>Direct Event Example</title>
		<style>
			body { padding:10px; }
			.box { width:100px; height:100px; background:#ccf; margin-top:1em; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray">
			<CustomDirectEvents>
				<ext:DirectEvent Target="Button1" OnEvent="MyServerMethod">
					<EventMask ShowMask="true" />
				</ext:DirectEvent>
				<ext:DirectEvent Target="MyDiv" OnEvent="MyServerMethod" />
				<ext:DirectEvent Target="${.box}" OnEvent="MyServerMethod" />
			</CustomDirectEvents>
		</ext:ResourceManager>

		<form id="HtmlForm" runat="server">
			<asp:Button ID="Button1" runat="server" Text="Click Me" />
		</form>
		
		<div class="box">Box 1</div>
		<div class="box">Box 2</div>
		<div class="box">Box 3</div>
	</body>
</html>
