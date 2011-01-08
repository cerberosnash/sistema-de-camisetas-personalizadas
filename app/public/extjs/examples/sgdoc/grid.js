var comboUnidades = new Ext.form.ComboBox({
    store: storeUnidades,
    displayField: 'nome',
    typeAhead: true,
    mode: 'local',
    triggerAction: 'all',
    emptyText:'Selecione a Unidade...',
    selectOnFocus:true,
    width:200
});

var testGrid = new Ext.grid.GridPanel({
    store: storeDocumentos,
    //autoLoad: true,
    colModel: new Ext.grid.ColumnModel({
        defaults: {
            // width: 120,
            sortable: true
        },
        columns: [
        {
            id: 'company',
            header: '#',
            width: 60,
            align: 'center',
            sortable: true,
            dataIndex: 'id',
            visibility: true
        },
        {
            header: 'Digital',
            width: 200,
            sortable: true,
            dataIndex: 'digital'
        },

        {
            header: 'Tipo',
            // renderer: Ext.util.Format.usMoney,
            dataIndex: 'tipo'
        },

        {
            header: 'Numero',
            dataIndex: 'numero'
        },

        {
            header: 'Assunto',
            dataIndex: 'assunto'
        },

        // instead of specifying renderer: Ext.util.Format.dateRenderer('m/d/Y') use xtype

        {
            header: 'Data',
            width: 135,
            dataIndex: 'data',
            xtype: 'datecolumn',
            format: 'M d, Y'
        }
        ]
    }),
    viewConfig: {
        forceFit: true,

        //      Return CSS class to apply to rows depending upon data values
        getRowClass: function(record, index) {
            var c = record.get('numero');
            if (c < 0) {
                return 'silk-grid';
            } else if (c > 0 && c <= 1) {
                return 'silk-cog';
            }else if (c > 0) {
                return 'silk-add';
            }
        }
    },
    sm: new Ext.grid.RowSelectionModel({
        singleSelect:false,
        listeners: {
            selectionchange: function(sel){
                var rec = sel.getSelected();
                if(rec){
                    Ext.getCmp('preview').body.update('Digital: <b><u>' + rec.get('digital') + '</u></b><br /><br />'+
                        'Tipo: <b><u>' + rec.get('tipo') + '</u></b><br /><br />'+
                        'Numero: <b><u>' + rec.get('numero') + '</u></b><br /><br />'+
                        'Assunto: <b><u>' + rec.get('assunto') + '</u></b><br /><br />');
                    Ext.getCmp('informacoes').body.update('Digital: <b><u>' + rec.get('digital') + '</u></b><br /><br />'+
                        'Tipo: <b><u>' + rec.get('tipo') + '</u></b><br /><br />'+
                        'Numero: <b><u>' + rec.get('numero') + '</u></b><br /><br />'+
                        'Assunto: <b><u>' + rec.get('assunto') + '</u></b><br /><br />');

                }
            }
        }
    }),
    tbar: new Ext.Toolbar({
        height: 30,
        items: [
        {
            xtype: 'button',
            id: 'basic-button-receber',
            text: 'Receber',
            iconCls: 'silk-page-white-put'
        },'-',
        'Destino: ',
        comboUnidades,
        '-',
        {
            xtype: 'button',
            id: 'basic-button-receber',
            text: 'Tramitar',
            iconCls: 'silk-page-white-go'
        }
        ]
    }),
    bbar: new Ext.PagingToolbar({
        pageSize: 25,
        store: storeDocumentos,
        displayInfo: true,
        plugins: new Ext.ux.ProgressBarPager()
    }),
    frame: true,
    title: 'Listagem',
    iconCls: 'silk-grid'
});