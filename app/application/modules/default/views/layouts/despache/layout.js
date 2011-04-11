//Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
Ext.form.Field.prototype.msgTarget = 'under';
Ext.namespace('App.Default.Layout.Despache');
Ext.QuickTips.init();

try{
             
    App.Default.Layout.Despache = Ext.extend(Ext.util.Observable,{

        constructor: function(){

            //   var controllerCliente = '/camisetas/cliente/';
            var controllerDespache = '/camisetas/despache/';
            var controllerIndex = '/camisetas/';
            //var controllerUtil = "/camisetas/util/";
            //  var controllerProdutos = '/camisetas/produtos/';
            var controllerLogoff = '/camisetas/logoff/';
               
            var storeDespache = new Ext.data.JsonStore({
                root: 'pedidos',
                totalProperty: 'totalCount',
                idProperty: 'sq_pedido',
                remoteSort: true,
                autoDestroy: true,
                baseParams:{
                    status: 3, /*status - 3 = Aguardando Despache */
                    start: 0,
                    limit: 1000,
                    dir: 'asc',
                    sort: 'sq_pedido'
                },
                fields: [{
                    name: 'sq_pedido',
                    type: 'int'
                }],
                proxy: new Ext.data.HttpProxy({
                    method: 'post',
                    url: controllerDespache + 'carregar'
                })
            });
            
            storeDespache.on('loadexception',function(a,b,c){
                var data = eval(c.responseText);
                if(data.success===false){
                    alert('[Error]\n[storePedidos]\n['+data.error+']');
                }else{
                    alert('[Error]\n[storePedidos]\n[Erro desconhecido.]');
                }
            });
                        
            //            storeDespache.on('load',function(store){
            //                if(parseInt(store.reader.jsonData.totalCount)>0){
            //                    Ext.getCmp('btnBoletos').enable();
            //                }else{
            //                    Ext.getCmp('btnBoletos').disable();
            //                }
            //            });
            
            storeDespache.load();

            /*DataStores - Fim*/
            
            function carregarInformacoesClientePedido(id){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: controllerDespache + 'informacoes-cliente',
                    method: 'POST',
                    params: {
                        id_pedido : id
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.getCmp('ipNome').setValue(data.nm_usuario);
                                    Ext.getCmp('ipCPF').setValue(data.nu_cpf);
                                    Ext.getCmp('ipDDResidencial').setValue(data.dd_residencial);
                                    Ext.getCmp('ipNUResidencial').setValue(data.nu_residencial);
                                    Ext.getCmp('ipDDCelular').setValue(data.dd_celular);
                                    Ext.getCmp('ipNUCelular').setValue(data.nu_celular);
                                    Ext.getCmp('ipMunicipio').setValue(data.sq_municipio);
                                    Ext.getCmp('ipCEP').setValue(data.nu_cep);
                                    Ext.getCmp('ipEndereco').setValue(data.tx_endereco);
                                    Ext.getCmp('ipUF').setRawValue(data.nm_uf);
                                    Ext.getCmp('ipMunicipio').setRawValue(data.nm_municipio);
                                    Ext.get('iGuiaPostagem').dom.src = controllerDespache +'guia/pedido/'+id;
                                }else{
                                    Ext.example.msg('Erro', 'Falha ao carregar as informacoes do cliente.');
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
            

            function Logoff(btn){
                if(btn=='yes'){
                    window.location = controllerLogoff;
                }
                if(btn=='ok'){
                    window.location = controllerLogoff;
                }
            }

            function PaginaInicial(btn){
                if(btn=='ok'){
                    window.location = controllerIndex;
                }
            }
     
            var bbarWest = new Ext.Toolbar({
                border: false,
                frame: false,
                height: 25,
                items:['->','-','-','-',
                'Desenvolvido por Michael Fernandes Rodrigues',
                '-','-','-'
                ]
            });

                
                
            var painelInformacoesPostagem =  new Ext.form.FormPanel({
                region:'west',
                layout: 'form',
                title: 'Informacoes da postagem',
                iconCls:'application-home',
                frame: false,
                border: true,
                width: 420,
                autoScroll: false,
                margins: '0px 0px 0px 0px',
                id: 'painelInformacoesPostagem',
                bodyStyle:'padding:5px 5px 5px 5px',
                items: [{
                    xtype: 'fieldset',
                    title: 'Informacoes do pedido',
                    defaults:{
                        width: 320,
                        msgTarget: 'under',
                        allowBlank: false,
                        maxLength: 100
                    },
                    items: [{
                        xtype: 'combo',
                        fieldLabel: 'N. Pedido',
                        name: 'nuPedido',
                        id: 'nuPedido',
                        store: storeDespache,
                        displayField:'sq_pedido',
                        valueField: 'sq_pedido',
                        typeAhead: true,
                        mode: 'remote',
                        editable: true,
                        forceSelection: true,
                        triggerAction: 'all',
                        width: 260,
                        selectOnFocus:true,
                        listeners: {
                            select: function(a){
                                Ext.example.msg('Despache', 'Pedido {0} selecionado.', a.getValue());
                                carregarInformacoesClientePedido( a.getValue());
                            }
                        }
                    }]
                },{
                    xtype: 'fieldset',
                    defaults:{
                        width: 320,
                        msgTarget: 'under',
                        allowBlank: false
                    },
                    title: 'Informacoes do correio',
                    items: [{
                        width: 260,
                        xtype: 'textfield',
                        fieldLabel: 'Rastreamento',
                        name: 'nuRastreamento',
                        id: 'nuRastreamento',
                        vtype: 'rastreamento',
                        msgTarget: 'under'
                    }]
                },{
                    xtype: 'fieldset',
                    title: 'Dados Pessoais',
                    defaults:{
                        width: 260,
                        readOnly: true,
                        msgTarget: 'under',
                        height: 25
                    },
                    items: [{
                        xtype: 'textfield',
                        fieldLabel: 'Nome',
                        name: 'Nome',
                        id: 'ipNome'
                    },{
                        xtype: 'textfield',
                        fieldLabel: 'CPF',
                        name: 'CPF',
                        id: 'ipCPF'
                    },{
                        xtype: 'compositefield',
                        fieldLabel: 'Tel. Residencial',
                        name: 'Tel. Residencial',
                        defaults:{
                            msgTarget: 'under',
                            height: 25                           
                        },
                        items: [{
                            xtype: 'textfield',
                            name: 'DDD Residencial',
                            id: 'ipDDResidencial',
                            width: 30
                        },{
                            xtype: 'textfield',
                            name: 'Tel. Residencial',
                            id: 'ipNUResidencial',
                            width: 225
                        }
                        ]
                    },{
                        xtype: 'compositefield',
                        fieldLabel: 'Tel. Celular',
                        defaults:{
                            msgTarget: 'under',
                            height: 25
                        },
                        items: [{
                            xtype: 'textfield',
                            name: 'DDD Celular',
                            id: 'ipDDCelular',
                            width: 30
                        },{
                            xtype: 'textfield',
                            name: 'Tel. Celular',
                            id: 'ipNUCelular',
                            width: 225
                        }]
                    },{
                        fieldLabel: 'Estado',
                        xtype: 'textfield',
                        name: 'Estado',
                        id: 'ipUF'
                    },{
                        fieldLabel: 'Município',
                        xtype: 'textfield',
                        name: 'Municipio',
                        id: 'ipMunicipio'
                    },{
                        xtype: 'textfield',
                        fieldLabel: 'CEP',
                        id: 'ipCEP',
                        name: 'CEP'
                    },{
                        fieldLabel: 'Endereço',
                        name: 'Endereço',
                        id: 'ipEndereco',
                        xtype: 'textarea'
                    }]
                }
                ],
                buttons: [
                {
                    xtype: 'button',
                    bodyStyle:'padding:10px 10px 10px 10px',
                    text: 'Gerar guia de postagem',
                    id: 'btnGerarGuiaPostagem',
                    iconCls: 'disk',
                    handler: function(){
                        alert('salvar');
                    }
                },
                {
                    xtype: 'button',
                    bodyStyle:'padding:10px 10px 10px 10px',
                    text: 'Concluir postagem',
                    id: 'btnFinalizarPostagem',
                    iconCls: 'disk',
                    handler: function(){
                        alert('gerar guia!!!');
                    }
                }
                ]
            });
            
            var painelVisualizacaoGuia = new Ext.Panel({
                region: 'center',
                margins: '0px 0px 0px 0px',
                autoScroll: false,
                autoHeight: false,
                autoEl: {
                    tag: 'iframe',
                    name: 'iGuiaPostagem',
                    id: 'iGuiaPostagem',
                    frameborder : 0,
                    src: controllerDespache +'guia/pedido/30'                   
                }
            });

        
            /*Movido para view-carrinho.js*/
            var DataGridDespache = new Ext.grid.GridPanel({
                layout: 'hbox',
                iconCls: 'icon-grid',
                frame: true,
                border: true,
                //region: 'west',
                width: 350,
                height: 200,
                stripeRows: true,
                loadMask: true,
                columnLines: true,
                store: storeDespache,
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
                columns : [/*
                {
                    header: "#",
                    width: 15,
                    sortable: true,
                    dataIndex: 'sq_produto'
                },
                {
                    header: "Cor",
                    width: 5,
                    sortable: true,
                    dataIndex: 'co_produto',
                    renderer: function (val, meta, record, rowIndex, colIndex, store) {
                        meta.css = ' c'+val;
                        return '';
                    }
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
                    width: 10,
                    sortable: true,
                    dataIndex: 'tm_produto',
                    renderer: function (val, meta, record, rowIndex, colIndex, store) {
                        if(val=='G'){
                            return 'Grande';
                        }else if(val=='M'){
                            return 'Média';
                        }else{
                            return 'Pequena';
                        }
                    }
                },{
                    header: "Valor",
                    width: 10,
                    sortable: true,
                    dataIndex: 'vl_produto',
                    renderer: 'brMoney'
                },
                {
                    header: "Quantidade",
                    width: 10,
                    dataIndex: 'qt_produto',
                    sortable: true,
                    editable: true,
                    renderer: function (val, meta, record, rowIndex, colIndex, store) {
                        return val + ' Camiseta(s)';
                    }
                }*/
                ],
                //  tbar: tbarCarrinho,
                viewConfig: {
                    forceFit: true
                },
                bbar: {
                    xtype:'paging',
                    pageSize: 20,
                    store: storeDespache,
                    displayInfo: true,
                    plugins: [/*new Ext.ux.ProgressBarPager({
                        displayMsg     : "<b>{0} &agrave; {1} de {2} camisetas(s)</b>"
                    })*/]
                }/*,
                tbar: tbarCenter*/
            });

            var viewPortDespache = new Ext.Panel({
                id:'viewPortDespache',
                layout:'border',
                resizable: true,
                bodyStyle:'padding:0px 0px 0px 0px',
                margins: '0px 0px 0px 0px',
                layoutConfig: {
                //    align : 'stretch',
                //pack  : 'start'
                },
                iconCls: 'application-view-icons',
                title: 'Despache',
                resizeTabs:false,
                frame: false,
                border: false,
                split: false,
                defaults:{
                    autoScroll:true
                },
                items: [DataGridDespache,painelInformacoesPostagem,painelVisualizacaoGuia]//,
            //tbar: tbarCenter//,
            // bbar: bbarEast
            });
        

            var PainelCentral = new Ext.TabPanel({
                id: 'PainelCentral',
                resizeTabs:false,
                minTabWidth: 115,
                tabWidth:135,
                frame: false,
                border: false,
                enableTabScroll:true,
                region: 'center',
                split: false,
                deferredRender: true,
                margins:'0 0 0 0',
                activeTab:0,
                defaults:{
                    //   closable: true,
                    autoScroll:true
                },
                listeners:{
                //beforeremove: removeTab
                },
                //plugins: new Ext.ux.TabCloseMenu(),
                items:[viewPortDespache]
            });

            
            var tbarPrincipal = new Ext.ux.StatusBar({
                id: 'tbarPrincipal',
                renderTo:Ext.getBody(),
                items: [{
                    xtype:'button',
                    text: 'Sair',
                    id: 'btnSair',
                    hidden: true,
                    iconCls: 'decline',
                    handler: function(){
                        Ext.MessageBox.show({
                            title: 'Fechar o Sistema',
                            msg: 'Voce tem certeza que deseja fechar o sistema?',
                            buttons: Ext.MessageBox.YESNOCANCEL,
                            fn: Logoff,
                            icon: Ext.MessageBox.QUESTION
                        })
                    }
                }]
            });

            /*Recuperar no do usuario logado*/
            var nomeUsuarioLogado = function(){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: controllerDespache + 'carregar-usuario',
                    method: 'POST',
                    params: {
                        campo : 'nm_usuario'
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.getCmp('tbarPrincipal').setText('Olá, '+data.campo+'. (Despachante)');
                                }else{
                                    Ext.getCmp('tbarPrincipal').setText('Olá, Seja bem vindo.');
                                }
                            }catch(e){
                                Ext.example.msg('Erro', '{0}',e);
                                Ext.getCmp('tbarPrincipal').setText('Olá, Seja bem vindo.');
                            }
                        }
                    },
                    failure: function(e) {
                        Ext.example.msg('Erro', '{0}',e);
                        Ext.getCmp('tbarPrincipal').setText('Olá, Seja bem vindo.');
                    }
                });
            }

            nomeUsuarioLogado();

            new Ext.Viewport({
                layout:'border',
                items:[
                {
                    id: 'header',
                    region: 'north',
                    split: false,
                    margins: '28 0 0 0',
                    bodyStyle:'padding:0px 0px 0px 0px',
                    border: false,
                    height: 80,
                    html:'<div id="logo"><div id="marca"></div><div id="contato"></div></div>'
                },{
                    id:'preview',
                    region: 'south',
                    bbar: bbarWest,
                    border: false
                },PainelCentral
                ]

            });

            App.Default.Layout.Despache.superclass.constructor.apply(this,arguments);
        }
    });

}catch(e){
    Ext.example.msg('Erro', '{0}',e);
}