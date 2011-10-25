Ext.namespace('App.Cliente');

App.Cliente.CriarCamiseta = Ext.extend(Ext.form.FormPanel, {
    tbar: null,
    bbar: null,
    items: null,
    stores: {},
    formUpload: null,
    buildStores: function(){
       
    },
    buildForm: function(){
        this.formUpload = new Ext.FormPanel({
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
            icon: Ext.MessageBox.INFO,
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
        })
    },
    buildItems: function(){
        this.items = new Ext.Panel({
            margins: '0 0 0 0',
            autoScroll: true,
            width: '100%',
            autoHeight: true,
            autoEl: {
                tag: 'iframe',
                name: 'iCriarCamiseta',
                id: 'iCriarCamiseta',
                frameborder : 0,
                src: controllerProdutos + 'renderizar/?cor=ffffff'
            }
        });
    },
    buildBbar: function(formUpload){
        this.bbar = new Ext.Toolbar({
            height: 30,
            items:['->',{
                xtype: 'button',
                text: 'Fazer upload da imagem',
                id: 'enviar_mc',
                iconCls: 'folder-up',
                handler: function(){
                    try{
                        if(formUpload.getForm().isValid()){
                            formUpload.getForm().submit({
                                url: controllerProdutos + 'upload',
                                waitMsg: 'Enviando imagem...',
                                titleMsg: 'Aguarde',
                                textMsg: 'Aguarde',
                                success: function(){
                                    Ext.get('iCriarCamiseta').dom.src = controllerProdutos;
                                    Ext.getCmp('recortar_mc').enable();
                                    Ext.getCmp('tamanho_mc').enable();
                                    Ext.getCmp('cor_mc').enable();
                                    Ext.getCmp('nome_mc').enable();
                                    Ext.getCmp('descricao_mc').enable();
                                    Ext.getCmp('posicao_mc').enable();
                                    Ext.getCmp('valor_mc').enable();
                                },
                                failure: function(){
                                    Ext.MessageBox.show({
                                        title: 'Erro',
                                        msg: 'Imagem corrompida ou no formato invalido!',
                                        width:300,
                                        buttons: Ext.MessageBox.OK,
                                        icon: Ext.MessageBox.ERROR,
                                        animEl: 'enviar_mc'
                                    });
                                }
                            });
                        } 
                    }catch(e){
                        alert(e);
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
                        icon: Ext.MessageBox.INFO,
                        animEl: 'iCriarCamiseta'
                    });
                    /**
 *Debugger
 *Ext.example.msg('Acao', 'Recortando...');
 */
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
                            ds_produto: Ext.getCmp('descricao_mc').getValue(),
                            fg_verso: Ext.getCmp('posicao_mc').getValue(),
                            vl_produto: Ext.getCmp('valor_mc').getValue()
                        },
                        success: function(responseObject) {
                            if(responseObject.responseText){
                                try{
                                    data = eval(responseObject.responseText);
                                    if(data.success===true && data.id){
                                        /**
                                         *Debugger
                                         *Ext.example.msg('Salvando', 'Camiseta {0} salva com sucesso',data.id);
                                         *Ext.example.msg('Noticia', 'A Camiseta {0} agora estara nos seus favoritos',data.id);
                                         **/
                                        
                                        AtualizarDataViewFavoritos();
                                        Ext.get('iCriarCamiseta').dom.src = controllerProdutos + 'renderizar/?t=' + new Date().getTime()+Math.random(0,9999);

                                        Ext.getCmp('salvar_mc').disable();
                                        Ext.getCmp('restaurar_mc').disable();
                                        Ext.getCmp('recortar_mc').disable();

                                        Ext.getCmp('cor_mc').setValue('');
                                        Ext.getCmp('tamanho_mc').setValue('');
                                        Ext.getCmp('nome_mc').setValue('');
                                        Ext.getCmp('descricao_mc').setValue('');
                                        Ext.getCmp('posicao_mc').setValue('');
                                        Ext.getCmp('valor_mc').setValue('');

                                        Ext.getCmp('cor_mc').disable();
                                        Ext.getCmp('tamanho_mc').disable();
                                        Ext.getCmp('nome_mc').disable();
                                        Ext.getCmp('descricao_mc').disable();
                                        Ext.getCmp('posicao_mc').disable();
                                        Ext.getCmp('valor_mc').disable();

                                        Ext.getCmp('formUpload').form.reset();

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
    },
    resetarForm: function(){
        
        Ext.getCmp('salvar_mc').disable();
        Ext.getCmp('restaurar_mc').disable();
        Ext.getCmp('recortar_mc').disable();
        Ext.getCmp('cor_mc').disable();
        Ext.getCmp('tamanho_mc').disable();
        Ext.getCmp('nome_mc').disable();
        Ext.getCmp('descricao_mc').disable();
        Ext.getCmp('posicao_mc').disable();
        Ext.getCmp('valor_mc').disable();

    },
    buildTbar: function(){
        this.tbar = new Ext.Toolbar({
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
                        /**
                         *Debugger
                         * Ext.example.msg('Tamanho Selecionada', 'Codigo {0}', a.getValue());
                         **/
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
                        /**
                         *Debugger
                         *Ext.example.msg('Cor Selecionada', 'Codigo {0}', a.getValue());
                         **/
                        var conn = new Ext.data.Connection();
                        var data = null;
                        conn.request({
                            url: controllerProdutos + 'colorir',
                            method: 'POST',
                            params: {
                                cor: Ext.getCmp('cor_mc').getValue(),
                                posicao: Ext.getCmp('posicao_mc').getValue()
                            },
                            success: function(responseObject) {
                                if(responseObject.responseText){
                                    try{
                                        data = eval(responseObject.responseText);
                                        if(data.success===true){
                                            /**
                                             *Debugger
                                             *Ext.example.msg('Processamento', 'Success {0} Cor {1}' ,data.success, data.cor );
                                             **/
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
            },'Posicao:',
            {
                xtype: 'combo',
                id: 'posicao_mc',
                anchor: '100%',
                store: storePosicoesCamisetas,
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
                        validarSalvarCriarCamiseta();
                        /**
                         *Debugger
                         *Ext.example.msg('Posicao Selecionada', 'Codigo {0}', a.getValue());
                         **/
                        var conn = new Ext.data.Connection();
                        var data = null;
                        conn.request({
                            url: controllerProdutos + 'colorir',
                            method: 'POST',
                            params: {
                                cor: Ext.getCmp('cor_mc').getValue(),
                                posicao: Ext.getCmp('posicao_mc').getValue()
                            },
                            success: function(responseObject) {
                                if(responseObject.responseText){
                                    try{
                                        data = eval(responseObject.responseText);
                                        if(data.success===true){
                                            /**
                                             *Debugger
                                             *Ext.example.msg('Processamento', 'Success {0} Posicao (Verso) {1}' ,data.success, data.posicao );
                                             **/
                                            Ext.get('iCriarCamiseta').dom.src = controllerProdutos + 'mostrar/?t=' + new Date().getTime();
                                        }else{
                                            Ext.example.msg('Erro', 'Falha ao processar a camiseta!');
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
            },'Preço:',
            {
                id: 'valor_mc',
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
                    }
                }

            },this.formUpload,{
                xtype: 'hidden',
                id: 'recorte',
                width: 60
            }]
        });
    },
    initComponent : function() {
        //this.buildItems();
        //this.buildStores();
        this.buildItems();
        this.buildForm();
        this.buildBbar(this.formUpload);
        this.buildTbar();
        this.resetarForm();

        App.Cliente.CriarCamiseta.superclass.initComponent.call(this);
    }
});

function validarSalvarCriarCamiseta(){
    if(Ext.getCmp('recorte').getValue() && Ext.getCmp('tamanho_mc').getValue() && Ext.getCmp('cor_mc').getValue() && Ext.getCmp('nome_mc').getValue() && Ext.getCmp('descricao_mc').getValue() && Ext.getCmp('posicao_mc').getValue()&& Ext.getCmp('valor_mc').getValue()){
        Ext.getCmp('salvar_mc').enable();
    }else{
        Ext.getCmp('salvar_mc').disable();
    }
}     
     
function validarRecorte(){
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

new App.Cliente.CriarCamiseta;