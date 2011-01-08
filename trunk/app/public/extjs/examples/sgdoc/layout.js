Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

try{

    var layout = Ext.extend(Ext.util.Observable,{

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
                    html: '<h1>Layout - SGDoc - V3</h1>Sistema Gerenciador de Documentos'
                },{
                    id:'preview',
                    region: 'south',
                    split: true,
                    height: 100,
                    minSize: 100,
                    maxSize: 500,
                    collapsible: true,
                    containerScroll: true,
                    useArrows: true,
                    autoScroll: true,
                    animate: true,
                    enableDD: true,
                    draggable: false,
                    title: 'Visualização',
                    iconCls: 'silk-grid',
                    margins: '0 0 0 0'
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
                    items:[AB_MENU_PROFISSIONAL]
                },//end-conteiner-west (Esquerda)
                //tabpanel central
                this.tabPanelCentral] //end-itens-viewport
            });

            layout.superclass.constructor.apply(this,arguments);
        } //end-trigger-construtor
        ,
        onNodeClick: function( node ) //begin-trigger-onNodeClick
        {

            var controller = node.attributes.controller;
            var action = node.attributes.action;
            var modulo = node.attributes.module;
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
                        // Ext.example.msg('Aguarde...', 'Controller:{0} Action: {1}:',controller,action);

                        if(!novaAba)
                        {
                            try{
                                var aba =  eval(responseObject.responseText);
                                aba.iconCls = icon;
                                aba.title = titulo;
                                aba.controller = controller;
                                aba.action = action;
                                aba.module = modulo;
                                novaAba = Ext.getCmp('tabPanelCentral').add(aba);
                                Ext.getCmp('tabPanelCentral').activate(novaAba);
                            }catch(e){
                                Ext.example.msg('Ocorreu um Erro', '{0}',e);
                            }
                        }
                    }
                },
                failure: function() {
                    Ext.example.msg('Aguarde...', 'MSG-TExt-Response-Error:');
                }
            });

            this.tabPanelCentral.activate(novaAba);

        }

    });

}catch(e){

}