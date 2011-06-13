//Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
Ext.form.Field.prototype.msgTarget = 'side';
Ext.namespace('App.Default.Layout.Administrador');
Ext.QuickTips.init();

try{
             
    App.Default.Layout.Administrador = Ext.extend(Ext.util.Observable,{

        constructor: function(){

            var controllerAdministrador = '/camisetas/administrador/';
            var controllerIndex = '/camisetas/';
            var controllerUtil = "/camisetas/util/";
            var controllerGaleria = '/camisetas/galeria/';
            var controllerProdutos = '/camisetas/produtos/';
            var controllerLogoff = '/camisetas/logoff/';
                         
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

            var storeRelatorios = new Ext.data.ArrayStore({
                fields: ['mValor', 'vValor'],
                data : [
                ['Relatorio de Camisetas Vendidas', '1'],
                ['Relatorio de Producao Individual', '2'],
                ['Relatorio de Pedidos Pagos', '3'],
                ['Relatorio de Pedidos Cancelados', '4'],
                ['Relatorio de Pedidos Enviados', '5'],
                ['Relatorio de Atividades', '6']
                ]
            });

            var storePerfis = new Ext.data.ArrayStore({
                fields: ['mValor', 'vValor'],
                data : [
                ['Cliente', '1'],
                ['Pagamento', '2'],
                ['Confeccao', '3'],
                ['Despache', '4'],
                ['Administrador', '5']
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

            function carregarFormAlteracaoUsuario(sq_usuario){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: controllerAdministrador + 'carregar-usuario',
                    method: 'POST',
                    params:{
                        sq_usuario:sq_usuario
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.getCmp('acID').setValue(sq_usuario)
                                    Ext.getCmp('acNome').setValue(data.usuario.nm_usuario);
                                    Ext.getCmp('acCPF').setValue(data.usuario.nu_cpf);
                                    Ext.getCmp('acDDResidencial').setValue(data.usuario.dd_residencial);
                                    Ext.getCmp('acNUResidencial').setValue(data.usuario.nu_residencial);
                                    Ext.getCmp('acDDCelular').setValue(data.usuario.dd_celular);
                                    Ext.getCmp('acNUCelular').setValue(data.usuario.nu_celular);
                                    Ext.getCmp('acUF').setValue(data.usuario.sq_uf);
                                    Ext.getCmp('acMunicipio').setValue(data.usuario.sq_municipio);
                                    Ext.getCmp('acCEP').setValue(data.usuario.nu_cep);
                                    Ext.getCmp('acEndereco').setValue(data.usuario.tx_endereco);
                                    Ext.getCmp('acEmail').setValue(data.usuario.tx_email);
                                    Ext.getCmp('acSenha').setValue(data.usuario.tx_senha);
                                    Ext.getCmp('acUF').setRawValue(data.usuario.nm_uf);
                                    Ext.getCmp('acMunicipio').setRawValue(data.usuario.nm_municipio);
                                    Ext.getCmp('acAtivo').setValue(data.usuario.st_ativo);
                                    Ext.getCmp('acPerfil').setValue(data.usuario.sq_perfil);
                                }else{
                                    Ext.example.msg('Erro', 'Falha ao tentar carregar as informacoes do usuario!');
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

            var formRelatorios =  new Ext.form.FormPanel({
                id: 'formRelatorios',
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
                    title: 'Informacoes do Relatorio',
                    items: [{
                        defaults:{
                            msgTarget: 'side',
                            allowBlank: false,
                            height: 25
                        },
                        fieldLabel: 'Tipo de Relatorio',
                        name: 'Tipo',
                        id: 'tipoRelatorio',
                        xtype: 'combo',
                        store: storeRelatorios,
                        displayField:'mValor',
                        valueField: 'vValor',
                        typeAhead: true,
                        mode: 'local',
                        value: '1',
                        editable: false,
                        forceSelection: true,
                        triggerAction: 'all'
                    },{
                        xtype: 'compositefield',
                        fieldLabel: 'Periodo',
                        name: 'Periodo',
                        defaults:{
                            msgTarget: 'side',
                            allowBlank: false,
                            height: 25
                        },
                        items: [{
                            xtype: 'datefield',
                            format: 'd-M-Y',
                            fieldLabel: 'Inicio',
                            id: 'inicioRelatorio',
                            name: 'inicioRelatorio',
                            width:160,
                            vtype: 'daterange',
                            endDateField: 'finalRelatorio'
                        },{
                            xtype: 'datefield',
                            format: 'd-M-Y',
                            fieldLabel: 'Final',
                            id: 'finalRelatorio',
                            name: 'finalRelatorio',
                            width:155,
                            vtype: 'daterange',
                            startDateField: 'inicioRelatorio'
                        }]
                    }]
                }
                ],
                buttons: [
                {
                    xtype: 'button',
                    bodyStyle:'padding:10px 10px 10px 10px',
                    text: 'Gerar Relatorio',
                    id: 'btnGerarRelatorio',
                    type: 'submit',
                    iconCls: 'report',
                    handler: function(){
                        if(Ext.getCmp('inicioRelatorio').isValid() && Ext.getCmp('finalRelatorio').isValid()){
                            window.open('/camisetas/relatorios/gerar/opcao/'+Ext.getCmp('tipoRelatorio').getValue()+'/dt_inicio/'+Ext.getCmp('inicioRelatorio').getValue().format('Y-m-d')+'/dt_final/'+Ext.getCmp('finalRelatorio').getValue().format('Y-m-d'));
                        }
                    }
                }
                ]
            });

            var formAlteracaoUsuario =  new Ext.form.FormPanel({
                id: 'formAlteracaoUsuario',
                frame:false,
                border: true,
                title: '',
                width: 500,
                height: 500,
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
                        fieldLabel: 'ID',
                        name: 'ID',
                        id: 'acID',
                        autoCreate: {
                            tag: 'input',
                            type: 'text',
                            disabled: 'disabled'
                        }
                    },{
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
                    title: 'Perfil',
                    defaults:{
                        width: 320,
                        msgTarget: 'side',
                        allowBlank: false,
                        maxLength: 100,
                        minLength: 6
                    },
                    items: [{
                        id:'acPerfil',
                        xtype: 'combo',
                        store: storePerfis,
                        fieldLabel: 'Tipo',
                        displayField:'mValor',
                        valueField: 'vValor',
                        typeAhead: true,
                        mode: 'local',
                        editable: false,
                        forceSelection: true,
                        triggerAction: 'all',
                        width: 100,
                        selectOnFocus:true,
                        listeners: {
                            select: function(a){
                                if(a.getValue()>1){
                                    Ext.example.msg('Atencao', 'Verifique se voce nao esta atribuindo um perfil do BACKEND a um cliente!');
                                }
                            }
                        }
                    },{
                        xtype: 'checkbox',
                        fieldLabel: 'Ativo',
                        name: 'Ativo',
                        id: 'acAtivo'
                    }]
                } ],
                buttons: [
                {
                    xtype: 'button',
                    bodyStyle:'padding:10px 10px 10px 10px',
                    text: 'Salvar',
                    id: 'acSalvarAlteracaoUsuario',
                    type: 'submit',
                    iconCls: 'disk',
                    handler: function(){
                        onSubmitSalvarAlteracaoUsuario();
                    }
                }
                ]
            });

            function onSubmitSalvarAlteracaoUsuario(){
                if(formAlteracaoUsuario.form.isValid()===true){
                    try{
                        var conn = new Ext.data.Connection();
                        var data = null;
                        conn.request({
                            url: controllerAdministrador + 'alterar-usuario',
                            method: 'POST',
                            params: {
                                sq_usuario : Ext.getCmp('acID').getValue(),
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
                                tx_senha : Ext.getCmp('acSenha').getValue(),
                                st_ativo : Ext.getCmp('acAtivo').getValue(),
                                sq_perfil : Ext.getCmp('acPerfil').getValue()
                            },
                            success: function(responseObject) {
                                if(responseObject.responseText){
                                    try{
                                        data = eval(responseObject.responseText);
                                        if(data.success===true){
                                            windowAlteracaoUsuario.hide();
                                            Ext.MessageBox.show({
                                                title: 'Perfil',
                                                msg: 'As informacoes do usuario foram alteradas com sucesso!',
                                                buttons: Ext.MessageBox.OK,
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
                    Ext.example.msg('Erro', 'Falha na alteração do perfil do usuario!');
                }
            }

            var windowRelatorios = new Ext.Window({
                id: 'windowRelatorios',
                resizable: false,
                iconCls: 'vcard-edit',
                layout:'fit',
                title: 'Relatorios',
                width:520,
                height: 180,
                modal: true,
                closeAction:'hide',
                plain: false,
                items: [formRelatorios]
            });

            var windowAlteracaoUsuario = new Ext.Window({
                id: 'windowAlteracaoUsuario',
                resizable: false,
                iconCls: 'vcard-edit',
                layout:'fit',
                title: 'Informacoes do Usuario',
                width:502,
                height: 600,
                modal: true,
                onHide : function(){
                    formAlteracaoUsuario.form.reset();
                },
                closeAction:'hide',
                plain: false,
                items: [formAlteracaoUsuario]
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
                '</div>',
                '</tpl>',
                '</div>'
                );

            var bbarAdicionar = new Ext.Panel({
                id: 'bbarAdicionar',
                layout: 'hbox',
                buttonAlign: 'center',
                buttons:[{
                    text: 'Remover Camiseta da Galeria',
                    id: 'btnDelCamiseta',
                    width: 320,
                    iconCls: 'delete',
                    scope: this,
                    handler: removerCamiseta
                }]
            });

            var painelVisualizacaoGaleria = new Ext.Panel({
                title: 'Visualizacao',
                iconCls:'application-home',
                frame: true,
                width: 350,
                html: '<img alt="carregando..." width="300" height="279" src="/camisetas/public/img/default.png"/>\n\
    <span>[Selecione uma camiseta para remove-la da galeria de camisetas]</span>',
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
                try{
                    storeFavoritos.load();
                }catch(e){
                    
                }
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
                }
                else{
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
                        iconCls: 'folder-explore'
                                   
                    },
                    fieldLabel: 'Imagem'
                               
                                
                }],
                buttons: []
            });
            
            var validarRecorte = function(){
                var conn = new Ext.data.Connection();
                var data = null;
                conn.request({
                    url: controllerProdutos + 'validar',
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
            
            var tbarCriarCamiseta = new Ext.Toolbar({
                id: 'tbarCriarCamiseta',
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
                            validarSalvarCriarCamiseta();
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
                            validarSalvarCriarCamiseta();
                            Ext.example.msg('Cor Selecionada', 'Codigo {0}', a.getValue());
                            var conn = new Ext.data.Connection();
                            var data = null;
                            conn.request({
                                url: controllerProdutos + 'colorir',
                                method: 'POST',
                                params: {
                                    cor: Ext.getCmp('cor_mc').getValue()
                                },
                                success: function(responseObject) {
                                    if(responseObject.responseText){
                                        try{
                                            data = eval(responseObject.responseText);
                                            if(data.success===true){
                                                Ext.example.msg('Processamento', 'Success {0} Cor {1}' ,data.success, data.cor );
                                                Ext.get('iCriarCamiseta').dom.src = controllerProdutos + 'mostrar/?t=' + new Date().getTime();
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
                            validarSalvarCriarCamiseta();
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
                            validarSalvarCriarCamiseta();
                        }
                    }
                },formUpload,{
                    xtype: 'hidden',
                    id: 'recorte',
                    width: 60
                }]
            });
                        
            
            function validarSalvarCriarCamiseta(){
                if(Ext.getCmp('recorte').getValue() && Ext.getCmp('tamanho_mc').getValue() && Ext.getCmp('cor_mc').getValue() && Ext.getCmp('nome_mc').getValue() && Ext.getCmp('descricao_mc').getValue()){
                    Ext.getCmp('salvar_mc').enable();
                }else{
                    Ext.getCmp('salvar_mc').disable();
                }
            }
          
            /*movido para view-minha-camiseta.js*/
            var bbarCriarCamiseta = new Ext.Toolbar({
                height: 30,
                items:['->',{
                    xtype: 'button',
                    text: 'Enviar',
                    id: 'enviar_mc',
                    iconCls: 'silk-add',
                    handler: function(){
                        if(formUpload.getForm().isValid()){
                            formUpload.getForm().submit({
                                url: controllerProdutos + 'upload',
                                waitMsg: 'Enviando imagem...',
                                titleMsg: 'Aguarde',
                                textMsg: 'Aguarde',
                                success: function(){
                                    Ext.get('iCriarCamiseta').dom.src = controllerProdutos;
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
                            animEl: 'iCriarCamiseta'
                        });
            
                        Ext.example.msg('Acao', 'Recortando...');
                        Ext.getCmp('recortar_mc').disable();
            
                        document.getElementById("iCriarCamiseta").contentWindow.recortar();
                        setTimeout(function(){
                            validarRecorte();
                            Ext.get('iCriarCamiseta').dom.src = controllerProdutos + 'aguarde';
                        }, 2000);
            
                        setTimeout(function(){
                            validarSalvarCriarCamiseta();
                            Ext.MessageBox.hide();
                            Ext.getCmp('recortar_mc').disable();
                            Ext.getCmp('restaurar_mc').enable();
                            Ext.get('iCriarCamiseta').dom.src = controllerProdutos + 'mostrar/?t=' + new Date().getTime()+Math.random(0,9999);
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
                        Ext.get('iCriarCamiseta').dom.src = controllerProdutos;
                        Ext.getCmp('recortar_mc').enable();
                        Ext.getCmp('restaurar_mc').disable();
                        Ext.getCmp('recorte').setValue('');
                        validarSalvarCriarCamiseta();
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
                            url: controllerAdministrador + 'criar-camiseta',
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
                                            Ext.get('iCriarCamiseta').dom.src = controllerProdutos + '?t=' + new Date().getTime()+Math.random(0,9999);
            
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
          
            function removerCamiseta(botao){
                if(botao.value){
                    var conn = new Ext.data.Connection();
                    var data = null;
                    conn.request({
                        url: controllerAdministrador + 'remover-camiseta',
                        method: 'POST',
                        params: {
                            sq_produto: botao.value
                        },
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true){
                                        Ext.example.msg('Acao', 'Camiseta removida com sucesso');
                                        storeCamisetas.load();
                                        try{
                                            Ext.getCmp('DataViewCamisetas').store.load();
                                        }catch(e){}
                                    }else{
                                        Ext.example.msg('Erro', 'Falha ao tentar remover a camiseta da galeria');
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
                            Ext.getCmp('btnDelCamiseta').enable();
                            Ext.getCmp('btnDelCamiseta').value = selNode[0].data.sq_produto;
                        }
                        catch(e){
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
                            Ext.example.msg('Error', 'MSG-TExt-Response-Error:');
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
                    id: 'btnRelatorios',
                    text: 'Relatorios',
                    iconCls: 'report',
                    action: 'view-boletos',
                    controller: 'cliente',
                    scope: this,
                    handler: function(){
                        windowRelatorios.show();
                    }
                },{
                    xtype:'button',
                    text: 'Nova Camiseta',
                    id: 'btnCriarCamiseta',
                    iconCls: 'picture-edit',
                    action: 'view-criar-camiseta',
                    controller: 'administrador',
                    scope: this,
                    handler: requestNewTab
                },
                {
                    xtype:'button',
                    text: 'Usuarios',
                    id: 'btnUsuarios',
                    iconCls: 'user',
                    action: 'view-usuarios',
                    controller: 'administrador',
                    scope: this,
                    handler: requestNewTab
                },
                {
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
                    url: controllerAdministrador + 'carregar-usuario-logado',
                    method: 'POST',
                    params: {
                        campo : 'nm_usuario'
                    },
                    success: function(responseObject) {
                        if(responseObject.responseText){
                            try{
                                data = eval(responseObject.responseText);
                                if(data.success===true){
                                    Ext.getCmp('tbarPrincipal').setText('Olá, '+data.campo+'. (Administrador)');
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

            /*function dateRangeFunc(){
                // Date picker
                var fromdate = new Ext.form.DateField({
                    format: 'Y-M-d', //YYYY-MMM-DD
                    fieldLabel: '',
                    id: 'startdt',
                    name: 'startdt',
                    width:140,
                    allowBlank:false,
                    vtype: 'daterange',
                    endDateField: 'enddt'// id of the 'To' date field
                });

                var todate = new Ext.form.DateField({
                    format: 'Y-M-d', //YYYY-MMM-DD
                    fieldLabel: '',
                    id: 'enddt',
                    name: 'enddt',
                    width:140,
                    allowBlank:false,
                    vtype: 'daterange',
                    startDateField: 'startdt'// id of the 'From' date field
                });

                fromdate.render('fromdate');
                todate.render('todate');
            }*/


            nomeUsuarioLogado();

            // dateRangeFunc();

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

            Ext.getCmp('btnDelCamiseta').disable();

            App.Default.Layout.Administrador.superclass.constructor.apply(this,arguments);
        }
    });

}catch(e){
    Ext.example.msg('Erro', '{0}',e);
}