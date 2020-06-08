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

namespace SGM
{
    class ConexionMaestra
    {
		public static SqlConnection conexion = new SqlConnection(@"Data source=DESKTOP;Initial Catalog=BaseSGM;Integrated Security=True");    // Nombre servidor
		
		public static void abrir()
		{
			if ((int)conexion.State == 0)
			{
				conexion.Open();
			}
		}
		public static void Cerrar()
		{
			if (conexion.State == (System.Data.ConnectionState)1)
			{
				conexion.Close();
			}
		}
	}
}
