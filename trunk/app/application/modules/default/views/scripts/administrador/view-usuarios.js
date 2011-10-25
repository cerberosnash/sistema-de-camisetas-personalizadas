Ext.namespace('App.Cliente');

App.Cliente.Usuarios = Ext.extend(Ext.form.FormPanel, {
    tbar: null,
    items: null,
    stores: {},
    grids: {},
    columns: {},
    layout: 'fit',
    bodyStyle:'padding:0px 0px 0px 0px',
    layoutConfig:{
        align:'stretch',
        pack:'start'
    },
    resizeTabs:false,
    frame: false,
    border: false,
    split: false,
    margins:'0px 0px 0px 0px',
    defaults:{
        autoScroll:true,
        margins:'0px 0px 0px 0px'
    },
    buildColumns: function(){
        this.columns.usuarios =  [
        {
            header: "#",
            width: 15,
            sortable: true,
            dataIndex: 'sq_usuario'
        },
        {
            header: "Nome",
            sortable: true,
            dataIndex: 'nm_usuario'
        },
        {
            header: "Perfil",
            sortable: true,
            dataIndex: 'sq_perfil',
            renderer: function (val, meta, record, rowIndex, colIndex, store) {
                switch (val) {
                    case 1:
                        return 'Cliente';
                        break;
                    case 2:
                        return 'Pagamento';
                        break;
                    case 3:
                        return 'Confeccao';
                        break;
                    case 4:
                        return 'Despache';
                        break;
                    case 5:
                        return 'Administrador';
                        break;
                    default:
                        return 'Desconhecido'
                        break;
                }
            }
        },
        {
            header: "Ativo",
            width: 90,
            sortable: true,
            dataIndex: 'st_ativo',
            renderer: function (val, meta, record, rowIndex, colIndex, store) {
                switch (val) {
                    case true:
                        return 'Sim';
                        break;
                    case false:
                        return 'Nao';
                        break;
                   
                }
            }
           
        }]
    },
    buildStores: function(){
        this.stores.usuarios = new Ext.data.JsonStore({
            id: 'storeUsuarios',
            root: 'usuarios',
            totalProperty: 'totalCount',
            idProperty: 'sq_usuario',
            remoteSort: true,
            autoDestroy: true,
            baseParams:{
                start:0,
                limit:20,
                dir: 'asc'
            },
            fields: ['sq_usuario','nm_usuario','sq_perfil','st_ativo'],
            proxy: new Ext.data.HttpProxy({
                method: 'post',
                url: controllerAdministrador + 'carregar-usuarios'
            })
        });

        this.stores.usuarios.setDefaultSort('sq_usuario', 'asc');
        this.stores.usuarios.load();
    },
    buildGrids: function(){
        this.grids.usuarios = new Ext.grid.GridPanel({
            id: 'dataGridUsuarios',
            iconCls: 'icon-grid',
            stripeRows: true,
            margins: '0px 0px 0px 0px',
            loadMask: true,
            columnLines: true,
            store: this.stores.usuarios,
            listeners:{
                dblclick:function(){
                    var rec = Ext.getCmp('dataGridUsuarios').getSelectionModel().getSelected();
                    carregarFormAlteracaoUsuario(rec.get('sq_usuario'));
                    windowAlteracaoUsuario.show();
                }
            },
            sm: new Ext.grid.RowSelectionModel({
                singleSelect:true,
                listeners: {
                    selectionchange: function(sel){
                        var rec = sel.getSelected();
                        if(rec){
                            
                    }
                    }
                }
            }),
            columns : this.columns.usuarios,
            tbar: this.tbar,
            viewConfig: {
                forceFit: true
            },
            bbar: {
                xtype:'paging',
                pageSize: 20,
                store: this.stores.usuarios,
                displayInfo: true,
                plugins: [new Ext.ux.ProgressBarPager({
                    displayMsg     : "<b>{0} &agrave; {1} de {2} camisetas(s)</b>"
                })]
            }
        });
    },
    cadastrarNovoProfissional: function(){
        windowNovoProfissional.show();
    },
    buildItems: function(){
        this.items = new Ext.Panel({
            layout: 'fit',
            frame: true,
            border: true,
            bodyStyle:'padding:0px 0px 0px 0px',
            items: [this.grids.usuarios]
        });
    },
    buildTbar: function(){
        this.tbar = new Ext.Toolbar({
            id: 'tbarUsuarios',
            height: 30,
            items:[{
                text: 'Adicionar Novo Profissional',
                id: 'btnNovoUsuario',
                iconCls: 'user-add',
                handler: this.cadastrarNovoProfissional
            }]
        });
    },
    initComponent : function() {
 
        this.buildStores();
        this.buildColumns();
        this.buildGrids();
        this.buildItems();
        this.buildTbar();
           
        App.Cliente.Usuarios.superclass.initComponent.call(this);
    }
});


new App.Cliente.Usuarios;