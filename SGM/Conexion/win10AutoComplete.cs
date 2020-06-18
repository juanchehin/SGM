using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace SGM.Conexion
{
    class win10AutoComplete
    {
    }

    public static class DataHelper
    {
        public static DataTable LoadDataTable()
        {

            DataTable dt = new DataTable();
            SqlDataAdapter da;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Conexion.ConexionMaestra.conexion;
            con.Open();

            da = new SqlDataAdapter("SELECT TOP 100 Descripcion FROM Producto1", con);

            da.Fill(dt);


            return dt;

        }

        public static AutoCompleteStringCollection LoadAutoComplete()
        {
            DataTable dt = LoadDataTable();

            AutoCompleteStringCollection stringCol = new AutoCompleteStringCollection();

            foreach (DataRow row in dt.Rows)
            {
                stringCol.Add(Convert.ToString(row["Descripcion"]));
            }

            return stringCol;
        }

    }
}
