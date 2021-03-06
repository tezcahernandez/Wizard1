﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;
using System.Xml;
using System.IO;
using System.Text;

public partial class Step2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [System.Web.Services.WebMethod]
    public static int saveObject(Alumno obj, string opcion, int id){
        conexion conn = new conexion();
        //var json = Newtonsoft.Json.JsonConvert.SerializeObject(obj);
        XmlSerializer xmlAlumno = new XmlSerializer(typeof(Alumno));

        XmlWriterSettings xmlWriterSet = new XmlWriterSettings();
        xmlWriterSet.Encoding = new UnicodeEncoding(false, false);
        xmlWriterSet.Indent = true;
        xmlWriterSet.OmitXmlDeclaration = true;

        StringWriter textWriter = new StringWriter();
        XmlWriter xmlWriter = XmlWriter.Create(textWriter, xmlWriterSet);
        xmlAlumno.Serialize(xmlWriter, obj);
        xmlWriter.Close();
        textWriter.Close();

        return conn.StoredProcedureAlumno(textWriter.ToString(), opcion, id);
    }

}

/*public partial class Alumno{
    public string nombre { get; set; }
    public string aPaterno { get; set; }
    public string aMaterno { get; set; }
    public string email { get; set; }
}*/