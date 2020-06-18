using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Management;
using System.Data.SqlClient;

using System.Globalization;
using System.Threading;

namespace SGM.Modulos.Caja
{
    public partial class CierreCaja : Form
    {
        public CierreCaja()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {


                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd = new SqlCommand("cerrarCaja", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idcaja", txtidcaja.Text);
                cmd.Parameters.AddWithValue("@fechafin", txtfechacierre.Value);
                cmd.Parameters.AddWithValue("@fechacierre", txtfechacierre.Value);
                cmd.ExecuteNonQuery();
                con.Close();
                Application.Exit();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void CierreCaja_Load(object sender, EventArgs e)
        {
            ManagementObjectSearcher MOS = new ManagementObjectSearcher("Select * From Win32_BaseBoard");
            foreach (ManagementObject getserial in MOS.Get())
            {
                lblSerialPc.Text = getserial.Properties["SerialNumber"].Value.ToString();
                mostrarCajaSerial();
                try
                {
                    txtidcaja.Text = datalistado_caja.SelectedCells[1].Value.ToString();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void mostrarCajaSerial()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();

                da = new SqlDataAdapter("mostrarCajasSerialDisco", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@Serial", lblSerialPc.Text);
                da.Fill(dt);
                datalistado_caja.DataSource = dt;

                con.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }


        }
    }
}
