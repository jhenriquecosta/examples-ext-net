<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Title</title>
		<style>
			body { margin:10px; }
			
			.x-menu-item-link { padding: 4px 2px 3px 32px; }
			.x-menu .x-form-item-label, .x-menu .x-form-field, .x-menu .x-form-display-field { font-size:11px; }
		</style>
		<script>
			var MyApp = {
				onClose: function() {
					this.up('menu').tab.close();
				},

				onTriggerClick: function() {
					var menu = this.up('menu');
					menu.tab.setTitle(this.getValue());
					menu.hide();
				},

				onBeforeTabMenuShow: function(tabPanel, tab, menu) {
					var menuPrev = menu.items.get(3),
					    menuNext = menu.items.get(4);

					if (menuPrev !== undefined) {
						menuPrev.setDisabled(tabPanel.items.first() === tab);
					}

					if (menuNext !== undefined) {
						menuNext.setDisabled(tabPanel.items.last() === tab);
					}
				},

				onTabMovePrevious: function() {
					MyApp.moveTab.call(this, -1);
				},

				onTabMoveNext: function() {
					MyApp.moveTab.call(this, 1);
				},

				moveTab: function(position) {
					var menu = this.up('menu'),
					    tabItem = menu.tab,
					    tab = tabItem.tab,
					    tabPanel = tabItem.ownerCt,
					    tabBar = tabPanel.tabBar,
						newPosition = tabBar.items.indexOf(tab) + position;

					tabBar.items.remove(tab);
					tabPanel.items.remove(tabItem);

					tabBar.items.insert(newPosition, tab);
					tabPanel.items.insert(newPosition, tabItem);

					tabPanel.setActiveTab(tabItem);
					tabBar.doLayout();
				}
			};
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" />
		
		<ext:TabPanel runat="server" Height="150" Width="400">
			<DefaultTabMenu>
				<ext:Menu>
					 <Items>
						<ext:MenuItem Text="Close" Icon="TabDelete">
							<Listeners>
								<Click Fn="MyApp.onClose" />
							</Listeners>
						</ext:MenuItem>
						<ext:MenuItem Text="Close Other Tabs" />
						<ext:MenuSeparator />
						<ext:MenuItem Text="Move To Previous">
							<Listeners>
								<Click Fn="MyApp.onTabMovePrevious" />
							</Listeners>
						</ext:MenuItem>
						<ext:MenuItem Text="Move To Next">
							<Listeners>
								<Click Fn="MyApp.onTabMoveNext" />
							</Listeners>
						</ext:MenuItem>
						<ext:MenuSeparator />
						<ext:TriggerField Text="New title" StyleSpec="margin-left:33px;" FieldLabel="Rename Tab" LabelAlign="Top">
							<Triggers>
								<ext:FieldTrigger Icon="Empty" Qtip="Click to rename" />
							</Triggers>
							<Listeners>
								<TriggerClick Fn="MyApp.onTriggerClick" />
							</Listeners>
						</ext:TriggerField>
					 </Items>
				</ext:Menu>
			</DefaultTabMenu>
			<Items>
				<ext:Panel Title="Default Menu 1" Html="Tab 1" Closable="true" />
				<ext:Panel Title="Default Menu 2" Html="Tab 2" />
				<ext:Panel Title="Custom Menu" Html="Tab 3" >
					<TabMenu>
						<ext:Menu>
							<Items>
								<ext:MenuItem Text="Custom" />
							</Items>
						</ext:Menu>
					</TabMenu>
				</ext:Panel>
			</Items>
			<Listeners>
				<BeforeTabMenuShow Fn="MyApp.onBeforeTabMenuShow" />
			</Listeners>
		</ext:TabPanel>
	</body>
</html>
