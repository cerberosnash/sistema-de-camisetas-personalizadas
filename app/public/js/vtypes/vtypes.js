// ******** TEXTFIELD COM FORMATAÇÃO DE MOEDA ***************
//Ext.ux.MoneyField = function(config){
//    var defConfig = {
//        autocomplete: 'off',
//        allowNegative: true,
//        format: 'BRL',
//        currency: 'R$',
//        showCurrency: false
//    };
//    Ext.applyIf(config,defConfig);
//    Ext.ux.MoneyField.superclass.constructor.call(this, config);
//};
//
//Ext.extend(Ext.ux.MoneyField, Ext.form.TextField,{
//
//    /*initComponent:function() {
//
//},*/
//
//    initEvents : function(){
//        Ext.ux.MoneyField.superclass.initEvents.call(this);
//        this.el.on("keydown",this.stopEventFunction,this);
//        this.el.on("keyup", this.mapCurrency,this);
//        this.el.on("keypress", this.stopEventFunction,this);
//    },
//
//    KEY_RANGES : {
//        numeric: [48, 57],
//        padnum: [96, 105]
//    },
//
//    isInRange : function(charCode, range) {
//        return charCode >= range[0] && charCode <= range[1];
//    },
//
//    formatCurrency : function(evt, floatPoint, decimalSep, thousandSep) {
//        floatPoint  = !isNaN(floatPoint) ? Math.abs(floatPoint) : 2;
//        thousandSep = typeof thousandSep != "string" ? "," : thousandSep;
//        decimalSep  = typeof decimalSep != "string" ? "." : decimalSep;
//        var key = evt.getKey();
//
//        if (this.isInRange(key, this.KEY_RANGES["padnum"])) {
//            key -= 48;
//        }
//
//        this.sign = (this.allowNegative && (key == 45 || key == 109)) ? "-" : (key == 43 || key == 107 || key == 16) ? "" : this.sign;
//
//        var character = (this.isInRange(key, this.KEY_RANGES["numeric"]) ? String.fromCharCode(key) : "");
//        var field = this.el.dom;
//        var value = (field.value.replace(/\D/g, "").replace(/^0+/g, "") + character).replace(/\D/g, "");
//        var length = value.length;
//
//        if ( character == "" && length > 0 && key == 8) {
//            length--;
//            value = value.substr(0,length);
//            evt.stopEvent();
//        }
//
//        if(field.maxLength + 1 && length >= field.maxLength) return false;
//
//        length <= floatPoint && (value = new Array(floatPoint - length + 2).join("0") + value);
//        for(var i = (length = (value = value.split("")).length) - floatPoint; (i -= 3) > 0; value[i - 1] += thousandSep);
//        floatPoint && floatPoint < length && (value[length - ++floatPoint] += decimalSep);
//        field.value = (this.showCurrency && this.currencyPosition == 'left' ? this.currency : '' ) +
//        (this.sign ? this.sign : '') +
//        value.join("") +
//        (this.showCurrency && this.currencyPosition != 'left' ? this.currency : '' );
//    },
//
//    mapCurrency : function(evt) {
//        switch (this.format) {
//            case 'BRL':
//                this.currency = 'R$';
//                this.currencyPosition = 'left';
//                this.formatCurrency(evt, 2,',','.');
//                break;
//
//            case 'EUR':
//                this.currency = ' €';
//                this.currencyPosition = 'right';
//                this.formatCurrency(evt, 2,',','.');
//                break;
//
//            case 'USD':
//                this.currencyPosition = 'left';
//                this.currency = '$';
//                this.formatCurrency(evt, 2);
//                break;
//
//            default:
//                this.formatCurrency(evt, 2);
//        }
//    },
//
//    stopEventFunction : function(evt) {
//        var key = evt.getKey();
//
//        if (this.isInRange(key, this.KEY_RANGES["padnum"])) {
//            key -= 48;
//        }
//
//        if ( (( key>=41 && key<=122 ) || key==32 || key==8 || key>186) && (!evt.altKey && !evt.ctrlKey) ) {
//            evt.stopEvent();
//        }
//    },
//
//    getCharForCode : function(keyCode){
//        var chr = '';
//        switch(keyCode) {
//            case 48: case 96: // 0 and numpad 0
//                chr = '0';
//                break;
//
//            case 49: case 97: // 1 and numpad 1
//                chr = '1';
//                break;
//
//            case 50: case 98: // 2 and numpad 2
//                chr = '2';
//                break;
//
//            case 51: case 99: // 3 and numpad 3
//                chr = '3';
//                break;
//
//            case 52: case 100: // 4 and numpad 4
//                chr = '4';
//                break;
//
//            case 53: case 101: // 5 and numpad 5
//                chr = '5';
//                break;
//
//            case 54: case 102: // 6 and numpad 6
//                chr = '6';
//                break;
//
//            case 55: case 103: // 7 and numpad 7
//                chr = '7';
//                break;
//
//            case 56: case 104: // 8 and numpad 8
//                chr = '8';
//                break;
//
//            case 57: case 105: // 9 and numpad 9
//                chr = '9';
//                break;
//
//            case 45: case 189: case 109:
//                chr = '-';
//                break;
//
//            case 43: case 107: case 187:
//                chr = '+';
//                break;
//
//            default:
//                chr = String.fromCharCode(keyCode); // key pressed as a lowercase string
//                break;
//        }
//        return chr;
//    }
//});
//
//Ext.ComponentMgr.registerType('moneyfield', Ext.ux.MoneyField);
// ************** FIM TEXTFIELD COMO MOEDA ******************************

