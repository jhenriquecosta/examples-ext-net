<%@ Page Language="C#" %>
<%@ Import Namespace="System.Threading" %>

<script runat="server">
	protected void ShowPanel(object sender, DirectEventArgs e)
	{
		Thread.Sleep(5000);
		X.Msg.Alert("DirectEvent", "Event received").Show();
	}
</script>
<!DOCTYPE html>
<html>
	<head id="Head1" runat="server">
		<title>Direct Event Example</title>
		<style>
			body { padding: 10px; }
			.x-mask-msg { border-color: #aaa; }
			.x-mask-msg > div { background-color: #fff; }
			#custom-div { border: 1px solid #444; background: #77e; padding: 2em; width: 150px; margin: 1em; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		
		<div id="custom-div">
			<p>Some content</p>
		</div>

		<ext:Window runat="server" Id="Window1" Title="Window with Button" Width="200" Height="150">
			<Buttons>
				<ext:Button Text="Click Me">
					<DirectEvents>
						<Click OnEvent="ShowPanel">
							<EventMask ShowMask="true" Target="CustomTarget" CustomTarget="custom-div" />
						</Click>
					</DirectEvents>
				</ext:Button>
			</Buttons>
		</ext:Window>
	</body>
</html>
