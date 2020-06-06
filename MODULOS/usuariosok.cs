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

namespace PuntoDeVenta
{
    public partial class usuariosok : Form
    {
        public usuariosok()
        {
            InitializeComponent();
        }

        private void usuariosok_Load(object sender, EventArgs e)
        {
            panel4.Visible = false;
            panelIcono.Visible = false;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text != "")
            {
                try
                {
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = Modulos.Conexion.ConexionMaestra.conexion;
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd = new SqlCommand("insertar_usuario", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nombres", txtNombre.Text);
                    cmd.Parameters.AddWithValue("@Login", txtUsuario.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    cmd.Parameters.AddWithValue("@Correo", txtCorreo.Text);
                    cmd.Parameters.AddWithValue("@Rol", cbRol.Text);
                    System.IO.MemoryStream ms = new System.IO.MemoryStream();
                    // Icono.Image.Save(ms, Icono.Image.RawFormat);        // Transformacion de datos de imagen para SQLServer


                    cmd.Parameters.AddWithValue("@Icono", ms.GetBuffer());
                    cmd.Parameters.AddWithValue("@NombreIcono", lblNumeroIcono.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    mostrar();
                    panel4.Visible = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);

                }

            }
        }

        private void mostrar()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Modulos.Conexion.ConexionMaestra.conexion;
                con.Open();

                da = new SqlDataAdapter("mostrar_usuario", con);
                da.Fill(dt);
                dataListado.DataSource = dt;
                con.Close();

                dataListado.Columns[1].Visible = false;
                dataListado.Columns[5].Visible = false;
                dataListado.Columns[6].Visible = false;
                dataListado.Columns[7].Visible = false;
                dataListado.Columns[8].Visible = false;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }


        }


        private void pictureBox4_Click(object sender, EventArgs e)
        {
            /*ICONO.Image = pictureBox4.Image;
            lblnumeroIcono.Text = "2";
            LblAnuncioIcono.Visible = false;
            panelICONO.Visible = false;*/
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblAnuncioIcono_Click_1(object sender, EventArgs e)
        {
            panelIcono.Visible = true;
        }



        private void PictureBox2_Click(object sender, EventArgs e)
        {
            panel4.Visible = true;
        }

        private void datalistado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
