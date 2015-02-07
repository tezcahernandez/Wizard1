$(document).ready(function () {
    var idAlumno;

    
    $('.Step1', '#WizarStep1').WStep1({
        // NO PARAMETER
    },
        {
            complete: function (event, data) {
                var alumno = data;
                var jObject = { obj: { nombre: alumno.nombre, aPaterno: alumno.aPaterno, aMaterno: alumno.aMaterno, email: alumno.email }, opcion: 'insert', id: '0' };
                $.ajax({
                    type: "POST",
                    url: "_Step1.aspx/saveObject",
                    data: JSON.stringify(jObject),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    failure: function (response) {
                        alert(response.d);
                    }
                }
                );
            }
        }
        );
    function OnSuccess(response) {
        $('.exito').show('slow');
        if (response.d == '0') {
            $('.exito').html("Error al tratar de guardar el Objeto");

        } else {
            idAlumno = response.d;
            $('.exito').html("El Objeto se ha insertado correctamente.");
            $('#WizarStep1').hide('slow');
            $('.STEP3').show('slow');
            select();
        }
    }

    function select() {
        $.ajax({
            type: "POST",
            url: "_Step1.aspx/Actualizar",
            data: JSON.stringify({ id: idAlumno }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                var obj = $.parseJSON(result.d);
                $('#windgetStep3').WidgetStep3({
                    resultado: obj
                },
                {
                    end: function (event, data) {
                        var json = { obj: { nombre: data.nombre, aPaterno: data.aPaterno, aMaterno: data.aMaterno, email: data.email }, opcion: 'update', id: idAlumno };
                        json = JSON.stringify(json);
                        $.ajax({
                            type: "POST",
                            url: "_Step1.aspx/SaveObject",
                            data: json,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (result) {
                                $('.exito').hide();
                                $('.exito').html("El registro se ha insertado correctamente.");
                                $('.exito').show('slow');
                            }
                        });
                        
                    }
                });
            },
            error: function () {
                alert("Ha ocurrido un error");
            }
        });
        
        
    }
});