var storeDocumentos = new Ext.data.JsonStore({
    root: 'documentos',
    totalProperty: 'totalCount',
    idProperty: 'id',
    remoteSort: false,

    fields: [
    'digital',
    {
        name: 'numero'//,
    //   type: 'int'
    },

    {
        name: 'tipo'//,
    //mapping: 'tipo',
    // type: 'date',
    // dateFormat: 'timestamp'
    },
    'assunto'
    ],

    // load using script tags for cross domain, if the data in on the same domain as
    // this page, an HttpProxy would be better
    proxy: new Ext.data.ScriptTagProxy({
        url: 'https://www3.icmbio.gov.br/sgdoc/protocolo/json/documentos.php'
     //   url: 'http://192.168.15.128/sgdoc/protocolo/json/documentos.php'
    })
});

storeDocumentos.setDefaultSort('digital', 'desc');
storeDocumentos.load({
    params:{
        start:0,
        limit:25
    }
});




var storeUnidades = new Ext.data.JsonStore({
    root: 'unidades',
    totalProperty: 'totalCount',
    idProperty: 'id',
    remoteSort: true,

    fields: [
    {
        name: 'sigla'//,
    //   type: 'int'
    },

    {
        name: 'nome'//,
    //mapping: 'tipo',
    // type: 'date',
    // dateFormat: 'timestamp'
    }
    ],

    // load using script tags for cross domain, if the data in on the same domain as
    // this page, an HttpProxy would be better
    proxy: new Ext.data.ScriptTagProxy({
        url: 'https://www3.icmbio.gov.br/sgdoc/protocolo/json/unidades.php'
        //url: 'http://192.168.15.128/sgdoc/protocolo/json/unidades.php'
    })
});

storeUnidades.setDefaultSort('sigla', 'desc');
storeUnidades.load({
    params:{
        start:0,
        limit:1000
    }
});