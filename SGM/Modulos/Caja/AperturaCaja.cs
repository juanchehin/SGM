using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Management;
using System.Xml;

namespace SGM.Modulos.Caja
{
    public partial class AperturaCaja : Form
    {
        public AperturaCaja()
        {
            InitializeComponent();
        }

        private void AperturaCaja_Load(object sender, EventArgs e)
        {
            System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("es-CO");
            System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.CurrencyDecimalSeparator = ".";
            System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.CurrencyGroupSeparator = ",";
            System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.NumberDecimalSeparator = ".";
            System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.NumberGroupSeparator = ",";
            ManagementObjectSearcher MOS = new ManagementObjectSearcher("Select * From Win32_BaseBoard");
            foreach (ManagementObject getserial in MOS.Get())
            {
                lblSerialPc.Text = getserial.Properties["SerialNumber"].Value.ToString();
                MostrarCajaSerial();
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

        private void ToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            try
            {
                ConexionMaestra.conexion.Open();
                SqlCommand cmd = new SqlCommand();
                cmd = new SqlCommand("editarDineroCajaInicial", ConexionMaestra.conexion);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdCaja", txtidcaja.Text);
                cmd.Parameters.AddWithValue("@saldo", txtmonto.Text);
                cmd.ExecuteNonQuery();
                ConexionMaestra.conexion.Close();

                this.Hide();
                Ventas.VentasMenuPrincipal frm = new Ventas.VentasMenuPrincipal();
                frm.ShowDialog();
                this.Hide();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void MostrarCajaSerial()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                // SqlConnection con = new SqlConnection();
                // con.ConnectionString = CONEXION.CONEXIONMAESTRA.conexion;
                // con.Open();

                ConexionMaestra.conexion.Open();
                // con.Open();
                SqlCommand cmd = new SqlCommand();
                // cmd = new SqlCommand("insertar_usuario", ConexionMaestra.conexion);
                // cmd.CommandType = CommandType.StoredProcedure;

                da = new SqlDataAdapter("MostrarCajasSerialDisco", ConexionMaestra.conexion);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@Serial", lblSerialPc.Text);
                da.Fill(dt);
                datalistado_caja.DataSource = dt;

                ConexionMaestra.conexion.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
        }

        private static void OnlyNumber(KeyPressEventArgs e, bool isdecimal)
        {
            String aceptados;
            if (!isdecimal)
            {
                aceptados = "0123456789." + Convert.ToChar(8);
            }
            else
                aceptados = "0123456789," + Convert.ToChar(8);

            if (aceptados.Contains("" + e.KeyChar))
            {
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }

        private void ToolStripMenuItem3_Click(object sender, EventArgs e)
        {
            try
            {

                ConexionMaestra.conexion.Open();
                SqlCommand cmd = new SqlCommand();

                cmd = new SqlCommand("editar_dinero_caja_inicial", ConexionMaestra.conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id_caja", txtidcaja.Text);
                cmd.Parameters.AddWithValue("@saldo", 0);
                cmd.ExecuteNonQuery();
                ConexionMaestra.conexion.Close();

                this.Hide();
                Ventas.VentasMenuPrincipal frm = new Ventas.VentasMenuPrincipal();
                frm.ShowDialog();
                this.Hide();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


    }
}
