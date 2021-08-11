<%@ Page Language="C#" %>

<script runat="server">
	public class GroceryItem
	{
		public string Name { get; set; }
		public double WeightKgs { get; set; }
	}	

	[DirectMethod]
	public static List<GroceryItem> GetItems()
	{
		return new List<GroceryItem>
	 	{
	 		new GroceryItem { Name = "Apples", WeightKgs = 1.5 },
	 		new GroceryItem { Name = "Pears", WeightKgs = 0.5 },
	 	};
	}
</script>
<!DOCTYPE html>
<html>
	<head id="Head2" runat="server">
		<title>Direct Method Example</title>
		
		<style>
			.my-window .x-window-body { padding: 5px; }
			.my-window .x-window-body li { list-style: disc; margin-left: 1.5em; }
		</style>

		<script>
			function onSuccess(items) {
				var buffer = [Ext.String.format("<p>Got {0} items:</p><ul>", items.length)],
					window = Ext.getCmp('Window1');

				Ext.each(items, function(item) {
					buffer.push(Ext.String.format("<li>{0} kilos of {1}</li>", item.WeightKgs, item.Name));
				});

				buffer.push("</ul>");

				window.removeAll();
				window.update(buffer.join(""));
			}

			function getItems() {
				App.direct.GetItems({
					success: onSuccess,
					eventMask: { showMask: true }
				});
			}
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Window runat="server" ID="Window1" Title="My Items" Width="250" Height="150" Cls="my-window">
			<Items>
				<ext:Label runat="server" Text="No items" />
			</Items>
			<TopBar>
				<ext:Toolbar runat="server">
					<Items>
						<ext:Button runat="server" Text="Update" Icon="ArrowRefresh">
							<Listeners>
								<Click Fn="getItems" />
							</Listeners>
						</ext:Button>
					</Items>					
				</ext:Toolbar>
			</TopBar>
		</ext:Window>
	</body>
</html>
