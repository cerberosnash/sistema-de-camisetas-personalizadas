//Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
Ext.form.Field.prototype.msgTarget = 'side';
Ext.namespace('App.Default.Layout.Confeccao');
Ext.QuickTips.init();

try{
             
    App.Default.Layout.Confeccao = Ext.extend(Ext.util.Observable,{

        constructor: function(){
           
            var controllerConfeccao = '/camisetas/confeccao/';
            var controllerLogoff = '/camisetas/logoff/';
            var pathUploads = '/camisetas/public/uploads/';
                  
            /* DataStores - Inicio */
            var storeConfeccao = new Ext.data.JsonStore({
                root: 'pedidos',
                totalProperty: 'totalCount',
                idProperty: 'sq_pedido',
                remoteSort: true,
                autoDestroy: true,
                baseParams:{
                    status: 1, /*status - 1 = Aguardando Confeccao */
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
                    url: controllerConfeccao + 'carregar'
                })
            });

            storeConfeccao.on('loadexception',function(a,b,c){
                var data = eval(c.responseText);
                if(data.success===false){
                    alert('[Error]\n[storePedidos]\n['+data.error+']');
                }else{
                    alert('[Error]\n[storePedidos]\n[Erro desconhecido.]');
                }
            });

            //            storeConfeccao.on('load',function(store){
            //                if(parseInt(store.reader.jsonData.totalCount)>0){
            //                    Ext.getCmp('btnBoletos').enable();
            //                }else{
            //                    Ext.getCmp('btnBoletos').disable();
            //                }
            //            });

            storeConfeccao.load();

            var storeConfeccaoLock = new Ext.data.JsonStore({
                root: 'pedidos',
                totalProperty: 'totalCount',
                idProperty: 'sq_pedido',
                remoteSort: true,
                autoDestroy: true,
                baseParams:{
                    status: 3, /*status - 3 = Aguardando Confeccao */
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
                    url: controllerConfeccao + 'carregar'
                })
            });

            storeConfeccaoLock.on('loadexception',function(a,b,c){
                var data = eval(c.responseText);
                if(data.success===false){
                    alert('[Error]\n[storePedidos]\n['+data.error+']');
                }else{
                    alert('[Error]\n[storePedidos]\n[Erro desconhecido.]');
                }
            });

            //            storeConfeccao.on('load',function(store){
            //                if(parseInt(store.reader.jsonData.totalCount)>0){
            //                    Ext.getCmp('btnBoletos').enable();
            //                }else{
            //                    Ext.getCmp('btnBoletos').disable();
            //                }
            //            });

            storeConfeccaoLock.load();

            /*DataStores - Fim*/

            function Logoff(btn){
                if(btn=='yes'){
                    window.location = controllerLogoff;
                }
                if(btn=='ok'){
                    window.location = controllerLogoff;
                }
            }

            function ImprimirEstampa(hash){
                window.open(pathUploads+hash,'Estampa','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=420,height=525');
            }

            var bbarPrincipal = new Ext.Toolbar({
                border: false,
                frame: false,
                height: 25,
                items:['->','-','-','-',
                'Desenvolvido por Michael Fernandes Rodrigues',
                '-','-','-'
                ]
            });

            function adicionarCarrinho(botao){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: controllerCarrinho + 'adicionar',
                    method: 'POST',
                    params: {
                        sq_produto: botao.value
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
                                    }catch(e){}
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
            }

            /*Grid de pedidos a serem confeccionados*/
            var DataGridConfeccao = new Ext.grid.GridPanel({
                layout: 'hbox',
                iconCls: 'icon-grid',
                frame: true,
                border: false,
                region: 'center',
                width: 350,
                height: 200,
                stripeRows: true,
                loadMask: true,
                columnLines: true,
                store: storeConfeccao,
                /*sm: new Ext.grid.RowSelectionModel({
                    singleSelect:true,
                    listeners: {
                        selectionchange: function(sel){
                            var rec = sel.getSelected();
                            if(rec){
                        //Ext.getCmp('QtdCarrinho').setValue(rec.get('qt_produto'));
                        //Ext.getCmp('QtdCarrinho').enable();
                        //Ext.getCmp('btnQtdCarrinho').enable();
                        //Ext.getCmp('btnRemoverCarrinho').enable();
                        }
                        }
                    }
                }),*/
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
                    header: "Cliente",
                    width: 200,
                    sortable: true,
                    dataIndex: 'nm_usuario'
                },{
                    header: "Valor",
                    width: 150,
                    sortable: true,
                    dataIndex: 'vl_pedido',
                    renderer: "brMoney"
                }],
                tbar:  new Ext.Toolbar({
                    border: false,
                    frame: false,
                    height: 25,
                    items:[{
                        xtype:'button',
                        text: 'Alocar pedido para confeccao',
                        id: 'btnLockConfeccao',
                        iconCls: 'lock',
                        handler: function(){
                            Ext.MessageBox.show({
                                title: 'Alocacao de pedido para confeccao',
                                msg: 'Voce tem certeza que deseja alocar um pedido para ser confeccionado?\nAtencao: Somente voce poderá confeccionar o pedido alocado!',
                                buttons: Ext.MessageBox.YESNOCANCEL,
                                fn: Logoff,
                                icon: Ext.MessageBox.WARNING
                            })
                        }
                    }]
                }),
                viewConfig: {
                    forceFit: true
                },
                bbar: {
                    xtype:'paging',
                    pageSize: 20,
                    store: storeConfeccao,
                    displayInfo: true,
                    plugins: [new Ext.ux.ProgressBarPager({
                        displayMsg     : "<b>{0} &agrave; {1} de {2} pedidos(s)</b>"
                    })]
                }/*,
                tbar: tbarCenter*/
            });

            /*Grid de pedidos a serem confeccionados*/
            var DataGridConfeccaoLock = new Ext.grid.GridPanel({
                layout: 'hbox',
                iconCls: 'icon-grid',
                frame: true,
                border: true,
                region: 'south',
                width: 350,
                height: 200,
                stripeRows: true,
                loadMask: true,
                columnLines: true,
                store: storeConfeccaoLock,
                sm: new Ext.grid.RowSelectionModel({
                    singleSelect:true,
                    listeners: {
                        selectionchange: function(sel){
                            var rec = sel.getSelected();
                            if(rec){

                                ImprimirEstampa();
                            //Ext.getCmp('QtdCarrinho').setValue(rec.get('qt_produto'));
                            //Ext.getCmp('QtdCarrinho').enable();
                            //Ext.getCmp('btnQtdCarrinho').enable();
                            //Ext.getCmp('btnRemoverCarrinho').enable();
                            }
                        }
                    }
                }),
                columns : [
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
                }
                ],
                viewConfig: {
                    forceFit: true
                },
                bbar: {
                    xtype:'paging',
                    pageSize: 20,
                    store: storeConfeccaoLock,
                    displayInfo: true,
                    plugins: [new Ext.ux.ProgressBarPager({
                        displayMsg     : "<b>{0} &agrave; {1} de {2} camisetas(s)</b>"
                    })]
                },
                tbar:  new Ext.Toolbar({
                    border: false,
                    frame: false,
                    height: 25,
                    items:[{
                        xtype:'button',
                        text: 'Finalizar confeccao',
                        id: 'btnFinalizarConfeccao',
                        iconCls: 'lock',
                        handler: function(){
                            Ext.MessageBox.show({
                                title: 'Finalizar confeccao',
                                msg: 'Voce tem certeza que deseja finalizar a confeccao deste pedido?',
                                buttons: Ext.MessageBox.YESNOCANCEL,
                                fn: Logoff,
                                icon: Ext.MessageBox.QUESTION
                            })
                        }
                    }]
                })
            });

            /*viewPort confeccao*/
            var viewPortConfeccao = new Ext.Panel({
                id:'viewPortConfeccao',
                layout:'border',
                resizable: true,
                bodyStyle:'padding:0px 0px 0px 0px',
                margins: '0px 0px 0px 0px',
                layoutConfig: {
                //    align : 'stretch',
                //pack  : 'start'
                },
                iconCls: 'application-view-icons',
                title: 'Confeccao',
                resizeTabs:false,
                frame: false,
                border: false,
                split: false,
                defaults:{
                    autoScroll:true
                },
                items: [DataGridConfeccao,DataGridConfeccaoLock]//,
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
                items:[viewPortConfeccao]
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
                    url: controllerConfeccao + 'carregar-usuario',
                    method: 'POST',
                    params: {
                        campo : 'nm_usuario'
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.getCmp('tbarPrincipal').setText('Olá, '+data.campo+'. (Confeccionador)');
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
                    bbar: bbarPrincipal,
                    border: false
                },PainelCentral
                ]

            });

            //Ext.getCmp('btnAddCarrinho').disable();
      
            App.Default.Layout.Confeccao.superclass.constructor.apply(this,arguments);
        }
    });

}catch(e){
    Ext.example.msg('Erro', '{0}',e);
}