// ******** TEXTFIELD COM FORMATAÇÃO DE CNPJ ***************
//Ext.ux.CNPJField = function(config){
//    var defConfig = {
//        autocomplete: 'off',
//        width: 140,
//        soNumero: false,
//        maxLength: (this.soNumero)? 15 : 19
//    };
//    Ext.applyIf(config,defConfig);
//    Ext.ux.CNPJField.superclass.constructor.call(this, config);
//};
//
//Ext.extend(Ext.ux.CNPJField, Ext.form.TextField,{
//    initEvents : function(){
//        Ext.ux.CNPJField.superclass.initEvents.call(this);
//        this.el.on("keydown",this.stopEventFunction,this);
//        this.el.on("keyup", this.formatCNPJ,this);
//        this.el.on("keypress", this.stopEventFunction,this);
//        this.el.on("focus", this.startCNPJ,this);
//    },
//
//    KEY_RANGES : {
//        numeric: [48, 57],
//        padnum: [96, 105]
//    },
//
//    isInRange : function(charCode, range) {
//        return charCode >= range[0] && charCode <= range[1];
//    },
//
//    stopEventFunction : function(evt) {
//        var key = evt.getKey();
//
//        if (this.isInRange(key, this.KEY_RANGES["padnum"])) {
//            key -= 48;
//        }
//
//        if ( (( key>=41 && key<=122 ) || key==32 || key==8 || key>186) && (!evt.altKey && !evt.ctrlKey) ) {
//            evt.stopEvent();
//        }
//    },
//
//    startCNPJ : function(){
//        var field = this.el.dom;
//        if(field.value == ''){
//            field.value = '';
//            if(this.soNumero){
//                field.value = '000000000000000';
//            }else{
//                field.value = '000.000.000/0000-00';
//            }
//        }
//    },
//
//    formatCNPJ : function(evt){
//        var key = evt.getKey();
//
//        if (this.isInRange(key, this.KEY_RANGES["padnum"])) {
//            key -= 48;
//        }
//
//        var character = (this.isInRange(key, this.KEY_RANGES["numeric"]) ? String.fromCharCode(key) : "");
//        var field = this.el.dom;
//        var value = (field.value.replace(/\D/g, "").substr(1) + character).replace(/\D/g, "");
//        var length = value.length;
//
//        if ( character == "" && length > 0 && key == 8) {
//            length--;
//            value = value.substr(0,length);
//            evt.stopEvent();
//        }
//
//        if(field.maxLength + 1 && length >= field.maxLength) return false;
//
//        if (length < 15) {
//            var qtn = '';
//            for(var i = 0; i < 15 - length; i++){
//                qtn = qtn + '0';
//            }
//            value = qtn+value;
//            length = 15;
//        }
//
//        if(this.soNumero){
//            field.value = value;
//        }else{
//            var result = '';
//            result = value.substr(0,3)+'.'+value.substr(3,3)+'.'+value.substr(6,3)+'/'+value.substr(9,4)+'-'+value.substr(13);
//            field.value = result;
//        }
//    }
//});
//
//Ext.ComponentMgr.registerType('cnpjfield', Ext.ux.CNPJField);
// ******** FIM TEXTFIELD COM FORMATAÇÃO DE CNPJ ***************

