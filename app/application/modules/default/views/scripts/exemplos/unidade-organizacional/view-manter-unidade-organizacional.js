/*
 *@function : definir o nome padrao para os objetos criados neste arquivo
 **/
Ext.namespace('Manter.Unid.Organiz');

/*
 *@function : carregar as informacoes necessarias para o funcionamento dos componentes do ExtJs
 **/

var storeAtivo = new Ext.data.ArrayStore({
    fields: ['label', 'value'],
    data : [['true', true],['false', false]]
});

var tb_unid_organiz = {
    'sq_unid_organiz':'sq_unid_organiz',
    'sg_unid_organiz':'sg_unid_organiz'
};

var storeListarUnidadesOrganizacionais = new Ext.data.JsonStore({
    root: 'unidades',
    totalProperty: 'totalCount',
    idProperty: 'sq_unid_organiz',
    remoteSort: true,

    fields: [
    {
        name: 'sq_unid_organiz'
    },
    {
        name: 'sq_unid_tipo'
    },
    {
        name: 'nm_unid_tipo'
    },
    {
        name: 'sg_unid_tipo'
    },
    {
        name: 'sg_uf'
    },
    {
        name: 'nm_uf'
    },
    {
        name: 'sq_municipio'
    },
    {
        name: 'nm_municipio'
    },
    {
        name: 'cd_uorg'
    },
    {
        name: 'sg_unid_organiz'
    },
    {
        name: 'nm_unid_organiz'
    }
    ,
    {
        name: 'nm_unid_organiz_pai'
    }
    ,
    {
        name: 'sq_unid_organiz_pai'
    }
    ,
    {
        name: 'st_ativo',
        type: 'bool'
    }
    ],
    proxy: new Ext.data.HttpProxy({
        url: 'unidade-organizacional/listar-unidades-organizacionais'
    })
});

storeListarUnidadesOrganizacionais.setDefaultSort('sq_unid_organiz', 'asc');
storeListarUnidadesOrganizacionais.load({
    params:{
        start:0,
        limit:20
    }
});

/*
 *@funcao : Carregar Unidades Organizacionais para serem utilizadas no ComboBox
 */

var storeComboUnidadesOrganizacionais = new Ext.data.JsonStore({
    root: 'unidades',
    totalProperty: 'totalCount',
    idProperty: 'sq_unid_organiz',
    remoteSort: true,
    autoDestroy: true,
    fields: [
    {
        name: 'sq_unid_organiz',
        type: 'int'
    },
    {
        name: 'nm_unid_organiz'
    }
    ],
    //  proxy: new Ext.data.ScriptTagProxy({
    proxy: new Ext.data.HttpProxy({
        method: 'post',
        url: 'unidade-organizacional/combo-unid-organiz'	
    })
});

/*
 *@funcao : Carregar os Tipos de Unidade Organizacional utilizados no ComboBox
 */

var storeTiposUnidadesOrganizacionais = new Ext.data.JsonStore({
    root: 'tipos',
    totalProperty: 'totalCount',
    idProperty: 'sq_unid_tipo',
    remoteSort: true,
    autoDestroy: true,
    fields: [
    {
        name: 'sq_unid_tipo',
        type: 'int'
    },
    {
        name: 'nm_unid_tipo'
    }
    ],
    proxy: new Ext.data.HttpProxy({
        method: 'post',
        url: 'unidade-organizacional/combo-tip-unid-organiz' /* controller/action */
    })
});


/*
 *@funcao : Carregar Unidades Organizacionais para serem utilizadas no ComboBox
 */

var storeUfs = new Ext.data.JsonStore({
    idProperty: 'sg_uf',
    remoteSort: false,
    autoDestroy: true,
    fields: [
    {
        name: 'sg_uf',
        type: 'char'
    },
    {
        name: 'nm_uf'
    }
    ],
    proxy: new Ext.data.HttpProxy({
        method: 'post',
        url: 'unidade-organizacional/combo-ufs' /* controller/action */
    })
});

var storeMunicipios = new Ext.data.JsonStore({
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
        url: 'unidade-organizacional/combo-municipios' /* controller/action */
    })
});

