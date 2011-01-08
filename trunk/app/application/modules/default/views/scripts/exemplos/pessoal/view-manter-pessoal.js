Ext.namespace('Manter.Unid.Organiz');

var sexo = [
['F', 'Feminino'],
['M', 'Masculino']
];
    
var  estadoCivil = [
['1', 'Solteiro'],
['2', 'Casado']
];


Manter.Unid.Organiz.Form = Ext.extend(Ext.form.FormPanel, {


    id: 'formManterUnidOrganiz',
    module: 'default',
    controller: 'pessoal',
    action: 'view-manter-pessoal',
    border: false,
    frame: false,
    scope: this,

    destroy: function(){
        Ext.fly(this.id).remove();
        Ext.getCmp('gridManterUnidOrganiz').destroy();
        Ext.getCmp('information').body.update();
    },

    bodyStyle:'padding:15px 15px 15px 15px',
    defaultType: 'textfield',
    defaults: {
        width: 300,
        selectOnFocus: true,
        allowBlank: false,
        blankText: 'Preencha o campo'//global.L_V_MSG_PREENCHA_CAMPO //'Preencha o campo'
    },
    // private A pointer to the currently loaded record
    record : null,
    help: null,
    /**
     * initComponent
     * @protected
     */
    initComponent : function() {
        this.items = this.buildForm();
        this.help = this.buildHelp();
        this.tbar = this.buildTbar();
        this.bbar = this.buildBbar();
        this.addEvents({
            /**
             * @event create
             * Fires when user clicks [create] button
             * @param {FormPanel} this
             * @param {Object} values, the Form's values object
             */
            create : true
        });

        // super
        Manter.Unid.Organiz.Form.superclass.initComponent.call(this);
    },

    /**
     * buildform
     * @private
     */
    buildForm : function() {
        return [{
            xtype:'fieldset',
            title: 'Dados Pessoais',
            collapsible: true,
            autoHeight:true,
            autoWidth:true,
            border: true,
            defaultType: 'textfield',
            defaults : {
                width: 350
            },

            items: [
            {
                disabled: true,
                id: 'sq_pessoa',
                xtype: 'numberfield',
                hidden: true,
                allowBlank: false,
                tabIndex: 1
            },
            {
                fieldLabel: '*Nome',
                id: 'nm_pessoa',
                tabIndex: 1,
                maxLength: 100
            },
            {
                xtype: 'textfield',
                fieldLabel: '*CPF',
                id: 'nu_cpf',
                minLength: 11,
                maxLength: 11,
                width: 120

            },
            {
                xtype: 'datefield',
                fieldLabel: '*Nascimento',
                id: 'dt_nascimento',
                allowBlank: true,
                width: 120,
                minLength: 0,
                maxLength: 10,
                tabIndex: 1
            

            },
            {
                fieldLabel: 'E-mail',
                id: 'tx_email',
                tabIndex: 1,
                maxLength: 100
            },
            {
                fieldLabel: '*Nome do Mae',
                id: 'nm_mae',
                tabIndex: 1,
                maxLength: 100
            },
            {
                fieldLabel: 'Nome do Pai',
                id: 'nm_pai',
                tabIndex: 1,
                maxLength: 100
            },
            {
                fieldLabel : '*Sexo',
                xtype : 'combo',
                editable : false,
                store: sexo,
                selectOnFocus:true,
                width: 150,
                tabIndex: 1

            },{
                fieldLabel: 'Estado Civil',
                xtype: 'combo',
                editable: false,
                store: estadoCivil,
                selectOnFocus:true,
                width: 150,
                tabIndex: 1
            },{
                fieldLabel : 'N Curriculo Lattes',
                xtype: 'numberfield',
                allowBlank: true,
                width: 150
            }]
        },{
            xtype:'fieldset',
            title: 'Dados Documentais',
            collapsible: true,
            autoHeight:true,
            autoWidth: true,
            // border: false,
            defaultType: 'textfield',
            items: [
            {
                fieldLabel: '*Tipo',
                id: 'nm_tipo',
                tabIndex: 1,
                maxLength: 200,
                selectOnFocus:true,
                allowBlank: true
            },
            {
                fieldLabel: '*Numero',
                id: 'ds_numero_documento',
                tabIndex: 1,
                maxLength: 100,
                selectOnFocus:true,
                allowBlank: true
            }, {
                xtype: 'datefield',
                fieldLabel: 'Data Emissao',
                id: 'dt_emissao',
                tabIndex: 1,
                width: 120,
                selectOnFocus:true,
                allowBlank: true
            },{
                fieldLabel: 'Orgao Emissor',
                id: 'ds-orgao_emissor',
                tabIndex: 1,
                maxLength: 100,
                selectOnFocus:true,
                allowBlank: true
            }, {
                xtype: 'datefield',
                fieldLabel: 'Validade',
                id: 'dt_validade',
                tabIndex: 1,
                width: 120,
                selectOnFocus:true,
                allowBlank: true
            }, {
                fieldLabel: '*UF',
                xtype: 'combo',
                editable: false,
                store: estadoCivil,
                selectOnFocus:true,
                width: 50,
                tabIndex: 1
            },{
                fieldLabel: '*Pais',
                xtype: 'combo',
                editable: false,
                store: estadoCivil,
                selectOnFocus:true,
                width: 200,
                tabIndex: 1
            }]
        }, {
            xtype:'fieldset',
            title: 'Endereco',
            collapsible: true,
            autoHeight:true,
            autoWidth: true,
            defaultType: 'textfield',
            items: [          
            {
                fieldLabel: '*Logradouro',
                id: 'nm_logradouro',
                tabIndex: 1,
                maxLength: 200,
                allowBlank: true,
                selectOnFocus:true
            },
            {
                fieldLabel: 'Municipio',
                id: 'sq_municipio',
                xtype: 'combo',
                // store: storeMunicipios,
                displayField: 'nm_municipio',
                valueField: 'sq_municipio',
                minChars: 5,
                editable: true, // usar no combo de UFs
                typeAhead: true,
                forceSelection: true,
                mode: 'local',
                triggerAction: 'all',
                emptyText:'--- Selecione um Municipio ---',
                selectOnFocus:true,
                tabIndex: 1,
                width: 300
            }, {
                fieldLabel: '*CEP',
                id: 'nu_cep',
                tabIndex: 1,
                maxLength: 120,
                allowBlank: true,
                selectOnFocus:true
            },{
                fieldLabel: '*Complemento',
                id: 'ds_complemento',
                tabIndex: 1,
                maxLength: 300,
                allowBlank: true,
                selectOnFocus:true
            },{
                fieldLabel: '*Bairro',
                id: 'nm_bairro',
                tabIndex: 1,
                maxLength: 200,
                allowBlank: true,
                selectOnFocus:true
            },{
                fieldLabel: '*UF',
                id: 'sg_uf',
                xtype: 'combo',
                /*   store: storeUfs,
                listeners:{
                    select:{
                        fn:function(combo, value){
                            Ext.getCmp('sq_municipio').clearValue();
                            Ext.getCmp('sq_municipio').enable();
                            storeMunicipios.load({
                                params: {
                                    query: combo.getValue()
                                }
                            });
                        }
                    }
                },*/
                displayField: 'nm_uf',
                valueField: 'sg_uf',
                editable: false, // usar no combo de UFs
                typeAhead: true,
                forceSelection: true,
                mode: 'remote',
                triggerAction: 'all',
                emptyText:'--- Selecione um Estado ---',
                selectOnFocus:true,
                tabIndex: 1
            }
            ]
        }];
    },

    buildTbar: function(){
        return [
        '->',
        {
            id: 'btn_novo_unid_organiz',
            text: 'Novo',
            iconCls: 'page-white',
            disabled: true,
            handler: this.onReset,
            scope: this
        },
        '-',
        {
            id: 'btn_salvar_unid_organiz',
            text: 'Salvar',
            iconCls: 'icon-save',
            value: 'save',
            disabled: true,
            handler: this.onValid,
            scope: this
        },
        '-',
        {
            id: 'btn_excluir_unid_organiz',
            text: 'Excluir',
            iconCls: 'silk-delete',
            value: 'delete',
            disabled: true,
            handler: this.onValid,
            scope: this
        },
        '-',
        {
            id: 'btn_adicionar_unid_organiz',
            text: 'Adicionar',
            iconCls: 'silk-add',
            value: 'add',
            handler: this.onValid,
            scope: this
        },
        '-',
        {
            text: 'Reset',
            iconCls: 'erase',
            handler: this.onReset,
            scope: this
        }
        ];
    },
    buildHelpShow: function(){
        try{
            this.help.show();
        }catch(e){
            alert(e);
        }
    },
    buildHelp: function(){
        try{
            return new Ext.Window({
                layout:'fit',
                width:500,
                height:300,
                scroller: true,
                closeAction:'hide',
                plain: true,
                modal: false,
                maximizable: true,
                minimizable: false,
                draggable: true,
                resizable: false,
                items: new Ext.Panel({
                    border:false,
                    autoLoad:{
                        method: 'post',
                        url: 'help/help',
                        params: {
                            modulo: this.module,
                            controlador : this.controller,
                            acao: this.action
                        },
                        scripts: false
                    }
                }),
                defaults:{
                    closable: true,
                    autoScroll:true
                },
                iconCls: 'silk-add',
                title: 'Ajuda',
                frame: true,
                bodyStyle: ''
            });
        }catch(e){
            alert(e);
        }

    },

    /**
     * buildUI
     * @private
     */
    buildBbar: function(){
        return ['->',{
            buttonAlign: 'right',
            iconCls: 'information',
            text: 'Ajuda',
            handler: function(){
                this.buildHelpShow();
            },
            scope: this
        }];
    },

    /**
     * onReset
     */
    onReset : function() {
        this.getForm().reset();
        this.onCheckButtons();
    // this.fireEvent('update', this, this.getForm().getValues());

    },

    onValid : function(btn) {

        if (!this.getForm().isValid()) {
            Ext.example.msg(global.L_V_T_CAMPO_BRANCO, global.L_V_MSG_PREENC_OBG);//('Campos em branco', 'Preencha os Obrigatorios');
        }else{
            switch(btn.value){
                case 'add':
                    Ext.MessageBox.confirm(global.L_V_T_CONFIRMAR, global.L_V_MSG_CONF_ADD_UNID, function(btn){
                        if(btn=='yes'){
                            this.onSubmit(btn.value,'unidade-organizacional/adicionar-unid-organiz');
                        }
                    }, this);
                    break;

                case 'delete':
                    Ext.MessageBox.confirm(global.L_V_T_CONFIRMAR, global.L_V_MSG_CONF_DEL_UNID, function(btn){
                        if(btn=='yes'){
                            this.onSubmit(btn.value,'unidade-organizacional/excluir-unid-organiz');
                        }
                    }, this);
                    break;

                case 'save':
                    Ext.MessageBox.confirm(global.L_V_T_CONFIRMAR, global.L_V_MSG_CONF_ALT_UNID, function(btn){
                        if(btn=='yes'){
                            this.onSubmit(btn.value,'unidade-organizacional/salvar-unid-organiz');
                        }
                    }, this);
                    break;

                default:
                    alert('Esta acao nao esta autorizado neste momento!');
                    break;
            }
        }
    },
    onCheckButtons: function(){
        //observa se existe serial
        try{
            if(Ext.getCmp('sq_unid_organiz').getValue()){
                Ext.getCmp('btn_adicionar_unid_organiz').disable();
                Ext.getCmp('btn_salvar_unid_organiz').enable();
                Ext.getCmp('btn_excluir_unid_organiz').enable();
            }else{
                Ext.getCmp('btn_adicionar_unid_organiz').enable();
                Ext.getCmp('btn_salvar_unid_organiz').disable();
                Ext.getCmp('btn_excluir_unid_organiz').disable();
                Ext.getCmp('btn_novo_unid_organiz').disable();
                Ext.getCmp('st_ativo').disable();
            }
        }catch(e){
            alert(e);
        }

    },
    /*
     *@private
     *@param : <string> url da action para o processamento dos dados do formulario
     *@return : <string>
     **/
    onSubmit : function(action,url){

        try{
            Ext.MessageBox.show({
                msg: global.L_V_T_AGUARDE + ', ' + global.L_V_T_SALVANDO,
                progressText: global.L_V_T_SALVANDO, //'Salvando...',
                width:300,
                wait:true,
                waitConfig: {
                    interval:50
                },
                icon:'customized-save-32'
            });

            var campos = {
                sq_unid_organiz :     Ext.util.Format.trim(Ext.getCmp('sq_unid_organiz').getValue()),
                cd_uorg :             Ext.util.Format.trim(Ext.getCmp('cd_uorg').getValue()),
                sq_unid_organiz_pai :     Ext.util.Format.trim(Ext.getCmp('sq_unid_organiz_pai').getValue()),
                sq_unid_tipo :        Ext.util.Format.trim(Ext.getCmp('sq_unid_tipo').getValue()),
                sq_municipio :        Ext.util.Format.trim(Ext.getCmp('sq_municipio').getValue()),
                sg_unid_organiz :     Ext.util.Format.trim(Ext.getCmp('sg_unid_organiz').getValue()),
                nm_unid_organiz : Ext.util.Format.trim(Ext.getCmp('nm_unid_organiz').getValue()),
                st_ativo :            Ext.util.Format.trim(Ext.getCmp('st_ativo').getValue())
            };

            var conn = new Ext.data.Connection();

            conn.request({
                url: url,
                method: 'post',
                params: campos,
                success: function(responseObject) {
                    if(responseObject.responseText){

                        try{
                            var response =  eval(responseObject.responseText);
                            Ext.MessageBox.show({
                                success: response.success,
                                title: response.title,
                                msg: response.msg,
                                buttons: Ext.MessageBox.OK,
                                icon: response.icon
                            });

                            if(response.success === true){

                                if(response.action == 'save'){
                                    storeListarUnidadesOrganizacionais.load({
                                        params:{
                                            start:0,
                                            limit:25,
                                            sort: 'sq_unid_organiz',
                                            dir: 'DESC'
                                        }
                                    });
                                }

                                if(response.action=='add'){
                                    Ext.getCmp('nm_unid_organiz').setValue();
                                    Ext.getCmp('sg_unid_organiz').setValue();
                                    Ext.getCmp('cd_uorg').setValue();
                                    Ext.getCmp('sq_unid_organiz').setValue();
                                    Ext.getCmp('sq_unid_organiz_pai').clearValue();
                                    // Ext.getCmp('sq_unid_organiz_pai').setValue()
                                    Ext.getCmp('sq_unid_tipo').clearValue();
                                    //Ext.getCmp('sq_unid_tipo').setValue();
                                    Ext.getCmp('sg_uf').clearValue();
                                    //Ext.getCmp('sg_uf').setValue();
                                    Ext.getCmp('sq_municipio').clearValue();
                                    // Ext.getCmp('sq_municipio').setValue();


                                    storeListarUnidadesOrganizacionais.load({
                                        params:{
                                            start:0,
                                            limit:25,
                                            sort: 'sq_unid_organiz',
                                            dir: 'DESC'
                                        }
                                    });
                                }

                                if(response.action=='delete'){

                                    Ext.getCmp('cd_uorg').setValue();
                                    Ext.getCmp('sq_unid_organiz').setValue();
                                    Ext.getCmp('sq_unid_organiz_pai').clearValue();
                                    Ext.getCmp('sq_unid_tipo').clearValue();
                                    Ext.getCmp('sg_uf').clearValue();
                                    Ext.getCmp('sq_municipio').clearValue();
                                    Ext.getCmp('sg_unid_organiz').setValue();
                                    Ext.getCmp('nm_unid_organiz').setValue();

                                    storeListarUnidadesOrganizacionais.load({
                                        params:{
                                            start:0,
                                            limit:25,
                                            sort: 'sq_unid_organiz',
                                            dir: 'DESC'
                                        }
                                    });
                                }


                            }

                        }catch(e){
                            Ext.MessageBox.show({

                                success: response.success,
                                title: global.L_V_MSG_ERROR, //'Ocorreu um Erro',
                                msg: e + responseObject.responseText + "teste do try",
                                buttons: Ext.MessageBox.OK,
                                icon: Ext.MessageBox.ERROR
                            });
                        }
                    }

                },
                failure: function(e) {
                    Ext.MessageBox.show({
                        title: global.L_V_MSG_ERROR, //'Ocorreu um Erro',
                        msg: e,
                        buttons: Ext.MessageBox.OK,
                        icon: Ext.MessageBox.ERROR
                    });
                }
            });

        }catch(e){
            Ext.MessageBox.show({
                title: global.L_V_MSG_ERROR, //'Ocorreu um Erro',
                msg: e,
                buttons: Ext.MessageBox.OK,
                icon: Ext.MessageBox.ERROR
            });
        }
    }
},{

});

new Manter.Unid.Organiz.Form;