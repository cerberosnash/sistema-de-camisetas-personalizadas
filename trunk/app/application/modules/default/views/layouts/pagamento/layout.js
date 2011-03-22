//Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
Ext.form.Field.prototype.msgTarget = 'side';
Ext.namespace('App.Default.Layout.Pagamento');
Ext.QuickTips.init();

try{
             
    App.Default.Layout.Pagamento = Ext.extend(Ext.util.Observable,{

        constructor: function(){

            var controllerPagamento = '/camisetas/pagamento/';
                            
            /* DataStores - Inicio */

            var storePagamento = new Ext.data.JsonStore({
                root: 'pedidos',
                totalProperty: 'totalCount',
                idProperty: 'sq_pedido',
                remoteSort: true,
                autoDestroy: true,
                baseParams:{
                    start: 0,
                    limit: 20,
                    dir: 'asc',
                    sort: 'sq_pedido'
                },
                fields: [
                {
                    name: 'sq_pedido',
                    type: 'int'
                },
                {
                    name: 'dt_pedido'
                },
                {
                    name: 'vl_pedido',
                    type: 'float'
                },
                {
                    name: 'nm_usuario'
                }
                ],
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
            //            
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

            var bbarEast = new Ext.Toolbar({
                border: true,
                frame: true,
                height: 30,
                items:[{
                    xtype:'paging',
                    pageSize: 20,
                    store: storePagamento,
                    displayInfo: true,
                    plugins: [new Ext.ux.ProgressBarPager({
                        displayMsg     : "<b>{0} &agrave; {1} de {2} camisetas(s)</b>"
                    })]
                }]
            });
            
            var bbarWest = new Ext.Toolbar({
                border: false,
                frame: false,
                height: 25,
                items:['->','-','-','-',
                'Desenvolvido por Michael Fernandes Rodrigues',
                '-','-','-'
                ]
            });

            var tbarCenter = new Ext.Toolbar({
                border: true,
                frame: true,
                height: 30,
                margins: '5 5 5 5',
                items  : []
            });

            var DataViewPagamentos = new Ext.grid.GridPanel({
                id: 'dataGridPagamento',
                iconCls: 'icon-grid',
                stripeRows: true,
                loadMask: true,
                columnLines: true,
                store: storePagamento,
                sm: new Ext.grid.RowSelectionModel({
                    singleSelect:true,
                    listeners: {
                        selectionchange: function(sel){
                            var rec = sel.getSelected();
                            if(rec){
                        //                                Ext.getCmp('QtdCarrinho').setValue(rec.get('qt_produto'));
                        //                                Ext.getCmp('QtdCarrinho').enable();
                        //                                Ext.getCmp('btnQtdCarrinho').enable();
                        //                                Ext.getCmp('btnRemoverCarrinho').enable();
                        }
                        }
                    }
                }),
                columns: [{
                    header: "#",
                   // width: 15,
                    sortable: true,
                    dataIndex: 'sq_pedido'
                },{
                    header: "Data",
                    //width: 5,
                    sortable: true,
                    dataIndex: 'dt_pedido'
                },{
                    header: "Valor",
                    //width: 50,
                    sortable: true,
                    dataIndex: 'vl_pedido'
                },{
                    header: "Cliente",
                    //width: 90,
                    sortable: true,
                    dataIndex: 'nm_usuario'
                }]
            });

            var viewPortPagamento = new Ext.Panel({
                id:'viewPortPagamento',
                layout:'hbox',
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
                margins:'0 0 0 0',
                defaults:{
                    autoScroll:true
                },
                items: [DataViewPagamentos],
                tbar: tbarCenter,
                bbar: bbarEast
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
                    url: controllerPagamento + 'carregar-usuario',
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
                    bbar: bbarWest,
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