Manter.Unid.Organiz.Form = Ext.extend(Ext.form.FormPanel, {
    id: 'formManterUnidOrganiz',
    module: 'default',
    controller: 'unidade-organizacional',
    action: 'view-manter-unidade-organizacional',
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
        blankText: global.L_V_MSG_PREENCHA_CAMPO //'Preencha o campo'
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
        return [
        {
            //fieldLabel: 'Serial',
            disabled: true,
            id: 'sq_unid_organiz',
            xtype: 'numberfield',
            hidden: true,
            allowBlank: false,
            tabIndex: 1
        },
        {
            fieldLabel: label.L_V_I_NOME_UNID, //'Nome da Unidade',
            id: 'nm_unid_organiz',
            tabIndex: 1,
            maxLength: 100
        },
        {
            fieldLabel: label.L_V_I_SIGLA_UNID, //'Sigla da Unidade',
            id: 'sg_unid_organiz',
            minLength: 3,
            maxLength: 10,
            tabIndex: 1
        },
        {
            fieldLabel: label.L_V_I_CDG_UORG, //'Codigo UORG',
            id: 'cd_uorg',
            xtype: 'numberfield',
            allowBlank: true,
            minLength: 0,
            maxLength: 9,
            tabIndex: 1
        },
        {
            fieldLabel: label.L_V_I_UND_SUPERIOR,
            id: 'sq_unid_organiz_pai',
            xtype: 'combo',
            store: storeComboUnidadesOrganizacionais,
            displayField: 'nm_unid_organiz',
            valueField: 'sq_unid_organiz',
            minChars: 5,
            pageSize: 10,
            typeAhead: true,
            forceSelection: true,
            mode: 'remote',
            triggerAction: 'all',
            emptyText: label.L_V_I_SELEC_UNID, //'--- Selecione a Unidade ---',
            selectOnFocus:true,
            tabIndex: 1
        },
        {
            fieldLabel: label.L_V_I_TIPO_UNID, //'Tipo da Unidade',
            id: 'sq_unid_tipo',
            xtype: 'combo',
            store: storeTiposUnidadesOrganizacionais,
            displayField: 'nm_unid_tipo',
            valueField: 'sq_unid_tipo',
            minChars: 5,
            pageSize: 10,
            typeAhead: true,
            forceSelection: true,
            mode: 'remote',
            triggerAction: 'all',
            emptyText:'--- Selecione um Tipo ---',
            selectOnFocus:true,
            tabIndex: 1
        },
        {
            fieldLabel: label.L_V_I_UF,//'UF',
            id: 'sg_uf',
            xtype: 'combo',
            store: storeUfs,
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
            },
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
        },
        {
            fieldLabel: label.L_V_I_MUNICIPIO, //'Municipio',
            id: 'sq_municipio',
            xtype: 'combo',
            store: storeMunicipios,
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
            tabIndex: 1
        },
        {
            fieldLabel: 'Ativo', //'Sigla da Unidade',
            id: 'st_ativo',
            xtype: 'checkbox',
            store: storeAtivo,
            disabled: true,
            displayField: 'label',
            valueField: 'value',
            allowBlank: true,
            tabIndex: 1
        }
        ];
    },
    /**
     * buildUI
     * @private
     */
    buildTbar: function(){
        return [
        '->',
        {
            id: 'btn_novo_unid_organiz',
            text: label.L_V_BTN_NOVO, //'Novo',
            iconCls: 'page-white',
            disabled: true,
            handler: this.onReset,
            scope: this
        },
        '-',
        {
            id: 'btn_salvar_unid_organiz',
            text: label.L_V_BTN_SALVAR, //'Salvar',
            iconCls: 'icon-save',
            value: 'save',
            disabled: true,
            handler: this.onValid,
            scope: this
        },
        '-',
        {
            id: 'btn_excluir_unid_organiz',
            text: label.L_V_BTN_EXCLUIR, //'Excluir',
            iconCls: 'silk-delete',
            value: 'delete',
            disabled: true,
            handler: this.onValid,
            scope: this
        },
        '-',
        {
            id: 'btn_adicionar_unid_organiz',
            text: label.L_V_BTN_ADICIONAR, //'Adicionar',
            iconCls: 'silk-add',
            value: 'add',
            handler: this.onValid,
            scope: this
        },
        '-',
        {
            text: label.L_V_BTN_LIMPAR, //'Reset',
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
                title: label.L_V_BTN_AJUDA,
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
            text: label.L_V_BTN_AJUDA,
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


Manter.Unid.Organiz.Grid = Ext.extend(Ext.grid.EditorGridPanel, {
    initComponent : function() {
        new Ext.grid.GridPanel({
            id: 'gridManterUnidOrganiz',
            autoHeight: true,
            loadMask: true,
            autoWidth: true,
            scroller: false,
            height: 300,
            minSize:100,
            maxSize: 300,
            collapsible: false,
            containerScroll: false,
            useArrows: true,
            autoScroll: true,
            animate: false,
            enableDD: false,
            draggable: false,
            frame: false,
            renderTo: 'PainelPreview',
            store: storeListarUnidadesOrganizacionais,
            border: false,
            colModel: new Ext.grid.ColumnModel({
                defaults: {
                    sortable: true
                },
                columns: [
                {
                    header: 'Status',
                    width: 50,
                    align: 'center',
                    hidden: true,
                    sortable: false
                   
                },
                {
                    header: 'Ativo',
                    width: 50,
                    align: 'center',
                    sortable: false,
                    hidden: true,
                    dataIndex: 'st_ativo'
                    
                },
                {
                    header: '#',
                    width: 30,
                    align: 'center',
                    sortable: true,
                    dataIndex: 'sq_unid_organiz'
                 
                },
                {
                    header: 'Serial Tipo',
                    width: 100,
                    sortable: true,
                    // renderer: Ext.util.Format.usMoney,
                    dataIndex: 'sq_unid_tipo',
                    hidden: true
                },
                {
                    header: 'Tipo',
                    width: 100,
                    sortable: true,
                    // renderer: Ext.util.Format.usMoney,
                    dataIndex: 'nm_unid_tipo'
                },
                {
                    header: 'Uorg',
                    width: 40,
                    sortable: true,
                    dataIndex: 'cd_uorg'
                },
                {
                    header: 'Nome',
                    width: 150,
                    sortable: true,
                    dataIndex: 'nm_unid_organiz'
                },
                {
                    header: 'Sigla',
                    width: 40,
                    sortable: true,
                    dataIndex: 'sg_unid_organiz'
                },
                {
                    header: 'Municipio',
                    width: 100,
                    sortable: true,
                    dataIndex: 'nm_municipio'
                },
                {
                    header: 'Serial Municipio',
                    width: 100,
                    sortable: true,
                    dataIndex: 'sq_municipio',
                    hidden: true
                },
                {
                    header: 'UF',
                    width: 20,
                    sortable: true,
                    dataIndex: 'sg_uf'
                },
                {
                    header: 'Nome Estado',
                    width: 100,
                    sortable: true,
                    dataIndex: 'nm_uf'
                },
                {
                    header: 'Unidade Superior',
                    width: 100,
                    sortable: true,
                    dataIndex: 'nm_unid_organiz_pai'
                },
                {
                    header: 'Sequencial Unidade Superior',
                    width: 100,
                    sortable: true,
                    dataIndex: 'sq_unid_organiz_pai',
                    hidden: true
                }
                ]
            }),
            viewConfig: {
                forceFit: false,
                getRowClass: function(record, index) {

                    if (record.get('st_ativo')===true) {
                        return 'accept';
                    } else {
                        return 'delete';
                    }
                }
            },
            sm: new Ext.grid.RowSelectionModel({
                singleSelect:true,
                listeners: {
                    selectionchange: function(sel){
                        var rec = sel.getSelected();
                        if(rec){
                            //seta os valores internos dos combobox
                            Ext.getCmp('sq_unid_organiz_pai').setValue(rec.get('sq_unid_organiz_pai'));
                            Ext.getCmp('sq_unid_tipo').setValue(rec.get('sq_unid_tipo'));
                            Ext.getCmp('sg_uf').setValue(rec.get('sg_uf'));
                            Ext.getCmp('sq_municipio').setValue(rec.get('sq_municipio'));
                            Ext.getCmp('st_ativo').setValue(rec.get('st_ativo'));

                            //seta os labels dos combobox
                            Ext.getCmp('sq_unid_organiz_pai').setRawValue(rec.get('nm_unid_organiz_pai'));
                            Ext.getCmp('sq_unid_tipo').setRawValue(rec.get('nm_unid_tipo'));
                            Ext.getCmp('sg_uf').setRawValue(rec.get('nm_uf'));
                            Ext.getCmp('sq_municipio').setRawValue(rec.get('nm_municipio'));
                            Ext.getCmp('st_ativo').setRawValue(rec.get('st_ativo'));

                            //seta o valor dos textField
                            Ext.getCmp('sq_unid_organiz').setValue(rec.get('sq_unid_organiz'));
                            Ext.getCmp('cd_uorg').setValue(rec.get('cd_uorg'));
                            Ext.getCmp('nm_unid_organiz').setValue(rec.get('nm_unid_organiz'));
                            Ext.getCmp('sg_unid_organiz').setValue(rec.get('sg_unid_organiz'));

                            //check botoes
                            if(Ext.getCmp('sq_unid_organiz').getValue()){
                                Ext.getCmp('btn_adicionar_unid_organiz').disable();
                                Ext.getCmp('btn_salvar_unid_organiz').enable();
                                Ext.getCmp('btn_excluir_unid_organiz').enable();
                                Ext.getCmp('btn_novo_unid_organiz').enable();
                                Ext.getCmp('st_ativo').enable();
                            }

                            //desabilitar botao excluir quando o registro estiver como st_ativo = false
                            if(rec.get('st_ativo')==false){
                                Ext.getCmp('btn_excluir_unid_organiz').disable();
                            }

                            //desabilitar checkbox st_ativo quando o registro estiver como st_ativo = true
                            if(Ext.getCmp('st_ativo').getValue()==true){
                                Ext.getCmp('st_ativo').disable();
                            }

                            //Exemplo de utilizacao do campo de informacoes
                            Ext.getCmp('information').body.update('Digital: <b><u>' + rec.get('digital') + '</u></b><br /><br />'+
                                'Tipo: <b><u>' + rec.get('tipo') + '</u></b><br /><br />'+
                                'Numero: <b><u>' + rec.get('numero') + '</u></b><br /><br />'+
                                'Assunto: <b><u>' + rec.get('assunto') + '</u></b><br /><br />');
                        }
                    }
                }
            }),
            tbar: [],
            bbar: new Ext.PagingToolbar({

                pageSize: 10,
                store: storeListarUnidadesOrganizacionais,
                //  autoWidth: true,
                //autoHeight: true,
                //  displayInfo: true,
                plugins: new Ext.ux.ProgressBarPager(),
                renderTo: 'sbar' //div global responsavel por renderizar o rodape do layout

            }),

            plugins: [
                
            new Ext.ux.grid.Search({
                  
                //  showSelectAll: false,
                //  searchText:'Pesquisar',
                //  iconCls: 'silk-add',
                //   searchTipText:'Preencha o campo com um argumento valido para o contexto escolhido',
                // selectAllText:'Combinar Todos os Campos',
                //   position:'right',
                //   minCharsTipText:'Informe pelo menos {0} characters',
                width:200
            //   //readonlyIndexes:[],
            /*  disableIndexes:['sq_municipio',
                        'sq_unid_organiz',
                        'sq_unid_tipo',
                        'nm_unid_tipo',
                         'sg_unid_tipo',
                        'sg_uf',
                        'nm_uf',
                        'nm_municipio',
                        'cd_uorg',
                        'sg_unid_organiz',
                        'nm_unid_organiz',
                        'nm_unid_organiz_pai',
                        'sq_unid_organiz_pai',
                        'st_ativo'],
                    // checkIndexes: [],
                    // minChars:5,
                    //  autoFocus:false,
                    // menuStyle:'radio',
                    mode: 'remote'*/
            })
            ]
        });
        
        Manter.Unid.Organiz.Grid.superclass.initComponent.call(this);
    }
});

/*
 *@function : iniciar os objetos do caso de uso Manter Unidade Organizacional
 **/
new Manter.Unid.Organiz.Grid;
new Manter.Unid.Organiz.Form;