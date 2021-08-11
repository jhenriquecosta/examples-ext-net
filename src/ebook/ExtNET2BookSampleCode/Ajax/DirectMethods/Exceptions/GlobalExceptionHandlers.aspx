<%@ Page Language="C#" %>

<script runat="server">
	[DirectMethod]
	public static decimal Divide(decimal number1, decimal number2)
	{
		try
		{
			// to simulate something going on
			// and to see status bar loading indicator being demonstrated
			System.Threading.Thread.Sleep(2500);

			return number1/number2;
		}
		catch (DivideByZeroException)
		{
			ResourceManager.AjaxSuccess = false;
			ResourceManager.AjaxErrorMessage = "Number2 can't be zero!";
			return 0;
		}
	}
</script>
<!DOCTYPE html>
<html>
	<head id="Head1" runat="server">
		<title>Global AJAX Handlers</title>
		<style>
			body { padding: 10px; }
		</style>
		<script>
			var MyApp = {
				doDivision: function() {
					var field1 = App.Number1.getValue(),
						field2 = App.Number2.getValue(),
						answer = App.Answer;

					App.direct.Divide(field1, field2, {
						success: function(result) {
							answer.setValue(result);
						}
					});
				},
				
				Ajax: {
					onBeforeAjaxRequest: function() {
						var statusBar = App.StatusBar1;
						statusBar.showBusy();
					},

					onRequestComplete: function() {
						MyApp.Ajax.clearStatus();
					},

					onRequestException: function(response, result) {
						MyApp.Ajax.clearStatus();

						Ext.Msg.alert("Could not divide", result.errorMessage);
					},

					clearStatus: function() {
						var statusBar = App.StatusBar1;
						statusBar.clearStatus({ useDefaults: true });
					}
				}
			};
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" ShowWarningOnAjaxFailure="false" Theme="Gray">
			<Listeners>
				<BeforeAjaxRequest Fn="MyApp.Ajax.onBeforeAjaxRequest" />
				<AjaxRequestComplete Fn="MyApp.Ajax.onRequestComplete" />
				<AjaxRequestException Fn="MyApp.Ajax.onRequestException" />
			</Listeners>
		</ext:ResourceManager>
		
		<ext:Panel runat="server" Title="My Panel" Width="300" BodyPadding="4">
			<Items>
				<ext:NumberField ID="Number1" runat="server" FieldLabel="Divide this" />
				<ext:NumberField ID="Number2" runat="server" FieldLabel="By this" />
				<ext:Button runat="server" Text="And you get">
					<Listeners>
						<Click Fn="MyApp.doDivision" />
					</Listeners>
				</ext:Button>
				<ext:DisplayField runat="server" ID="Answer" FieldLabel="Answer" />
			</Items>
			<BottomBar>
				<ext:StatusBar ID="StatusBar1" runat="server" DefaultText="Ready" />
			</BottomBar>
		</ext:Panel>
	</body>
</html>
