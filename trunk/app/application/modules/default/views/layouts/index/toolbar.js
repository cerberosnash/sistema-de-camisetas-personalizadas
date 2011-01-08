//Ext.onReady(function(){
//    try{
//        var tbar =  new Ext.ux.StatusBar({
//            defaultText: '',
//            items: [{
//                xtype:'button',
//                text: 'Autenticação',
//                iconCls: 'silk-table-refresh',
//                menuAlign: 'br-tr?',
//                handler: function(){
//                    alert('Autenticacao');
//                }
//            }
//            , '-',{
//                xtype:'button',
//                text: 'Cadastro',
//                iconCls: 'silk-cog',
//                menuAlign: 'br-tr?',
//                handler: function(){
//                    alert('Cadastro');
//
//
//
//                    novaAba = Ext.getCmp('PainelCentral').add({
//                        xtype:'button',
//                        text: 'Autenticação',
//                        title: 'Cadastro',
//                        iconCls: 'silk-add',
//                        menuAlign: 'br-tr?',
//                        handler: function(){
//                            alert('Autenticacao');
//                        }
//                    });
//                    Ext.getCmp('PainelCentral').activate(novaAba);
//
//                    PainelCentral.activate(novaAba);
//
//                }
//            }]
//        });
//        tbar.render('tbar');
//    }catch(e){
//        Ext.example.msg('Error', '{0}',e);
//    }
//
//});