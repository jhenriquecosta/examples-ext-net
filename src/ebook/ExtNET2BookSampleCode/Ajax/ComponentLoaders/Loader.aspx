<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Direct Method from User Control Example</title>
		<style>
			body { padding: 10px; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />

		<ext:TabPanel runat="server" width="300" height="200">
			<Items>
				<ext:Panel Title="First" Html="Activate second panel to see contents on demand" />
				<ext:Panel Title="Second" Layout="Accordion">
					<Loader Url="LoadComponent.ashx" Mode="Component">
						<LoadMask ShowMask="true" />
					</Loader>
				</ext:Panel>
			</Items>
		</ext:TabPanel>
	</body>
</html>
