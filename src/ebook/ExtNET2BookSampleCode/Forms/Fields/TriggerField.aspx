<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Form Field Examples</title>
		<style>
			body { padding:10px; }
		</style>
		<script>
			var MyApp = {
				onTriggerClick: function(field, trigger, index, tag) {
					switch (tag) {
						case 'clear':
							field.setValue('');
							break;
						case 'search':
							// do search
					}
				}
			};
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" />

		<ext:TriggerField runat="server">
			<Triggers>
				<ext:FieldTrigger
					Icon="Clear"
					Tag="clear"
					Qtip="<h2>Title</h2><p>Custom title</p>"
				/>
				<ext:FieldTrigger Icon="Search" Tag="search" />
			</Triggers>
			<Listeners>
				<TriggerClick Fn="MyApp.onTriggerClick" />
			</Listeners>
		</ext:TriggerField>
	</body>
</html>
