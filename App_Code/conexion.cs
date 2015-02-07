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

    public int StoredProcedureAlumno(string sql, string op, int id){
        try{
            using (SqlConnection sqlconn = new SqlConnection(CadConnection)){
                sqlconn.Open();
                sqlCommand = new SqlCommand("SP_OBJECT_ALUMNO", sqlconn);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@json", sql);
                sqlCommand.Parameters.AddWithValue("@op", op);
                sqlCommand.Parameters.AddWithValue("@id", id);

                SqlDataReader r = sqlCommand.ExecuteReader();

                while(r.Read()){
                    return Convert.ToInt32(r["id"]);
                }
            }
        }
        catch (SqlException e){
            Console.Write(e);
        }
        return 0;
    }

}