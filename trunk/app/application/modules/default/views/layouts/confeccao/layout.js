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
                    status: 2, /*status - 2 = Aguardando Confeccao */
                    start: 0,
                    limit: 20,
                    dir: 'asc',
                    sort: 'sq_pedido',
                    alocado: false
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
                    url: controllerConfeccao + 'carregar',
                    params:{
                        alocado:false
                    }
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

            storeConfeccao.on('load',function(store){
                if(parseInt(store.reader.jsonData.totalCount)>0){
                    Ext.getCmp('btnLockConfeccao').enable();
                }else{
                    Ext.getCmp('btnLockConfeccao').disable();
                }
            });

            storeConfeccao.load();

            var storeConfeccaoLock = new Ext.data.JsonStore({
                root: 'produtos',
                totalProperty: 'totalCount',
                idProperty: 'sq_produto',
                remoteSort: true,
                autoDestroy: true,
                baseParams:{
                    start: 0,
                    limit: 20,
                    dir: 'asc',
                    sort: 'sq_produto'
                },
                fields: [{
                    name: 'sq_produto',
                    type: 'int'
                },{
                    name: 'fg_verso'
                },{
                    name: 'co_produto'
                },{
                    name: 'nm_produto'
                },{
                    name: 'ds_produto'
                },{
                    name: 'tm_produto'
                },{
                    name: 'vl_produto'
                },{
                    name: 'nu_quantidade'
                },{
                    name: 'hs_produto',
                    type: 'string'
                }],
                proxy: new Ext.data.HttpProxy({
                    method: 'post',
                    url: controllerConfeccao + 'carregar-produtos'
                })
            });

            storeConfeccaoLock.on('loadexception',function(a,b,c){
                var data = eval(c.responseText);
                if(data.success===false){
                    alert('[Error]\n[storeProdutos]\n['+data.error+']');
                }else{
                    alert('[Error]\n[storeProdutos]\n[Erro desconhecido.]');
                }
            });

            storeConfeccaoLock.on('load',function(store){
                if(parseInt(store.reader.jsonData.totalCount)>0){
                    Ext.getCmp('btnFinalizarConfeccao').enable();
                }else{
                    Ext.getCmp('btnFinalizarConfeccao').disable();
                }
            });

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

            var bbarPrincipal = new Ext.Toolbar({
                border: false,
                frame: false,
                height: 25,
                items:['->','-','-','-',
                'Desenvolvido por Michael Fernandes Rodrigues',
                '-','-','-'
                ]
            });

            function ImprimirEstampa(hash){
                window.open(pathUploads+hash+'.png','Estampa','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=420,height=525');
            }

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
                                fn: alocarPedidoConfeccao,
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
                }
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
                                ImprimirEstampa(rec.get('hs_produto'));
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
                    sortable: true,
                    dataIndex: 'co_produto',
                    renderer: function (val, meta, record, rowIndex, colIndex, store) {
                        meta.css = ' c'+val;
                        return '';
                    }
                },
                {
                    header: "Posicao",
                    sortable: true,
                    dataIndex: 'fg_verso',
                    renderer: function (val, meta, record, rowIndex, colIndex, store) {
                        if(val=='true'){
                            return 'Verso';
                        }else{
                            return 'Frente';
                        }
                    }
                },
                {
                    header: "Nome",
                    sortable: true,
                    dataIndex: 'nm_produto'
                },
                {
                    header: "Descricao",
                    sortable: true,
                    dataIndex: 'ds_produto'
                },
                {
                    header: "Tamanho",
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
                    dataIndex: 'nu_quantidade',
                    sortable: true,
                    editable: true,
                    renderer: function (val, meta, record, rowIndex, colIndex, store) {
                        return val + ' Camiseta(s)';
                    }
                },
                {
                    header: "Hash",
                    dataIndex: 'hs_produto',
                    sortable: true
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
                        iconCls: 'accept',
                        handler: function(){
                            Ext.MessageBox.show({
                                title: 'Finalizacao do Pedido',
                                msg: 'Voce tem certeza que deseja finalizar este pedido?',
                                buttons: Ext.MessageBox.YESNOCANCEL,
                                fn: finalizarConfeccao,
                                icon: Ext.MessageBox.QUESTION
                            });
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
                layoutConfig: {},
                iconCls: 'application-view-icons',
                title: 'Confeccao',
                resizeTabs:false,
                frame: false,
                border: false,
                split: false,
                defaults:{
                    autoScroll:true
                },
                items: [DataGridConfeccao,DataGridConfeccaoLock]
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
                    autoScroll:true
                },
                items:[viewPortConfeccao]
            });

            /*Botao Sair*/
            new Ext.ux.StatusBar({
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


            /*Funcoes*/
            function alocarPedidoConfeccao(btn){
                if(btn=='yes'){
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerConfeccao + 'alocar',
                        method: 'POST',
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
                                        storeConfeccao.load();
                                        storeConfeccaoLock.load();
                                        Ext.example.msg('Noticia',data.message);
                                    }else{
                                        Ext.example.msg('Erro',data.error);
                                    }
                                }catch(e){
                                    Ext.example.msg('Erro', '{0}',e);
                                }
                            }
                        },
                        failure: function(e) {
                            Ext.example.msg('Erro', '{0}',e);
                            Ext.getCmp('tbarPrincipal').setText('Olá, Seja bem vindo.');
                        }
                    });
                }
            }

            function finalizarConfeccao(btn){
                if(btn=='yes'){
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerConfeccao + 'finalizar-confeccao',
                        method: 'POST',
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
                                        storeConfeccao.load();
                                        storeConfeccaoLock.load();
                                        Ext.example.msg('Noticia',data.message);
                                    }else{
                                        Ext.example.msg('Erro',data.error);
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
      
            App.Default.Layout.Confeccao.superclass.constructor.apply(this,arguments);
        }
    });

}catch(e){
    Ext.example.msg('Erro', '{0}',e);
}