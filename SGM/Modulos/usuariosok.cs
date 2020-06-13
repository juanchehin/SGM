using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;
using System.Drawing;


namespace SGM
{
    public partial class usuariosok : Form
    {
        public usuariosok()
        {
            InitializeComponent();
            // this.mostrar();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void CargarEstadoDeIconos()
        {
            try
            {
                foreach (DataGridViewRow row in datalistado.Rows)
                {

                    try
                    {

                        string Icono = Convert.ToString(row.Cells["NombreDeIcono"].Value);

                        if (Icono == "1")
                        {
                            pictureBox3.Visible = false;
                        }
                        else if (Icono == "2")
                        {
                            pictureBox4.Visible = false;
                        }
                        else if (Icono == "3")
                        {
                            pictureBox5.Visible = false;
                        }
                        else if (Icono == "4")
                        {
                            pictureBox6.Visible = false;
                        }
                        else if (Icono == "5")
                        {
                            pictureBox7.Visible = false;
                        }
                        else if (Icono == "6")
                        {
                            pictureBox8.Visible = false;
                        }
                        else if (Icono == "7")
                        {
                            pictureBox9.Visible = false;
                        }
                        else if (Icono == "8")
                        {
                            pictureBox10.Visible = false;
                        }
                    }
                    catch (Exception ex)
                    {


                    }


                }
            }
            catch (Exception ex)
            {

            }
        }
        public bool validar_Mail(string sMail)
        {
            return Regex.IsMatch(sMail, @"^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$");

        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (validar_Mail(txtcorreo.Text) == false)
            {
                MessageBox.Show("Dirección de correo electronico no valida, el correo debe tener el formato: nombre@dominio.com, " + " por favor seleccione un correo valido", "Validación de correo electronico", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                txtcorreo.Focus();
                txtcorreo.SelectAll();
            }
            else
            {
                if (txtnombre.Text != "")
                {
                    try
                    {
                        Console.WriteLine("Entro a btnGuardar_Click");
                        // SqlConnection con = new SqlConnection();
                        ConexionMaestra.conexion.Open();
                        // con.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd = new SqlCommand("insertar_usuario", ConexionMaestra.conexion);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@NombresApellidos", txtnombre.Text);
                        cmd.Parameters.AddWithValue("@Login", txtlogin.Text);
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                        cmd.Parameters.AddWithValue("@Correo", txtcorreo.Text);
                        cmd.Parameters.AddWithValue("@Rol", txtrol.Text);
                        System.IO.MemoryStream ms = new System.IO.MemoryStream();
                        ICONO.Image.Save(ms, ICONO.Image.RawFormat);


                        cmd.Parameters.AddWithValue("@Icono", ms.GetBuffer());
                        cmd.Parameters.AddWithValue("@NombreIcono", lblnumeroIcono.Text);
                        cmd.ExecuteNonQuery();
                        // con.Close();
                        ConexionMaestra.conexion.Close();
                        mostrar();
                        panel4.Visible = false;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);

                    }
                    Conexion.TamañoAutomaticoDatatable.Multilinea(ref datalistado);

                }
            }
           
        }
        private void mostrar()
        {
            try
            {
            DataTable dt = new DataTable();
            SqlDataAdapter da;
            // SqlConnection con = new SqlConnection();
            // con.ConnectionString = ConexionMaestra.conexion.ToString();
            // con.Open();
            ConexionMaestra.conexion.Open();
            Console.WriteLine("Entro a mostrar");
         
            da = new SqlDataAdapter("mostrar_usuario", ConexionMaestra.conexion);
            da.Fill(dt);
            datalistado.DataSource = dt;
            // con.Close();
            ConexionMaestra.conexion.Close();
                Console.WriteLine("Entro a mostrar cerrar conexion");
                datalistado.Columns[1].Visible = false;
                datalistado.Columns[5].Visible = false;
                datalistado.Columns[6].Visible = false;
                datalistado.Columns[7].Visible = false;
                datalistado.Columns[8].Visible = false;

            //    ConexionMaestra.conexion.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
            finally
            {
                ConexionMaestra.conexion.Close();
                Console.WriteLine("Entro a mostrar finally");
            }

        }

        private void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            if (txtnombre.Text != "")
            {
                try
                {
                    // SqlConnection con = new SqlConnection();
                    // con.ConnectionString = CONEXION.CONEXIONMAESTRA.conexion;
                    // con.Open();

                    // SqlConnection con = new SqlConnection();
                    ConexionMaestra.conexion.Open();
                    // con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd = new SqlCommand("editar_usuario", ConexionMaestra.conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@idUsuario", lblId_usuario.Text);
                    cmd.Parameters.AddWithValue("@NombresApellidos", txtnombre.Text);
                    cmd.Parameters.AddWithValue("@Login", txtlogin.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    cmd.Parameters.AddWithValue("@Correo", txtcorreo.Text);
                    cmd.Parameters.AddWithValue("@Rol", txtrol.Text);
                    System.IO.MemoryStream ms = new System.IO.MemoryStream();
                    ICONO.Image.Save(ms, ICONO.Image.RawFormat);


                    cmd.Parameters.AddWithValue("@Icono", ms.GetBuffer());
                    cmd.Parameters.AddWithValue("@NombreIcono", lblnumeroIcono.Text);
                    cmd.ExecuteNonQuery();
                    // con.Close();
                    ConexionMaestra.conexion.Close();
                    mostrar();
                    panel4.Visible = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);

                }

            }
        }
        private void pictureBox3_Click(object sender, EventArgs e)
        {
            ICONO.Image = pictureBox3.Image;
            lblnumeroIcono.Text = "1";
            LblAnuncioIcono.Visible = false;
            panelICONO.Visible = false;

        }

        private void LblAnuncioIcono_Click(object sender, EventArgs e)
        {
            panelICONO.Visible = true;
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            ICONO.Image = pictureBox4.Image;
            lblnumeroIcono.Text = "2";
            LblAnuncioIcono.Visible = false;
            panelICONO.Visible = false;
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            ICONO.Image = pictureBox5.Image;
            lblnumeroIcono.Text = "3";
            LblAnuncioIcono.Visible = false;
            panelICONO.Visible = false;
        }

        private void pictureBox6_Click(object sender, EventArgs e)
        {
            ICONO.Image = pictureBox6.Image;
            lblnumeroIcono.Text = "4";
            LblAnuncioIcono.Visible = false;
            panelICONO.Visible = false;
        }

        private void pictureBox7_Click(object sender, EventArgs e)
        {
            ICONO.Image = pictureBox7.Image;
            lblnumeroIcono.Text = "5";
            LblAnuncioIcono.Visible = false;
            panelICONO.Visible = false;
        }

        private void pictureBox8_Click(object sender, EventArgs e)
        {
            ICONO.Image = pictureBox8.Image;
            lblnumeroIcono.Text = "6";
            LblAnuncioIcono.Visible = false;
            panelICONO.Visible = false;
        }

        private void pictureBox9_Click(object sender, EventArgs e)
        {
            ICONO.Image = pictureBox9.Image;
            lblnumeroIcono.Text = "7";
            LblAnuncioIcono.Visible = false;
            panelICONO.Visible = false;
        }

        private void flowLayoutPanel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void pictureBox10_Click(object sender, EventArgs e)
        {
            ICONO.Image = pictureBox10.Image;
            lblnumeroIcono.Text = "8";
            LblAnuncioIcono.Visible = false;
            panelICONO.Visible = false;
        }

        private void usuariosok_Load(object sender, EventArgs e)
        {
            panel4.Visible = false;
            panelICONO.Visible = false;
            mostrar();
        }

        private void PictureBox2_Click(object sender, EventArgs e)
        {
            panel4.Visible = true;
            LblAnuncioIcono.Visible = true;
            txtnombre.Text = "";
            txtlogin.Text = "";
            txtPassword.Text = "";
            txtcorreo.Text = "";
            btnGuardar.Visible = true;
            btnGuardarCambios.Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void datalistado_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            lblId_usuario.Text = datalistado.SelectedCells[1].Value.ToString();
            txtnombre.Text = datalistado.SelectedCells[2].Value.ToString();
            txtlogin.Text = datalistado.SelectedCells[3].Value.ToString();

            txtPassword.Text = datalistado.SelectedCells[4].Value.ToString();

            ICONO.BackgroundImage = null;
            byte[] b = (Byte[])datalistado.SelectedCells[5].Value;
            MemoryStream ms = new MemoryStream(b);
            ICONO.Image = Image.FromStream(ms);

            LblAnuncioIcono.Visible = false;

            lblnumeroIcono.Text = datalistado.SelectedCells[6].Value.ToString();
            txtcorreo.Text = datalistado.SelectedCells[7].Value.ToString();
            txtrol.Text = datalistado.SelectedCells[8].Value.ToString();
            panel4.Visible = true;
            btnGuardar.Visible = false;
            btnGuardarCambios.Visible = true;
        }

        private void btnVolver_Click(object sender, EventArgs e)
        {
            panel5.Visible = false;
        }

        private void ICONO_Click(object sender, EventArgs e)
        {
            CargarEstadoDeIconos();
            panelICONO.Visible = true;
        }

        private void datalistado_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            if (e.ColumnIndex == this.datalistado.Columns["Eli"].Index)
            {
                DialogResult result;
                result = MessageBox.Show("¿Realmente desea eliminar este Usuario?", "Eliminando registros", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (result == DialogResult.OK)
                {
                    SqlCommand cmd;
                    try
                    {
                        foreach (DataGridViewRow row in datalistado.SelectedRows)
                        {

                            int onekey = Convert.ToInt32(row.Cells["idUsuario"].Value);
                            string usuario = Convert.ToString(row.Cells["Login"].Value);

                            try
                            {

                                try
                                {
                                    ConexionMaestra.conexion.Open();
                                    // con.Open();
                                    cmd = new SqlCommand("eliminar_usuario", ConexionMaestra.conexion);
                                    cmd.CommandType = CommandType.StoredProcedure;

                                    // SqlConnection con = new SqlConnection();
                                    // con.ConnectionString = CONEXION.CONEXIONMAESTRA.conexion;
                                    // con.Open();
                                   // cmd = new SqlCommand("eliminar_usuario", con);
                                    // cmd.CommandType = CommandType.StoredProcedure;

                                    cmd.Parameters.AddWithValue("@idusuario", onekey);
                                    cmd.Parameters.AddWithValue("@login", usuario);
                                    cmd.ExecuteNonQuery();

                                    // con.Close();
                                    ConexionMaestra.conexion.Close();

                                }
                                catch (Exception ex)
                                {
                                    MessageBox.Show(ex.Message);
                                }

                            }
                            catch (Exception ex)
                            {

                                MessageBox.Show(ex.Message);
                            }

                        }
                        mostrar();
                    }

                    catch (Exception ex)
                    {

                    }
                }
            }
        }

        private void pictureBox11_Click(object sender, EventArgs e)
        {
            dlg.InitialDirectory = "";
            dlg.Filter = "Imagenes|*.jpg;*.png";
            dlg.FilterIndex = 2;
            dlg.Title = "Cargador de Imagenes ADA 369";
            if (dlg.ShowDialog() == DialogResult.OK)
            {
                ICONO.BackgroundImage = null;
                ICONO.Image = new Bitmap(dlg.FileName);
                ICONO.SizeMode = PictureBoxSizeMode.Zoom;
                lblnumeroIcono.Text = Path.GetFileName(dlg.FileName);
                LblAnuncioIcono.Visible = false;
                panelICONO.Visible = false;
            }
        }

        private void buscar_usuario()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                // SqlConnection con = new SqlConnection();
                //con.ConnectionString = CONEXION.CONEXIONMAESTRA.conexion;
                // con.Open();

                ConexionMaestra.conexion.Open();
                // con.Open();
                // cmd = new SqlCommand("eliminar_usuario", ConexionMaestra.conexion);
                // cmd.CommandType = CommandType.StoredProcedure;

                da = new SqlDataAdapter("buscar_usuario", ConexionMaestra.conexion);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@letra", txtBuscar.Text);
                da.Fill(dt);
                datalistado.DataSource = dt;
                ConexionMaestra.conexion.Close();

                datalistado.Columns[1].Visible = false;
                datalistado.Columns[5].Visible = false;
                datalistado.Columns[6].Visible = false;
                datalistado.Columns[7].Visible = false;
                datalistado.Columns[8].Visible = false;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
            Conexion.TamañoAutomaticoDatatable.Multilinea(ref datalistado);

        }

        public void Numeros(System.Windows.Forms.TextBox CajaTexto, System.Windows.Forms.KeyPressEventArgs e)
        {
            if (Char.IsDigit(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsControl(e.KeyChar))
            {
                e.Handled = false;

            }
            else
            {
                e.Handled = true;

            }


        }
        private void txtbuscar_TextChanged(object sender, EventArgs e)
        {
            buscar_usuario();

        }

        private void txtPassword_KeyPress(object sender, KeyPressEventArgs e)
        {
            Numeros(txtBuscar, e);
        }

        private void btnVolver_Click_1(object sender, EventArgs e)
        {
            panel4.Visible = false;
        }
    }

}
