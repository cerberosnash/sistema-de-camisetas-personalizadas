//Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
Ext.form.Field.prototype.msgTarget = 'side';
Ext.namespace('App.Default.Layout.Index');
Ext.QuickTips.init();

try{
             
    App.Default.Layout.Index = Ext.extend(Ext.util.Observable,{

        constructor: function(){

            var controllerAutenticacao = '/camisetas/autenticacao/autenticar';
            var urlRecuperarSenha = '/camisetas/autenticacao/recuperar';
            var urlGeradorCamisetas = "/camisetas/outros/png-1.0/camiseta.php?imagem=";
            var urlEstados = "/camisetas/outros/png-1.0/estados.php";
            var urlMunicipios = "/camisetas/outros/png-1.0/municipios.php";
            var urlCaptcha = "/camisetas/outros/png-1.0/captcha/CaptchaSecurityImages.php?width=72&height=25&characters=4&t=";
            var urlSecurityCode = "/camisetas/outros/png-1.0/captcha.php";
            var controllerPedidos = "/camisetas/pedidos/";
            var controllerGaleria = '/camisetas/galeria/';
            var controllerCarrinho = '/camisetas/carrinho/';
            var urlFavoritos = '/camisetas/outros/png-1.0/favoritos.php';
            var urlProcessarBoleto = '/camisetas/library/Util/boletos/BB.php';
            var urlUploadCamisetas = '/camisetas/outros/png-1.0/upload.php';
            var urlMinhaCamiseta = '/camisetas/outros/png-1.0/minha_camiseta.php';
            var urlLogoff = '/camisetas/logoff';
            var urlCorMinhaCamiseta = '/camisetas/outros/png-1.0/cor.php';
            var controllerFavoritos = '/camisetas/favoritos/';
            var urlMostrarMinhaCamiseta = '/camisetas/outros/png-1.0/mostrar_camiseta.php';
            var urlAguarde = '/camisetas/outros/png-1.0/aguarde.php';
            var urlValidarRecorte = '/camisetas/outros/png-1.0/validar_recorte.php';
            var urlAlteracaoCliente = '/camisetas/outros/png-1.0/alteracao_cliente.php';

            /*DataStores - Inicio*/

            var storeEstados = new Ext.data.JsonStore({
                root: 'estados',
                totalProperty: 'totalCount',
                idProperty: 'sq_uf',
                remoteSort: false,
                autoDestroy: true,
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
                    url: urlEstados
                })
            });

            var storeMunicipios = new Ext.data.JsonStore({
                root: 'municipios',
                totalProperty: 'totalCount',
                idProperty: 'sq_municipio',
                remoteSort: true,
                autoDestroy: true,
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
                    url: urlMunicipios
                })
            });

            var storePedidos = new Ext.data.JsonStore({
                root: 'pedidos',
                totalProperty: 'totalCount',
                idProperty: 'sq_pedido',
                remoteSort: true,
                autoDestroy: true,
                fields: [
                {
                    name: 'sq_pedido',
                    type: 'int'
                },
                {
                    name: 'cd_pedido'
                }
                ],
                proxy: new Ext.data.HttpProxy({
                    method: 'post',
                    url: controllerPedidos + 'carregar'
                })
            });

            storePedidos.on('loadexception',function(a,b,c){
                var data = eval(c.responseText);
                if(data.success===false){
                    alert('[Error]\n[storePedidos]\n['+data.error+']');
                }else{
                    alert('[Error]\n[storePedidos]\n[Erro desconhecido.]');
                }
            });

            storePedidos.on('load',function(store){
                if(parseInt(store.reader.jsonData.totalCount)>0){
                    Ext.getCmp('btnBoletos').enable();
                }else{
                    Ext.getCmp('btnBoletos').disable();
                }
            });

            storePedidos.load();

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

            var storeBancos = new Ext.data.ArrayStore({
                fields: ['mValor', 'vValor'],
                data : [
                ['Banco do Brasil', 'BB'],
                ['Banco Itau', 'BI'],
                ['Banco Santander', 'BS'],
                ['UniBanco', 'UB'],
                ['Caixa Economica Federal', 'CE'],
                ['Banco Real', 'BR'],
                ['Banco HSBC', 'HS'],
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

            var storeCarrinho = new Ext.data.JsonStore({
                root: 'images',
                totalProperty: 'totalCount',
                idProperty: 'sq_produto',
                remoteSort: false,
                autoDestroy: true,
                baseParams:{
                    start:0,
                    limit:20
                },
                fields: ['sq_produto','nm_produto','co_produto','ds_produto','tm_produto','qt_produto', 'hs_produto',{
                    name:'vl_produto',
                    type: 'float'
                }],
                proxy: new Ext.data.HttpProxy({
                    method: 'post',
                    url: controllerCarrinho + 'carregar'
                })
            });

            storeCarrinho.on('load',function(store){
                if(parseInt(store.reader.jsonData.totalCount)>0){
                    Ext.getCmp('btnCarrinho').enable();
                    if(parseFloat(store.reader.jsonData.totalCarrinho)>0){
                        Ext.getCmp('txTotalCarrinho').setText('Total: R$'+parseFloat(store.reader.jsonData.totalCarrinho));
                        Ext.getCmp('btnFinalizarCarrinho').enable();
                    }else{
                        Ext.getCmp('txTotalCarrinho').setText('Total: R$0.00');
                        Ext.getCmp('btnFinalizarCarrinho').disable();
                        Ext.getCmp('btnRemoverCarrinho').disable();
                        Ext.getCmp('QtdCarrinho').disable();
                        Ext.getCmp('btnQtdCarrinho').disable();
                    }
                }else{
                    Ext.getCmp('btnCarrinho').disable();
                    Ext.getCmp('txTotalCarrinho').setText('Total: R$0.00');
                    Ext.getCmp('btnFinalizarCarrinho').disable();
                }
            });

            storeCarrinho.setDefaultSort('nm_produto', 'asc');
            storeCarrinho.load();

            var storeFavoritos = new Ext.data.JsonStore({
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
                    url: controllerFavoritos + 'carregar'
                })
            });

            storeFavoritos.setDefaultSort('sq_produto', 'desc');

            storeFavoritos.on('load',function(store){
                if(store.reader.jsonData.success===true){
                    if(parseInt(store.reader.jsonData.totalCount)>0){
                        Ext.getCmp('btnFavoritos').enable();
                    }else{
                        Ext.getCmp('btnFavoritos').disable();
                    }
                }
            });

            storeFavoritos.on('loadexception',function(a,b,c){
                var data = eval(c.responseText);
                if(data.success===false){
                    alert('[Error]\n[storeFavoritos]\n['+data.error+']');
                }else{
                    if(parseInt(c.reader.jsonData.totalCount)>0){
                        Ext.getCmp('btnFavoritos').enable();
                    }else{
                        Ext.getCmp('btnFavoritos').disable();
                    }
                }
            });

            storeFavoritos.load();

            /*DataStores - Fim*/

            function Logoff(btn){
                if(btn=='yes'){
                    window.location = urlLogoff;
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
                        var ms = 5000/count;
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
                            btn.disabled = false;
                            cb();
                        }else{
                            var i = v/count;
                            pbar.updateProgress(i,'Recuperando senha...');
                            if(Math.round(100*i)==100){
                                windowRecuperarSenha.hide();
                                pbar.destroy();
                                btn.disabled = false;
                                Ext.MessageBox.show({
                                    msg: 'Sua senha sera enviada para '+ Ext.getCmp('rEmail').getValue(),
                                    icon:'silk-add',
                                    animEl: 'btnRecuperarSenha'
                                });
                            }
                        }
                    };
                };
                return {
                    run : function(pbar, btn, count, cb){
                        btn.disabled = true;
                        var ms = 5000/count;
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
                    src: urlCaptcha + new Date().getTime()
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
                    src: urlCaptcha + new Date().getTime()
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
                        Ext.get(img).dom.src = urlCaptcha+new Date().getTime()+Math.random(0,9999);
                        var conn = new Ext.data.Connection();
                        var data = null;
                        conn.request({
                            url: urlSecurityCode,
                            method: 'POST',
                            params: {},
                            success: function(responseObject) {
                                if(responseObject.responseText){
                                    try{
                                        data = eval(responseObject.responseText);
                                        if(data[0].success===true){
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

            function carregarFormAlteracaoCliente(){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: urlAlteracaoCliente,
                    method: 'POST',
                    params: {
                        acao: 'carregar'
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.cliente.success===true){
                                    Ext.getCmp('acNome').setValue(data.cliente.nome);
                                    Ext.getCmp('acCPF').setValue(data.cliente.cpf);
                                    Ext.getCmp('acDDResidencial').setValue(data.cliente.ddd_residencial);
                                    Ext.getCmp('acNUResidencial').setValue(data.cliente.tel_residencial);
                                    Ext.getCmp('acDDCelular').setValue(data.cliente.ddd_celular);
                                    Ext.getCmp('acNUCelular').setValue(data.cliente.tel_celular);
                                    Ext.getCmp('acUF').setValue(data.cliente.uf);
                                    Ext.getCmp('acMunicipio').setValue(data.cliente.municipio);
                                    Ext.getCmp('acCEP').setValue(data.cliente.cep);
                                    Ext.getCmp('acEndereco').setValue(data.cliente.endereco);
                                    Ext.getCmp('acEmail').setValue(data.cliente.email);
                                    Ext.getCmp('acSenha').setValue(data.cliente.senha);
                                }else{
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
                    iconCls: 'silk-add',
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
                    iconCls: 'silk-delete',
                    handler: onSubmitRecuperarSenha
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
                    value: 'cerberosnash@gmail.com'
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
                    value: 'cerberosnash@gmail.com'
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

            var formAlteracaoCliente =  new Ext.form.FormPanel({
                id: 'formAlteracaoCliente',
                frame:false,
                border: true,
                success: function(e){
                    alert(e);
                },
                failure: function(e){
                    alert(e);
                },
                url: urlAlteracaoCliente,
                baseParams:{
                    acao: 'salvar'
                },
                title: '',
                width: 500,
                bodyStyle:'padding:10px 10px 10px 10px',
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
                        //name: 'Nome',
                        id: 'acNome',
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
                        id: 'acCPF',
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
                            //name: 'DDD Residencial',
                            id: 'acDDResidencial',
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
                            //name: 'Tel. Residencial',
                            id: 'acNUResidencial',
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
                            //name: 'DDD Celular',
                            id: 'acDDCelular',
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
                            //name: 'Tel. Celular',
                            id: 'acNUCelular',
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
                        //name: 'Estado',
                        id: 'acUF',
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
                        //name: 'Municipio',
                        id: 'acMunicipio',
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
                        id: 'acCEP',
                        //name: 'CEP',
                        vtype: 'cep',
                        autoCreate: {
                            tag: 'input',
                            type: 'text',
                            maxlength: '9'
                        }
                    },{
                        fieldLabel: 'Endereço',
                        id: 'acEndereco',
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
                        //name: 'Email',
                        id: 'acEmail',
                        vtype: 'email'
                    },{
                        xtype: 'textfield',
                        fieldLabel: 'Senha',
                        //name: 'Senha',
                        id: 'acSenha',
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
                        id: 'acVDEmail',
                        vtype: 'comparefield',
                        idFieldCompare: 'acEmail',
                        autoCreate: {
                            tag: 'input',
                            type: 'text',
                            maxlength: '100'
                        }
                    },{
                        xtype: 'textfield',
                        fieldLabel: 'Senha',
                        id: 'acVDSenha',
                        inputType: 'password',
                        idFieldCompare:  'acSenha',
                        vtype: 'comparefield',
                        autoCreate: {
                            tag: 'input',
                            type: 'password',
                            maxlength: '100'
                        }
                    },{
                        xtype: 'compositefield',
                        fieldLabel: 'Código',
                        items:[{
                            xtype: 'textfield',
                            //name: 'Captcha',
                            id: 'acCaptcha',
                            vtype: 'captcha',
                            width: 245
                        },boxCaptchaAutenticacao]
                    }]
                }
                ],
                buttons: [
                {
                    xtype: 'button',
                    bodyStyle:'padding:10px 10px 10px 10px',
                    text: 'Salvar Alteracoes',
                    id: 'acSalvarAlteracaoCliente',
                    type: 'submit',
                    iconCls: 'silk-add',
                    handler: onSubmitSalvarAlteracaoCliente
                }
                ]
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
                        //name: 'Nome',
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
                            //name: 'DDD Residencial',
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
                            //name: 'Tel. Residencial',
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
                            //name: 'DDD Celular',
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
                            //name: 'Tel. Celular',
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
                        //name: 'Estado',
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
                        //name: 'Municipio',
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
                        //name: 'CEP',
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
                        //name: 'Email',
                        id: 'tx_email',
                        vtype: 'email'
                    },{
                        xtype: 'textfield',
                        fieldLabel: 'Senha',
                        //name: 'Senha',
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
                    },{
                        xtype: 'compositefield',
                        fieldLabel: 'Código',
                        items:[{
                            xtype: 'textfield',
                            //name: 'Captcha',
                            id: 'cCaptcha',
                            vtype: 'captcha',
                            width: 245
                        },boxCaptchaAutenticacao]
                    }]
                }],
                buttons: [{
                    text: 'Finalizar Cadastro',
                    id: 'cEntrar',
                    type: 'submit',
                    iconCls: 'silk-add',
                    handler: onSubmitCadastro
                }]
            });

            function onSubmitRecuperarSenha(){
                if(formRecuperarSenha.form.isValid()===true){
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: urlRecuperarSenha,
                        method: 'POST',
                        params: {
                            email : Ext.getCmp('rEmail').getValue(),
                            captcha : Ext.getCmp('rCaptcha').getValue()
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

                                        RunnerRecuperarSenha.run(pbarRecuperarSenha, Ext.getCmp('rRecuperar'), 19, function(){
                                            pbarRecuperarSenha.updateText('Concluído!');
                                        });

                                    }else{
                                        Ext.example.msg('Erro', 'Falha ao recuperar a senha');
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
                        url: controllerAutenticacao,
                        method: 'POST',
                        params: {
                            email : Ext.getCmp('aEmail').getValue(),
                            senha : Ext.getCmp('aSenha').getValue(),
                            captcha : Ext.getCmp('aCaptcha').getValue()
                        },
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
                                      
                                        //tbarPrincipal.setText('Olá, '+data[0].nome+' - '+data[0].perfil+'.');

                                        var pbarAutenticacao = new Ext.ProgressBar({
                                            text:'Carregando...',
                                            id:'pbarAutenticacao',
                                            cls:'custom',
                                            width: 250,
                                            margins: '5px 5px 5px 5px',
                                            doLayout: false,
                                            renderTo: 'boxLoadingAutenticacao'
                                        });
                                        RunnerAutenticacao.run(pbarAutenticacao, Ext.getCmp('aEntrar'), 19, data.url);
                                   
                                    }
                                    else{
                                        Ext.example.msg('Erro', data.error);
                                        pbarAutenticacao.updateText('Tente novamente!');
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
                alert('submit cadastro'+ Ext.getCmp('formCadastro').form.isValid());
            }

            function onSubmitSalvarAlteracaoCliente(){
                if(Ext.getCmp('formAlteracaoCliente').form.isValid()){
                    Ext.getCmp('formAlteracaoCliente').form.submit();
                }
            }

            var windowAutenticacao = new Ext.Window({
                id: 'windowAutenticacao',
                resizable: false,
                iconCls: 'silk-add',
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
                iconCls: 'silk-add',
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
                iconCls: 'silk-add',
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

            var windowAlteracaoCliente = new Ext.Window({
                id: 'windowAlteracaoCliente',
                resizable: false,
                iconCls: 'silk-add',
                layout:'fit',
                title: 'Alteracao',
                width:502,
                height: 600,
                modal: true,
                onHide : function(){
                    formAlteracaoCliente.form.reset();
                },
                closeAction:'hide',
                plain: false,
                items: [formAlteracaoCliente]
            });

            var tplVisualizacao = new Ext.XTemplate(
                '<div class="details">',
                '<tpl for=".">',
                '<img alt="carregando..." width="300" height="279" src="/camisetas/outros/png-1.0/camiseta.php?imagem={hs_produto}&cor={co_produto}&tamanho=300"/>',
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
                '<b>Data Criacao: </b>',
                '<span>{dt_produto}</span>',
                '<b>Vendidas: </b>',
                '<span>{nu_vendidos} Unidades</span>',
                '</div>',
                '</tpl>',
                '</div>'
                );

            var bbarAdicionar = new Ext.Panel({
                id: 'bbarAdicionar',
                layout: 'hbox',
                buttonAlign: 'center',
                buttons:[{
                    text: 'Adicionar no Carrinho',
                    id: 'btnAddCarrinho',
                    width: 160,
                    iconCls: 'silk-add',
                    handler: function(){
                        if(this.value){
                            adicionarCarrinho(this.value);
                        }
                    }
                },{
                    text: 'Adicionar nos Favoritos',
                    id: 'btnAddFavoritos',
                    width: 160,
                    iconCls: 'silk-delete',
                    handler: function(){
                        adicionarFavoritos(this.value);
                    }
                }]
            });

            var bbarRemoverFavoritos = new Ext.Panel({
                id: 'bbarRemoverFavoritos',
                layout: 'hbox',
                buttonAlign: 'center',
                buttons:[{
                    bodyStyle: 'padding: 50px;',
                    text: 'Remover dos favoritos',
                    id: 'btnDelFavorito',
                    width: 160,
                    iconCls: 'silk-add',
                    handler: function(){
                        removerFavoritos(this.value);
                    }
                },{
                    text: 'Adicionar no carrinho',
                    id: 'btnAddFavCarrinho',
                    width: 160,
                    iconCls: 'silk-add',
                    handler: function(){
                        adicionarCarrinho(this.value);
                    }
                }]
            });

            var painelVisualizacaoGaleria = new Ext.Panel({
                title: 'Visualizacao',
                frame: true,
                width: 350,
                html: '<img alt="carregando..." width="300" height="279" src="/camisetas/outros/png-1.0/imagens/default.png"/>\n\
    <span>[Selecione uma camisetas da galeria para adiciona-la no carrinho, nos seus favoritos ou somente para visualizar os detalhes]</span>',
                autoScroll: true,
                margins: '0 0 0 10',
                id: 'painelVisualizacaoGaleria',
                tpl: tplVisualizacao,
                bbar: bbarAdicionar
            });

            var painelVisualizacaoFavoritos = new Ext.Panel({
                title: 'Visualizacao',
                frame: true,
                width: 350,
                html: '<img alt="carregando..." width="300" height="279" src="/camisetas/outros/png-1.0/imagens/default.png"/>\n\
    <span>[Selecione uma camisetas dos favoritos para adiciona-la no carrinho, nos seus favoritos ou somente para visualizar os detalhes]</span>',
                autoScroll: true,
                margins: '0 0 0 10',
                id: 'painelVisualizacaoFavoritos',
                tpl: tplVisualizacao,
                bbar: bbarRemoverFavoritos
            });

            var tplCamisetas = new Ext.XTemplate(
                '<ul>',
                '<tpl for=".">',
                '<li class="camiseta">',
                '<img src="'+urlGeradorCamisetas+'{hs_produto}&cor={co_produto}&tamanho=200" />',
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

            var AtualizarDataViewFavoritos = function(){
                storeFavoritos.load({
                    params: {
                        start: 0,
                        limit: 20,
                        dir: 'desc',
                        sort: 'sq_produto',
                        query: Ext.getCmp('fr_query').getValue(),
                        preco_max: Ext.getCmp('fr_preco_max').getValue(),
                        preco_min: Ext.getCmp('fr_preco_min').getValue(),
                        tamanho: Ext.getCmp('fr_tamanho').getValue(),
                        cor: Ext.getCmp('fr_cor').getValue()
                    }
                });
            }

            function validarValoresCamisetas(){
                if(parseFloat(Ext.getCmp('preco_min').getValue()) > parseFloat(Ext.getCmp('preco_max').getValue())){
                    Ext.example.msg('Atenção', 'O preço maximo ({0}) nao pode ser menor que o preco minimo ({1})!',Ext.getCmp('preco_max').getValue() , Ext.getCmp('preco_min').getValue());
                }else{
                    AtualizarDataViewCamisetas();
                }
            }

            function validarValoresFavoritos(){
                if(parseFloat(Ext.getCmp('fr_preco_min').getValue()) > parseFloat(Ext.getCmp('fr_preco_max').getValue())){
                    Ext.example.msg('Atenção', 'O preço maximo ({0}) nao pode ser menor que o preco minimo ({1})!',Ext.getCmp('fr_preco_max').getValue() , Ext.getCmp('fr_preco_min').getValue());
                }else{
                    AtualizarDataViewFavoritos();
                }
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

            var bbarFavoritos = new Ext.Toolbar({
                border: false,
                frame: false,
                height: 30,
                items:[{
                    xtype:'paging',
                    pageSize: 20,
                    store: storeFavoritos,
                    displayInfo: true,
                    plugins: [new Ext.ux.ProgressBarPager()]
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
                            Ext.example.msg('Preco Minimo Selecionado', 'Codigo {0}', a.getValue());
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
                            Ext.example.msg('Preco Maximo Selecionada', 'Codigo {0}', a.getValue());
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
                            Ext.example.msg('Tamanho Selecionada', 'Codigo {0}', a.getValue());
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
                            Ext.example.msg('Cor Selecionada', 'Codigo {0}', a.getValue());
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
                        Ext.example.msg('Palavra-Chave Selecionada', 'Palavra {0}', Ext.getCmp('query').getValue());
                        AtualizarDataViewCamisetas();
                    }
                }]
            });

            var tbarFavoritos = new Ext.Toolbar({
                border: false,
                frame: false,
                height: 30,
                margins: '5 5 5 5',
                items  : [
                '  ','Preço Minimo:',
                {
                    id: 'fr_preco_min',
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
                            Ext.example.msg('Preco Minimo Selecionado', 'Codigo {0}', a.getValue());
                            validarValoresFavoritos();
                        }
                    }

                },'  ','Preço Máximo',
                {
                    id: 'fr_preco_max',
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
                            Ext.example.msg('Preco Maximo Selecionada', 'Codigo {0}', a.getValue());
                            validarValoresFavoritos();
                        }
                    }
                },'  ','Tamanho:',
                {
                    id: 'fr_tamanho',
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
                            Ext.example.msg('Tamanho Selecionada', 'Codigo {0}', a.getValue());
                            AtualizarDataViewFavoritos();
                        }
                    }
                },'  ','Cor:',
                {
                    xtype: 'comboCores',
                    id: 'fr_cor',
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
                            Ext.example.msg('Cor Selecionada', 'Codigo {0}', a.getValue());
                            AtualizarDataViewFavoritos();
                        }
                    }
                },'->','Palavra-Chave:',
                {
                    xtype: 'textfield',
                    name: 'query',
                    id: 'fr_query',
                    width: 250
                },'  ',{
                    xtype:'button',
                    text: '',
                    title: 'Pesquisar',
                    iconCls: 'find',
                    handler:  function(a){
                        Ext.example.msg('Palavra-Chave Selecionada', 'Palavra {0}', Ext.getCmp('query').getValue());
                        AtualizarDataViewFavoritos();
                    }
                }]
            });


            var formUpload = new Ext.FormPanel({
                fileUpload: true,
                id: 'formUpload',
                border: true,
                frame: true,
                width: 250,
                height: 35,
                method: 'POST',
                baseCls: 'x-plain',
                bodyStyle: (Ext.isIE? 'padding-left: 3px;' : 'padding-left: 5px;'),
                baseParams: {},
                onSubmit: Ext.emptyFn,
                waitMsgTarget: false,
                scope: this,
                labelWidth: 42,
                defaults: {
                    allowBlank: false,
                    msgTarget: 'qtip'
                },
                items:[{
                    xtype: 'fileuploadfield',
                    id: 'imagem',
                    width: 150,
                    emptyText: '',
                    buttonText: '',
                    buttonCfg:{
                        iconCls: 'picture-save'
                    },
                    fieldLabel: 'Imagem'
                //               buttonText: 'Escolher...',
                    
                }],
                buttons: []
            });

            var validarRecorte = function(){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: urlValidarRecorte,
                    method: 'POST',
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data){
                                    Ext.getCmp('recorte').setValue(data.success);
                                }
                            }catch(e){
                                Ext.example.msg('Erro', '{0}',e);
                                Ext.getCmp('recorte').setValue('false');
                            }
                        }
                    },
                    failure: function(e) {
                        Ext.example.msg('Erro', '{0}',e);
                        Ext.getCmp('recorte').setValue('false');
                    }
                });

                return false;
            }

            var tbarMinhaCamiseta = new Ext.Toolbar({
                id: 'tbarMinhaCamiseta',
                layout: 'hbox',
                border: true,
                frame: true,
                height: 30,
                bodyStyle: (Ext.isIE? 'padding-left: 3px;' : 'padding: 5px;'),
                items  : ['Tamanho:',
                {
                    id: 'tamanho_mc',
                    xtype: 'combo',
                    fieldLabel:'Tamanho',
                    store: storeTamanhosCamisetas,
                    displayField:'mValor',
                    valueField: 'vValor',
                    typeAhead: true,
                    mode: 'local',
                    value: '',
                    editable: false,
                    forceSelection: true,
                    triggerAction: 'all',
                    width: 70,
                    selectOnFocus:true,
                    listeners: {
                        select: function(a){
                            Ext.example.msg('Tamanho Selecionada', 'Codigo {0}', a.getValue());
                            validarSalvarMinhaCamiseta();
                        }
                    }
                },'Cor:',
                {
                    xtype: 'comboCores',
                    id: 'cor_mc',
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
                            validarSalvarMinhaCamiseta();
                            Ext.example.msg('Cor Selecionada', 'Codigo {0}', a.getValue());
                            var conn = new Ext.data.Connection();
                            var data = null;
                            conn.request({
                                url: urlCorMinhaCamiseta,
                                method: 'POST',
                                params: {
                                    cor: Ext.getCmp('cor_mc').getValue()
                                },
                                success: function(responseObject) {
                                    if(responseObject.responseText){
                                        try{
                                            data = eval(responseObject.responseText);
                                            if(data.success===true){
                                                Ext.example.msg('Processamento', 'Sucess {0} Cor {1}' ,data.success, data.cor );
                                                Ext.get('iMinhaCamiseta').dom.src = urlMostrarMinhaCamiseta + '?t=' + new Date().getTime()+Math.random(0,9999);

                                            }else{
                                                Ext.example.msg('Erro', 'Falha ao processar o cor da camiseta!');
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
                        }
                    }
                },'Nome:',
                {
                    xtype: 'textfield',
                    name: 'nome_mc',
                    id: 'nome_mc',
                    width: 80,
                    enableKeyEvents : true,
                    autoCreate:{
                        tag: 'input',
                        type: 'text',
                        maxLength: 25
                    },
                    listeners:{
                        keyup:function(){
                            validarSalvarMinhaCamiseta();
                        }
                    }
                },'Descricao:',
                {
                    xtype: 'textfield',
                    name: 'descricao_mc',
                    id: 'descricao_mc',
                    width: 80,
                    enableKeyEvents : true,
                    autoCreate:{
                        tag: 'input',
                        type: 'text',
                        maxLength: 100
                    },
                    listeners:{
                        keyup:function(){
                            validarSalvarMinhaCamiseta();
                        }
                    }
                },formUpload,{
                    xtype: 'hidden',
                    id: 'recorte',
                    width: 60
                }]
            });
            

            function validarSalvarMinhaCamiseta(){
                if(Ext.getCmp('recorte').getValue() && Ext.getCmp('tamanho_mc').getValue() && Ext.getCmp('cor_mc').getValue() && Ext.getCmp('nome_mc').getValue() && Ext.getCmp('descricao_mc').getValue()){
                    Ext.getCmp('salvar_mc').enable();
                }else{
                    Ext.getCmp('salvar_mc').disable();
                }
            }

            var tbarBoletos = new Ext.Toolbar({
                height: 30,
                id: 'tbarBoletos',
                frame: false,
                border: false,
                items  : ['  ','Banco:',
                {
                    id: 'nm_banco',
                    xtype: 'combo',
                    store: storeBancos,
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
                            Ext.example.msg('Acao', 'Carregar o boleto do banco {0}', a.getValue());
                            processarBoleto();
                        }
                    }

                },'Código do Pedido',
                {
                    id: 'cd_pedido',
                    xtype: 'combo',
                    store: storePedidos,
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
                            Ext.example.msg('Pedido', 'Pedido Selecionado {0}', a.getValue());
                            processarBoleto();
                        }
                    }
                },{
                    xtype: 'button',
                    text: 'Imprimir Boleto',
                    iconCls: 'silk-table-refresh',
                    handler: function(){
                        if(Ext.getCmp('cd_pedido').getValue() && Ext.getCmp('nm_banco').getValue()){
                            try{
                                iBoleto.print();
                            }catch(e){
                                Ext.example.msg('Erro', e);
                            }
                        }else{
                            Ext.example.msg('Erro', 'Antes de imprimir o boleto selecione o banco e o pedido!');
                        }
                    }
                }]
            });

            function processarBoleto(){
                if(Ext.getCmp('cd_pedido').getValue() && Ext.getCmp('nm_banco').getValue()){
                    Ext.MessageBox.show({
                        msg: 'Processando o Boleto, Aguarde...',
                        progressText: 'Processando...',
                        width:300,
                        wait:true,
                        waitConfig: {
                            interval:100
                        },
                        icon:'silk-add',
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

            var DataViewFavoritos = new Ext.DataView({
                store: storeFavoritos,
                mode: 'remote',
                border: true,
                frame: true,
                flex:1,
                destroy: function(){
                    Ext.fly('DataViewFavoritos').remove();
                //  Ext.fly('PainelDetalhesCamisetas').remove();
                },
                tpl: tplCamisetas,
                id: 'DataViewFavoritos',
                loadMask: true,
                itemSelector: 'li.camiseta',
                overClass   : 'camiseta-hover',
                singleSelect: true,
                multiSelect : false,
                autoScroll  : true,
                listeners: {
                    dblclick:function(){
                        Ext.example.msg('Event', 'Click Duplo');

                        var selNode = DataViewFavoritos.getSelectedRecords();
                        var win = new Ext.Window({
                            resizable: false,
                            iconCls: 'silk-add',
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
                                html: '<img alt="carregando..." width="650" height="604" src="/camisetas/outros/png-1.0/camiseta.php?imagem='+selNode[0].data.hs_produto+'&cor='+selNode[0].data.co_produto+'&tamanho=650"/>'
                            }),
                            buttons: []
                        });
                        win.show();
                    },
                    click: function(){
                        try{
                            var selNode = DataViewFavoritos.getSelectedRecords();
                            tplVisualizacao.overwrite(painelVisualizacaoFavoritos.body, selNode[0].data);
                            Ext.getCmp('btnDelFavorito').enable();
                            Ext.getCmp('btnAddFavCarrinho').enable();
                            Ext.getCmp('btnAddFavCarrinho').value = selNode[0].data.sq_produto;
                            Ext.getCmp('btnDelFavorito').value = selNode[0].data.sq_produto;
                        }catch(e){
                            Ext.example.msg('Erro', '{0}',e);
                        }
                    }
                }
            });

            var bbarMinhaCamiseta = new Ext.Toolbar({
                height: 30,
                items:['->',{
                    xtype: 'button',
                    text: 'Enviar',
                    id: 'enviar_mc',
                    iconCls: 'silk-add',
                    handler: function(){
                        if(formUpload.getForm().isValid()){
                            formUpload.getForm().submit({
                                url: urlUploadCamisetas,
                                waitMsg: 'Enviando imagem...',
                                titleMsg: 'Aguarde',
                                textMsg: 'Aguarde',
                                success: function(){
                                    Ext.get('iMinhaCamiseta').dom.src = urlMinhaCamiseta;
                                    //   formUpload.getForm().reset();
                                    Ext.getCmp('recortar_mc').enable();
                                    Ext.getCmp('tamanho_mc').enable();
                                    Ext.getCmp('cor_mc').enable();
                                    Ext.getCmp('nome_mc').enable();
                                    Ext.getCmp('descricao_mc').enable();
                                },
                                failure: function(){
                                    Ext.example.msg('Erro', 'O envio da imagem falhou!');
                                }
                            });
                        }
                    }
                },{
                    xtype:'button',
                    text: 'Recortar',
                    id: 'recortar_mc',
                    title: 'Recortar',
                    iconCls: 'cut',
                    handler:  function(){
                        Ext.MessageBox.show({
                            msg: 'Processando Camiseta, Aguarde...',
                            progressText: 'Processando...',
                            width:300,
                            wait:true,
                            waitConfig: {
                                interval:100
                            },
                            icon:'silk-add',
                            animEl: 'iMinhaCamiseta'
                        });

                        Ext.example.msg('Acao', 'Recortando...');
                        Ext.getCmp('recortar_mc').disable();

                        document.getElementById("iMinhaCamiseta").contentWindow.recortar();
                        setTimeout(function(){
                            validarRecorte();
                            Ext.get('iMinhaCamiseta').dom.src = urlAguarde;
                        }, 2000);

                        setTimeout(function(){
                            validarSalvarMinhaCamiseta();
                            Ext.MessageBox.hide();
                            Ext.getCmp('recortar_mc').disable();
                            Ext.getCmp('restaurar_mc').enable();
                            Ext.get('iMinhaCamiseta').dom.src = urlMostrarMinhaCamiseta + '?t=' + new Date().getTime()+Math.random(0,9999);
                        }, 5000);

                        

                    }
                },{
                    xtype:'button',
                    text: 'Restaurar',
                    id: 'restaurar_mc',
                    title: 'Restaurar',
                    iconCls: 'image-edit',
                    handler:  function(){
                        Ext.example.msg('Acao', 'Restaurando...');
                        Ext.get('iMinhaCamiseta').dom.src = urlMinhaCamiseta;
                        Ext.getCmp('recortar_mc').enable();
                        Ext.getCmp('restaurar_mc').disable();
                        Ext.getCmp('recorte').setValue('');
                        validarSalvarMinhaCamiseta();
                    }
                },{
                    xtype:'button',
                    text: 'Salvar',
                    id: 'salvar_mc',
                    title: 'Salvar',
                    iconCls: 'picture-save',
                    handler:  function(){
                        Ext.example.msg('Acao', 'Salvando...');
                        var conn = new Ext.data.Connection();
                        var data = null;
                        conn.request({
                            url: controllerFavoritos + 'criar',
                            method: 'POST',
                            params: {
                                co_produto: Ext.getCmp('cor_mc').getValue(),
                                tm_produto: Ext.getCmp('tamanho_mc').getValue(),
                                nm_produto: Ext.getCmp('nome_mc').getValue(),
                                ds_produto: Ext.getCmp('descricao_mc').getValue()
                            },
                            success: function(responseObject) {
                                if(responseObject.responseText){
                                    try{
                                        data = eval(responseObject.responseText);
                                        if(data.success===true && data.id){
                                            Ext.example.msg('Salvando', 'Camiseta {0} salva com sucesso',data.id);
                                            Ext.example.msg('Noticia', 'A Camiseta {0} agora estara nos seus favoritos',data.id);
                                            AtualizarDataViewFavoritos();
                                            Ext.get('iMinhaCamiseta').dom.src = urlMinhaCamiseta + '?t=' + new Date().getTime()+Math.random(0,9999);

                                            Ext.getCmp('salvar_mc').disable();
                                            Ext.getCmp('restaurar_mc').disable();
                                            Ext.getCmp('recortar_mc').disable();

                                            Ext.getCmp('cor_mc').getValue('');
                                            Ext.getCmp('tamanho_mc').setValue('');
                                            Ext.getCmp('nome_mc').setValue('');
                                            Ext.getCmp('descricao_mc').setValue('');

                                            Ext.getCmp('cor_mc').disable();
                                            Ext.getCmp('tamanho_mc').disable();
                                            Ext.getCmp('nome_mc').disable();
                                            Ext.getCmp('descricao_mc').disable();
                                            Ext.getCmp('descricao_mc').disable();

                                            formUpload.form.reset();



                                        }
                                        else{
                                            Ext.example.msg('Erro', 'Falha no Processamento');
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
                    }
                }]
            });

            function adicionarFavoritos(id){
                if(id){
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerFavoritos + 'adicionar',
                        method: 'POST',
                        params: {
                            sq_produto: id
                        },
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
                                        Ext.example.msg('Acao', 'Favorito adicionado com sucesso');
                                        AtualizarDataViewFavoritos();

                                    }else{
                                        Ext.example.msg('Erro', 'Falha ao adicionar ao favorito');
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
                }
                return false;
            }

            function removerFavoritos(id){
                if(id){
                    Ext.Msg.show({
                        msg: String.format('Voce tem certeza que deseja remover esta camiseta dos seus favoritos?'),
                        buttons: Ext.Msg.YESNO,
                        icon: Ext.Msg.QUESTION,
                        fn: function(btn) {
                            if(btn == 'yes') {
                                var conn = new Ext.data.Connection();
                                var data = null;
                                conn.request({
                                    url: controllerFavoritos + 'remover',
                                    method: 'POST',
                                    params: {
                                        sq_produto: id
                                    },
                                    success: function(responseObject) {
                                        if(responseObject.responseText){
                                            try{
                                                data = eval(responseObject.responseText);
                                                if(data.success===true){
                                                    Ext.example.msg('Acao', 'Favorito removido com sucesso');
                                                    AtualizarDataViewFavoritos();

                                                }else{
                                                    Ext.example.msg('Erro', 'Falha ao remover favorito');
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
                            }
                        }
                    });
                }
                return false;
            }

            function finalizarCarrinho(){
                Ext.Msg.show({
                    msg: String.format('Voce tem certeza que deseja finalizar o seu carrinho?'),
                    buttons: Ext.Msg.YESNO,
                    icon: Ext.Msg.QUESTION,
                    fn: function(btn) {
                        if(btn == 'yes') {
                            var conn = new Ext.data.Connection();
                            var data = null;
                            conn.request({
                                url: controllerCarrinho + 'finalizar',
                                method: 'POST',
                                success: function(responseObject) {
                                    if(responseObject.responseText){
                                        try{
                                            data = eval(responseObject.responseText);
                                            if(data.success===true){
                                                Ext.example.msg('Acao', 'Carrinho finalizado com sucesso');
                                                DataGridCarrinho.store.removeAll();
                                                storeCarrinho.load();
                                                storePedidos.load();
                                                try{
                                                    Ext.get('iBoleto').dom.src = '';
                                                    Ext.example.msg('Noticia', 'O boleto para o pagamento esta disponivel');
                                                }catch(e){
                                                    Ext.example.msg('Noticia', 'O boleto para o pagamento esta disponivel');
                                                }                                          
                                            }else{
                                                Ext.example.msg('Erro', 'Falha ao finalizar o carrinho');
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
                        }
                    }
                });
                return false;
            }

            function removerCarrinho(id){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: controllerCarrinho + 'remover',
                    method: 'POST',
                    params: {
                        sq_produto: id
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.example.msg('Acao', 'Camiseta removida do carrinho com sucesso');
                                    var rec = DataGridCarrinho.getSelectionModel().getSelected();
                                    DataGridCarrinho.store.remove(rec);
                                    Ext.getCmp('QtdCarrinho').disable();
                                    Ext.getCmp('btnQtdCarrinho').disable();
                                    Ext.getCmp('btnRemoverCarrinho').disable();
                                    storeCarrinho.load();
                                }else{
                                    Ext.example.msg('Erro', 'Falha ao remover a camiseta do carrinho');
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
            }

            function adicionarCarrinho(id){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: controllerCarrinho + 'adicionar',
                    method: 'POST',
                    params: {
                        // acao: 'adicionar',
                        sq_produto: id
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.example.msg('Acao', 'Camiseta adicionada no carrinho com sucesso');
                                    storeCarrinho.load();
                                }else{
                                    Ext.example.msg('Erro', 'Falha ao adicionar a camiseta ao carrinho');
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
            }

            function alterarQuantidadeCarrinho(){
                var rec = DataGridCarrinho.getSelectionModel().getSelected();
                if (rec && Ext.getCmp('QtdCarrinho').validate()) {
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerCarrinho + 'quantidade',
                        method: 'POST',
                        params: {
                            sq_produto: rec.get('sq_produto'),
                            qt_produto: Ext.getCmp('QtdCarrinho').getValue()
                        },
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
                                        Ext.example.msg('Acao', 'Quantidade alterada com sucesso');
                                        var rec = DataGridCarrinho.getSelectionModel().getSelected();
                                        rec.set('quantidade',Ext.getCmp('QtdCarrinho').getValue());
                                        storeCarrinho.load();
                                    }else{
                                        Ext.example.msg('Erro', 'Falha ao alterar a quantidade');
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
                }
            }

            var tbarCarrinho = new Ext.Toolbar({
                id: 'tbarCarrinho',
                height: 30,
                items:['Quantidade:',new Ext.ux.form.SpinnerField({
                    id: 'QtdCarrinho',
                    width: 50,
                    minValue: 1,
                    maxValue: 100,
                    allowDecimals: false,
                    decimalPrecision: 1,
                    incrementValue: 1,
                    alternateIncrementValue: 1,
                    accelerate: true
                }),{
                    text: 'Confirmar',
                    id: 'btnQtdCarrinho',
                    iconCls: 'silk-add',
                    handler: alterarQuantidadeCarrinho
                },{
                    text: 'Remover',
                    id: 'btnRemoverCarrinho',
                    iconCls: 'silk-delete',
                    handler: function(){
                        var rec = DataGridCarrinho.getSelectionModel().getSelected();
                        if (rec) {
                            removerCarrinho(rec.get('sq_produto'));
                        }
                    }
                }, '-',{
                    text: 'Finalizar o Carrinho',
                    id: 'btnFinalizarCarrinho',
                    iconCls: 'arrow-divide',
                    handler: function(){
                        finalizarCarrinho();
                    }
                },'->',{
                    xtype: 'label',
                    id: 'txTotalCarrinho',
                    iconCls: 'silk-delete',
                    store: storeCarrinho,
                    displayField: 'totalCarrinho',
                    valueField: 'totalCarrinho'
                }]
            });

            var fieldsGridCarrinho =  [
            {
                header: "#",
                width: 15,
                sortable: true,
                dataIndex: 'sq_produto'
            },

            {
                header: "Nome",
                width: 50,
                sortable: true,
                dataIndex: 'nm_produto'
            },
            {
                header: "Cor",
                width: 15,
                sortable: true,
                dataIndex: 'co_produto'
            },
            {
                header: "Descricao",
                width: 90,
                sortable: true,
                dataIndex: 'ds_produto'
            },
            {
                header: "Tamanho",
                width: 30,
                sortable: true,
                dataIndex: 'tm_produto'
            },{
                header: "Valor",
                width: 30,
                sortable: true,
                dataIndex: 'vl_produto'
            },
            {
                header: "Quantidade",
                width: 10,
                dataIndex: 'qt_produto',
                sortable: true,
                editable: true
            }
            ];

            var DataGridCarrinho = new Ext.grid.GridPanel({
                iconCls: 'icon-grid',
                frame: true,
                border: true,
                stripeRows: true,
                loadMask: true,
                columnLines: true,
                store: storeCarrinho,
                listeners:{
                    dblclick:function(){
                        Ext.example.msg('Event', 'Click Duplo');
                        var rec = DataGridCarrinho.getSelectionModel().getSelected();
                        var win = new Ext.Window({
                            resizable: false,
                            iconCls: 'silk-add',
                            layout:'fit',
                            title: rec.get('nm_produto'),
                            width:650,
                            height:650,
                            modal: true,
                            closeAction:'hide',
                            plain: false,
                            items: new Ext.Panel({
                                deferredRender:false,
                                border:false,
                                html: '<img alt="carregando..." width="650" height="604" src="/camisetas/outros/png-1.0/camiseta.php?imagem='+rec.get('hs_produto')+'&cor='+rec.get('co_produto')+'&tamanho=650"/>'
                            }),
                            buttons: []
                        });
                        win.show();
                    }
                },
                sm: new Ext.grid.RowSelectionModel({
                    singleSelect:true,
                    listeners: {
                        selectionchange: function(sel){
                            var rec = sel.getSelected();
                            if(rec){
                                Ext.getCmp('QtdCarrinho').setValue(rec.get('qt_produto'));
                                Ext.getCmp('QtdCarrinho').enable();
                                Ext.getCmp('btnQtdCarrinho').enable();
                                Ext.getCmp('btnRemoverCarrinho').enable();
                            }
                        }
                    }
                }),
                columns : fieldsGridCarrinho,
                tbar: tbarCarrinho,
                viewConfig: {
                    forceFit: true
                },
                bbar: {
                    xtype:'paging',
                    pageSize: 20,
                    store: storeCarrinho,
                    displayInfo: true,
                    plugins: [new Ext.ux.ProgressBarPager({
                        displayMsg     : "<b>{0} &agrave; {1} de {2} camisetas(s)</b>"
                    })]
                }
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
                        Ext.example.msg('Event', 'Click Duplo');

                        var selNode = DataViewCamisetas.getSelectedRecords();
                        var win = new Ext.Window({
                            resizable: false,
                            iconCls: 'silk-add',
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
                                html: '<img alt="carregando..." width="650" height="604" src="/camisetas/outros/png-1.0/camiseta.php?imagem='+selNode[0].data.hs_produto+'&cor='+selNode[0].data.co_produto+'&tamanho=650"/>'
                            }),
                            buttons: []
                        });
                        win.show();
                    },
                    click: function(){
                        try{
                            var selNode = DataViewCamisetas.getSelectedRecords();
                            tplVisualizacao.overwrite(painelVisualizacaoGaleria.body, selNode[0].data);
                            Ext.getCmp('btnAddCarrinho').enable();
                            Ext.getCmp('btnAddFavoritos').enable();
                            Ext.getCmp('btnAddCarrinho').value = selNode[0].data.sq_produto;
                            Ext.getCmp('btnAddFavoritos').value = selNode[0].data.sq_produto;
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
                iconCls: 'silk-add',
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

            var viewPortFavoritos = new Ext.Panel({
                id:'viewPortFavoritos',
                title: 'Favoritos',
                iconCls: 'tabs',
                closable:true,
                closeAction:'hide',
                layout:'hbox',
                layoutConfig: {
                    align : 'stretch',
                    pack  : 'start'
                },
                resizeTabs:false,
                frame: false,
                border: false,
                split: false,
                margins:'0 0 0 0',
                defaults:{
                    autoScroll:true,
                    margins:'0 0 0 0'
                },
                items: [DataViewFavoritos,painelVisualizacaoFavoritos],
                tbar: tbarFavoritos,
                bbar: bbarFavoritos
            });

            var viewPortCarrinho = new Ext.Panel({
                id:'viewPortCarrinho',
                layout: 'fit',
                bodyStyle:'padding:0px 0px 0px 0px',
                title:'Carrinho',
                iconCls:'tabs',
                closable:true,
                closeAction:'hide',
                layoutConfig:{
                    align:'stretch',
                    pack:'start'
                },
                resizeTabs:false,
                frame: false,
                border: false,
                split: false,
                margins:'0 0 0 0',
                defaults:{
                    autoScroll:true,
                    margins:'0 0 0 0'
                },
                items: [DataGridCarrinho/*,painelVisualizacaoCarrinho*/]/*,
                tbar: tbarFavoritos,
                bbar: bbarFavoritos*/
            });

            var removeTab = function (el, tab) {
                Ext.Msg.show({
                    msg: String.format('Voce tem certeza que deseja fechar a aba {0}?', tab.title),
                    buttons: Ext.Msg.YESNO,
                    icon: Ext.Msg.QUESTION,
                    fn: function(btn, text) {
                        if(btn == 'yes') {
                            PainelCentral.un('beforeremove', removeTab);
                            PainelCentral.remove(tab);
                            PainelCentral.on('beforeremove', removeTab);
                        } else {
                    //tab.body.update(String.format('You did not close {0}.', tab.title));
                    }
                    }
                });
                return false;
            };

            var tbarPrincipal = new Ext.ux.StatusBar({
                renderTo:Ext.getBody(),
                defaultText: 'Olá, Visitante.',
                items: [{
                    xtype:'button',
                    text: 'Minha Camiseta',
                    id: 'btnMinhaCamiseta',
                    hidden: true,
                    iconCls: 'silk-table-refresh',
                    handler: function(){

                        var novaAba = PainelCentral.items.find(function(aba){
                            return aba.title === 'Minha Camiseta';
                        });

                        if(!novaAba)
                        {
                            try{
                                var tabMinhaCamiseta = {
                                    title: 'Minha Camiseta',
                                    iconCls: 'tabs',
                                    items:[new Ext.Panel({
                                        margins: '0 0 0 0',
                                        autoScroll: true,
                                        width: '100%',
                                        autoHeight: true,
                                        autoEl: {
                                            tag: 'iframe',
                                            name: 'iMinhaCamiseta',
                                            id: 'iMinhaCamiseta',
                                            frameborder : 0,
                                            src: urlMinhaCamiseta + '?cor=ffffff'
                                        }
                                    })],
                                    closable:true,
                                    closeAction:'hide',
                                    tbar: tbarMinhaCamiseta,
                                    bbar: bbarMinhaCamiseta
                                };

                                novaAba = Ext.getCmp('PainelCentral').add(tabMinhaCamiseta);
                                Ext.getCmp('PainelCentral').activate(novaAba);
                            }catch(e){
                                Ext.example.msg('Erro', '{0}',e);
                            }
                        }
                        PainelCentral.activate(novaAba);


                    }
                },'   ',{
                    xtype:'button',
                    text: 'Boletos',
                    id: 'btnBoletos',
                    hidden: true,
                    iconCls: 'silk-table-refresh',
                    handler: function(){

                        var novaAba = PainelCentral.items.find(function(aba){
                            return aba.title === 'Boletos';
                        });

                        if(!novaAba)
                        {
                            try{
                                var tabBoletos = {
                                    title: 'Boletos',
                                    iconCls: 'tabs',
                                    items:[new Ext.Panel({
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
                                    })],
                                    closable:true,
                                    closeAction:'hide',
                                    tbar: tbarBoletos
                                };

                                novaAba = Ext.getCmp('PainelCentral').add(tabBoletos);
                                Ext.getCmp('PainelCentral').activate(novaAba);
                            }catch(e){
                                Ext.example.msg('Erro', '{0}',e);
                            }
                        }
                        PainelCentral.activate(novaAba);


                    }
                },'   ',{
                    xtype:'button',
                    text: 'Carrinho',
                    id: 'btnCarrinho',
                    hidden: true,
                    iconCls: 'silk-table-refresh',
                    handler: function(){
                        var novaAba = PainelCentral.items.find(function(aba){
                            return aba.title === 'Carrinho';
                        });

                        if(!novaAba)
                        {
                            try{
                                //                                var tabCarrinho = {
                                //                                    title: 'Carrinho',
                                //                                    iconCls: 'tabs',
                                //                                    items:[],
                                //                                    closable:true,
                                //                                    closeAction:'hide',
                                //                                    tbar: [/*tbarBoletos*/]
                                //                                };

                                novaAba = Ext.getCmp('PainelCentral').add(viewPortCarrinho);
                                Ext.getCmp('PainelCentral').activate(novaAba);
                            }catch(e){
                                Ext.example.msg('Erro', '{0}',e);
                            }
                        }
                        PainelCentral.activate(novaAba);

                    }
                },'   ',{
                    xtype:'button',
                    text: 'Favoritos',
                    id: 'btnFavoritos',
                    hidden: true,
                    iconCls: 'silk-table-refresh',
                    handler: function(){
                        var novaAba = PainelCentral.items.find(function(aba){
                            return aba.title === 'Favoritos';
                        });

                        if(!novaAba)
                        {
                            try{
                                //                                var tabFavoritos = {
                                //                                    title: 'Favoritos',
                                //                                    iconCls: 'tabs',
                                //                                    items:[],
                                //                                    closable:true,
                                //                                    closeAction:'hide',
                                //                                    tbar: tbarFavoritos
                                //                                };

                                novaAba = Ext.getCmp('PainelCentral').add(viewPortFavoritos);
                                Ext.getCmp('PainelCentral').activate(novaAba);
                            }catch(e){
                                Ext.example.msg('Erro', '{0}',e);
                            }
                        }
                        PainelCentral.activate(novaAba);
                    }
                },'   ',{
                    xtype:'button',
                    text: 'Perfil',
                    id: 'btnPerfil',
                    hidden: true,
                    iconCls: 'silk-table-refresh',

                    handler: function(){
                        carregarFormAlteracaoCliente();
                        windowAlteracaoCliente.show();
                    }
                },'   ',{
                    xtype:'button',
                    text: 'Sair',
                    id: 'btnSair',
                    hidden: true,
                    iconCls: 'silk-add',
                    handler: function(){
                        Ext.MessageBox.show({
                            title: 'Fechar o Sistema',
                            msg: 'Voce tem certeza que deseja fechar o sistema?',
                            buttons: Ext.MessageBox.YESNOCANCEL,
                            fn: Logoff,
                            icon: Ext.MessageBox.QUESTION
                        })
                    }
                },'   ',{
                    xtype:'button',
                    text: 'Autenticação',
                    id: 'btnAutenticacao',
                    iconCls: 'silk-table-refresh',
                    handler: function(){
                        windowAutenticacao.show();
                        onCapthaChange('boxCaptchaAutenticacao','imgCaptchaAutenticacao');
                    }
                },'   ',{
                    xtype:'button',
                    text: 'Recuperar Senha',
                    id: 'btnRecuperarSenha',
                    iconCls: 'silk-table-refresh',
                    handler: function(){
                        windowRecuperarSenha.show();
                        onCapthaChange('boxCaptchaAutenticacao','imgCaptchaAutenticacao');
                    }
                },'   ',{
                    xtype:'button',
                    text: 'Cadastro',
                    id: 'btnCadastro',
                    iconCls: 'silk-cog',
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
                    //   closable: true,
                    autoScroll:true
                },
                listeners:{
                    beforeremove: removeTab
                },
                //plugins: new Ext.ux.TabCloseMenu(),
                items:[viewPortGaleria]
            });

            //    Ext.getCmp('btnBoletos').hide();
            // Ext.getCmp('btnCarrinho').hide();
            // Ext.getCmp('btnFavoritos').hide();
            // Ext.getCmp('btnPerfil').hide();
            //Ext.getCmp('btnSair').hide();
            Ext.getCmp('btnAddCarrinho').disable();
            Ext.getCmp('btnAddFavoritos').disable();

            Ext.getCmp('salvar_mc').disable();
            Ext.getCmp('recortar_mc').disable();
            Ext.getCmp('restaurar_mc').disable();

            Ext.getCmp('tamanho_mc').disable();
            Ext.getCmp('cor_mc').disable();
            Ext.getCmp('nome_mc').disable();
            Ext.getCmp('descricao_mc').disable();

            Ext.getCmp('QtdCarrinho').disable();
            Ext.getCmp('btnQtdCarrinho').disable();
            Ext.getCmp('btnRemoverCarrinho').disable();

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