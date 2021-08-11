<%@ Page Language="C#" EnableViewState="false" %>


<script runat="server">
	protected void Button_Click(object sender, DirectEventArgs e)
	{
		Window1.Html = string.Format("Server time: {0}", DateTime.Now);
		Window1.Show();
	}
</script>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Ext.NET Window example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />

		<ext:Button ID="Button1" runat="server" Text="Show Window">
			<DirectEvents>
				<Click OnEvent="Button_Click" />
			</DirectEvents>
		</ext:Button>

		<ext:Window
			ID="Window1"
			runat="server"
			AnimateTarget="Button1"
			Height="200"
			Hidden="true"
			Icon="ApplicationCascade"
			Maximizable="true"
			Modal="true"
			Title="My Window"
			Width="300" />
			
	</body>
</html>
