<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Step1.ascx.cs" Inherits="WebUserControls_Step1" %>
<div class="Step1">

    <table>
        <tr>
            <th colspan="2">Registro de Alumno
            </th>
        </tr>
        <tr>
            <th colspan="2">
                <input type="text" class="txtNombre" placeholder="Nombre"/>
            </th>
        </tr>
        <tr>
            <th colspan="2">
                <input type="text" class="txtaPaterno" placeholder="Apellido Paterno" />
            </th>
        </tr>
        <tr>
            <th colspan="2">
                <input type="text" class="txtaMaterno" placeholder="Apellido Materno" />
            </th>
        </tr>
        <tr>
            <th colspan="2">
                <input type="text" class="txtEmail" placeholder="Email" />
            </th>
        </tr>
        <tr>
            <td>
                <input type="button" value="Enviar" class="btnEnviar" />

            </td>
            <td>
                <input type="button" id="btnLimpiar" value="Limpiar" />
            </td>
        </tr>

    </table>

</div>
