Ext.namespace('App.Cliente');

App.Cliente.Carrinho = Ext.extend(Ext.form.FormPanel, {
    tbar: null,
    items: null,
    stores: {},
    grids: {},
    columns: {},
    layout: 'fit',
    bodyStyle:'padding:0px 0px 0px 0px',
    layoutConfig:{
        align:'stretch',
        pack:'start'
    },
    resizeTabs:false,
    frame: false,
    border: false,
    split: false,
    margins:'0 0 0 0',
    defaults:{
        autoScroll:true,
        margins:'0 0 0 0'
    },
    finalizarCarrinho: function(){
        Ext.Msg.show({
            msg: String.format('Voce tem certeza que deseja finalizar o seu carrinho?'),
            buttons: Ext.Msg.YESNO,
            icon: Ext.Msg.QUESTION,
            fn: function(btn) {
                if(btn == 'yes') {
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerCarrinho + 'finalizar',
                        method: 'POST',
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
                                        Ext.example.msg('Acao', 'Carrinho finalizado com sucesso');
                                        Ext.getCmp('dataGridCarrinho').store.removeAll();
                                        Ext.getCmp('dataGridCarrinho').store.load();
                                        try{
                                            Ext.getCmp('cd_pedido').store.load();
                                        }catch(e){}                                       
                                        try{
                                            Ext.get('iBoleto').dom.src = '';
                                            Ext.example.msg('Noticia', 'O boleto para o pagamento esta disponivel');
                                        }catch(e){
                                            Ext.example.msg('Noticia', 'O boleto para o pagamento esta disponivel');
                                        }
                                    }else{
                                        Ext.example.msg('Erro', 'Falha ao finalizar o carrinho');
                                    }
                                }catch(e){
                                    Ext.example.msg('Erro', '{0}',e);
                                }
                            }
                        },
                        failure: function(e) {
                            Ext.example.msg('Erro', '{0}',e);
                        }
                    });
                }
            }
        });
        return false;
    },
    alterarQuantidadeCarrinho: function(){
        var rec = Ext.getCmp('dataGridCarrinho').getSelectionModel().getSelected();
        if (rec && Ext.getCmp('QtdCarrinho').validate()) {
            var conn = new Ext.data.Connection();
            var data = null;
            conn.request({
                url: controllerCarrinho + 'quantidade',
                method: 'POST',
                params: {
                    sq_produto: rec.get('sq_produto'),
                    qt_produto: Ext.getCmp('QtdCarrinho').getValue()
                },
                success: function(responseObject) {
                    if(responseObject.responseText){
                        try{
                            data = eval(responseObject.responseText);
                            if(data.success===true){
                                Ext.example.msg('Acao', 'Quantidade alterada com sucesso');
                                var rec = Ext.getCmp('dataGridCarrinho').getSelectionModel().getSelected();
                                rec.set('quantidade',Ext.getCmp('QtdCarrinho').getValue());
                                Ext.getCmp('dataGridCarrinho').store.load();
                            }else{
                                Ext.example.msg('Erro', 'Falha ao alterar a quantidade');
                            }
                        }catch(e){
                            Ext.example.msg('Erro', '{0}',e);
                        }
                    }
                },
                failure: function(e) {
                    Ext.example.msg('Erro', '{0}',e);
                }
            });
        }
    },
    removerCarrinho: function(){

        var id = Ext.getCmp('dataGridCarrinho').getSelectionModel().getSelected().get('sq_produto');
        var conn = new Ext.data.Connection();
        var data = null;
        conn.request({
            url: controllerCarrinho + 'remover',
            method: 'POST',
            params: {
                sq_produto: id
            },
            success: function(responseObject) {
                if(responseObject.responseText){
                    try{
                        data = eval(responseObject.responseText);
                        if(data.success===true){
                            Ext.example.msg('Acao', 'Camiseta removida do carrinho com sucesso');
                            var rec = Ext.getCmp('dataGridCarrinho').getSelectionModel().getSelected();
                            Ext.getCmp('dataGridCarrinho').store.remove(rec);
                            Ext.getCmp('QtdCarrinho').disable();
                            Ext.getCmp('btnQtdCarrinho').disable();
                            Ext.getCmp('btnRemoverCarrinho').disable();
                            Ext.getCmp('dataGridCarrinho').store.load();
                        }else{
                            Ext.example.msg('Erro', 'Falha ao remover a camiseta do carrinho');
                        }
                    }catch(e){
                        Ext.example.msg('Erro', '{0}',e);
                    }
                }
            },
            failure: function(e) {
                Ext.example.msg('Erro', '{0}',e);
            }
        });
    },
    buildColumns: function(){
        this.columns.carrinho =  [
        {
            header: "#",
            width: 15,
            sortable: true,
            dataIndex: 'sq_produto'
        },

        {
            header: "Nome",
            width: 50,
            sortable: true,
            dataIndex: 'nm_produto'
        },
        {
            header: "Descricao",
            width: 90,
            sortable: true,
            dataIndex: 'ds_produto'
        },
        {
            header: "Tamanho",
            width: 30,
            sortable: true,
            dataIndex: 'tm_produto'
        },{
            header: "Valor",
            width: 30,
            sortable: true,
            dataIndex: 'vl_produto'
        },
        {
            header: "Quantidade",
            width: 10,
            dataIndex: 'qt_produto',
            sortable: true,
            editable: true
        }
        ];
    },
    buildStores: function(){
        this.stores.carrinho = new Ext.data.JsonStore({
            id: 'storeCarrinho',
            root: 'images',
            totalProperty: 'totalCount',
            idProperty: 'sq_produto',
            remoteSort: false,
            autoDestroy: true,
            baseParams:{
                start:0,
                limit:20
            },
            fields: ['sq_produto','nm_produto','ds_produto','tm_produto','qt_produto', 'hs_produto',{
                name:'vl_produto',
                type: 'float'
            }],
            proxy: new Ext.data.HttpProxy({
                method: 'post',
                url: controllerCarrinho + 'carregar'
            })
        });

        this.stores.carrinho.on('load',function(store){
            if(parseInt(store.reader.jsonData.totalCount)>0){
                Ext.getCmp('btnCarrinho').enable();
                Ext.getCmp('txTotalCarrinho').setText('Total: R$'+parseFloat(store.reader.jsonData.totalCarrinho));
                Ext.getCmp('btnFinalizarCarrinho').enable();
            }else{
                Ext.getCmp('btnCarrinho').disable();
                Ext.getCmp('QtdCarrinho').disable();
                Ext.getCmp('btnQtdCarrinho').disable();
                Ext.getCmp('btnRemoverCarrinho').disable();
                Ext.getCmp('btnFinalizarCarrinho').disable();
                Ext.getCmp('txTotalCarrinho').setText('Total: R$0.00');
            }
        });

        this.stores.carrinho.setDefaultSort('nm_produto', 'asc');
        this.stores.carrinho.load();
    },
    buildGrids: function(){
        this.grids.carrinho = new Ext.grid.GridPanel({
            id: 'dataGridCarrinho',
            iconCls: 'icon-grid',
            stripeRows: true,
            loadMask: true,
            columnLines: true,
            store: this.stores.carrinho,
            listeners:{
                dblclick:function(){
                    Ext.example.msg('Event', 'Click Duplo');
                    var rec = Ext.getCmp('dataGridCarrinho').getSelectionModel().getSelected();
                    var win = new Ext.Window({
                        resizable: false,
                        iconCls: 'silk-add',
                        layout:'fit',
                        title: rec.get('nm_produto'),
                        width:650,
                        height:650,
                        modal: true,
                        closeAction:'hide',
                        plain: false,
                        items: new Ext.Panel({
                            deferredRender:false,
                            border:false,
                            html: '<img alt="carregando..." width="650" height="604" src="'+controllerProdutos+'renderizar/?imagem='+rec.get('hs_produto')+'&cor='+rec.get('co_produto')+'&tamanho=650"/>'
                        }),
                        buttons: []
                    });
                    win.show();
                }
            },
            sm: new Ext.grid.RowSelectionModel({
                singleSelect:true,
                listeners: {
                    selectionchange: function(sel){
                        var rec = sel.getSelected();
                        if(rec){
                            Ext.getCmp('QtdCarrinho').setValue(rec.get('qt_produto'));
                            Ext.getCmp('QtdCarrinho').enable();
                            Ext.getCmp('btnQtdCarrinho').enable();
                            Ext.getCmp('btnRemoverCarrinho').enable();
                        }
                    }
                }
            }),
            columns : this.columns.carrinho,
            tbar: this.tbar,
            viewConfig: {
                forceFit: true
            },
            bbar: {
                xtype:'paging',
                pageSize: 20,
                store: this.stores.carrinho,
                displayInfo: true,
                plugins: [new Ext.ux.ProgressBarPager({
                    displayMsg     : "<b>{0} &agrave; {1} de {2} camisetas(s)</b>"
                })]
            }
        });
    },
    buildItems: function(){
        this.items = new Ext.Panel({
            layout: 'fit',
            frame: true,
            bodyStyle:'padding:0px 0px 0px 0px;',
            items: [this.grids.carrinho]
        });
    },
    buildTbar: function(){
        this.tbar = new Ext.Toolbar({
            id: 'tbarCarrinho',
            height: 30,
            items:['Quantidade:',new Ext.ux.form.SpinnerField({
                id: 'QtdCarrinho',
                width: 50,
                minValue: 1,
                maxValue: 100,
                allowDecimals: false,
                decimalPrecision: 1,
                incrementValue: 1,
                alternateIncrementValue: 1,
                accelerate: true
            }),{
                text: 'Confirmar',
                id: 'btnQtdCarrinho',
                iconCls: 'silk-add',
                handler: this.alterarQuantidadeCarrinho
            },{
                text: 'Remover',
                id: 'btnRemoverCarrinho',
                iconCls: 'silk-delete',
                handler: this.removerCarrinho
            }, '-',{
                text: 'Finalizar o Carrinho',
                id: 'btnFinalizarCarrinho',
                iconCls: 'arrow-divide',
                handler: this.finalizarCarrinho
            },'->',{
                xtype: 'label',
                id: 'txTotalCarrinho',
                iconCls: 'silk-delete',
                store: this.stores.carrinho,
                displayField: 'totalCarrinho',
                valueField: 'totalCarrinho'
            }]
        });
    },
    initComponent : function() {
 
        this.buildStores();
        this.buildColumns();
        this.buildGrids();
        this.buildItems();
        this.buildTbar();

        Ext.getCmp('QtdCarrinho').disable();
        Ext.getCmp('btnQtdCarrinho').disable();
        Ext.getCmp('btnRemoverCarrinho').disable();
           
        App.Cliente.Carrinho.superclass.initComponent.call(this);
    }
});


new App.Cliente.Carrinho;

