$.widget("gestionix.WStep1", {
    CONTROL: null,
    btnEnviar: null,
    txtNombre: null,
    txtAPaterno: null,
    txtAMaterno: null,
    txtEmail:null,

    options: {
    },
    _create: function () {
        CONTROL = this;
        CONTROL.btnEnviar = $('.btnEnviar', CONTROL.element);
        CONTROL.txtNombre = $('.txtNombre', CONTROL.element);
        CONTROL.txtAPaterno = $('.txtaPaterno', CONTROL.element);
        CONTROL.txtAMaterno = $('.txtaMaterno', CONTROL.element);
        CONTROL.txtEmail = $('.txtEmail', CONTROL.element);
        CONTROL.btnEnviar.bind("click", $.proxy(CONTROL._SendData, CONTROL));
    },
    _setOption: function (key, value) {
        this.options[key] = value;
    },
    _SendData: function () {
        var CONTROL = this;
        var band = true;
        var obj = new Alumno();
        if (CONTROL._Valida(CONTROL.txtNombre)) band = false;
        if (CONTROL._Valida(CONTROL.txtAPaterno)) band = false;
        if (CONTROL._Valida(CONTROL.txtAMaterno)) band = false;
        if (!(CONTROL._ValidaEmail(CONTROL.txtEmail))) band = false;

        obj.nombre = CONTROL.txtNombre.val();
        obj.aPaterno = CONTROL.txtAPaterno.val();
        obj.aMaterno = CONTROL.txtAMaterno.val();
        obj.email = CONTROL.txtEmail.val();
        if(band) this._trigger("complete", {}, obj);
    },
    _Valida: function (_control) {
        var cad = _control.val().lenght;
        if (cad == null || cad.lenght == 0) {
            _control.attr("placeholder", "Escribe algo aquí");
            return false;
        }
        return true;
    },
    _ValidaEmail: function (_control) {
        if (/[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/.test(_control.val())) {
            return true;
        }
        _control.val("");
        _control.attr("placeholder", "Escribe correo aquí");
        return false;
    }

})(jQuery);
