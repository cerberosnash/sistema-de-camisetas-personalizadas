Ext.namespace('App.Cliente');

App.Cliente.Favoritos = Ext.extend(Ext.form.FormPanel, {
    bodyStyle:'padding:0px 0px 0px 0px',
    layout:'hbox',
    layoutConfig: {
        align : 'stretch',
        pack  : 'start'
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
    tbar: null,
    bbar: null,
    items: null,
    stores: {},
    dataviews: {},
    paineis: {},
    adicionarCarrinho:function(botao){
        var id = botao.value;
        var conn = new Ext.data.Connection();
        var data = null;
        conn.request({
            url: controllerCarrinho + 'adicionar',
            method: 'POST',
            params: {
                sq_produto: id
            },
            success: function(responseObject) {
                if(responseObject.responseText){
                    try{
                        data = eval(responseObject.responseText);
                        if(data.success===true){ 
                            Ext.example.msg('Acao', 'Camiseta adicionada no carrinho com sucesso');
                            storeCarrinho.load();
                            try{                               
                                Ext.getCmp('dataGridCarrinho').store.load();
                            }catch(e){
                                        
                            }
                        }else{
                            Ext.example.msg('Erro', 'Falha ao adicionar a camiseta ao carrinho');
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
    removerFavoritos:function(botao){
        var id = botao.value;
        if(id){
            Ext.Msg.show({
                msg: String.format('Voce tem certeza que deseja remover esta camiseta dos seus favoritos?'),
                buttons: Ext.Msg.YESNO,
                icon: Ext.Msg.QUESTION,
                fn: function(btn) {
                    if(btn == 'yes') {
                        var conn = new Ext.data.Connection();
                        var data = null;
                        conn.request({
                            url: controllerFavoritos + 'remover',
                            method: 'POST',
                            params: {
                                sq_produto: id
                            },
                            success: function(responseObject) {
                                if(responseObject.responseText){
                                    try{
                                        data = eval(responseObject.responseText);
                                        if(data.success===true){
                                            Ext.example.msg('Acao', 'Favorito removido com sucesso');
                                            Ext.getCmp('btnDelFavorito').disable();
                                            Ext.getCmp('btnAddFavCarrinho').disable();
                                            Ext.getCmp('DataViewFavoritos').store.load({
                                                params: {
                                                    start: 0,
                                                    limit: 20,
                                                    dir: 'desc',
                                                    sort: 'sq_produto',
                                                    query: Ext.getCmp('fr_query').getValue(),
                                                    preco_max: Ext.getCmp('fr_preco_max').getValue(),
                                                    preco_min: Ext.getCmp('fr_preco_min').getValue(),
                                                    tamanho: Ext.getCmp('fr_tamanho').getValue(),
                                                    cor: Ext.getCmp('fr_cor').getValue()
                                                }
                                            });

                                        }else{
                                            Ext.example.msg('Erro', 'Falha ao remover favorito');
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
        }
        return false;
    },
    buildTbar: function(){
        this.tbar = new Ext.Toolbar({
            id:'tbarFavoritos',
            border: false,
            frame: false,
            height: 30,
            margins: '5 5 5 5',
            items  : [
            '  ','Preço Minimo:',
            {
                id: 'fr_preco_min',
                xtype: 'combo',
                store: storeValoresCamisetas,
                displayField:'mValor',
                valueField: 'vValor',
                typeAhead: true,
                mode: 'local',
                value: '9.99',
                editable: false,
                forceSelection: true,
                triggerAction: 'all',
                width: 100,
                selectOnFocus:true,
                listeners: {
                    select: function(a){
                        Ext.example.msg('Preco Minimo Selecionado', 'Codigo {0}', a.getValue());
                        validarValoresFavoritos();
                    }
                }

            },'  ','Preço Máximo',
            {
                id: 'fr_preco_max',
                xtype: 'combo',
                store: storeValoresCamisetas,
                displayField:'mValor',
                valueField: 'vValor',
                typeAhead: true,
                mode: 'local',
                value: '99.99',
                editable: false,
                forceSelection: true,
                triggerAction: 'all',
                width: 100,
                selectOnFocus:true,
                listeners: {
                    select: function(a){
                        Ext.example.msg('Preco Maximo Selecionada', 'Codigo {0}', a.getValue());
                        validarValoresFavoritos();
                    }
                }
            },'  ','Tamanho:',
            {
                id: 'fr_tamanho',
                xtype: 'combo',
                store: storeTamanhosCamisetas,
                displayField:'mValor',
                valueField: 'vValor',
                typeAhead: true,
                mode: 'local',
                value: '',
                editable: false,
                forceSelection: true,
                triggerAction: 'all',
                width: 100,
                selectOnFocus:true,
                listeners: {
                    select: function(a){
                        Ext.example.msg('Tamanho Selecionada', 'Codigo {0}', a.getValue());
                        Ext.getCmp('DataViewFavoritos').store.load({
                            params: {
                                start: 0,
                                limit: 20,
                                dir: 'desc',
                                sort: 'sq_produto',
                                query: Ext.getCmp('fr_query').getValue(),
                                preco_max: Ext.getCmp('fr_preco_max').getValue(),
                                preco_min: Ext.getCmp('fr_preco_min').getValue(),
                                tamanho: Ext.getCmp('fr_tamanho').getValue(),
                                cor: Ext.getCmp('fr_cor').getValue()
                            }
                        });
                    }
                }
            },'  ','Cor:',
            {
                xtype: 'comboCores',
                id: 'fr_cor',
                fieldLabel:'Cor',
                anchor: '100%',
                value: '',
                valueField: 'vValor',
                displayField: 'mValor',
                iconClsField: 'cValor',
                width: 120,
                editable: false,
                selectOnFocus:true,
                forceSelection: true,
                triggerAction: 'all',
                listeners: {
                    select: function(a){
                        Ext.example.msg('Cor Selecionada', 'Codigo {0}', a.getValue());
                        Ext.getCmp('DataViewFavoritos').store.load({
                            params: {
                                start: 0,
                                limit: 20,
                                dir: 'desc',
                                sort: 'sq_produto',
                                query: Ext.getCmp('fr_query').getValue(),
                                preco_max: Ext.getCmp('fr_preco_max').getValue(),
                                preco_min: Ext.getCmp('fr_preco_min').getValue(),
                                tamanho: Ext.getCmp('fr_tamanho').getValue(),
                                cor: Ext.getCmp('fr_cor').getValue()
                            }
                        });
                    }
                }
            },'->','Palavra-Chave:',
            {
                xtype: 'textfield',
                name: 'query',
                id: 'fr_query',
                width: 250
            },'  ',{
                xtype:'button',
                text: '',
                title: 'Pesquisar',
                iconCls: 'find',
                handler:  function(a){
                    Ext.example.msg('Palavra-Chave Selecionada', 'Palavra {0}', Ext.getCmp('query').getValue());
                    Ext.getCmp('DataViewFavoritos').store.load({
                        params: {
                            start: 0,
                            limit: 20,
                            dir: 'desc',
                            sort: 'sq_produto',
                            query: Ext.getCmp('fr_query').getValue(),
                            preco_max: Ext.getCmp('fr_preco_max').getValue(),
                            preco_min: Ext.getCmp('fr_preco_min').getValue(),
                            tamanho: Ext.getCmp('fr_tamanho').getValue(),
                            cor: Ext.getCmp('fr_cor').getValue()
                        }
                    });
                }
            }]
        });
    },
    buildPainel: function(){
        this.paineis.visualizacao = new Ext.Panel({
            title: 'Visualizacao',
            iconCls:'application-home',
            frame: true,
            width: 350,
            html: '<img alt="carregando..." width="300" height="279" src="/camisetas/public/img/default.png"/>\n\
    <span>[Selecione uma camisetas dos favoritos para adiciona-la no carrinho, nos seus favoritos ou somente para visualizar os detalhes]</span>//',
            autoScroll: true,
            margins: '0 0 0 10',
            id: 'painelVisualizacaoFavoritos',
            tpl: tplVisualizacao,
            bbar: new Ext.Panel({
                id: 'bbarRemoverFavoritos',
                layout: 'hbox',
                buttonAlign: 'center',
                buttons:[{
                    bodyStyle: 'padding: 50px;',
                    text: 'Remover dos favoritos',
                    id: 'btnDelFavorito',
                    width: 160,
                    iconCls: 'heart-delete',
                    scope: this,
                    handler: this.removerFavoritos
                },{
                    text: 'Adicionar no carrinho',
                    id: 'btnAddFavCarrinho',
                    width: 160,
                    iconCls: 'cart-add',
                    scope: this,
                    handler: this.adicionarCarrinho
                }]
            })
        });
    },
    buildDataView:function(){
        this.dataviews.favoritos = new Ext.DataView({
            store: this.stores.favoritos,
            mode: 'remote',
            border: true,
            frame: true,
            flex:1,
            destroy: function(){
                Ext.fly('DataViewFavoritos').remove();
            },
            tpl: tplCamisetas,
            id: 'DataViewFavoritos',
            loadMask: true,
            itemSelector: 'li.camiseta',
            overClass   : 'camiseta-hover',
            singleSelect: true,
            multiSelect : false,
            autoScroll  : true,
            listeners: {
                dblclick:function(){
                    var selNode = Ext.getCmp('DataViewFavoritos').getSelectedRecords();
                    var win = new Ext.Window({
                        resizable: false,
                        iconCls: 'magnifier',
                        layout:'fit',
                        title: selNode[0].data.nm_produto,
                        width:650,
                        height:650,
                        modal: true,
                        closeAction:'hide',
                        plain: false,
                        items: new Ext.Panel({
                            deferredRender:false,
                            border:false,
                            html: '<img alt="carregando..." width="650" height="604" src="'+controllerProdutos+'renderizar/?imagem='+selNode[0].data.hs_produto+'&cor='+selNode[0].data.co_produto+'&tamanho=650"/>'
                        }),
                        buttons: []
                    });
                    win.show();
                },
                click: function(){
                    try{
                        var selNode =  Ext.getCmp('DataViewFavoritos').getSelectedRecords();
                        tplVisualizacao.overwrite( Ext.getCmp('painelVisualizacaoFavoritos').body, selNode[0].data);
                        Ext.getCmp('btnDelFavorito').enable();
                        Ext.getCmp('btnAddFavCarrinho').enable();
                        Ext.getCmp('btnAddFavCarrinho').value = selNode[0].data.sq_produto;
                        Ext.getCmp('btnDelFavorito').value = selNode[0].data.sq_produto;
                    }catch(e){
                        Ext.example.msg('Erro', '{0}',e);
                    }
                }
            }
        });
    },
    buildStores: function(){
        this.stores.favoritos = new Ext.data.JsonStore({
            root: 'images',
            totalProperty: 'totalCount',
            idProperty: 'sq_produto',
            remoteSort: true,
            autoDestroy: true,
            baseParams:{
                query: '',
                tamanho: '',
                cor: '',
                preco_max: '9.99',
                preco_min: '99.99',
                start:0,
                limit:20
            },
            fields: ['sq_produto','nm_produto','co_produto','ds_produto','tm_produto','hs_produto',{
                name:'vl_produto',
                type: 'float'
            }],
            proxy: new Ext.data.HttpProxy({
                method: 'post',
                url: controllerFavoritos + 'carregar'
            })
        });

        this.stores.favoritos.setDefaultSort('sq_produto', 'desc');

        this.stores.favoritos.on('load',function(store){
            if(store.reader.jsonData.success===true){
                if(parseInt(store.reader.jsonData.totalCount)>0){
                    Ext.getCmp('btnFavoritos').enable();
                }else{
                    Ext.getCmp('btnFavoritos').disable();
                }
            }
        });

        this.stores.favoritos.on('loadexception',function(a,b,c){
            var data = eval(c.responseText);
            if(data.success===false){
                alert('[Error]\n[storeFavoritos]\n['+data.error+']');
            }else{
                if(parseInt(c.reader.jsonData.totalCount)>0){
                    Ext.getCmp('btnFavoritos').enable();
                }else{
                    Ext.getCmp('btnFavoritos').disable();
                }
            }
        });

        this.stores.favoritos.load();
    },
    buildItems: function(){
        this.items = new Ext.Panel({
            id:'viewPortFavoritos',
            layout:'hbox',
            layoutConfig: {
                align : 'stretch',
                pack  : 'start'
            },
            items: [this.dataviews.favoritos,this.paineis.visualizacao],
            tbar: Ext.getCmp('tbarFavoritos'),
            bbar:  new Ext.Toolbar({
                border: false,
                frame: false,
                height: 30,
                items:[{
                    xtype:'paging',
                    pageSize: 20,
                    store: this.stores.favoritos,
                    displayInfo: true,
                    plugins: [new Ext.ux.ProgressBarPager()]
                }]
            })
        });
    },
    buildBbar: function(){

       
    },
    initComponent : function() {
        this.buildStores();
        this.buildPainel();
        this.buildTbar();
        this.buildBbar();
        this.buildDataView();
        this.buildItems();

        Ext.getCmp('btnDelFavorito').disable();
        Ext.getCmp('btnAddFavCarrinho').disable();
        
        App.Cliente.Favoritos.superclass.initComponent.call(this);
    }
});


new App.Cliente.Favoritos;