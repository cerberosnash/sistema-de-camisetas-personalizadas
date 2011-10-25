//Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
Ext.form.Field.prototype.msgTarget = 'side';
Ext.namespace('App.Default.Layout.Index');
Ext.QuickTips.init();

try{
             
    App.Default.Layout.Index = Ext.extend(Ext.util.Observable,{

        constructor: function(){

            var controllerCliente = '/camisetas/cliente/';
            var controllerIndex = '/camisetas/';
            var controllerAutenticacao = '/camisetas/autenticacao/';
            var controllerUtil = "/camisetas/util/";
            var controllerGaleria = '/camisetas/galeria/';
            var controllerProdutos = '/camisetas/produtos/';
                  
            /* DataStores - Inicio */

            var storeEstados = new Ext.data.JsonStore({
                root: 'estados',
                totalProperty: 'totalCount',
                idProperty: 'sq_uf',
                remoteSort: false,
                autoDestroy: true,
                baseParams:{
                    combo: 'ufs'
                },
                fields: [
                {
                    name: 'sq_uf',
                    type: 'int'
                },
                {
                    name: 'nm_uf'
                }
                ],
                proxy: new Ext.data.HttpProxy({
                    method: 'post',
                    url: controllerUtil + 'combos'
                })
            });

            storeEstados.setDefaultSort('nm_uf', 'asc');

            storeEstados.on('loadexception',function(a,b,c){
                var data = eval(c.responseText);
                if(data.success===false){
                    alert('[Error]\n[storeEstados]\n['+data.error+']');
                }else{
                    alert('[Error]\n[storeEstados]\n[Erro desconhecido.]');
                }
            });

            var storeMunicipios = new Ext.data.JsonStore({
                root: 'municipios',
                totalProperty: 'totalCount',
                idProperty: 'sq_municipio',
                remoteSort: false,
                autoDestroy: true,
                baseParams:{
                    combo: 'municipios'
                },
                fields: [
                {
                    name: 'sq_municipio',
                    type: 'int'
                },
                {
                    name: 'nm_municipio'
                }
                ],
                proxy: new Ext.data.HttpProxy({
                    method: 'post',
                    url: controllerUtil + 'combos'
                })
            });

            storeMunicipios.setDefaultSort('nm_municipio', 'asc');

            storeMunicipios.on('loadexception',function(a,b,c){
                var data = eval(c.responseText);
                if(data.success===false){
                    alert('[Error]\n[storeMunicipios]\n['+data.error+']');
                }else{
                    alert('[Error]\n[storeMunicipios]\n[Erro desconhecido.]');
                }
            });

            var storeTamanhosCamisetas = new Ext.data.ArrayStore({
                fields: ['mValor', 'vValor'],
                data : [
                ['Todos', ''],
                ['Pequena', 'P'],
                ['Media', 'M'],
                ['Grande', 'G']
                ]
            });

            var storeValoresCamisetas = new Ext.data.ArrayStore({
                fields: ['mValor', 'vValor'],
                data : [
                ['R$ 9.99', '9.99'],
                ['R$ 19.99', '19.99'],
                ['R$ 29.99', '29.99'],
                ['R$ 39.99', '39.99'],
                ['R$ 49.99', '49.99'],
                ['R$ 59.99', '59.99'],
                ['R$ 69.99', '69.99'],
                ['R$ 79.99', '79.99'],
                ['R$ 89.99', '89.99'],
                ['R$ 99.99', '99.99']
                ]
            });

            var storeCamisetas = new Ext.data.JsonStore({
                root: 'images',
                totalProperty: 'totalCount',
                idProperty: 'sq_produto',
                remoteSort: true,
                autoDestroy: true,
                baseParams:{
                    query: '',
                    tamanho: '',
                    cor: '',
                    preco_max: '9.99',
                    preco_min: '99.99',
                    start:0,
                    limit:20
                },
                fields: ['sq_produto','nm_produto','co_produto','ds_produto','tm_produto','hs_produto',{
                    name:'vl_produto',
                    type: 'float'
                }],
                proxy: new Ext.data.HttpProxy({
                    method: 'post',
                    url: controllerGaleria + 'carregar'
                })
            });

            storeCamisetas.on('loadexception',function(a,b,c){
                var data = eval(c.responseText);
                if(data.success===false){
                    alert('[Error]\n[storeCamisetas]\n['+data.error+']');
                }else{
                    alert('[Error]\n[storeCamisetas]\n[Erro desconhecido.]');
                }
            });

            storeCamisetas.setDefaultSort('sq_produto', 'desc');
            storeCamisetas.load();

            function PaginaInicial(btn){
                if(btn=='ok'){
                    window.location = controllerIndex;
                }
            }

            var RunnerAutenticacao = function(){
                var f = function(v, pbar, btn, count, url){
                    return function(){
                        if(v > count){
                            btn.disabled = false;
                        }else{
                            var i = v/count;
                            pbar.updateProgress(i, Math.round(100*i)+'% Carregados...');
                            if(Math.round(100*i)==100){
                                window.location = url;
                            }
                        }
                    };
                };
                return {
                    run : function(pbar, btn, count, cb,url){
                        btn.disabled = true;
                        var ms = 1/count;
                        for(var i = 1; i < (count+2); i++){
                            setTimeout(f(i, pbar, btn, count, cb), i*ms);
                        }
                    }
                }
            }();

            var RunnerRecuperarSenha = function(){
                var f = function(v, pbar, btn, count, cb){
                    return function(){
                        if(v > count){
                            btn.disabled = true;
                        }else{
                            var i = v/count;
                            pbar.updateProgress(i,'Recuperando senha...');
                            if(Math.round(100*i)==100){
                                windowRecuperarSenha.hide();
                                pbar.destroy();
                                btn.disabled = false;
                                Ext.MessageBox.show({
                                    msg: 'Sua senha sera enviada para '+ Ext.getCmp('rEmail').getValue(),
                                    icon:'lock',
                                    animEl: 'btnRecuperarSenha'
                                });
                            }
                        }
                    };
                };
                return {
                    run : function(pbar, btn, count, cb){
                        btn.disabled = true;
                        var ms = 1/count;
                        for(var i = 1; i < (count+2); i++){
                            setTimeout(f(i, pbar, btn, count, cb), i*ms);
                        }
                    }
                }
            }();
            
            var boxCaptchaAutenticacao = new Ext.BoxComponent({
                name: 'Captcha',
                id: 'boxCaptchaAutenticacao',
                width: 70,
                height: 25,
                autoEl: {
                    tag:'img',
                    id: 'imgCaptchaAutenticacao',
                    title : 'Clique para recarregar',
                    src: controllerUtil +'captcha/?t='+ new Date().getTime()
                }
            });

            boxCaptchaAutenticacao.on('render',function (){
                Ext.get('imgCaptchaAutenticacao').on('click',function(){
                    onCapthaChange('boxCaptchaAutenticacao','imgCaptchaAutenticacao');
                });
            });

            var boxCaptchaCadastro = new Ext.BoxComponent({
                name: 'Captcha',
                id: 'boxCaptchaCadastro',
                width: 70,
                height: 25,
                autoEl: {
                    tag:'img',
                    id: 'imgCaptchaCadastro',
                    title : 'Clique para recarregar',
                    src: controllerUtil +'captcha/?t='+ new Date().getTime()
                }
            });

            boxCaptchaCadastro.on('render',function (){
                var curr = Ext.get('imgCaptchaCadastro');
                curr.on('click',function(){
                    onCapthaChange('boxCaptchaCadastro','imgCaptchaCadastro');
                },this);
            },this);

            function onCapthaChange(box,img){
                var curr = Ext.get(img);
                Ext.getCmp(box).disable();
                curr.slideOut('b', {
                    callback: function(){
                        Ext.get(img).dom.src = controllerUtil +'captcha/?t='+ new Date().getTime();
                        var conn = new Ext.data.Connection();
                        var data = null;
                        conn.request({
                            url: controllerUtil + 'codigo',
                            method: 'POST',
                            success: function(responseObject) {
                                if(responseObject.responseText){
                                    try{
                                        data = eval(responseObject.responseText);
                                        if(data.success===true){
                                        }
                                        else{
                                            Ext.example.msg('Erro', 'Falha na autenticação');
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
                        curr.slideIn('t');
                        Ext.getCmp(box).enable();
                    }
                },this);
            }


            var bbarAutenticacao = new Ext.Toolbar({
                id: 'bbarAutenticacao',
                border: false,
                frame: false,
                margins: '0 0 0 0',
                height: 30,
                width: 250,
                items:[new Ext.BoxComponent({
                    name: 'Captcha',
                    id: 'boxLoadingAutenticacao',
                    margins: '5px 5px 5px 5px'
                }),'->',{
                    text: 'Entrar',
                    id: 'aEntrar',
                    width: 110,
                    type: 'submit',
                    iconCls: 'accept',
                    handler: onSubmitAutenticacao
                }]
            });

            var bbarRecuperarSenha = new Ext.Toolbar({
                id: 'bbarRecuperarSenha',
                border: false,
                frame: false,
                margins: '0 0 0 0',
                height: 30,
                width: 250,
                items:[new Ext.BoxComponent({
                    name: 'Captcha',
                    id: 'boxLoadingRecuperarSenha',
                    margins: '5px 5px 5px 5px'
                }),'->',{
                    text: 'Recuperar',
                    id: 'rRecuperar',
                    width: 110,
                    type: 'submit',
                    iconCls: 'key-go',
                    handler: function(){
                        onSubmitRecuperarSenha();
                    }
                }]
            });

            var formAutenticacao =  new Ext.form.FormPanel({
                labelWidth: 75,
                frame: false,
                border: true,
                title: '',
                bodyStyle:'padding:10px 10px 10px 10px',
                defaults: {
                    width: 230,
                    allowBlank:false
                },
                defaultType: 'textfield',
                items: [{
                    fieldLabel: 'Email',
                    name: 'email',
                    id: 'aEmail',
                    vtype:'email',
                    value: 'admin@camisetas.com'
                }, {
                    fieldLabel: 'Senha',
                    name: 'senha',
                    id: 'aSenha',
                    inputType: 'password',
                    initialPasswordField: 'password',
                    vtype: 'password'

                }, {
                    xtype: 'compositefield',
                    fieldLabel: 'Código',
                    items:[{
                        xtype: 'textfield',
                        name: 'Captcha',
                        id: 'aCaptcha',
                        vtype: 'captcha',
                        allowBlank:false,
                        width: 158
                    },boxCaptchaAutenticacao]
                }],
                bbar:  bbarAutenticacao
            });

            var formRecuperarSenha =  new Ext.form.FormPanel({
                labelWidth: 75,
                frame: false,
                border: true,
                title: '',
                bodyStyle:'padding:10px 10px 10px 10px',
                defaults: {
                    width: 230,
                    allowBlank:false
                },
                defaultType: 'textfield',
                items: [{
                    fieldLabel: 'Email',
                    name: 'email',
                    id: 'rEmail',
                    vtype:'email',
                    value: 'admin@camisetas.com'
                },{
                    xtype: 'compositefield',
                    fieldLabel: 'Código',
                    items:[{
                        xtype: 'textfield',
                        name: 'Captcha',
                        id: 'rCaptcha',
                        allowBlank:false,
                        vtype: 'captcha',
                        width: 158
                    },boxCaptchaAutenticacao]
                }],
                bbar: bbarRecuperarSenha
            });


            var formCadastro =  new Ext.form.FormPanel({
                id: 'formCadastro',
                frame:false,
                border: true,
                title: '',
                bodyStyle:'padding:10px 10px 10px 10px',
                layout: 'form',
                items: [{
                    defaults:{
                        width: 320,
                        msgTarget: 'side',
                        allowBlank: false,
                        height: 25
                    },
                    xtype: 'fieldset',
                    title: 'Dados Pessoais',
                    items: [{
                        xtype: 'textfield',
                        defaults:{
                            msgTarget: 'side',
                            allowBlank: false,
                            height: 25
                        },
                        fieldLabel: 'Nome',
                        name: 'Nome',
                        id: 'nm_usuario',
                        maxLength: 100,
                        vtype: 'onlytext',
                        autoCreate: {
                            tag: 'input',
                            type: 'text',
                            maxlength: '100'
                        }
                    },{
                        xtype: 'cpffield',
                        fieldLabel: 'CPF',
                        id: 'nu_cpf',
                        vtype: 'cpf'
                    },{
                        xtype: 'compositefield',
                        fieldLabel: 'Tel. Residencial',
                        defaults:{
                            msgTarget: 'side',
                            allowBlank: false,
                            height: 25
                        },
                        items: [{
                            xtype: 'textfield',
                            name: 'DDD Residencial',
                            id: 'dd_residencial',
                            width: 30,
                            maxLengthText: 'O Código DDD deve conter {0} digitos',
                            minLengthText: 'O Código DDD deve conter {0} digitos',
                            maxLength: 3,
                            minLength: 3,
                            vtype: 'ddd',
                            autoCreate: {
                                tag: 'input',
                                type: 'text',
                                maxlength: '3'
                            }
                        },{
                            xtype: 'textfield',
                            name: 'Tel. Residencial',
                            id: 'nu_residencial',
                            width: 285,
                            vtype: 'telefone',
                            autoCreate: {
                                tag: 'input',
                                type: 'text',
                                maxlength: '9'
                            }
                        }
                        ]
                    },{
                        xtype: 'compositefield',
                        fieldLabel: 'Tel. Celular',
                        defaults:{
                            msgTarget: 'side',
                            allowBlank: false,
                            height: 25
                        },
                        items: [{
                            xtype: 'textfield',
                            name: 'DDD Celular',
                            id: 'dd_celular',
                            width: 30,
                            maxLengthText: 'O Código DDD deve conter {0} digitos',
                            minLengthText: 'O Código DDD deve conter {0} digitos',
                            maxLength: 3,
                            minLength: 3,
                            vtype: 'ddd',
                            autoCreate: {
                                tag: 'input',
                                type: 'text',
                                maxlength: '3'
                            }
                        },{
                            xtype: 'textfield',
                            name: 'Tel. Celular',
                            id: 'nu_celular',
                            width: 285,
                            vtype: 'telefone',
                            autoCreate: {
                                tag: 'input',
                                type: 'text',
                                maxlength: '9'
                            }
                        }]
                    },{
                        fieldLabel: 'Estado',
                        xtype: 'combo',
                        name: 'Estado',
                        id: 'sq_uf',
                        store: storeEstados,
                        listeners:{
                            select:{
                                fn:function(combo){
                                    Ext.getCmp('sq_municipio').clearValue();
                                    Ext.getCmp('sq_municipio').enable();
                                    storeMunicipios.load({
                                        params: {
                                            sq_uf: combo.getValue()
                                        }
                                    });
                                }
                            }
                        },
                        displayField: 'nm_uf',
                        valueField: 'sq_uf',
                        editable: false, // usar no combo de UFs
                        typeAhead: true,
                        forceSelection: true,
                        mode: 'remote',
                        triggerAction: 'all',
                        emptyText:'',
                        selectOnFocus:true
                    },{
                        fieldLabel: 'Município',
                        xtype: 'combo',
                        name: 'Municipio',
                        id: 'sq_municipio',
                        store: storeMunicipios,
                        displayField: 'nm_municipio',
                        valueField: 'sq_municipio',
                        minChars: 5,
                        editable: true,
                        typeAhead: true,
                        forceSelection: true,
                        mode: 'local',
                        triggerAction: 'all',
                        emptyText:'',
                        selectOnFocus:true
                    },{
                        xtype: 'textfield',
                        fieldLabel: 'CEP',
                        id: 'nu_cep',
                        name: 'CEP',
                        vtype: 'cep',
                        autoCreate: {
                            tag: 'input',
                            type: 'text',
                            maxlength: '9'
                        }
                    },{
                        fieldLabel: 'Endereço',
                        id: 'tx_endereco',
                        xtype: 'textarea',
                        maxLength: 100,
                        height: 50,
                        autoCreate: {
                            tag: 'textarea',
                            type: 'textarea',
                            maxlength: '100'
                        }
                    }]
                },{
                    xtype: 'fieldset',
                    title: 'Autenticação',
                    defaults:{
                        width: 320,
                        msgTarget: 'side',
                        allowBlank: false,
                        maxLength: 100,
                        minLength: 6
                    },
                    items: [{
                        xtype: 'textfield',
                        fieldLabel: 'Email',
                        name: 'Email',
                        id: 'tx_email',
                        vtype: 'email'
                    },{
                        xtype: 'textfield',
                        fieldLabel: 'Senha',
                        name: 'Senha',
                        id: 'tx_senha',
                        inputType: 'password',
                        initialPasswordField: 'password',
                        vtype: 'password'
                    }]
                },{
                    xtype: 'fieldset',
                    defaults:{
                        width: 320,
                        msgTarget: 'side',
                        allowBlank: false,
                        maxLength: 100,
                        minLength: 6
                    },
                    title: 'Confirmação',
                    items: [{
                        xtype: 'textfield',
                        fieldLabel: 'Email',
                        id: 'vd_email',
                        vtype: 'comparefield',
                        idFieldCompare: 'tx_email',
                        autoCreate: {
                            tag: 'input',
                            type: 'text',
                            maxlength: '100'
                        }
                    },{
                        xtype: 'textfield',
                        fieldLabel: 'Senha',
                        id: 'vd_senha',
                        inputType: 'password',
                        idFieldCompare:  'tx_senha',
                        vtype: 'comparefield',
                        autoCreate: {
                            tag: 'input',
                            type: 'password',
                            maxlength: '100'
                        }
                    }]
                }],
                buttons: [{
                    text: 'Finalizar Cadastro',
                    id: 'cEntrar',
                    type: 'submit',
                    iconCls: 'disk',
                    handler: onSubmitCadastro
                }]
            });

            function onSubmitRecuperarSenha(){
                if(formRecuperarSenha.form.isValid()===true){
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerAutenticacao + 'recuperar',
                        method: 'POST',
                        params: {
                            tx_email : Ext.getCmp('rEmail').getValue()
                        },
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){

                                        var pbarRecuperarSenha = new Ext.ProgressBar({
                                            text:'Carregando...',
                                            id:'pbarRecuperarSenha',
                                            cls:'custom',
                                            width: 250,
                                            margins: '5px 5px 5px 5px',
                                            doLayout: false,
                                            renderTo: 'boxLoadingRecuperarSenha'
                                        });

                                        RunnerRecuperarSenha.run(pbarRecuperarSenha, Ext.getCmp('rRecuperar'), 2);

                                    }else{
                                        Ext.example.msg('Erro', data.error);
                                        Ext.MessageBox.show({
                                            title: 'Erro!',
                                            msg: data.error,
                                            buttons: Ext.MessageBox.OK,
                                            icon: Ext.MessageBox.ERROR
                                        });
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
                }else{
                    Ext.example.msg('Erro', 'Falha na autenticação');
                }
            }

            function onSubmitAutenticacao(){
                if(formAutenticacao.form.isValid()===true){
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerAutenticacao + 'autenticar',
                        method: 'POST',
                        params: {
                            tx_email : Ext.getCmp('aEmail').getValue(),
                            tx_senha : Ext.getCmp('aSenha').getValue(),
                            tx_captcha : Ext.getCmp('aCaptcha').getValue()
                        },
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
             
                                        var pbarAutenticacao = new Ext.ProgressBar({
                                            text:'Carregando...',
                                            id:'pbarAutenticacao',
                                            cls:'custom',
                                            width: 250,
                                            margins: '5px 5px 5px 5px',
                                            doLayout: false,
                                            renderTo: 'boxLoadingAutenticacao'
                                        });

                                        RunnerAutenticacao.run(pbarAutenticacao, Ext.getCmp('aEntrar'), 1, data.url);
                                   
                                    }else{
                                        Ext.example.msg('Erro', data.error);
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
                }else{
                    Ext.example.msg('Erro', 'Falha na autenticação');
                }
            }

            function onSubmitCadastro(){
                if(formCadastro.form.isValid()===true){
                    try{
                        var conn = new Ext.data.Connection();
                        var data = null;
                        conn.request({
                            url: controllerCliente + 'adicionar',
                            method: 'POST',
                            params: {
                                nm_usuario : Ext.getCmp('nm_usuario').getValue(),
                                nu_cpf : Ext.getCmp('nu_cpf').getValue(),
                                dd_residencial : Ext.getCmp('dd_residencial').getValue(),
                                nu_residencial : Ext.getCmp('nu_residencial').getValue(),
                                dd_celular : Ext.getCmp('dd_celular').getValue(),
                                nu_celular : Ext.getCmp('nu_celular').getValue(),
                                sq_uf : Ext.getCmp('sq_uf').getValue(),
                                sq_municipio : Ext.getCmp('sq_municipio').getValue(),
                                nu_cep : Ext.getCmp('nu_cep').getValue(),
                                tx_endereco : Ext.getCmp('tx_endereco').getValue(),
                                tx_email : Ext.getCmp('tx_email').getValue(),
                                tx_senha : Ext.getCmp('tx_senha').getValue()
                            },
                            success: function(responseObject) {
                                if(responseObject.responseText){
                                    try{
                                        data = eval(responseObject.responseText);
                                        if(data.success===true){
                                            windowCadastro.hide();
                                            Ext.MessageBox.show({
                                                title: 'Seja bem vindo!',
                                                msg: 'Cliente cadastro com sucesso!',
                                                buttons: Ext.MessageBox.OK,
                                                fn: PaginaInicial,
                                                icon: Ext.MessageBox.INFO
                                            });
                                        }else{
                                            Ext.example.msg('Erro', data.error);
                                            Ext.MessageBox.show({
                                                title: 'Erro!',
                                                msg: data.error,
                                                buttons: Ext.MessageBox.OK,
                                                icon: Ext.MessageBox.ERROR
                                            });
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
                    }catch(e){
                        Ext.example.msg('Erro', '{0}',e);
                    }
                }else{
                    Ext.example.msg('Erro', 'Falha no Cadastro');
                }
            }

            var windowAutenticacao = new Ext.Window({
                id: 'windowAutenticacao',
                resizable: false,
                iconCls: 'user-key',
                layout:'fit',
                title: 'Autenticação',
                width:400,
                height:160,
                modal: true,
                closeAction:'hide',
                plain: false,
                items: [formAutenticacao]
            });

            var windowRecuperarSenha = new Ext.Window({
                id: 'windowRecuperarSenha',
                resizable: false,
                iconCls: 'lock',
                layout:'fit',
                title: 'Recuperar Senha',
                width:400,
                height:140,
                modal: true,
                closeAction:'hide',
                plain: false,
                items: [formRecuperarSenha]
            });

            var windowCadastro = new Ext.Window({
                id: 'windowCadastro',
                resizable: false,
                iconCls: 'user-add',
                layout:'fit',
                title: 'Cadastro',
                width:502,
                height: 600,
                modal: true,
                onHide : function(){
                    formCadastro.form.reset();
                },
                closeAction:'hide',
                plain: false,
                items: [formCadastro]
            });

            var tplVisualizacao = new Ext.XTemplate(
                '<div class="details">',
                '<tpl for=".">',
                '<img alt="carregando..." width="300" height="279" src="'+controllerProdutos+'renderizar/?imagem={hs_produto}&cor={co_produto}&tamanho=300"/>',
                '<b>Codigo: </b>',
                '<span>{sq_produto}</span>',
                '<b>Nome: </b>',
                '<span>{nm_produto}</span>',
                '<b>Tamanho: </b>',
                '<span>{tm_produto}</span>',
                '<b>Valor: </b>',
                '<span>R${vl_produto}</span>',
                '<b>Descricao: </b>',
                '<span>{ds_produto}</span>',
                '</div>',
                '</tpl>',
                '</div>'
                );


            var painelVisualizacaoGaleria = new Ext.Panel({
                title: 'Visualizacao',
                iconCls:'application-home',
                frame: true,
                width: 350,
                html: '<img alt="carregando..." width="300" height="279" src="/camisetas/public/img/default.png"/>\n\
    <span>[Selecione uma camisetas da galeria para adiciona-la no carrinho, nos seus favoritos ou somente para visualizar os detalhes]</span>',
                autoScroll: true,
                margins: '0 0 0 10',
                id: 'painelVisualizacaoGaleria',
                tpl: tplVisualizacao//,
            });

            var tplCamisetas = new Ext.XTemplate(
                '<ul>',
                '<tpl for=".">',
                '<li class="camiseta">',
                '<img src="'+controllerProdutos+'renderizar/?imagem={hs_produto}&cor={co_produto}&tamanho=200" />',
                '<strong>{nm_produto}</strong>',
                '<span>{vl_produto:brMoney}</span>',
                '</li>',
                '</tpl>',
                '</ul>');

            var AtualizarDataViewCamisetas = function(){
                storeCamisetas.load({
                    params: {
                        start: 0,
                        limit: 20,
                        dir: 'desc',
                        sort: 'sq_produto',
                        query: Ext.getCmp('query').getValue(),
                        preco_max: Ext.getCmp('preco_max').getValue(),
                        preco_min: Ext.getCmp('preco_min').getValue(),
                        tamanho: Ext.getCmp('tamanho').getValue(),
                        cor: Ext.getCmp('cor').getValue()
                    }
                });
            }

            var bbarEast = new Ext.Toolbar({
                border: true,
                frame: true,
                height: 30,
                items:[{
                    xtype:'paging',
                    pageSize: 20,
                    store: storeCamisetas,
                    displayInfo: true,
                    plugins: [new Ext.ux.ProgressBarPager({
                        displayMsg     : "<b>{0} &agrave; {1} de {2} camisetas(s)</b>"
                    })]
                }]
            });

            var bbarWest = new Ext.Toolbar({
                border: false,
                frame: false,
                height: 25,
                items:['->','-','-','-',
                'Desenvolvido por Michael Fernandes Rodrigues',
                '-','-','-'
                ]
            });

            var tbarCenter = new Ext.Toolbar({
                border: true,
                frame: true,
                height: 30,
                margins: '5 5 5 5',
                items  : [
                '  ','Preço Minimo:',
                {
                    id: 'preco_min',
                    xtype: 'combo',
                    store: storeValoresCamisetas,
                    displayField:'mValor',
                    valueField: 'vValor',
                    typeAhead: true,
                    mode: 'local',
                    value: '9.99',
                    editable: false,
                    forceSelection: true,
                    triggerAction: 'all',
                    width: 100,
                    selectOnFocus:true,
                    listeners: {
                        select: function(a){
                            /**
                             *Debugger
                             *Ext.example.msg('Preco Minimo Selecionado', 'Codigo {0}', a.getValue());
                             **/
                            validarValoresCamisetas();
                        }
                    }

                },'  ','Preço Máximo',
                {
                    id: 'preco_max',
                    xtype: 'combo',
                    store: storeValoresCamisetas,
                    displayField:'mValor',
                    valueField: 'vValor',
                    typeAhead: true,
                    mode: 'local',
                    value: '99.99',
                    editable: false,
                    forceSelection: true,
                    triggerAction: 'all',
                    width: 100,
                    selectOnFocus:true,
                    listeners: {
                        select: function(a){
                            /**
                             *Debugger
                             *Ext.example.msg('Preco Maximo Selecionada', 'Codigo {0}', a.getValue());
                             **/
                            
                            validarValoresCamisetas();
                        }
                    }
                },'  ','Tamanho:',
                {
                    id: 'tamanho',
                    xtype: 'combo',
                    store: storeTamanhosCamisetas,
                    displayField:'mValor',
                    valueField: 'vValor',
                    typeAhead: true,
                    mode: 'local',
                    value: '',
                    editable: false,
                    forceSelection: true,
                    triggerAction: 'all',
                    width: 100,
                    selectOnFocus:true,
                    listeners: {
                        select: function(a){
                            /**
                             *Debugger
                             *Ext.example.msg('Tamanho Selecionada', 'Codigo {0}', a.getValue());
                             **/
                            
                            AtualizarDataViewCamisetas();
                        }
                    }
                },'  ','Cor:',
                {
                    xtype: 'comboCores',
                    id: 'cor',
                    fieldLabel:'Cor',
                    anchor: '100%',
                    value: '',
                    valueField: 'vValor',
                    displayField: 'mValor',
                    iconClsField: 'cValor',
                    width: 120,
                    editable: false,
                    selectOnFocus:true,
                    forceSelection: true,
                    triggerAction: 'all',
                    listeners: {
                        select: function(a){
                            /**
                             *Debugger
                             *Ext.example.msg('Cor Selecionada', 'Codigo {0}', a.getValue());
                             **/
                            
                            AtualizarDataViewCamisetas();
                        }
                    }
                },'->','Palavra-Chave:',
                {
                    xtype: 'textfield',
                    name: 'query',
                    id: 'query',
                    width: 250
                },'  ',{
                    xtype:'button',
                    text: '',
                    title: 'Pesquisar',
                    iconCls: 'find',
                    handler:  function(a){
                        /**
                         *Debugger
                         *Ext.example.msg('Palavra-Chave Selecionada', 'Palavra {0}', Ext.getCmp('query').getValue());
                         **/
                        
                        AtualizarDataViewCamisetas();
                    }
                }]
            });

            var DataViewCamisetas = new Ext.DataView({
                store: storeCamisetas,
                mode: 'remote',
                border: true,
                frame: true,
                flex:1,
                closable: false,
                destroy: function(){
                    Ext.fly('DataViewCamisetas').remove();
                    Ext.fly('PainelDetalhesCamisetas').remove();
                },
                tpl: tplCamisetas,
                id: 'DataViewCamisetas',
                loadMask: true,
                itemSelector: 'li.camiseta',
                overClass   : 'camiseta-hover',
                singleSelect: true,
                multiSelect : false,
                autoScroll  : true,
                listeners: {
                    dblclick:function(){
                        var selNode = DataViewCamisetas.getSelectedRecords();
                        var win = new Ext.Window({
                            resizable: false,
                            iconCls: 'magnifier',
                            layout:'fit',
                            title: selNode[0].data.nm_produto,
                            width:650,
                            height:650,
                            modal: true,
                            closeAction:'hide',
                            plain: false,
                            items: new Ext.Panel({
                                deferredRender:false,
                                border:false,
                                html: '<img alt="carregando..." width="650" height="604" src="'+controllerProdutos+'renderizar/?imagem='+selNode[0].data.hs_produto+'&cor='+selNode[0].data.co_produto+'&tamanho=650"/>'
                            }),
                            buttons: []
                        });
                        win.show();
                    },
                    click: function(){
                        try{
                            var selNode = DataViewCamisetas.getSelectedRecords();
                            tplVisualizacao.overwrite(painelVisualizacaoGaleria.body, selNode[0].data);
                        }catch(e){
                            Ext.example.msg('Erro', '{0}',e);
                        }
                    }
                }
            });

            var viewPortGaleria = new Ext.Panel({
                id:'viewPortGaleria',
                layout:'hbox',
                layoutConfig: {
                    align : 'stretch',
                    pack  : 'start'
                },
                iconCls: 'application-view-icons',
                title: 'Galeria',
                resizeTabs:false,
                frame: false,
                border: false,
                split: false,
                margins:'0 0 0 0',
                defaults:{
                    autoScroll:true
                },
                items: [DataViewCamisetas,painelVisualizacaoGaleria],
                tbar: tbarCenter,
                bbar: bbarEast
            });

            var tbarPrincipal = new Ext.ux.StatusBar({
                renderTo:Ext.getBody(),
                defaultText: 'Olá, Visitante.',
                items: [{
                    xtype:'button',
                    text: 'Autenticação',
                    id: 'btnAutenticacao',
                    iconCls: 'user-key',
                    handler: function(){
                        windowAutenticacao.show();
                        onCapthaChange('boxCaptchaAutenticacao','imgCaptchaAutenticacao');
                    }
                },'   ',
                {
                    xtype:'button',
                    text: 'Recuperar Senha',
                    id: 'btnRecuperarSenha',
                    iconCls: 'lock',
                    handler: function(){
                        windowRecuperarSenha.show();
                        onCapthaChange('boxCaptchaAutenticacao','imgCaptchaAutenticacao');
                    }
                },'   ',{
                    xtype:'button',
                    text: 'Cadastro',
                    id: 'btnCadastro',
                    iconCls: 'user-add',
                    //     menuAlign: 'br-tr?',
                    handler: function(){
                        windowCadastro.show();
                        onCapthaChange('boxCaptchaCadastro','imgCaptchaCadastro');
                    }
                }]
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
                listeners:{
                },
                items:[viewPortGaleria]
            });

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
                    bbar: bbarWest,
                    border: false
                },PainelCentral
                ]

            });

            App.Default.Layout.Index.superclass.constructor.apply(this,arguments);
        }
    });

}catch(e){
    Ext.example.msg('Erro', '{0}',e);
}