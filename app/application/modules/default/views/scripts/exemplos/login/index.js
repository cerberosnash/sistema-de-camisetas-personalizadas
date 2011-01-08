Ext.namespace("Ext.ux.Login");

Ext.ux.Login = function(){
    var FormPanel;
    var Win
    var indexUrl  = 'inicio';
    var submitUrl = 'login/login';

    function onSubmit(){
        if(Ext.isEmpty(Ext.util.Format.trim(Ext.get('nm_cpf').getValue()))) {
            Ext.MessageBox.show({
                title: 'Erro',
                msg: '<b>' + 'informe o usuário' + '</b>', //informe o usuário
                buttons: Ext.MessageBox.OK,
                animEl: 'Botao',
                closable:false,
                icon: Ext.MessageBox.ERROR,
                fn: function(){
                    Ext.getCmp('nm_cpf').setValue('');
                    Ext.getCmp('nm_cpf').focus();
                }
            });
            return false;
        }

        if(Ext.isEmpty(Ext.util.Format.trim(Ext.get('codigo').getValue()))) {
            Ext.MessageBox.show({
                title: 'Erro',
                msg: '<b>' + 'Informe o codigo' + '</b>',
                buttons: Ext.MessageBox.OK,
                animEl: 'Botao',
                closable:false,
                icon: Ext.MessageBox.ERROR,
                fn: function(){
                    Ext.getCmp('codigo').setValue('');
                    Ext.getCmp('codigo').focus();
                }
            });
            return false;
        }

        if(Ext.isEmpty(Ext.util.Format.trim(Ext.get('ds_senha').getValue()))){
            Ext.MessageBox.show({
                title: 'Erro',
                msg: '<b>' + 'Informe a senha' + '</b>',
                buttons: Ext.MessageBox.OK,
                animEl: 'Botao',
                closable:false,
                icon: Ext.MessageBox.ERROR,
                fn: function(){
                    Ext.getCmp('ds_senha').setValue('');
                    Ext.getCmp('ds_senha').focus();
                }
            });
            return false;
        }

        if (FormPanel.form.isValid()) {
            FormPanel.form.submit({
                //waitTitle: 'Por favor aguarde',
                //waitMsg: 'Validando usuario...',
                reset: false,
                success: Ext.ux.Login.Success,
                failure: Ext.ux.Login.Failure,
                scope: Ext.ux.Login
            });
        }
    }

    return{
        Init:function(){
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';

            var LogoPanel = new Ext.Panel({
                baseCls: 'x-plain',
                id: 'login-logo',
                region: 'center'
            });

            if(!(FormPanel instanceof Ext.form.FormPanel)){
                FormPanel = new Ext.form.FormPanel({
                    id: 'formPainelLogin',
                    labelWidth:45,
                    region: 'center',
                    method: 'POST',
                    url: submitUrl,
                    baseCls: 'x-plain',
                    bodyStyle: (Ext.isIE? 'padding-left: 3px;' : 'padding: 3px;'),
                    baseParams: {
                        module: 'Login'
                    },
                    onSubmit: Ext.emptyFn,
                    waitMsgTarget: false,
                    defaults: {
                        width: 100,
                        allowBlank:false,
                        selectOnFocus: true,
                        blankText: 'Preencha o campo'
                    },
                    defaultType: 'textfield',
                    frame: false,
                    id: 'login-form',
                    items: [{
                        fieldLabel: '<b>' +'Informe o CPF' + '</b>',
                        id: 'nm_cpf',
                        name: 'nm_cpf',
                        tabIndex:1,
                        fireKey : function(e){
                            if(e.getKey() == e.ENTER){
                                Ext.getCmp('ds_senha').focus();
                            }
                        }
                    },{
                        fieldLabel: '<b>' + 'Senha' + '</b>',
                        inputType: 'password',
                        id: 'ds_senha',
                        name: 'ds_senha',
                        tabIndex:2
                    },{
                        fieldLabel: '<b>' + 'Codigo' + '</b>',
                        inputType: 'textfield',
                        id: 'codigo',
                        name: 'codigo',
                        tabIndex:2
                    }],
                    buttonAlign:'right',
                    buttons: [{
                        id:'Botao',
                        text:'<b>' + 'Entrar' + '</b>',
                        type: 'submit',
                        handler: onSubmit,
                        scope: Ext.ux.Login
                    },{
                        id:'Botao2',
                        text:'<b>' + 'Sair' + '</b>',
                        type: 'submit',
                        handler: onSubmit,
                        scope: Ext.ux.Login
                    }]
                });
            }

            if(!(Win instanceof Ext.Window)){
                Win = new Ext.Window({
                    title: 'Autenticacao',
                    iconCls: 'silk-group-key',
                    width:300,
                    height:(Ext.isIE? 207 : 200),
                    plain: true,
                    collapsible: false,
                    resizable: false,
                    closable: false,
                    modal: true,
                    border: false,
                    keys: [{
                        key: Ext.EventObject.ENTER,
                        fn:  function(e){
                            if(Ext.isEmpty(Ext.util.Format.trim(Ext.get('nm_cpf').getValue()))){
                                return false;
                            }
                            if(Ext.isEmpty(Ext.util.Format.trim(Ext.get('ds_senha').getValue()))){
                                return false;
                            }
                            onSubmit();
                        },
                        scope:this
                    }],
                    items: [LogoPanel, FormPanel],
                    focus: function(){
                        Ext.get('nm_cpf').focus();
                    }
                });
            }
            Win.show();
        },

        Success: function(formPanel, action){
            if(action && action.result){
               
                Ext.MessageBox.show({
                    title: action.result.title,
                    msg: action.result.message,
                    progressText: action.result.progressText,
                    width:300,
                    progress:true,
                    closable:false
                });

                // this hideous block creates the bogus progress
                var f = function(v){
                    return function(){
                        if(v == 12){
                            Ext.MessageBox.hide();
                            //Ext.example.msg('Done', 'Your fake items were loaded!');
                            // window.location.reload();
                            //  setTimeout(function(){
                            // Ext.MessageBox.hide();
                            window.location = indexUrl;
                        //   }, 1000);
                        }else{
                            var i = v/11;
                            Ext.MessageBox.updateProgress(i, Math.round(100*i)+'%');
                        }
                    };
                };
                for(var i = 1; i < 13; i++){
                    setTimeout(f(i), i*100);
                }
                
                Win.destroy(true);
            }
        },

        Failure: function(formPanel, action) {
            Ext.MessageBox.show({
                title: 'Erro',
                msg: '<b>'+ action.result.message +'</b>',
                buttons: Ext.MessageBox.OK,
                animEl: 'Botao',
                closable:false,
                icon: Ext.MessageBox.ERROR/*,
                fn:function(){
                    if( action.result.code == 'N' ){
                        Ext.getCmp('nm_cpf').focus();
                    } else if(action.result.code == 'S') {
                        Ext.getCmp('ds_senha').focus();
                    }
                }*/
            });
        }
    };
}();

Ext.BasicForm.prototype.afterAction=function(action, success){
    this.activeAction = null;
    var o = action.options;
    if(o.waitMsg){
        Ext.MessageBox.updateProgress(1);
        Ext.MessageBox.hide();
    }
    if(success){
        if(o.reset){
            this.reset();
        }
        Ext.callback(o.success, o.scope, [this, action]);
        this.fireEvent('actioncompleted', this, action);
    }else{
        Ext.callback(o.failure, o.scope, [this, action]);
        this.fireEvent('actionfailed', this, action);
    }
}

Ext.onReady(Ext.ux.Login.Init, Ext.ux.Login, true);

Ext.getCmp('nm_cpf').setValue('01492364177');
Ext.getCmp('ds_senha').setValue('123123');
Ext.getCmp('codigo').setValue('73762385149');