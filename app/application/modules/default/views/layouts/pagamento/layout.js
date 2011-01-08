Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

/*
 *@function : definir o nome padrao para os objetos criados neste arquivo
 **/
Ext.namespace('App.Default.Layout.Pagamento');

try{

    var AB_PROFISSIONAL_NOME = 'Jhonatan Luiz de Souza Santos';
    var AB_PROFISSIONAL_UNIDADE_LOGADO = 'Desenvolvimento';
    var AB_MENU_PROFISSIONAL = [{
        title:'Manter Unidades',
        id: 'conteiner-1',
        iconCls: 'silk-add',
        root:{
            children:[{
                text: 'Unidades',
                leaf:true,
                action:'view-manter-unidade-organizacional',
                controller:'unidade-organizacional',
                iconCls:'silk-add'
            }]
        }
    }];
    var AB_PROFISSIONAL_UNIDADES = [{
        text: 'Desenvolvimento',
        unidade: 2,
        handler: onClickButtonChangeUnidade
    },{
        text: 'Setor de apoio a presidencia',
        unidade: 1,
        handler: onClickButtonChangeUnidade
    }];

    App.Default.Layout.Pagamento = Ext.extend(Ext.util.Observable,{

        constructor: function() //begin-trigger-construtor
        {

            //Aba Default do Centro!
            this.tabPanelCentral = new Ext.TabPanel({
                id: 'tabPanelCentral',
                resizeTabs:false,
                minTabWidth: 115,
                tabWidth:135,
                enableTabScroll:true,
                region: 'center',
                split: false,
                deferredRender: true,
                margins:'0 0 0 0',
                activeTab:0,
                defaults:{
                    closable: true,
                    autoScroll:true
                },
                plugins: new Ext.ux.TabCloseMenu(),
                items:[]
            });

            //criar layout
            new Ext.Viewport({
                layout:'border',
                items:[
                {
                    id: 'header',
                    region: 'north',
                    split: false,
                    margins: '30 0 5 0',
                    border: true,
                    height: 70,
                    html:'<h1>Layout - Pagamento - V3</h1>Site de Camisetas Personalizadas'
                },{
                    id:'preview',
                    region: 'south',
                    split: true,
                    border: true,
                    height: 100,
                    minSize: 100,
                    maxSize: 600,
                    collapsible: true,
                    containerScroll: false,
                    useArrows: true,
                    autoScroll: false,
                    animate: true,
                    enableDD: true,
                    draggable: false,
                    title: 'Visualização',
                    iconCls: 'silk-grid',
                    margins: '0 0 0 0',
                    items: [
                    new Ext.Panel({
                        layout: 'fit',
                        frame : false,
                        border: false,
                        id : 'PainelPreview'
                    })
                    ],
                    bbar: {
                        id: 'sbar',
                        height: 30
                    }
                },{
                    region: 'east',
                    id: 'information',
                    split: true,
                    width: 200,
                    minSize: 200,
                    maxSize: 500,
                    collapsible: true,
                    containerScroll: true,
                    useArrows: true,
                    autoScroll: true,
                    animate: true,
                    enableDD: true,
                    draggable: false,
                    title: 'Informações',
                    iconCls: 'silk-grid',
                    margins: '0 0 0 0'
                },{
                    id: 'menus',
                    region: 'west',
                    layout: 'accordion',
                    collapsible: true,
                    title: 'Menu Principal',
                    iconCls: 'silk-grid',
                    defaultType: 'treepanel',
                    containerScroll: true,
                    useArrows: true,
                    autoScroll: true,
                    animate: true,
                    enableDD: true,
                    draggable: false,
                    width:200,
                    split:false,
                    margins: '0 5 0 0',
                    layoutConfig:{
                        fill: true,
                        animate:true
                    },
                    defaults:{
                        border:false,
                        rootVisible:false
                        ,
                        listeners:{
                            scope: this,
                            click: this.onNodeClick //condicao : se clicar no 'node' entao chama onNodeClick
                        }
                    },
                    items:[]
                },//end-conteiner-west (Esquerda)
                //tabpanel central
                this.tabPanelCentral] //end-itens-viewport
            });

            App.Default.Layout.Pagamento.superclass.constructor.apply(this,arguments);
        } //end-trigger-construtor
        ,
        onNodeClick: function( node ) //begin-trigger-onNodeClick
        {

            var controller = node.attributes.controller;
            var action = node.attributes.action;
            //var modulo = node.attributes.module;
            var titulo = node.attributes.text;
            var icon = node.attributes.iconCls;
            var conn = new Ext.data.Connection();
            var novaAba = this.tabPanelCentral.items.find(function( aba ){
                return aba.action === action;
            });

            conn.request({
                url: controller+'/'+action,
                method: 'POST',
                params: {
                //start: 'start-callback',
                //limit: 'limit-callback'
                },
                success: function(responseObject) {

                    if(responseObject.responseText){

                        if(!novaAba)
                        {
                            try{
                                var aba =  eval(responseObject.responseText);
                                aba.iconCls = icon;
                                aba.title = titulo;
                                // aba.controller = controller;
                                // aba.action = action;
                                // aba.module = modulo;
                                novaAba = Ext.getCmp('tabPanelCentral').add(aba);
                                Ext.getCmp('tabPanelCentral').activate(novaAba);
                            }catch(e){
                                Ext.example.msg('Erro', '{0}',e);
                            }
                        }
                    }
                },
                failure: function(e) {
                    Ext.example.msg('Erro', '{0}',e);
                }
            });

            this.tabPanelCentral.activate(novaAba);

        }

    });

}catch(e){
    Ext.example.msg('Erro', '{0}',e);
}

Ext.QuickTips.init();
Ext.form.Field.prototype.msgTarget = 'side';