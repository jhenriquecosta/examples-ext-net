<%@ Page Language="C#" %>

<script runat="server">
	protected void DoSomething(object sender, DirectEventArgs e)
	{
		e.ExtraParamsResponse.Add(new Ext.Net.Parameter("paramName", "response value"));

		ExtNet.Msg.Notify("Done", "Done").Show();
	}
</script>
<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
		<style>
			body { padding: 10px; }
		</style>
		<script>
			function onAfterServerDidSomething(response, result) {
				console.log(result.extraParamsResponse.paramName);
			}
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Button runat="server" Text="Click Me">
			<DirectEvents>
				<Click OnEvent="DoSomething" Success="onAfterServerDidSomething" />
			</DirectEvents>
		</ext:Button>
	</body>
</html>
