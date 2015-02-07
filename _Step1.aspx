<%@ Page Language="C#" AutoEventWireup="true" CodeFile="_Step1.aspx.cs" Inherits="_Step1" %>

<%@ Register Src="~/WebUserControls/Step1.ascx" TagPrefix="uc1" TagName="Step1" %>
<%@ Register Src="~/WebUserControls/step3.ascx" TagPrefix="uc1" TagName="step3" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="JScripts/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('.exito').hide();
            $('.STEP3').hide();
        });

    </script>
    <script src="JScripts/jquery-ui.min.js" type="text/javascript"></script>
    <script src="JScripts/Global.js" type="text/javascript"></script>
    <script src="JScripts/Step1.js" type="text/javascript"></script>
    <script src="JScripts/Step3.js" type="text/javascript"></script>
    <script src="JScripts/Main.js" type="text/javascript"></script>
    <link href="CSS/style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="exito">
            </div>
        
        <div id="WizarStep1">            
            <div class="content1">
                <div class="cab">
                    <label>Datos del contacto</label>
                </div>
                <div class="body1">
                    <uc1:Step1 runat="server" ID="Step1" />
                </div>
            </div>
        </div>
        <div class="STEP3">
            <div class="content1">
                <div class="cab">
                    <label>Datos del contacto</label>
                </div>
                <div class="body1">
                    <uc1:step3 runat="server" ID="step3" />
                </div>
                </div>
            </div>
    </form>
</body>
</html>
