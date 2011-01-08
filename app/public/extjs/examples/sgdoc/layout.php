<?php

header('Content-type: application/javascript');
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
header('Cache-Control: no-cache');
header('Pragma: no-cache');

$layout =  "var layout = Ext.extend(Ext.util.Observable,{
	
    constructor: function() //begin-trigger-construtor
    {
		
        //Aba Default do Centro!
        this.tabPanelCentral = new Ext.TabPanel({
            resizeTabs:false,
            minTabWidth: 115,
            tabWidth:135,
            enableTabScroll:true,
            region: 'center',
            split: false,
            deferredRender: false,
            activeTab:0,
            defaults:{
                closable: true,
                autoScroll:true
            },
            plugins: new Ext.ux.TabCloseMenu(),
            items:[{
                title:'Seja Bem Vindo',
                //contentEl:'portal', //orientacao dos componentes do html
                bodyStyle:'padding:10px;',
                closable:true
            }]
        });
		
	
        //criar layout
        new Ext.Viewport({
            layout:'border',
            items:[ //begin-itens-viewport
            {
                region: 'north',
                split: false,
                margins: '0 0 0 0',
                height: 70, // give north and south regions a height
                html: '<h1>Layout - SGDoc - V3</h1>Sistema Gerenciador de Documentos'
              
            },{
                // lazily created panel (xtype:'panel' is default)
                region: 'south',
                //    contentEl: 'south',
                split: true,
                height: 100,
                //items: meuGrafico,
                minSize: 100,
                maxSize: 500,
                collapsible: true,
                title: 'Visualizacao',
                margins: '0 0 0 0'
            },{
                region: 'east',
                //    contentEl: 'south',
                split: true,
                //height: 100,
                width: 200,
                //items: meuGrafico,
                minSize: 200,
                maxSize: 500,
                collapsible: true,
                title: 'Informacoes',
                margins: '0 0 0 0'
            },{ //begin-conteiner-west (esquerda)
                //menu lateral
                region: 'west',
                layout: 'accordion',
                defaultType: 'treepanel',
                width:200,
                split:true,
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
                        click: this.onNodeClick
                    }
                },
                items:[{ //begin-item-1
                    title:'Minhas Caixas',
                    iconCls: 'silk-add',
                    root:{ //begin-root
                        children:[{ //begin-children
                            text:'Caixa de Entrada',
                            leaf:true,
                            iconCls:'no-icon'
                        },{
                            text:'Area Trabalho',
                            leaf:true,
                            iconCls:'no-icon'
                        },{
                            text:'Caixa Saida',
                            leaf:true,
                            iconCls:'no-icon'
                        },{
                            text:'Caixa de Externos',
                            leaf:true,
                            iconCls:'no-icon'
                        },{
                            text:'Caixa Prazos',
                            leaf:true,
                            iconCls:'no-icon'
                        },{
                            text:'Caixa Prioridades',
                            leaf:true,
                            iconCls:'no-icon'
                        }] //end-children
                    } //end-root
                }//end-item-1
                ,
                
                { //begin-item-2
                    title:'Configuracoes'
                    ,
                    iconCls: 'silk-cog'
                    ,
                    root	: { //begin-root
                        children: [ //begin-children
                        {
                            text:'Feriados',
                            leaf:true,
                            iconCls:'no-icon'
                        }
                        ,{
                            text:'Permissoes',
                            leaf:true,
                            iconCls:'no-icon'
                        }
                        ,{
                            text:'Horarios',
                            leaf:true,
                            iconCls:'no-icon'
                        }
                        ,{
                            text:'Cargas',
                            leaf:true,
                            iconCls:'no-icon'
                        }
                        ,{
                            text:'Acesso ao sistema'	,
                            leaf:true,
                            iconCls:'no-icon'
                        }
                        ]//end-children
                    }
                } //end-item-2
                ,
                {
                    title	: 'Relatorios'
                    ,
                    iconCls: 'silk-grid'
                    ,
                    root	: {
                        children: [
                        {
                            text:'Tempo Trabalhado por Atendente',
                            leaf:true,
                            iconCls:'no-icon'
                        }
                        ,{
                            text:'Vendas por Cliente',
                            leaf:true,
                            iconCls:'no-icon'
                        }
                        ,{
                            text:'Rotas de Distribuicao',
                            leaf:true,
                            iconCls:'no-icon'
                        }
                        ,{
                            text:'Performance dos Representantes',
                            leaf:true,
                            iconCls:'no-icon'
                        }
                        ]
                    }
                }]
            },//end-conteiner-west (Esquerda)
            //tabpanel central
            this.tabPanelCentral] //end-itens-viewport
        });
		
        layout.superclass.constructor.apply(this,arguments);
    } //end-trigger-construtor
	
    //Listeners {
		
    ,
    onNodeClick: function( node ) //begin-trigger-onNodeClick
    {
        
        var titulo = node.text;
        var novaAba = this.tabPanelCentral.items.find(function( aba ){
            return aba.title === titulo;
        });

        if(!novaAba)
        {
            novaAba = this.tabPanelCentral.add({
                title	: titulo,
                html	: node.text +  titulo
            });
        }
			
        this.tabPanelCentral.activate(novaAba);
			
    /* 4� Esse passo seria carregar o conte�do. Existem v�rias abordagens e eu n�o irei criar, somente comentar
         * O conte�do da aba poderia ser carregado mediante um atributo URL no n�
         *
         * novaAba.load({
         * 		 url	: node.url
         * 		,scripts: true
         * });
         *
         * Ou ent�o cada conte�do seria uma extens�o de um componente Ext e o n� guardaria o xtype desse componente.
         *
         * novaAba.add({
         * 		xtype: node.childXtype
         * });
         *
         * novaAba.doLayout();
         */
    }
	
});

Ext.onReady(function()
{
    new layout();
});

";

echo $layout;

?>