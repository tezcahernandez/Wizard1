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
                var jObject = { obj: { nombre: alumno.nombre, aPaterno: alumno.aPaterno, aMaterno: alumno.aMaterno, email: alumno.email }, opcion:'insert' };

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
                $('.exito').html(response.d);
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
