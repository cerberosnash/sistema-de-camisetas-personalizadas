Ext.ns('App', 'App.cliente');

var storeAtivo = new Ext.data.ArrayStore({
    fields: ['label', 'value'],
    data : [['true', true],['false', false]]
});

App.cliente.boletos = Ext.extend(Ext.form.FormPanel, {
    border: false,
    frame: false,
    bodyStyle:'padding:15px 15px 15px 15px',
    defaultType: 'textfield',
    defaults: {
        width: 300,
        selectOnFocus: true,
        allowBlank: false
     
    //anchor: '100%'
    },
    // private A pointer to the currently loaded record
    record : null,
    help: null,
    /**
     * initComponent
     * @protected
     */
    initComponent : function() {
      
        // super
        App.cliente.boletos.superclass.initComponent.call(this);
   
    }
//extensivel;
},{

});


new  App.cliente.boletos;