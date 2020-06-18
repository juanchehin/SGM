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

        private void ToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd = new SqlCommand("editarDineroCajaInicial", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id_caja", txtidcaja.Text);
                cmd.Parameters.AddWithValue("@saldo", txtmonto.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                
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

        private void txtmonto_KeyPress(object sender, KeyPressEventArgs e)
        {
            //OnlyNumber(e, false);
            //{
            //    // Si se pulsa la tecla Intro, pasar al siguiente
            //    //if( e.KeyChar == Convert.ToChar('\r') ){
            //    if (e.KeyChar == '\r')
            //    {
            //        e.Handled = true;

            //    }
            //    else if (e.KeyChar == ',')
            //    {
            //        // si se pulsa en el punto se convertirá en coma
            //        e.Handled = true;
            //        SendKeys.Send(".");
            //    }
            //}
            //CONEXION.Numeros_separadores.Separador_de_Numeros(txtmonto, e);
            //if (Char.IsDigit(e.KeyChar))
            //{
            //    e.Handled = false;
            //}
            //else if (Char.IsControl(e.KeyChar))
            //{
            //    e.Handled = false;
            //}
            //else if (char.IsSeparator('.'))
            //{
            //    e.Handled = false;

            //}
            //else if (e.KeyChar == ',')
            //{
            //    e.Handled = false;
            //}
            //else
            //{
            //    e.Handled = true;
            //}

            Conexion.NumerosSeparadores.separadorNumeros(txtmonto, e);
        }

        private void ToolStripMenuItem3_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();
                SqlCommand cmd = new SqlCommand();


                cmd = new SqlCommand("editarDineroCajaInicial", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id_caja", txtidcaja.Text);
                cmd.Parameters.AddWithValue("@saldo", 0);
                cmd.ExecuteNonQuery();
                con.Close();

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
