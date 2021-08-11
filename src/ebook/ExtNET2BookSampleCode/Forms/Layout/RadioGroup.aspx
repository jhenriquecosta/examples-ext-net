<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Form Layout Examples</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" />
		
		<ext:RadioGroup runat="server" Width="400">
			<Items>
				<ext:Radio BoxLabel="Item 1" />
				<ext:Radio BoxLabel="Item 2" Checked="true" />
				<ext:Radio BoxLabel="Item 3" />
				<ext:Radio BoxLabel="Item 4" />
				<ext:Radio BoxLabel="Item 5" />
			</Items>
		</ext:RadioGroup>
		
		<ext:RadioGroup runat="server" ColumnsNumber="3" Vertical="true" Width="400">
			<Items>
				<ext:Radio BoxLabel="Item 1" />
				<ext:Radio BoxLabel="Item 2" Checked="true" />
				<ext:Radio BoxLabel="Item 3" />
				<ext:Radio BoxLabel="Item 4" />
				<ext:Radio BoxLabel="Item 5" />
			</Items>
		</ext:RadioGroup>

	</body>
</html>
