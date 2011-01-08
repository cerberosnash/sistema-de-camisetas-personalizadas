Ext.onReady(function(){
    try{
        var user = AB_PROFISSIONAL_NOME;
        var unid = AB_PROFISSIONAL_UNIDADE_LOGADO;
        var sbar =  new Ext.ux.StatusBar({
            defaultText: 'Olá, '+user+' - '+unid,
            items: [new Date().format('d/n/Y'), ' ', ' ', '-', {
                xtype:'tbsplit',
                text:'Trocar Unidade',
                iconCls: 'silk-table-refresh',
                menuAlign: 'br-tr?',
                menu: new Ext.menu.Menu({
                    items: [AB_PROFISSIONAL_UNIDADES]
                })
            }
            , '-',{
                xtype:'tbsplit',
                text:'Configurações',
                iconCls: 'silk-cog',
                menuAlign: 'br-tr?',
                menu: new Ext.menu.Menu({
                    items: [{
                        text: 'Protocolo'
                    }, {
                        text: 'Diplan'
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
        sbar.render('sbar');
    }catch(e){
        Ext.example.msg('Ocorreu um Erro', '{0}',e);
    }
});