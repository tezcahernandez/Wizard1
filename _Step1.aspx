<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_Step1.aspx.cs" Inherits="_Step1" %>

<%@ Register Src="~/WebUserControls/Step1.ascx" TagPrefix="uc1" TagName="Step1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="JScripts/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="JScripts/jquery-ui.min.js" type="text/javascript"></script>
    <script src="JScripts/Global.js" type="text/javascript"></script>
    <script src="JScripts/Step1.js" type="text/javascript"></script>
    <script type="text/javascript">
        //JS Code
        $(document).ready(function () {
            $('.Step1', '#WizarStep1').WStep1({
                // NO PARAMETER
            },
                {
                    complete: function (event, data) {
                        //functionbyRosendo(Alumno data);
                        alert(data.nombre);
                    }
                }
                );
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id ="WizarStep1">
        <uc1:Step1 runat="server" ID="Step1" />
    </div>
    </form>
</body>
</html>
