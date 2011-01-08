function onClickButtonExit(){
    Ext.MessageBox.show({
        title: global.L_V_T_FECHAR_SISTEMA, //'Fechar o Sistema',
        msg: 'Michael Fernandes Rodrigues' + '. ' + 'Você tem certeza que deseja fechar o sistema?',
        buttons: Ext.MessageBox.YESNOCANCEL,
        fn: showResult,
        // animEl: 'mb4',
        icon: Ext.MessageBox.QUESTION
    });

    function showResult(btn){
        if(btn=='yes'){
            Ext.example.msg('Aguarde...', 'Fechando o sistema!');
            window.location = 'logoff';
        }
    }


//Ext.example.msg('Aguarde...', 'Fechando o sistema!');
// window.location = 'logoff/';
}


function onClickButtonChangeUnidade(item){
    // Ext.example.msg('Aguarde...', 'Logando na Unidade {0} SQ_UNIDADE {1}!',item.text,item.unidade);
    var conn = new Ext.data.Connection();
    conn.request({
        url: 'login'+'/'+'login',
        method: 'POST',
        params: {
            sq_estrutura: item.unidade
        },
        success: function(responseObject) {

            if(responseObject.responseText){
                // Ext.example.msg('Aguarde...', 'Response:{0}',responseObject.responseText);

                try{
                    var resultado =  eval(responseObject.responseText);
                    //Ext.example.msg('Aguarde...', 'Response:{0}',resultado.message);

                   
                    
                    if(resultado.success){
                        //Ext.example.msg('Aguarde...', '{0}',resultado.message);
                      //  alert(responseObject.responseText);
                        
                        Ext.MessageBox.show({
                            title: resultado.title,
                            msg: resultado.message,
                            progressText: resultado.progressText,
                            width:300,
                            progress:true,
                            closable:false
                        });

                        // this hideous block creates the bogus progress
                        var f = function(v){
                            return function(){
                                if(v == 12){
                                    Ext.MessageBox.hide();
                                  //  Ext.example.msg('Done', 'Your fake items were loaded!');
                                    window.location.reload();

                                }else{
                                    var i = v/11;
                                    Ext.MessageBox.updateProgress(i, Math.round(100*i)+'%');
                                }
                            };
                        };
                        for(var i = 1; i < 13; i++){
                            setTimeout(f(i), i*100);
                        }
                        
                    //window.location = redirect;
                    }else{
                        Ext.example.msg('Aguarde', '{0}',resultado.message);
                    // window.location.reload();
                    }

                }catch(e){
                    //  if(e=='SyntaxError: syntax error'){
                    Ext.example.msg('Error', '{0}' ,e);
                   //
                //   Ext.example.msg('Done', 'Your fake items were loaded!');
                //  }
                }
              
            }
        },
        failure: function() {
            Ext.example.msg('Aguarde', '{0}', e);
        }
    });
}


function onClickButtonChangePreferencias(item){

    var conn = new Ext.data.Connection();
    var url = 'perfil-config/language';

    if (item.value == "gray" || item.value =="olive" || item.value == "blue"
        || item.value == "violet"|| item.value == "black" || item.value == "slickness") {
        url = 'perfil-config/theme';
    }
    conn.request({
        url: url,
        method: 'POST',
        params: {
            param : item.value
        },
        success: function(responseObject) {
            if(responseObject.responseText){
                try{
                    var resultado =  eval(responseObject.responseText);
                    if(resultado.success){
                        Ext.MessageBox.show({
                            title: 'Aguarde',
                            msg: eval(resultado.msg),
                            progressText: eval(resultado.progressText),
                            width:300,
                            progress:true,
                            closable:false
                        });
                        var f = function(v){
                            return function(){
                                if(v == 12){
                                    Ext.MessageBox.hide();
                                    window.location.reload();
                                }else{
                                    var i = v/11;
                                    Ext.MessageBox.updateProgress(i, Math.round(100*i)+'%');
                                }
                            };
                        };
                        for(var i = 1; i < 13; i++){
                            setTimeout(f(i), i*100);
                        }
                    }else if(resultado.success==false){
                        Ext.example.msg('Aguarde', '{0}',resultado.message);
                    }
                }catch(e){
                    Ext.example.msg('Aguarde', '{0}', e);
                }
            }
        }
    });
}