<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Step2.aspx.cs" Inherits="Step2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Step 2</title>
    <script src="JScripts/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="JScripts/jquery-ui.min.js" type="text/javascript"></script>
    <script src="JScripts/Global.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var idAlumno;

            load();

            function load() {
                $('.exito').hide();
            }

            $('#btn').click(function () {
                saveObject();
            });

            function saveObject() {
                var alumno = new Alumno();
                alumno.nombre = 'Juan'
                alumno.aPaterno = 'Perez'
                alumno.aMaterno = 'Hernandez'
                alumno.email = "juan@gmail.com"
                var jObject = { obj: { nombre: alumno.nombre, aPaterno: alumno.aPaterno, aMaterno: alumno.aMaterno, email: alumno.email }, opcion:'insert', id:'0' };
                //var ObjectXml = { xml: '<Alumno xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><nombre></nombre><aPaterno>Perez</aPaterno><aMaterno>Hernandez</aMaterno><email>juan@gmail.com</email></Alumno>"' };
                //contentType: "text/xml",
                //data: {inputxml: escape('<test></test>') <- how to post xml structure correctly?}
                $.ajax({
                    type: "POST",
                    url: "Step2.aspx/saveObject",
                    data: JSON.stringify(jObject),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnSuccess,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }

            function OnSuccess(response) {
                $('.exito').show('slow');
                if (response.d == '0') {
                    $('.exito').html("Error al tratar de guardar el Objeto");
                } else {
                    idAlumno = response.d;
                    $('.exito').html("El Objeto se ha insertado correctamente.");
                }
            }
        })
    </script>
    <style>
        .exito{
			background: #C2FFAF;
			border: 1px solid #2A7F0F;
			padding: 5px;
			margin-bottom: 15px;
			width: 400px;
		}
    </style>
</head>
<body>
    <div class="exito">
	</div>
    <form id="form1" runat="server">
    <div>
        <input type="button" id="btn" value="Click Me" />  
    </div>
    </form>
</body>
</html>
