Ext.namespace('App.Cliente');

App.Cliente.Boletos = Ext.extend(Ext.form.FormPanel, {
    tbar: null,
    items: null,
    stores: {},
    buildStores: function(){
        /*Store Pedidos*/
        this.stores.pedidos = new Ext.data.JsonStore({
            root: 'pedidos',
            totalProperty: 'totalCount',
            idProperty: 'sq_pedido',
            remoteSort: true,
            autoDestroy: true,
            fields: [{
                name: 'sq_pedido',
                type: 'int'
            },
            {
                name: 'cd_pedido'
            } ],
            proxy: new Ext.data.HttpProxy({
                method: 'post',
                url: controllerPedidos + 'carregar'
            })
        });

        this.stores.pedidos.on('loadexception',function(a,b,c){
            var data = eval(c.responseText);
            if(data.success===false){
                alert('[Error]\n[storePedidos]\n['+data.error+']');
            }else{
                alert('[Error]\n[storePedidos]\n[Erro desconhecido.]');
            }
        });

        this.stores.pedidos.on('load',function(store){
            if(parseInt(store.reader.jsonData.totalCount)>0){
                Ext.getCmp('btnBoletos').enable();
            }else{
                Ext.getCmp('btnBoletos').disable();
            }
        });

        this.stores.pedidos.load();

        this.stores.bancos = new Ext.data.ArrayStore({
            fields: ['mValor', 'vValor'],
            data : [
            ['Banco do Brasil', 'BB']
            ]
        });
    },
    buildItems: function(){
        this.items = new Ext.Panel({
            margins: '0 0 0 0',
            autoScroll: true,
            width: 700,
            autoHeight: true,
            autoEl: {
                tag: 'iframe',
                name: 'iBoleto',
                id: 'iBoleto',
                frameborder : 0
            }
        });
    },
    buildTbar: function(){
        this.tbar = new Ext.Toolbar({
            height: 30,
            id: 'tbarBoletos',
            frame: false,
            border: false,
            items  : ['Banco:',
            {
                id: 'nm_banco',
                xtype: 'combo',
                store: this.stores.bancos,
                displayField:'mValor',
                valueField: 'vValor',
                typeAhead: true,
                mode: 'local',
                editable: false,
                forceSelection: true,
                triggerAction: 'all',
                width: 200,
                selectOnFocus:true,
                listeners: {
                    select: function(a){
                        /**
                         *Debugger
                         *Ext.example.msg('Acao', 'Carregar o boleto do banco {0}', a.getValue());
                         **/
                       
                        if(Ext.getCmp('cd_pedido').getValue() && Ext.getCmp('nm_banco').getValue()){
                            Ext.MessageBox.show({
                                msg: 'Processando o Boleto, Aguarde...',
                                progressText: 'Processando...',
                                width:300,
                                wait:true,
                                waitConfig: {
                                    interval:100
                                },
                                icon:'money',
                                animEl: 'iBoleto'
                            });

                            var conn = new Ext.data.Connection();
                            var data = null;

                            conn.request({
                                url: controllerPedidos + 'processar',
                                method: 'POST',
                                params: {
                                    sq_pedido: Ext.getCmp('cd_pedido').getValue(),
                                    nm_banco:  Ext.getCmp('nm_banco').getValue()
                                },
                                success: function(responseObject) {
                                    if(responseObject.responseText){
                                        try{
                                            data = eval(responseObject.responseText);
                                            if(data.success===true){
                                                Ext.get('iBoleto').dom.src = controllerPedidos + 'boleto';
                                                setTimeout(function(){
                                                    Ext.MessageBox.hide();
                                                }, 1000);


                                            }
                                            else{
                                                Ext.example.msg('Erro', 'Falha no Processamento');
                                            }
                                        }
                                        catch(e){
                                            Ext.example.msg('Erro', '{0}',e);
                                        }
                                    }
                                },
                                failure: function(e) {
                                    Ext.example.msg('Erro', '{0}',e);
                                }
                            });
                        }/**else{
                            Ext.example.msg('Erro', 'Antes de imprimir o boleto selecione o banco e o pedido!');
                        }*/
                    }
                }

            },'Codigo do Pedido',
            {
                id: 'cd_pedido',
                xtype: 'combo',
                store: this.stores.pedidos,
                displayField:'cd_pedido',
                valueField: 'sq_pedido',
                typeAhead: true,
                mode: 'remote',
                editable: false,
                forceSelection: true,
                triggerAction: 'all',
                width: 200,
                selectOnFocus:true,
                listeners: {
                    select: function(a){
                        /**
                         *Debugger
                         *Ext.example.msg('Pedido', 'Pedido Selecionado {0}', a.getValue());
                         **/
                        if(Ext.getCmp('cd_pedido').getValue() && Ext.getCmp('nm_banco').getValue()){
                            Ext.MessageBox.show({
                                msg: 'Processando o Boleto, Aguarde...',
                                progressText: 'Processando...',
                                width:300,
                                wait:true,
                                waitConfig: {
                                    interval:100
                                },
                                icon:'money',
                                animEl: 'iBoleto'
                            });

                            var conn = new Ext.data.Connection();
                            var data = null;

                            conn.request({
                                url: controllerPedidos + 'processar',
                                method: 'POST',
                                params: {
                                    sq_pedido: Ext.getCmp('cd_pedido').getValue(),
                                    nm_banco:  Ext.getCmp('nm_banco').getValue()
                                },
                                success: function(responseObject) {
                                    if(responseObject.responseText){
                                        try{
                                            data = eval(responseObject.responseText);
                                            if(data.success===true){
                                                Ext.get('iBoleto').dom.src = controllerPedidos + 'boleto';
                                                setTimeout(function(){
                                                    Ext.MessageBox.hide();
                                                }, 1000);


                                            }
                                            else{
                                                Ext.example.msg('Erro', 'Falha no Processamento');
                                            }
                                        }
                                        catch(e){
                                            Ext.example.msg('Erro', '{0}',e);
                                        }
                                    }
                                },
                                failure: function(e) {
                                    Ext.example.msg('Erro', '{0}',e);
                                }
                            });
                        }else{
                            Ext.example.msg('Erro', 'Antes de imprimir o boleto selecione o banco e o pedido!');
                        }
                    }
                }
            },{
                xtype: 'button',
                text: 'Imprimir Boleto',
                iconCls: 'printer',
                handler: function(){
                    if(Ext.getCmp('cd_pedido').getValue() && Ext.getCmp('nm_banco').getValue()){
                        try{
                            PrintThisPage();
                        }catch(e){
                            Ext.example.msg('Erro', e);
                        }
                    }else{
                        Ext.example.msg('Erro', 'Antes de imprimir o boleto selecione o banco e o pedido!');
                    }
                }
            }]
        });
    },
    initComponent : function() {
        
        this.buildStores();
        this.buildItems();
        this.buildTbar();

        App.Cliente.Boletos.superclass.initComponent.call(this);
    }
});

function CheckIsIE()
{
    if (navigator.appName.toUpperCase() == 'MICROSOFT INTERNET EXPLORER') {
        return true;
    }
    else {
        return false;
    }
}


function PrintThisPage()
{

    if (CheckIsIE() == true)
    {
        document.iBoleto.focus();
        document.iBoleto.print();
    }
    else
    {
        window.frames['iBoleto'].focus();
        window.frames['iBoleto'].print();
    }

}

new App.Cliente.Boletos;