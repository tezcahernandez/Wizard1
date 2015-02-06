(function ($) {
    $.widget("gestionix.WidgetStep3", {
        Save: null,
        nombre:null,
        aPaterno: null,
        aMaterno: null,
        email: null,
        control:null,

        options: {
            resultado: null,
        },

        _create: function () {
            control = this;
            $(".txtnombre", control.element).val(control.options.resultado.Alumno.nombre + " OK"); 
            $(".aPaterno", control.element).val(control.options.resultado.Alumno.aPaterno + " OK");
            $(".aMaterno", control.element).val(control.options.resultado.Alumno.aMaterno + " OK");
            $(".email", control.element).val(control.options.resultado.Alumno.email + " OK");
            control.Save = $(".guardar", control.element);
            control.Save.bind("click", $.proxy(control, "_operation"));
           
        },
        _setOption: function (Objeto, value) {
            if (Objeto != value)
                this.options[Objeto] = value;
        },
        _operation: function () {
            control = this;
            control.nombre = $(".txtnombre", control.element).val();
            control.aPaterno = $(".aPaterno", control.element).val();
            control.aMaterno = $(".aMaterno", control.element).val();
            control.email = $(".email", control.element).val();
            var obj = function(){
                this.nombre = control.nombre,
                this.aPaterno= control.aPaterno,
                this.aMaterno = control.aMaterno,
                this.email = control.email
            }
            var objeto = new obj();
            control._trigger("end",{},objeto);
        },
    });
})(jQuery);