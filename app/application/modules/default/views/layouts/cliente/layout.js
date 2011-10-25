//Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
Ext.form.Field.prototype.msgTarget = 'side';
Ext.namespace('App.Default.Layout.Cliente');
Ext.QuickTips.init();

try{
             
    App.Default.Layout.Cliente = Ext.extend(Ext.util.Observable,{

        constructor: function(){

            var controllerCliente = '/camisetas/cliente/';
            var controllerIndex = '/camisetas/';
            var controllerUtil = "/camisetas/util/";
            var controllerPedidos = "/camisetas/pedidos/";
            var controllerGaleria = '/camisetas/galeria/';
            var controllerCarrinho = '/camisetas/carrinho/';
            var controllerProdutos = '/camisetas/produtos/';
            var controllerLogoff = '/camisetas/logoff/';
            var controllerFavoritos = '/camisetas/favoritos/';
                  
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
            
            var storePosicoesCamisetas = new Ext.data.ArrayStore({
                fields: ['mValor', 'vValor'],
                data : [
                ['Frente', 'false'],
                ['Atras', 'true']
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
                fields: ['sq_produto','nm_produto','co_produto','ds_produto','tm_produto','hs_produto','fg_verso',{
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
                fields: ['sq_produto','nm_produto',/*'co_produto',*/'ds_produto','tm_produto','qt_produto', 'hs_produto',{
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
                }else{
                    Ext.getCmp('btnCarrinho').disable();
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
                fields: ['sq_produto','nm_produto','co_produto','ds_produto','tm_produto','hs_produto','fg_verso',{
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
                    window.location = controllerLogoff;
                }
                if(btn=='ok'){
                    window.location = controllerLogoff;
                }
            }

            function PaginaInicial(btn){
                if(btn=='ok'){
                    window.location = controllerIndex;
                }
            }
 
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

            function carregarFormAlteracaoCliente(){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: controllerCliente + 'carregar',
                    method: 'POST',
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.getCmp('acNome').setValue(data.cliente.nm_usuario);
                                    Ext.getCmp('acCPF').setValue(data.cliente.nu_cpf);
                                    Ext.getCmp('acDDResidencial').setValue(data.cliente.dd_residencial);
                                    Ext.getCmp('acNUResidencial').setValue(data.cliente.nu_residencial);
                                    Ext.getCmp('acDDCelular').setValue(data.cliente.dd_celular);
                                    Ext.getCmp('acNUCelular').setValue(data.cliente.nu_celular);
                                    Ext.getCmp('acUF').setValue(data.cliente.sq_uf);
                                    Ext.getCmp('acMunicipio').setValue(data.cliente.sq_municipio);
                                    Ext.getCmp('acCEP').setValue(data.cliente.nu_cep);
                                    Ext.getCmp('acEndereco').setValue(data.cliente.tx_endereco);
                                    Ext.getCmp('acEmail').setValue(data.cliente.tx_email);
                                    Ext.getCmp('acSenha').setValue(data.cliente.tx_senha);

                                    Ext.getCmp('acUF').setRawValue(data.cliente.nm_uf);
                                    Ext.getCmp('acMunicipio').setRawValue(data.cliente.nm_municipio);
                                }else{
                                    Ext.example.msg('Erro', 'Falha ao tentar carregar as informacoes do usuario!');
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
            }

          
            var formAlteracaoCliente =  new Ext.form.FormPanel({
                id: 'formAlteracaoCliente',
                frame:false,
                border: true,
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
                        name: 'Nome',
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
                        name: 'CPF',
                        id: 'acCPF',
                        vtype: 'cpf'
                    },{
                        xtype: 'compositefield',
                        fieldLabel: 'Tel. Residencial',
                        name: 'Tel. Residencial',
                        defaults:{
                            msgTarget: 'side',
                            allowBlank: false,
                            height: 25
                        },
                        items: [{
                            xtype: 'textfield',
                            name: 'DDD Residencial',
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
                            name: 'Tel. Residencial',
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
                            name: 'DDD Celular',
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
                            name: 'Tel. Celular',
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
                        name: 'Estado',
                        id: 'acUF',
                        store: storeEstados,
                        listeners:{
                            select:{
                                fn:function(combo){
                                    Ext.getCmp('acMunicipio').clearValue();
                                    Ext.getCmp('acMunicipio').enable();
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
                        name: 'CEP',
                        vtype: 'cep',
                        autoCreate: {
                            tag: 'input',
                            type: 'text',
                            maxlength: '9'
                        }
                    },{
                        fieldLabel: 'Endereço',
                        name: 'Endereço',
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
                        name: 'Email',
                        id: 'acEmail',
                        vtype: 'email'
                    },{
                        xtype: 'textfield',
                        fieldLabel: 'Senha',
                        name: 'Senha',
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
                        name: 'Email Configuração',
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
                        name: 'Senha Configuração',
                        id: 'acVDSenha',
                        inputType: 'password',
                        idFieldCompare:  'acSenha',
                        vtype: 'comparefield',
                        autoCreate: {
                            tag: 'input',
                            type: 'password',
                            maxlength: '100'
                        }
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
                    iconCls: 'disk',
                    handler: function(){
                        onSubmitSalvarAlteracaoCliente();
                    }
                }
                ]
            });


            function onSubmitSalvarAlteracaoCliente(){
                if(formAlteracaoCliente.form.isValid()===true){
                    try{
                        var conn = new Ext.data.Connection();
                        var data = null;
                        conn.request({
                            url: controllerCliente + 'alterar',
                            method: 'POST',
                            params: {
                                nm_usuario : Ext.getCmp('acNome').getValue(),
                                nu_cpf : Ext.getCmp('acCPF').getValue(),
                                dd_residencial : Ext.getCmp('acDDResidencial').getValue(),
                                nu_residencial : Ext.getCmp('acNUResidencial').getValue(),
                                dd_celular : Ext.getCmp('acDDCelular').getValue(),
                                nu_celular : Ext.getCmp('acNUCelular').getValue(),
                                sq_uf : Ext.getCmp('acUF').getValue(),
                                sq_municipio : Ext.getCmp('acMunicipio').getValue(),
                                nu_cep : Ext.getCmp('acCEP').getValue(),
                                tx_endereco : Ext.getCmp('acEndereco').getValue(),
                                tx_email : Ext.getCmp('acEmail').getValue(),
                                tx_senha : Ext.getCmp('acSenha').getValue()
                            },
                            success: function(responseObject) {
                                if(responseObject.responseText){
                                    try{
                                        data = eval(responseObject.responseText);
                                        if(data.success===true){
                                            windowAlteracaoCliente.hide();
                                            Ext.MessageBox.show({
                                                title: 'Perfil',
                                                msg: 'Alterações salvas com sucesso!\n\rObs: As alterações entraram em vigor após o Logoff!',
                                                buttons: Ext.MessageBox.OK,
                                                fn: Logoff,
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
                                Ext.example.msg('Erro', '{0}dd',e);
                            }
                        });
                    }catch(e){
                        Ext.example.msg('Erro', '{0}',e);
                    }
                }else{
                    Ext.example.msg('Erro', 'Falha na Alteração do Perfil!');
                }
            }

            var windowAlteracaoCliente = new Ext.Window({
                id: 'windowAlteracaoCliente',
                resizable: false,
                iconCls: 'vcard-edit',
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
                '<img alt="carregando..." width="300" height="279" src="'+controllerProdutos+'renderizar/?imagem={hs_produto}&cor={co_produto}&tamanho=300&verso={fg_verso}"/>',
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
                //                '<b>Data Criacao: </b>',
                //                '<span>{dt_produto}</span>',
                //                '<b>Vendidas: </b>',
                //                '<span>{nu_vendidos} Unidades</span>',
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
                    iconCls: 'cart-add',
                    scope:this,
                    handler: adicionarCarrinho
                },{
                    text: 'Adicionar nos Favoritos',
                    id: 'btnAddFavoritos',
                    width: 160,
                    iconCls: 'heart-add',
                    scope: this,
                    handler: adicionarFavoritos
                }]
            });

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
                tpl: tplVisualizacao,
                bbar: bbarAdicionar
            });

          
            var tplCamisetas = new Ext.XTemplate(
                '<ul>',
                '<tpl for=".">',
                '<li class="camiseta">',
                '<img src="'+controllerProdutos+'renderizar/?imagem={hs_produto}&cor={co_produto}&tamanho=200&verso={fg_verso}" />',
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
                storeFavoritos.load();
            }

            function validarValoresCamisetas(){
                if(parseFloat(Ext.getCmp('preco_min').getValue()) > parseFloat(Ext.getCmp('preco_max').getValue())){
                /**
                     *Debugger
                     *Ext.example.msg('Atenção', 'O preço maximo ({0}) nao pode ser menor que o preco minimo ({1})!',Ext.getCmp('preco_max').getValue() , Ext.getCmp('preco_min').getValue());
                     */
                }else{
                    AtualizarDataViewCamisetas();
                }
            }

            function validarValoresFavoritos(){
                if(parseFloat(Ext.getCmp('fr_preco_min').getValue()) > parseFloat(Ext.getCmp('fr_preco_max').getValue())){
                /**
                     *Debugegr
                     *Ext.example.msg('Atenção', 'O preço maximo ({0}) nao pode ser menor que o preco minimo ({1})!',Ext.getCmp('fr_preco_max').getValue() , Ext.getCmp('fr_preco_min').getValue());
                     */
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
                             */
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
                         */
                        AtualizarDataViewCamisetas();
                    }
                }]
            });

                      
            function adicionarFavoritos(botao){
                if(botao.value){
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerFavoritos + 'adicionar',
                        method: 'POST',
                        params: {
                            sq_produto: botao.value
                        },
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
                                        Ext.example.msg('Acao', 'Favorito adicionado com sucesso');
                                        storeFavoritos.load();
                                        try{
                                            Ext.getCmp('DataViewFavoritos').store.load();
                                        }catch(e){}   
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
            
            function adicionarCarrinho(botao){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: controllerCarrinho + 'adicionar',
                    method: 'POST',
                    params: {
                        sq_produto: botao.value
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.example.msg('Acao', 'Camiseta adicionada no carrinho com sucesso');
                                    storeCarrinho.load();
                                    try{
                                        Ext.getCmp('dataGridCarrinho').store.load();
                                    }catch(e){}
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
                                html: '<img alt="carregando..." width="650" height="604" src="'+controllerProdutos+'renderizar/?imagem='+selNode[0].data.hs_produto+'&cor='+selNode[0].data.co_produto+'&tamanho=650'+'&verso='+selNode[0].data.fg_verso+'"/>'
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
                    }
                    }
                });
                return false;
            };

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
                    beforeremove: removeTab
                },
                items:[viewPortGaleria]
            });


            function requestNewTab(botao){

                var controller = botao.controller;
                var action = botao.action;
                var titulo = botao.text;
                var icon = botao.iconCls;
                var conn = new Ext.data.Connection();
                var novaAba = PainelCentral.items.find(function(aba){
                    return aba.action === action;
                });
                
                if(novaAba==null){
                    conn.request({
                        url: controller+'/'+action,
                        method: 'POST',
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                if(!novaAba)                            {
                                    try{
                                        var aba =  eval(responseObject.responseText);
                                        aba.iconCls = icon;
                                        aba.title = titulo;
                                        aba.controller = controller;
                                        aba.action = action;
                                        aba.closable = true;
                                        aba.closeAction = 'hide';                                                  
                                        novaAba = Ext.getCmp('PainelCentral').add(aba);
                                        Ext.getCmp('PainelCentral').activate(novaAba);
                                    }catch(e){
                                        Ext.example.msg('Error', '{0}',e);
                                    }
                                }
                            }
                        },
                        failure: function() {
                        /**
                             *Debugger
                             *Ext.example.msg('Error', 'MSG-TExt-Response-Error:');
                             **/
                        }
                    });
                }
                PainelCentral.activate(novaAba);
            }

            var tbarPrincipal = new Ext.ux.StatusBar({
                id: 'tbarPrincipal',
                renderTo:Ext.getBody(),
                items: [{
                    xtype: 'button',
                    id: 'btnBoletos',
                    text: 'Boletos',
                    iconCls: 'money',
                    action: 'view-boletos',
                    controller: 'cliente',
                    scope: this,
                    handler: requestNewTab
                },{
                    xtype:'button',
                    text: 'Criar Camiseta',
                    id: 'btnMinhaCamiseta',
                    iconCls: 'picture-edit',
                    action: 'view-minha-camiseta',
                    controller: 'cliente',
                    scope: this,
                    handler: requestNewTab
                },
                {
                    xtype:'button',
                    text: 'Carrinho',
                    id: 'btnCarrinho',
                    iconCls: 'cart',
                    action: 'view-carrinho',
                    controller: 'cliente',
                    scope: this,
                    handler: requestNewTab
                },'   ',{
                    xtype:'button',
                    text: 'Favoritos',
                    id: 'btnFavoritos',
                    iconCls: 'heart',
                    action: 'view-favoritos',
                    controller: 'cliente',
                    scope: this,
                    handler: requestNewTab
                },'   ',{
                    xtype:'button',
                    text: 'Perfil',
                    id: 'btnPerfil',
                    iconCls: 'vcard-edit',

                    handler: function(){
                        carregarFormAlteracaoCliente();
                        windowAlteracaoCliente.show();
                    }
                },'   ',{
                    xtype:'button',
                    text: 'Sair',
                    id: 'btnSair',
                    hidden: true,
                    iconCls: 'decline',
                    handler: function(){
                        Ext.MessageBox.show({
                            title: 'Fechar o Sistema',
                            msg: 'Voce tem certeza que deseja fechar o sistema?',
                            buttons: Ext.MessageBox.YESNOCANCEL,
                            fn: Logoff,
                            icon: Ext.MessageBox.QUESTION
                        })
                    }
                },]
            });

            /*Recuperar no do usuario logado*/
            var nomeUsuarioLogado = function(){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: controllerCliente + 'carregar-usuario-logado',
                    method: 'POST',
                    params: {
                        campo : 'nm_usuario'
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.getCmp('tbarPrincipal').setText('Olá, '+data.campo+'. (Cliente)');
                                }else{
                                    Ext.getCmp('tbarPrincipal').setText('Olá, Seja bem vindo.');
                                }
                            }catch(e){
                                Ext.example.msg('Erro', '{0}',e);
                                Ext.getCmp('tbarPrincipal').setText('Olá, Seja bem vindo.');
                            }
                        }
                    },
                    failure: function(e) {
                        Ext.example.msg('Erro', '{0}',e);
                        Ext.getCmp('tbarPrincipal').setText('Olá, Seja bem vindo.');
                    }
                });
            }

            nomeUsuarioLogado();

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

            Ext.getCmp('btnAddCarrinho').disable();
            Ext.getCmp('btnAddFavoritos').disable();

            App.Default.Layout.Cliente.superclass.constructor.apply(this,arguments);
        }
    });

}catch(e){
    Ext.example.msg('Erro', '{0}',e);
}