/*CPF Field*/
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

/*CPF Field*/
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

/* Validação de CPF*/
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
}

Ext.apply(Ext.form.VTypes,{
    cpf: function(val){
        return validacpf(val);
    },
    cpfText: 'CPF não é válido!'
});

/*Telefone*/
Ext.apply(Ext.form.VTypes, {
    telefone: function(val) {
        return /^(\d{4}[-]?){1,2}(\d{4})$/.test(val);
    },
    telefoneText: 'Telefone Inválido! Exemplo: (9999-9999)',
    telefoneMask: /[\d-]/
});

/*CEP*/
Ext.apply(Ext.form.VTypes, {
    cep: function(val) {
        return /^(\d{5}[-]?){1,2}(\d{3})$/.test(val);
    },
    cepText: 'Cep Inválido! Exemplo: (72610-512)',
    cepMask: /[\d-]/
});

/*DDD*/
Ext.apply(Ext.form.VTypes, {
    ddd: function(val) {
        var ddd = /^([0-9])/;
        return ddd.test(val);
    },
    dddText: 'ddd',
    dddMask: /[\d\s:amp]/i
});

/*Senha*/
Ext.apply(Ext.form.VTypes, {
    password: function(value){
        var hasSpecial = value.match(/[a-zA-Z0-9]/);
        var hasLength = (value.length >= 6);
        return (hasSpecial && hasLength);
    },
    passwordText: 'A senha deve ser composta de no minimo 6 numeros ou letras',
    passwordMask: /[a-zA-Z0-9]/
});

/*Rastreamento correios*/
Ext.apply(Ext.form.VTypes, {
    rastreamento: function(val) {
        return /^([A-Z]{2})([0-9]{9})([A-Z]{2})$/.test(val);
    },
    rastreamentoText: 'Este rastreamento não é válido. Exemplo: SS123456789BR'
});

Ext.form.VTypes["onlytext"] = /[a-zA-Z'\s]/;
Ext.form.VTypes["onlytextMask"] = /[a-zA-Z'\s]/;
Ext.form.VTypes["onlytextText"] = "";

/*Comparar Campos*/
Ext.apply(Ext.form.VTypes,{
    comparefield: function(value, field){
        if (field.idFieldCompare){
            var campo = Ext.getCmp(field.idFieldCompare);
            this.comparefieldText = 'O conteudo deste campo esta diferente do campo <b>'+campo.getName()+'</b>.';
            return (value == campo.getValue());
        }else{
            return false; 
        }

    },

    comparefieldText: 'Não foi informado o campo para comparar o conteudo!'
});

/*Captchar*/
var codeCaptcha = null;

Ext.apply(Ext.form.VTypes, {
    captcha: function(value){
        if(value.length==4){
            var urlSecurityCode = "/camisetas/public/util/captcha.php";
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
            return (value == codeCaptcha);
            
        }else{
            return false;
        }
    },
    captchaText: 'O código não confere!'
});

/*Range de Datas*/
Ext.apply(Ext.form.VTypes, {
    daterange : function(val, field) {
        var date = field.parseDate(val);

        if(!date){
            return;
        }

        if (field.startDateField && (!this.dateRangeMax || (date.getTime() != this.dateRangeMax.getTime()))) {
            var start = Ext.getCmp(field.startDateField);
            start.setMaxValue(date);
            start.validate();
            this.dateRangeMax = date;
        } else if (field.endDateField && (!this.dateRangeMin || (date.getTime() != this.dateRangeMin.getTime()))) {
            var end = Ext.getCmp(field.endDateField);
            end.setMinValue(date);
            end.validate();
            this.dateRangeMin = date;
        }
        return true;
    }
});