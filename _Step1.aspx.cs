using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;
using System.Xml;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using System.Xml;
using Newtonsoft.Json;
using System.Xml.Linq;
public partial class _Step1 : System.Web.UI.Page
{
    static SqlConnection con = new SqlConnection("Data Source=NTBOOK;Initial Catalog=WIZARD;User ID=sa;Password=sa");
    static SqlCommand cmd = new SqlCommand();
    static SqlDataReader reader;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Services.WebMethod]
    public static int saveObject(Alumno obj, string opcion, int id)
    {
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
    [System.Web.Services.WebMethod]
    public static string Actualizar(string id)
    {
    
        cmd.CommandText = "select IdObject,Object from tblObject where IdObject=" + id + "";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        con.Open();
        reader = cmd.ExecuteReader();
        string json = "";

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                XmlDocument xml1 = new XmlDocument();
                SqlXml xml = reader.GetSqlXml(reader.GetOrdinal("Object"));
                xml1.LoadXml(xml.Value);
                json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(xml1);
            }
        }
        con.Close();
        return json;

    }

    [System.Web.Services.WebMethod]
    public static void ExcecuteProcedure(string id)
    {
        cmd.CommandText = "spInsertColumn";
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter param = new SqlParameter();
        param.ParameterName = "@idAlumno";
        param.Value = id;
        cmd.Parameters.Add(param);
        cmd.Connection = con;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}


public partial class Alumno
{
    public string nombre { get; set; }
    public string aPaterno { get; set; }
    public string aMaterno { get; set; }
    public string email { get; set; }
}