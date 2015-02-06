<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Step3.aspx.cs" Inherits="widgetOk" %>

<%@ Register Src="~/WebUserControls/step3.ascx" TagPrefix="uc1" TagName="step3" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Step 3</title>
    <script type="text/javascript" src="JScripts/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="JScripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="JScripts/Step3.js"></script>
    <script type="text/javascript" src="JScripts/Global.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
                select();
            function select() {        
               $.ajax({
                    type: "POST",
                    url: "Step3.aspx/Actualizar",
                    data: JSON.stringify({id:8}),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        var obj = $.parseJSON(result.d);
                        $('#windgetStep3').WidgetStep3({
                            resultado: obj//parametro
                        },
                        {
                            end: function (event, data)
                            {
                                var json = { Alumno: { nombre: data.nombre, aPaterno: data.aPaterno, aMaterno: data.aMaterno, email: data.email }, opcion: "update",id:8};
                                json = JSON.stringify(json);
                                alert(json);
                                $.ajax({
                                    type: "POST",
                                    url: "Step2.aspx/SaveObject",
                                    data: {},
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (result) {
                                        alert(result);

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
        })

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p id="Alumnos"></p>
        <uc1:step3 runat="server" ID="step3" />
    </div>
        
    </form>
</body>
</html>
<%-- spInsertColumn nombre de procedimiento --%>