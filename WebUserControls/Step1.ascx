<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Step1.ascx.cs" Inherits="WebUserControls_Step1" %>
<div class="Step1">
    <div>
        <br />
            <label>Nombre</label><br />
        <input type="text" class="txtNombre" size="40" /><br />
        <br />

            <label>Apellido Paterno</label><br />
        <input type="text" class="txtaPaterno" size="40" /><br />
        <br />

            <label>Apellido Materno</label><br />
        <input type="text" class="txtaMaterno" size="40" /><br />
        <br />

            <label>Email</label><br />
        <input type="text" class="txtEmail" size="40" /><br />
        <br />
    </div>
    <div class="center">
        <input type="button" value="Guardar" class="btnEnviar" />

        o <a href="#" class="btnLimpiar">Cancelar</a><br />
    </div>
</div>
