//Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
Ext.form.Field.prototype.msgTarget = 'side';
Ext.namespace('App.Default.Layout.Pagamento');
Ext.QuickTips.init();

try{
             
    App.Default.Layout.Pagamento = Ext.extend(Ext.util.Observable,{

        constructor: function(){

            var controllerPagamento = '/camisetas/pagamento/';
            var controllerLogoff = '/camisetas/logoff/';
                            
            /* DataStores - Inicio */

            var storePagamento = new Ext.data.JsonStore({
                root: 'pedidos',
                totalProperty: 'totalCount',
                idProperty: 'sq_pedido',
                remoteSort: true,
                autoDestroy: true,
                baseParams:{
                    status: 1, /*status - 1 = Aguardando Pagamento */
                    start: 0,
                    limit: 1000,
                    dir: 'asc',
                    sort: 'sq_pedido'
                },
                fields: [{
                    name: 'sq_pedido',
                    type: 'int'
                },{
                    name: 'dt_pedido'
                },{
                    name: 'vl_pedido',
                    type: 'float'
                },{
                    name: 'nm_usuario'
                }],
                proxy: new Ext.data.HttpProxy({
                    method: 'post',
                    url: controllerPagamento + 'carregar'
                })
            });
            
            storePagamento.on('loadexception',function(a,b,c){
                var data = eval(c.responseText);
                if(data.success===false){
                    alert('[Error]\n[storePedidos]\n['+data.error+']');
                }else{
                    alert('[Error]\n[storePedidos]\n[Erro desconhecido.]');
                }
            });
                        
            //            storePagamento.on('load',function(store){
            //                if(parseInt(store.reader.jsonData.totalCount)>0){
            //                    Ext.getCmp('btnBoletos').enable();
            //                }else{
            //                    Ext.getCmp('btnBoletos').disable();
            //                }
            //            });
            
            storePagamento.load();
           
            /*DataStores - Fim*/

            function Logoff(btn){
                if(btn=='yes'){
                    window.location = controllerLogoff;
                }
                if(btn=='ok'){
                    window.location = controllerLogoff;
                }
            }
            //
            //            var bbarPagamentoPaginacao = new Ext.Toolbar({
            //                border: true,
            //                frame: true,
            //                height: 30,
            //                items:[{
            //                    xtype:'paging',
            //                    pageSize: 20,
            //                    store: storePagamento,
            //                    displayInfo: true,
            //                    plugins: [new Ext.ux.ProgressBarPager({
            //                        displayMsg     : "<b>{0} &agrave; {1} de {2} pedidos(s)</b>"
            //                    })]
            //                }]
            //            });
            
            var bbarPagamento = new Ext.Toolbar({
                border: false,
                frame: false,
                height: 25,
                items:['->','-','-','-',
                'Desenvolvido por Michael Fernandes Rodrigues',
                '-','-','-'
                ]
            });

            var tbarPagamento = new Ext.Toolbar({
                border: true,
                frame: true,
                height: 30,
                //                margins: '5 5 5 5',
                items  : [{
                    xtype: 'button',
                    id: 'btnConfirmarPagamento',
                    text: 'Confirmar Pagamento',
                    iconCls: 'accept',
                    disabled: true,
                    scope: this,
                    handler: function(){
                        Ext.MessageBox.show({
                            title: 'Confirmacao de Pagamento',
                            msg: 'Voce tem certeza que deseja confirma o pagamento deste pedido?',
                            buttons: Ext.MessageBox.YESNOCANCEL,
                            fn: confirmarPagamento,
                            icon: Ext.MessageBox.QUESTION
                        })
                    }
                },{
                    xtype: 'button',
                    id: 'btnCancelarPagamento',
                    text: 'Cancelar Pagamento',
                    iconCls: 'delete',
                    disabled: true,
                    scope: this,
                    handler: function(){
                        Ext.MessageBox.show({
                            title: 'Confirmacao de Pagamento',
                            msg: 'Voce tem certeza que deseja cancelar este pedido?',
                            buttons: Ext.MessageBox.YESNOCANCEL,
                            fn: cancelarPagamento,
                            icon: Ext.MessageBox.QUESTION
                        })
                    }
                }]
            });

            /*Funcoes*/
            /*Cancelar Pagamento do Pedido*/
            function cancelarPagamento(btn){
                if(btn=='yes'){

                    /*Persistir cancelamento de pedido*/
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerPagamento + 'cancelar',
                        method: 'POST',
                        params: {
                            id_pedido : Ext.getCmp('dataGridPagamento').getSelectionModel().getSelected().get('sq_pedido')
                        },
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
                                        Ext.example.msg('Alerta', 'Pagamento cancelado com sucesso!');
                                        Ext.getCmp('btnConfirmarPagamento').disable();
                                        Ext.getCmp('btnCancelarPagamento').disable();
                                        storePagamento.load();
                                    }else{
                                        Ext.MessageBox.show({
                                            title: 'Erro',
                                            msg: data.error,
                                            buttons: Ext.MessageBox.OK,
                                            icon: Ext.MessageBox.ERROR,
                                            fn: function(btn){
                                                if(btn=='ok'){
                                                    Ext.getCmp('btnConfirmarPagamento').disable();
                                                    Ext.getCmp('btnCancelarPagamento').disable();
                                                    storePagamento.load();
                                                }
                                            }
                                        });
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

            /*Confirmar Pagamento do Cliente*/
            function confirmarPagamento(btn){
                if(btn=='yes'){

                    /*Persistir confirmacao de pagamento*/
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerPagamento + 'confirmar',
                        method: 'POST',
                        params: {
                            id_pedido : Ext.getCmp('dataGridPagamento').getSelectionModel().getSelected().get('sq_pedido')
                        },
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
                                        Ext.example.msg('Alerta', 'Pagamento confirmado com sucesso!');
                                        Ext.getCmp('btnConfirmarPagamento').disable();
                                        Ext.getCmp('btnCancelarPagamento').disable();
                                        storePagamento.load();
                                    }else{
                                        Ext.MessageBox.show({
                                            title: 'Erro',
                                            msg: data.error,
                                            buttons: Ext.MessageBox.OK,
                                            icon: Ext.MessageBox.ERROR,
                                            fn: function(btn){
                                                if(btn=='ok'){
                                                    Ext.getCmp('btnConfirmarPagamento').disable();
                                                    Ext.getCmp('btnCancelarPagamento').disable();
                                                    storePagamento.load();
                                                }
                                            }
                                        });
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

            var dataGridPagamento = new Ext.grid.GridPanel({
                id: 'dataGridPagamento',
                iconCls: 'icon-grid',
                stripeRows: true,
                loadMask: true,
                frame: true,
                border: true,
                margins:'0px 0px 0px 0px',
                columnLines: true,
                store: storePagamento,
                layout: 'fit',
                forceLayout: true,
                viewConfig: {
                    forceFit: true
                },
                sm: new Ext.grid.RowSelectionModel({
                    singleSelect:true,
                    listeners: {
                        selectionchange: function(sel){
                            var rec = sel.getSelected();
                            if(rec){
                                Ext.getCmp('btnConfirmarPagamento').enable();
                                Ext.getCmp('btnCancelarPagamento').enable();
                            }
                        }
                    }
                }),
                columns: [{
                    header: "#",
                    width: 100,
                    sortable: true,
                    dataIndex: 'sq_pedido'
                },{
                    header: "Data",
                    width: 150,
                    sortable: true,
                    dataIndex: 'dt_pedido',
                    renderer:Ext.util.Format.dateRenderer('d/m/Y')
                },{
                    header: "Valor",
                    width: 150,
                    sortable: true,
                    dataIndex: 'vl_pedido',
                    renderer: "brMoney"
                },{
                    header: "Cliente",
                    width: 200,
                    sortable: true,
                    dataIndex: 'nm_usuario'
                }],
                plugins:[new Ext.ux.ProgressBarPager()]
            });

            var viewPortPagamento = new Ext.Panel({
                id:'viewPortPagamento',
                bodyStyle:'padding:0px 0px 0px 0px',
                layout:'fit',
                layoutConfig: {
                    align : 'stretch',
                    pack  : 'start'
                },
                iconCls: 'application-view-icons',
                title: 'Pedidos Pendentes',
                resizeTabs:false,
                frame: false,
                border: false,
                split: false,
                margins:'0px 0px 0px 0px',
                defaults:{
                    autoScroll:true
                },
                items: [dataGridPagamento],
                tbar: tbarPagamento,
                bbar: new Ext.PagingToolbar({
                    pageSize: 100,
                    store: storePagamento,
                    displayInfo: true,
                    plugins: new Ext.ux.ProgressBarPager()
                })
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
                // beforeremove: removeTab
                },
                //plugins: new Ext.ux.TabCloseMenu(),
                items:[viewPortPagamento]
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
                    url: controllerPagamento + 'carregar-usuario-logado',
                    method: 'POST',
                    params: {
                        campo : 'nm_usuario'
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.getCmp('tbarPrincipal').setText('Olá, '+data.campo+'. (Pagamento)');
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
                    bbar: bbarPagamento,
                    border: false
                },PainelCentral
                ]

            });

            App.Default.Layout.Pagamento.superclass.constructor.apply(this,arguments);
        }
    });

}catch(e){
    Ext.example.msg('Erro', '{0}',e);
}