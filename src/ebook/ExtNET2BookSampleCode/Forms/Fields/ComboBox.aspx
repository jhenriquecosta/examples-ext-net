<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Form Field Examples</title>
		<style>
			body { padding:10px; }
			.x-form-item { margin: 2.5em 0; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" />

		<ext:ComboBox
			runat="server" 
			Editable="false"
			FieldLabel="Country"
			LabelAlign="Top"
			EmptyText="Select a country...">
			<Items>
				<ext:ListItem Text="Canada" Value="CA" />
				<ext:ListItem Text="United States" Value="USA" />
			</Items>
			<SelectedItems>
				<ext:ListItem Value="USA" />
			</SelectedItems>
		</ext:ComboBox>

		<ext:ComboBox
			runat="server" 
			Editable="false"
			FieldLabel="Country"
			LabelAlign="Top"
			MultiSelect="true"
			EmptyText="Select a country...">
			<Items>
				<ext:ListItem Text="Canada" Value="CA" />
				<ext:ListItem Text="United States" Value="USA" />
			</Items>
			<SelectedItems>
				<ext:ListItem Index="1" />
			</SelectedItems>
		</ext:ComboBox>
	</body>
</html>
