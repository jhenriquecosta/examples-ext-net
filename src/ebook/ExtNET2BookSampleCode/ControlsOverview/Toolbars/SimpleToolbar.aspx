<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head>
		<title>A simple toolbar</title>
		<style>
			body { padding: 10px; }
		</style>
		
		<script>
			var MyApp = {
				onItemClick: function(item) {
					Ext.MessageBox.show({
						title: "Menu Click",
						html: String.format('You clicked "{0}".', item.text)
					});
				}
			};
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Window runat="server" Resizable="true" Width="300" Height="200" BodyPadding="5">
			<TopBar>
				<ext:Toolbar EnableOverflow="true">
					<Items>
						<ext:SplitButton Text="Paste" Icon="PastePlain">
							<Menu>
								<ext:Menu>
									<Items>
										<ext:MenuItem Text="Paste Plain Text" />
										<ext:MenuItem Text="Paste with Merge" />
										<ext:MenuSeparator />
										<ext:MenuItem Text="Paste Special..." />
									</Items>
								</ext:Menu>
							</Menu>
						</ext:SplitButton>
						<ext:Button Tooltip="Cut" Icon="Cut" />
						<ext:Button Tooltip="Copy" Icon="PageWhiteCopy" />
						<ext:ToolbarSeparator />
						<ext:Button Text="Change case">
							<Menu>
								<ext:Menu>
									<Items>
										<ext:MenuItem Text="Lower case" Icon="TextLowercase" />
										<ext:MenuItem Text="Upper case" Icon="TextUppercase" />
										<ext:MenuSeparator />
										<ext:MenuItem Text="Title case" />
									</Items>
								</ext:Menu>
							</Menu>
						</ext:Button>
						<ext:Button Text="More options">
							<Menu>
								<ext:Menu>
									<Items>
										<ext:MenuItem Text="Theme">
											<Menu>
												<ext:Menu>
													<Items>
														<ext:CheckMenuItem
															Text="Black"
															Group="theme"
															CheckHandler="MyApp.onItemCheck" />
														<ext:CheckMenuItem
															Text="Gray"
															Group="theme"
															Checked="true"
															CheckHandler="MyApp.onItemCheck" />
														<ext:CheckMenuItem
															Text="Blue"
															Group="theme"
															CheckHandler="MyApp.onItemCheck" />
													</Items>
												</ext:Menu>
											</Menu>
										</ext:MenuItem>
										<ext:MenuItem Text="Choose a Date" Icon="Calendar">
											<Menu>
												<ext:DateMenu>
													<Listeners>
														<Select Handler="alert(Ext.String.format('You chose {0}.', Ext.util.Format.date(date, 'M j, Y')));" />
													</Listeners>
												</ext:DateMenu>
											</Menu>
										</ext:MenuItem>
										<ext:MenuItem Text="Choose a Color" Icon="ColorSwatch">
											<Menu>
												<ext:ColorMenu>
													<Listeners>
														<Select Handler="alert(Ext.String.format('You chose {0}.', color));" />
													</Listeners>
												</ext:ColorMenu>
											</Menu>
										</ext:MenuItem>
									</Items>
								</ext:Menu>
							</Menu>
						</ext:Button>
					</Items>
				</ext:Toolbar>
			</TopBar>
			<Content>
				<p>Resize this window to see toolbar overflow in effect</p>
			</Content>
		</ext:Window>
			
		<ext:Toolbar>
			<Items>
				<ext:Button Icon="PastePlain" />
				<ext:Button Icon="Cut" />
				<ext:Button Icon="PageCopy" />
				<ext:ToolbarSeparator />
				<ext:TextField FieldLabel="Search" LabelAlign="Right" LabelWidth="50" />
				<ext:Button Icon="Find" />
				<ext:ToolbarSeparator />
				<ext:Button Text="Action">
					<Menu>
						<ext:Menu>
							<Items>
								<ext:Panel
									Title="Mega dropdown!"
									Icon="ApplicationForm"
									Width="200"
									Height="100" />
							</Items>
						</ext:Menu>
					</Menu>
				</ext:Button>
			</Items>
		</ext:Toolbar>
	</body>
</html>
