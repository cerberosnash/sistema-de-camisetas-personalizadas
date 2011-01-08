Ext.onReady(function(){
    try{
        var tbar =  new Ext.ux.StatusBar({
            defaultText: 'Seja bem vindo' + ',' + 'Michael Fernandes Rodrigues'+ ' - ' + 'Cliente',
            items: [new Date().format('d/n/Y'), ' ', ' ', '-', {
                xtype:'tbsplit',
                text: 'Trocar Unidade',
                iconCls: 'silk-table-refresh',
                menuAlign: 'br-tr?',
                menu: new Ext.menu.Menu({
                    items: [AB_PROFISSIONAL_UNIDADES]
                })
            }
            , '-',{
                xtype:'splitbutton',
                text: 'Configurações',
                iconCls: 'silk-cog',
                menuAlign: 'br-tr?',
                menu: new Ext.menu.Menu({
                    items: [{
                        text : 'Temas',
                        iconCls : 'theme',
                        menu:{
                            items :[
                            {
                                text: 'Cinza',
                                value : 'gray',
                                iconCls : 'theme-gray',
                                handler: onClickButtonChangePreferencias
                            }, {
                                text: 'Azul',
                                value : 'blue',
                                iconCls : 'theme-blue',
                                handler: onClickButtonChangePreferencias
                            }, {
                                text: 'Verde Oliva',
                                value : 'olive',
                                iconCls : 'theme-olive',
                                handler: onClickButtonChangePreferencias
                            },{
                                text: 'Violeta',
                                value : 'violet',
                                iconCls : 'theme-violet',
                                handler: onClickButtonChangePreferencias
                            }, {
                                text: 'Preto',
                                value : 'black',
                                iconCls : 'theme-black',
                                handler: onClickButtonChangePreferencias
                            },{
                                text: 'Moderno',
                                value : 'slickness',
                                iconCls : 'theme-slickness',
                                handler: onClickButtonChangePreferencias
                            } ]
                        }
                    },{
                        text: 'Idiomas',
                        iconCls: 'blist',
                        menu: {
                            items: [
                            {
                                text: 'Portugues',
                                value : 'pt_br',
                                iconCls : 'flag-br',
                                handler: onClickButtonChangePreferencias
                            }, {
                                text: 'Espanhol',
                                value : 'es',
                                iconCls : 'flag-es',
                                handler: onClickButtonChangePreferencias
                            }, {
                                text: 'Ingles',
                                value : 'en',
                                iconCls : 'flag-us',
                                handler: onClickButtonChangePreferencias
                            }
                            ]
                        }

                    }]
                })
            }
            , '-',
            {
                text: 'Sair',
                iconCls: 'silk-door-out',
                handler: onClickButtonExit
            }
            ]
        });
        tbar.render('tbar');
    }catch(e){
        Ext.example.msg('Error', '{0}',e);
    }

});