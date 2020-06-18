using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Diagnostics;
using System.Windows.Forms;
using System.Linq;
using System.Xml.Linq;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SGM.Conexion
{
    class ConexionMaestra
    {
		public static string conexion = Convert.ToString(Conexion.Desencryptacion.checkServer());

		/*public static SqlConnection conexion = new SqlConnection(@"Data source=DESKTOP\SQLEXPRESS;Initial Catalog=SGM;Integrated Security=True");    // Nombre servidor
		

		public static void abrir()
		{

			Console.WriteLine("Entro a conexion maestra abrir");
			if ((int)conexion.State == 0)
			{
				MessageBox.Show("Se abrio la conexion");
				conexion.Open();
			}
		}
		public static void Cerrar()
		{
			if (conexion.State == (System.Data.ConnectionState)1)
			{
				MessageBox.Show("Se cerro la conexion");
				conexion.Close();
			}
		}*/
	}
}
