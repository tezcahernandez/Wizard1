using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for conexion
/// </summary>
public class conexion
{
    private String CadConnection;
    private SqlConnection slqConnection;
    private SqlCommand sqlCommand;
	
    public conexion(){
        CadConnection = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
	}

    public bool StoredProcedureAlumno(string sql, string op){
        try{
            using (SqlConnection sqlconn = new SqlConnection(CadConnection)){
                sqlconn.Open();
                sqlCommand = new SqlCommand("SP_OBJECT_ALUMNO", sqlconn);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@json", sql);
                sqlCommand.Parameters.AddWithValue("@op", op);

                sqlCommand.ExecuteNonQuery();
            }
            return true;
        }
        catch (SqlException e){
            Console.Write(e);
        }
        return false;
    }
}