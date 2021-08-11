// ##################################################################
// Plugin to extend a paging toolbar with change page size capability
// ##################################################################
Ext.define('Ext.ux.plugin.PageSizeChanger', {
	extend: 'Ext.AbstractPlugin',

	alias: 'plugin.PageSizeChanger',

	labelText: 'Page size:',

	pageSizes: [10, 15, 20],

	changeButtonLabel: 'Change',

	init: function (pager) {
		if (!(pager instanceof Ext.PagingToolbar)) {
			throw "This plugin is designed to work with a paging toolbar";
		}

		this.store = pager.getStore();
		this.initComboBox();
		this.initChangeButton();

		var insertOffSet = pager.displayInfo === true ? 2 : 0;

		function getPosition() {
			return pager.items.getCount() - insertOffSet;
		}

		pager.insert(getPosition(), '-');
		pager.insert(getPosition(), { xtype: 'tbtext', text: this.labelText });
		pager.insert(getPosition(), this.comboBox);
		pager.insert(getPosition(), this.changeButton);
	},

	destroy: function () {
		delete this.comboBox;
		delete this.changeButton;
		delete this.getStore();
	},

	initComboBox: function () {
		var pageSizeRecords = [];

		Ext.each(this.pageSizes, function(item) {
			pageSizeRecords.push([item, item]);
		});

		this.comboBox = new Ext.form.ComboBox({
			width: 45,
			value: this.store.pageSize,
			typeAhead: false,
			forceSelection: true,
			editable: false,
			valueField: "value",
			store: new Ext.data.SimpleStore({
				fields: ["text", "value"],
				data: pageSizeRecords
			}),
			listeners: {
				select: { fn: this.select, scope: this }
			}
		});
	},

	initChangeButton: function () {
		this.changeButton = new Ext.Button({
			disabled: true,
			text: this.changeButtonLabel,
			listeners: {
				click: {
					fn: this.click,
					scope: this
				}
			}
		});
	},

	select: function () {
		this.changeButton.enable();
	},

	click: function () {
		var size = this.comboBox.getValue();
		this.store.pageSize = size;
		this.store.load();
		this.changeButton.disable();
	}
});
