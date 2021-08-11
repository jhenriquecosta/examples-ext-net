<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
	<head runat="server">
		<title>MessageBus Example</title>
		<style>
			body { padding: 10px; }
		</style>
		<script>
			function DoSomething() {
				// run some code
				Ext.net.Bus.publish('App.event2', { item: this });
			}
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" />
		
		<ext:Panel
			runat="server"
			Title="MessageBus Event Logger"
			Width="200"
			Height="150"
			AutoScroll="true">
			<MessageBusListeners>
				<ext:MessageBusListener
					Name="App.*"
					Handler="this.body.createChild({
						html: 'Received event from ' + data.item.id,
						tag: 'p'
					});" />
			</MessageBusListeners>
			<Buttons>
				<ext:Button ID="Button1" runat="server" Text="Publish event 1">
					<Listeners>
						<Click BroadcastOnBus="App.event1" />
					</Listeners>
				</ext:Button>
				<ext:Button ID="Button2" runat="server" Text="Publish event 2">
					<Listeners>
						<Click Fn="DoSomething" />
					</Listeners>
				</ext:Button>
			</Buttons>
		</ext:Panel>
	</body>
</html>
