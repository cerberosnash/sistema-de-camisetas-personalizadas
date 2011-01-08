Ext.namespace("Ext.ux.Login");

Ext.ux.Login = function(){
    var FormPanel;
    var Win;
    var indexUrl  = 'inicio';
    var submitUrl = 'login/login';

    function onSubmit(){
        if(Ext.isEmpty(Ext.util.Format.trim(Ext.get('nm_cpf').getValue()))) {
            Ext.MessageBox.show({
                title: 'Erro',
                msg: '<b>Informe o Usuario</b>',
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
                msg: '<b>Informe o Codigo</b>',
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
                msg: '<b>Informe a Senha</b>',
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
                        fieldLabel: '<b>CPF</b>',
                        id: 'nm_cpf',
                        name: 'nm_cpf',
                        tabIndex:1,
                        fireKey : function(e){
                            if(e.getKey() == e.ENTER){
                                Ext.getCmp('ds_senha').focus();
                            }
                        }
                    },{
                        fieldLabel: '<b>SENHA</b>',
                        inputType: 'password',
                        id: 'ds_senha',
                        name: 'ds_senha',
                        tabIndex:2
                    },{
                        fieldLabel: '<b>Codigo</b>',
                        inputType: 'textfield',
                        id: 'codigo',
                        name: 'codigo',
                        tabIndex:2
                    }],
                    buttonAlign:'right',
                    buttons: [{
                        id:'Botao',
                        text:'<b>Entrar</b>',
                        type: 'submit',
                        handler: onSubmit,
                        scope: Ext.ux.Login
                    },{
                        id:'Botao2',
                        text:'<b>Sair</b>',
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
                    //msg: "&nbsp;<b>Carregando as configura&ccedil;&otilde;es</b>",
                    msg: '<b>'+ action.result.message +'</b>',
                    //progressText: 'Acessando sistema...',
                    width:300,
                    height: 300,
                    wait:true,
                    icon:'silk-add',
                    closable:false,
                    //icon: Ext.MessageBox.OK,
                    waitConfig:{
                        interval:500
                    }
                });
                setTimeout(function(){
                    Ext.MessageBox.hide();
                    window.location = indexUrl;
                }, 5000);
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
                icon: Ext.MessageBox.ERROR,
                fn:function(){
                    if( action.result.code == 'N' ){
                        Ext.getCmp('nm_cpf').focus();
                    } else if(action.result.code == 'S') {
                        Ext.getCmp('ds_senha').focus();
                    }
                }
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



var CapsLock = {
    init: function() {
        var id = Ext.id();
        this.alertBox = Ext.DomHelper.append(document.body,{
            tag: 'div',
            style: 'width: 8em',
            children: [{
                tag: 'div',
                style: 'text-align: center; color: red;',
                html: 'Caps Lock está ligado!',
                id: id
            }]
        }, true);
        Ext.fly(id).boxWrap();
        this.alertBox.hide();
        var pwds = Ext.query("INPUT[type='password']");
        for(var i = 0; i < pwds.length; i++) {
            Ext.get(pwds[i].id).on(
                'keypress',
                this.keypress.createDelegate(this,pwds[i],true),
                this
                );
        }
    },
    keypress: function(e, el) {
        var charCode = e.getCharCode();
        if(
            (e.shiftKey && charCode >= 97 && charCode <= 122) ||
            (!e.shiftKey && charCode >= 65 && charCode <= 90)
            ){
            this.showWarning(el);
        } else {
            this.hideWarning();
        }
    },
    showWarning: function(el) {
        var x = Ext.fly(el).getX();
        var width = Ext.fly(el).getWidth();
        var y = Ext.fly(el).getY();
        this.alertBox.setXY([x + width + 40,y]);
        this.alertBox.show();
    },
    hideWarning: function() {
        this.alertBox.hide();
    }
}
Ext.onReady(CapsLock.init, CapsLock, true);