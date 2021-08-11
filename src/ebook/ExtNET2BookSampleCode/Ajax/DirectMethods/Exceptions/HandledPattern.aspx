<%@ Page Language="C#" %>

<script runat="server">
	[DirectMethod]
	public static void DoSomething()
	{
		try
		{
			// call through to your business logic layer
		}
		catch (Exception e)
		{
			ResourceManager.AjaxSuccess = false;
			ResourceManager.AjaxErrorMessage = GetFriendlyMessage(e);
			
			// Do any logging and other operation here
		}
	}

	private static string GetFriendlyMessage(Exception exception)
	{
		throw new NotImplementedException();
	}
</script>
<!DOCTYPE html>
<html>
	<head id="Head2" runat="server">
		<title>Direct Method Example</title>
		
		<script>
			function doSomething() {
				App.direct.DoSomething({
					failure: directMethodFailed
				});
			}

			function directMethodFailed(msg) {
				Ext.Msg.alert('Failed', msg);
			}
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Button runat="server" Text="Do Something">
			<Listeners>
				<Click Fn="doSomething" />
			</Listeners>
		</ext:Button>
	</body>
</html>
