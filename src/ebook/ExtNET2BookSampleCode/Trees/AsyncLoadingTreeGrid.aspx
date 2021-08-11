<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Controllers" %>
<script runat="server">
protected void Page_Load(object sender, EventArgs e)
{
	if (X.IsAjaxRequest)
		return;
	
	string startingPath = IconTreeController.StartingPath;

	var dirInfo = new DirectoryInfo(startingPath);
	var rootNode = IconFolderTree.Root[0];
	IconTreeController.SetNodeCustomAttributes(rootNode, dirInfo);
}
</script>
<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Title</title>
		<style>
			body { padding:10px; }
			#IconFolderTree .x-panel-body { border-bottom:none; }
			.dir-info { background:#f5f5f5; padding:6px 8px; border-top:3px double #dcdcdc!important; border-bottom:1px solid #dcdcdc!important; }
			.dir-info p { font-size:11px; line-height:1.6; }
			.dir-info strong { font-weight:bold; }
		</style>
		<script>
			var MyApp = {
				showInfo: function (record) {
					var panel = this.getDockedItems("panel[dock=bottom]")[0];
					panel.update(record.data);
				}
			};
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" />
		
		<ext:TreePanel Id="IconFolderTree"
			runat="server" Width="300" height="220"
			Icon="Pictures" Title="Icons" AutoScroll="true">
			<ColumnModel>
				<Columns>
					<ext:TreeColumn Text="Folder" 
						Flex="1" DataIndex="text" />
					<ext:TemplateColumn 
						Text="Last Modified" 
						Width="150" DataIndex="lastMod">
						<Template>
							<Html>
								{lastMod:date("F j, Y, g:i a")}
							</Html>
						</Template>
					</ext:TemplateColumn>
				</Columns>
			</ColumnModel>
			<Root>
				<ext:Node NodeID="Root" Text="icons" Expanded="true" />
			</Root>
			<Store>
				<ext:TreeStore runat="server">
					<Model>
						<ext:Model>
							<Fields>
								<ext:ModelField Name="numFiles" Type="Int" />
								<ext:ModelField Name="numSubDirs" Type="Int" />
								<ext:ModelField Name="lastMod" Type="Date" DateFormat="yyyy-MM-dd HH:mm:ss" />
							</Fields>
						</ext:Model>
					</Model>
					<Proxy>
						<ext:AjaxProxy Url="/IconTree/GetSubDirectories" />
					</Proxy>
				</ext:TreeStore>
			</Store>
			<DockedItems>
				<ext:Panel Dock="bottom" height="70" BodyCls="dir-info">
					<Tpl>
						<Html>
							<p>Last Modified: <strong>{lastMod:date("F j, Y, g:i a")}</strong></p>
							<p>Number of files: <strong>{numFiles}</strong></p>
							<p>Number of subdirectories: <strong>{numSubDirs}</strong></p>
						</Html>
					</Tpl>
				</ext:Panel>
			</DockedItems>
			<Listeners>
				<Select Handler="MyApp.showInfo.call(
					#{IconFolderTree}, record);" />
			</Listeners>
		</ext:TreePanel>
	</body>
</html>