// ******** TEXTFIELD COM FORMATAÇÃO DE CPF ***************
Ext.ux.CPFField = function(config){
    var defConfig = {
        autocomplete: 'off',
        width: 100,
        soNumero: false,
        maxLength: (this.soNumero)? 11 : 14
    };
    Ext.applyIf(config,defConfig);
    Ext.ux.CPFField.superclass.constructor.call(this, config);
};

Ext.extend(Ext.ux.CPFField, Ext.form.TextField,{
    initEvents : function(){
        Ext.ux.CPFField.superclass.initEvents.call(this);
        this.el.on("keydown",this.stopEventFunction,this);
        this.el.on("keyup", this.formatCPF,this);
        this.el.on("keypress", this.stopEventFunction,this);
        this.el.on("focus", this.startCPF,this);
    },

    KEY_RANGES : {
        numeric: [48, 57],
        padnum: [96, 105]
    },

    isInRange : function(charCode, range) {
        return charCode >= range[0] && charCode <= range[1];
    },

    stopEventFunction : function(evt) {
        var key = evt.getKey();

        if (this.isInRange(key, this.KEY_RANGES["padnum"])) {
            key -= 48;
        }

        if ( (( key>=41 && key<=122 ) || key==32 || key==8 || key>186) && (!evt.altKey && !evt.ctrlKey) ) {
            evt.stopEvent();
        }
    },

    startCPF : function(){
        var field = this.el.dom;
        if(field.value == ''){
            field.value = '';
            if(this.soNumero){
                field.value = '00000000000';
            }else{
                //field.value = '000.000.000-00';
                field.value = '';
            }
        }
    },

    formatCPF : function(evt){
        var key = evt.getKey();

        if (this.isInRange(key, this.KEY_RANGES["padnum"])) {
            key -= 48;
        }

        var character = (this.isInRange(key, this.KEY_RANGES["numeric"]) ? String.fromCharCode(key) : "");
        var field = this.el.dom;
        var value = (field.value.replace(/\D/g, "").substr(1) + character).replace(/\D/g, "");
        var length = value.length;

        if ( character == "" && length > 0 && key == 8) {
            length--;
            value = value.substr(0,length);
            evt.stopEvent();
        }

        if(field.maxLength + 1 && length >= field.maxLength) return false;

        if (length < 11) {
            var qtn = '';
            for(var i = 0; i < 11 - length; i++){
                qtn = qtn + '0';
            }
            value = qtn+value;
            length = 11;
        }

        if(this.soNumero){
            field.value = value;
        }else{
            var result = '';
            result = value.substr(0,3)+'.'+value.substr(3,3)+'.'+value.substr(6,3)+'-'+value.substr(9);
            field.value = result;
        }
    }
});

Ext.ComponentMgr.registerType('cpffield', Ext.ux.CPFField);
// ******** FIM TEXTFIELD COM FORMATAÇÃO DE CPF ***************

// ************** FUNÇÕES DE VALIDAÇÕES *************************************

// Validação de CPF
function validacpf(CPF){
    var i;
    s = CPF.replace(/\D/g, "");
    if(parseInt(s) == 0){
        return false;
    }
    var c = s.substr(0,9);
    var dv = s.substr(9,2);
    var d1 = 0;
    for (i = 0; i < 9; i++){
        d1 += c.charAt(i)*(10-i);
    }
    if (d1 == 0){
        return false;
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(0) != d1){
        return false;
    }
    d1 *= 2;
    for (i = 0; i < 9; i++){
        d1 += c.charAt(i)*(11-i);
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(1) != d1){
        return false;
    }
    return true;
};		// Termina validação CPF
//
//// Validação de CNPJ
//function VerifyCNPJ(CNPJ){
//    CNPJ = CNPJ.replace(/\D/g, "");
//    if(parseInt(CNPJ) == 0){
//        return false;
//    }else{
//        g=CNPJ.length-2;
//        if(RealTestaCNPJ(CNPJ,g) == 1){
//            g=CNPJ.length-1;
//            if(RealTestaCNPJ(CNPJ,g) == 1){
//                return true;
//            }else{
//                return false;
//            }
//        }else{
//            return false;
//        }
//    }
//};
//
//function RealTestaCNPJ(CNPJ,g){
//    var VerCNPJ=0;
//    var ind=2;
//    var tam;
//    for(f=g;f>0;f--){
//        VerCNPJ+=parseInt(CNPJ.charAt(f-1))*ind;
//        if(ind>8){
//            ind=2;
//        }else{
//            ind++;
//        }
//    }
//    VerCNPJ%=11;
//    if(VerCNPJ==0 || VerCNPJ==1){
//        VerCNPJ=0;
//    }else{
//        VerCNPJ=11-VerCNPJ;
//    }
//    if(VerCNPJ!=parseInt(CNPJ.charAt(g))){
//        return(0);
//    }else{
//        return(1);
//    }
//};		// Termina validação CNPJ
//
//// ********************* FIM VALIDAÇÕES ***********************
//
//// ********************* VTYPES *******************************

