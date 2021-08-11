Ext.define('MyApp.FinancialGrid', {
	extend: 'Ext.grid.Panel',

	alias: 'widget.financialgrid',

	template: '<span class="{0}">{1}{2}</span>',

	change: function (value) {
		return this.formatChange(value);
	},

	pctChange: function (value) {
		return this.formatChange(value, '%');
	},

	formatChange: function (value, suffix) {
		return Ext.String.format(
			this.template,
			(value > 0) ? 'positive' : 'negative',
			value,
			suffix || '');
	},

	initEvents: function () {
		this.addEvents('companyselected');

		this.on('select', this.onSelect, this);

		this.callParent();
	},

	onSelect: function (row, record) {
		this.fireEvent('companyselected', this, record);
	},

	changePageSize: function (pageSize) {
		var store = this.getStore();
		store.pageSize = pageSize;
		store.load();
	}
});
