// create namespace for plugins
Ext.namespace('Ext.ux.plugins');

/**
 * Ext.ux.plugins.IconCombo plugin for Ext.form.Combobox
 *
 * @author  Ing. Jozef Sakalos
 * @date    January 7, 2008
 *
 * @class Ext.ux.plugins.IconCombo
 * @extends Ext.util.Observable
 */
Ext.ux.plugins.IconCombo = function(config) {
    Ext.apply(this, config);
};

// plugin code
Ext.extend(Ext.ux.plugins.IconCombo, Ext.util.Observable, {
    init:function(combo) {
        Ext.apply(combo, {
            tpl:  '<tpl for=".">'
            + '<div class="x-combo-list-item ux-icon-combo-item '
            + '{' + combo.iconClsField + '}">'
            + '{' + combo.displayField + '}'
            + '</div></tpl>',

            onRender:combo.onRender.createSequence(function(ct, position) {
                // adjust styles
                this.wrap.applyStyles({
                    position:'relative'
                });
                this.el.addClass('ux-icon-combo-input');

                // add div for icon
                this.icon = Ext.DomHelper.append(this.el.up('div.x-form-field-wrap'), {
                    tag: 'div',
                    style:'position:absolute'
                });
            }), // end of function onRender

            setIconCls:function() {
                var rec = this.store.query(this.valueField, this.getValue()).itemAt(0);
                if(rec) {
                    this.icon.className = 'ux-icon-combo-icon ' + rec.get(this.iconClsField);
                }
            }, // end of function setIconCls

            setValue:combo.setValue.createSequence(function(value) {
                this.setIconCls();
            })
        });
    } // end of function init
}); // end of extend

// end of file



/**
 * @author schiesser
 */
Ext.ns('Extreme.components');

Extreme.components.CountryCombo = Ext.extend(Ext.form.ComboBox, {
    constructor: function(config){
        var data;
        if (config.phoneLabels) {
            data = [['+49', '+49', 'ux-flag-de'], ['+43', '+43', 'ux-flag-at'], ['+41', '+41', 'ux-flag-ch'], ['+352', '+352', 'ux-flag-lu'], ['+432', '+432', 'ux-flag-li']];
        }
        else {
            data = [['DE', 'Deutschland', 'ux-flag-de'], ['AT', 'Österreich', 'ux-flag-at'], ['CH', 'Schweiz', 'ux-flag-ch'], ['LU', 'Luxemburg', 'ux-flag-lu'], ['LI', 'Lichtenstein', 'ux-flag-li']];
        }

        Extreme.components.CountryCombo.superclass.constructor.call(this, Ext.apply({
            store: new Ext.data.SimpleStore({
                fields: ['countryCode', 'countryName', 'countryFlag'],
                data: data
            }),
            plugins: new Ext.ux.plugins.IconCombo(),
            valueField: 'countryCode',
            displayField: 'countryName',
            iconClsField: 'countryFlag',
            triggerAction: 'all',
            mode: 'local'
        }, config));
    }
});
Ext.reg('countrycombo', Extreme.components.CountryCombo);







Extreme.components.CountryCombo = Ext.extend(Ext.form.ComboBox, {
    constructor: function(config){
        var data;
        //        if (config.phoneLabels) {
        //            data = [['+49', '+49', 'ux-flag-de'], ['+43', '+43', 'ux-flag-at'], ['+41', '+41', 'ux-flag-ch'], ['+352', '+352', 'ux-flag-lu'], ['+432', '+432', 'ux-flag-li']];
        //        }
        //        else {
        //            data = [['DE', 'Deutschland', 'ux-flag-de'], ['AT', 'Österreich', 'ux-flag-at'], ['CH', 'Schweiz', 'ux-flag-ch'], ['LU', 'Luxemburg', 'ux-flag-lu'], ['LI', 'Lichtenstein', 'ux-flag-li']];
        //        }

        data = [
        ['', 'Todas', 'todas-cores'],
        ['171c46','azul-escuro','c171c46'],
        ['344ca3','azul-claro','c344ca3'],
        ['000000', 'Preta', 'c000000'],
        ['1bbc81','verde-limao','c1bbc81'],
        ['34a4c4','verde-claro','c34a4c4'],
        ['520b0b','marron','c520b0b'],
        ['174621','verde-escuro','c174621'],
        ['717171','cinza','c717171'],
        ['a7bc1b','amarelo-limao','ca7bc1b'],
        ['a3346b','rosa','ca3346b'],
        ['a33434','vermelho-suave','ca33434'],
        ['d83200','laranja','cd83200'],
        ['f6d600','amarelo','cf6d600'],
        ['f60000','vermelho','cf60000'],
        ['ffffff','branco','cffffff']
        ];



        Extreme.components.CountryCombo.superclass.constructor.call(this, Ext.apply({
            store: new Ext.data.SimpleStore({
                fields: ['vValor', 'mValor', 'cValor'],
                data: data,
                sort: 'mValor'
            }),
            plugins: new Ext.ux.plugins.IconCombo(),
            //valueField: 'countryCode',
            //displayField: 'countryName',
            //iconClsField: 'countryFlag',
            sort: 'mValor',
            triggerAction: 'all',
            mode: 'local'
        }, config));
    }
});
Ext.reg('comboCores', Extreme.components.CountryCombo);