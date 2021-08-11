var MyApp = {
	template: '<span class="{0}">{1}</span>',

	change: function (value) {
		return Ext.String.format(MyApp.template, (value > 0) ? "positive" : "negative", value);
	},

	pctChange: function (value) {
		return Ext.String.format(MyApp.template, (value > 0) ? "positive" : "negative", value + "%");
	},

	changePageSize: function (grid, comboBox) {
		var store = grid.getStore();
		store.pageSize = comboBox.getValue();
		store.reload();
	}
}