Ext.apply(Ext.form.VTypes,{
    cpf: function(val,field){
        return validacpf(val);
    },

    cpfText: 'CPF não é válido!'
});
//
//Ext.apply(Ext.form.VTypes,{
//    cnpj: function(val,field){
//        return VerifyCNPJ(val);
//    },
//
//    cnpjText: 'CNPJ não é válido!'
//});

// ******************** FIM VTYPES ***********************








//            Ext.apply(Ext.form.VTypes, {
//                telefone:  function(v) {
//                    return /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.test(v);
//                },
//                telefoneText: 'Must be a numeric IP address',
//                telefoneMask: /[\d\.]/i
//            });
//Ext.form.VTypes["telefone"] = /^(\d{3}[-]?){1,2}(\d{4})$/;
//Ext.form.VTypes["telefoneMask"] = /[\d-]/;
//Ext.form.VTypes["telefoneText"] = 'Not a valid phone number.  Must be in the format 123-4567 or 123-456-7890 (dashes optional)';


Ext.apply(Ext.form.VTypes, {
    telefone: function(val, field) {
        return /^(\d{4}[-]?){1,2}(\d{4})$/.test(val);
    },
    telefoneText: 'Telefone Inválido! Exemplo: (9999-9999)',
    telefoneMask: /[\d-]/
});

Ext.apply(Ext.form.VTypes, {
    cep: function(val, field) {
        return /^(\d{5}[-]?){1,2}(\d{3})$/.test(val);
    },
    cepText: 'Cep Inválido! Exemplo: (72610-512)',
    cepMask: /[\d-]/
});


Ext.apply(Ext.form.VTypes, {
    ddd: function(val, field) {
        var ddd = /^([0-9])/;
        return ddd.test(val);
    },
    dddText: 'ddd',
    dddMask: /[\d\s:amp]/i
});

Ext.apply(Ext.form.VTypes, {
    password: function(value, field)
    {
        var hasSpecial = value.match(/[a-zA-Z0-9]/);
        var hasLength = (value.length >= 6);
        return (hasSpecial && hasLength);
    },
    passwordText: 'A senha deve ser composta de no minimo 6 numeros ou letras',
    passwordMask: /[a-zA-Z0-9]/
});

Ext.form.VTypes["onlytext"] = /[a-zA-Z'\s]/;
Ext.form.VTypes["onlytextMask"] = /[a-zA-Z'\s]/;
Ext.form.VTypes["onlytextText"] = "";


Ext.apply(Ext.form.VTypes, {
    comparefield: function(value, field)
    {
        if (field.idFieldCompare)
        {
            var campo = Ext.getCmp(field.idFieldCompare);
            this.comparefieldText = 'O conteudo deste campo esta diferente do campo <b>'+campo.getName()+'</b>.';
            return (value == campo.getValue());
        }else{
            return false; 
        }

    },

    comparefieldText: 'Não foi informado o campo para comparar o conteudo!'
});


var codeCaptcha = null;

Ext.apply(Ext.form.VTypes, {
    captcha: function(value){
        if(value.length==4){
            var urlSecurityCode = "/camisetas/outros/png-1.0/captcha.php";
            var conn = new Ext.data.Connection();
            var data = null;
            conn.request({
                url: urlSecurityCode,
                method: 'POST',
                params: {
                    captcha: value
                },
                success: function(responseObject) {
                    if(responseObject.responseText){
                        try{
                            data = eval(responseObject.responseText);
                            if(data[0].success===true){
                                codeCaptcha = data[0].code;
                            }else{
                                Ext.example.msg('Captcha', 'Falha na verificacao');
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
            Ext.example.msg('Erro', '{0} - {1}',value,codeCaptcha);
            return (value == codeCaptcha);
            
        }else{
            Ext.example.msg('Erro', 'menos de 4');
            return false;
        }
    },
    captchaText: 'O código não confere!'
});