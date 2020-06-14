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

namespace SGM.Modulos
{
    public partial class Login : Form
    {
        int contador;
        public Login()
        {
            InitializeComponent();
            
        }
        public void DibujarUsuarios()
        {
            ConexionMaestra.conexion.Open();
            // con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("select * from Usuarios WHERE Estado = 'ACTIVO'", ConexionMaestra.conexion);
            // cmd.CommandType = CommandType.StoredProcedure;

            // SqlConnection con = new SqlConnection();
            // con.ConnectionString = CONEXION.CONEXIONMAESTRA.conexion;
            // con.Open();
            // SqlCommand cmd = new SqlCommand();
            // cmd = new SqlCommand("select * from USUARIO2 WHERE Estado = 'ACTIVO'", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Label b = new Label();
                Panel p1 = new Panel();
                PictureBox I1 = new PictureBox();

                b.Text = rdr["Login"].ToString();
                b.Name = rdr["idUsuario"].ToString();
                b.Size = new System.Drawing.Size(175, 25);
                b.Font = new System.Drawing.Font("Microsoft Sans Serif", 13);
                b.BackColor = Color.FromArgb(20, 20, 20);
                b.ForeColor = Color.White;
                b.Dock = DockStyle.Bottom;
                b.TextAlign = ContentAlignment.MiddleCenter;
                b.Cursor = Cursors.Hand;

                p1.Size = new System.Drawing.Size(155, 167);
                p1.BorderStyle = BorderStyle.None;
                p1.BackColor = Color.FromArgb(20, 20, 20);


                I1.Size = new System.Drawing.Size(175, 132);
                I1.Dock = DockStyle.Top;
                I1.BackgroundImage = null;
                byte[] bi = (Byte[])rdr["Icono"];
                MemoryStream ms = new MemoryStream(bi);
                I1.Image = Image.FromStream(ms);
                I1.SizeMode = PictureBoxSizeMode.Zoom;
                I1.Tag = rdr["Login"].ToString();
                I1.Cursor = Cursors.Hand;

                p1.Controls.Add(b);
                p1.Controls.Add(I1);
                b.BringToFront();
                flowLayoutPanel1.Controls.Add(p1);

                b.Click += new EventHandler(mieventoLabel);
                I1.Click += new EventHandler(miEventoImagen);
            }
            ConexionMaestra.conexion.Close();


        }
        private void miEventoImagen(System.Object sender, EventArgs e)
        {
            txtlogin.Text = ((PictureBox)sender).Tag.ToString();
            panel3.Visible = true;
            panel1.Visible = false;
        }

        private void mieventoLabel(System.Object sender, EventArgs e)
        {
            txtlogin.Text = ((Label)sender).Text;
            panel3.Visible = true;
            panel1.Visible = false;
        }
        private void Login_Load(object sender, EventArgs e)
        {
            DibujarUsuarios();
            panel3.Visible = false;
            timer1.Start();
        }

        private void txtpassword_Paint(object sender, PaintEventArgs e)
        {
            Iniciar_sesion_correcto();
        }
        
        private void flowLayoutPanel1_Click(object sender, EventArgs e)
        {

        }

        private void txtpassword_TextChanged(object sender, EventArgs e)
        {
           Iniciar_sesion_correcto();
        }
    private void Iniciar_sesion_correcto()
    {
       cargarusuarios();
       contar();


       if (contador > 0)
       {
           Caja.AperturaCaja formAperturaCaja = new Caja.AperturaCaja();

           this.Hide();
           formAperturaCaja.ShowDialog();
           //formulario_apertura_de_caja.ShowDialog();
       }

    }

    private void contar()
    {
       int x;

       x = datalistado.Rows.Count;
       contador = (x);

    }
    private void cargarusuarios()
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
                cmd.CommandType = CommandType.StoredProcedure;

                da = new SqlDataAdapter("validar_usuario", ConexionMaestra.conexion);
           da.SelectCommand.CommandType = CommandType.StoredProcedure;
           da.SelectCommand.Parameters.AddWithValue("@password", txtpassword.Text);
           da.SelectCommand.Parameters.AddWithValue("@login", txtlogin.Text);

           da.Fill(dt);
           datalistado.DataSource = dt;
                //con.Close();
                ConexionMaestra.conexion.Close();
            }
            catch (Exception ex)
       {
           MessageBox.Show(ex.Message);

       }



    }

        private void button1_Click(object sender, EventArgs e)
        {
            PanelRestaurarCuenta.Visible = true;
            mostrar_correos();
        }

        private void mostrar_correos()
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

                da = new SqlDataAdapter("select Correo from Usuarios where Estado='ACTIVO'", ConexionMaestra.conexion);

                da.Fill(dt);
                txtcorreo.DisplayMember = "Correo";
                txtcorreo.ValueMember = "Correo";
                txtcorreo.DataSource = dt;
                ConexionMaestra.conexion.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }



        }

        private void Button4_Click(object sender, EventArgs e)
        {
            PanelRestaurarCuenta.Visible = false;
        }

        private void Button3_Click(object sender, EventArgs e)
        {
            mostrarUsuariosCorreo();
            richTextBox1.Text = richTextBox1.Text.Replace("@pass", lblResultadoContraseña.Text);
            enviarCorreo("sgmtucuman@gmail.com", "luna3290", richTextBox1.Text, "Solicitud de Contraseña", txtcorreo.Text, "");
        }

        internal void enviarCorreo(string emisor, string password, string mensaje, string asunto, string destinatario, string ruta)
        {
            try
            {
                MailMessage correos = new MailMessage();
                SmtpClient envios = new SmtpClient();
                correos.To.Clear();
                correos.Body = "";
                correos.Subject = "";
                correos.Body = mensaje;
                correos.Subject = asunto;
                correos.IsBodyHtml = true;
                correos.To.Add((destinatario));
                correos.From = new MailAddress(emisor);
                envios.Credentials = new NetworkCredential(emisor, password);

                envios.Host = "smtp.gmail.com";
                envios.Port = 587;
                envios.EnableSsl = true;

                envios.Send(correos);
                lblEstado_de_envio.Text = "ENVIADO";
                MessageBox.Show("Contraseña Enviada, revisa tu correo Electronico", "Restauracion de contraseña", MessageBoxButtons.OK, MessageBoxIcon.Information);
                PanelRestaurarCuenta.Visible = false;

            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR, revisa tu correo Electronico", "Restauracion de contraseña", MessageBoxButtons.OK, MessageBoxIcon.Information);

                lblEstado_de_envio.Text = "Correo no registrado";
            }

        }

        private void mostrarUsuariosCorreo()
        {
            try
            {
                string resultado;
                // SqlConnection con = new SqlConnection();
                //con.ConnectionString = CONEXION.CONEXIONMAESTRA.conexion;

                ConexionMaestra.conexion.Open();
                // con.Open();
                SqlCommand cmd = new SqlCommand();
                // cmd = new SqlCommand("insertar_usuario", ConexionMaestra.conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlCommand da = new SqlCommand("buscarUsuarioCorreo", ConexionMaestra.conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                // da.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@correo", txtcorreo.Text);

                ConexionMaestra.conexion.Open();


                // con.Open();
                lblResultadoContraseña.Text = Convert.ToString(da.ExecuteScalar());
                ConexionMaestra.conexion.Close();

//                 con.Close();



            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }



        }

        private void timer1_Tick(object sender, EventArgs e)
        {


            timer1.Stop();
            try
            {

                ManagementObjectSearcher MOS = new ManagementObjectSearcher("Select * From Win32_BaseBoard");
                foreach (ManagementObject getserial in MOS.Get())
                {
                    lblSerialPc.Text = getserial.Properties["SerialNumber"].Value.ToString();

                    MostrarCajaSerial();
                    try
                    {
                        // txtidcaja.Text = datalistado_caja.SelectedCells[1].Value.ToString(); // Solo para pruebas
                        lblcaja.Text = dataGridView1.SelectedCells[2].Value.ToString();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
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

                ConexionMaestra.conexion.Open();
                // con.Open();
                SqlCommand cmd = new SqlCommand();
                // cmd = new SqlCommand("select * from Usuarios WHERE Estado = 'ACTIVO'", ConexionMaestra.conexion);
                // cmd.CommandType = CommandType.StoredProcedure;

                // SqlConnection con = new SqlConnection();
                // con.ConnectionString = CONEXION.CONEXIONMAESTRA.conexion;
                // con.Open();
                // SqlCommand cmd = new SqlCommand();
                // cmd = new SqlCommand("select * from USUARIO2 WHERE Estado = 'ACTIVO'", con);
                SqlDataReader rdr = cmd.ExecuteReader();

                da = new SqlDataAdapter("mostrar_cajas_por_Serial_de_DiscoDuro", ConexionMaestra.conexion);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@Serial", lblSerialPc.Text);
                da.Fill(dt);
                dataGridView1.DataSource = dt;
                ConexionMaestra.conexion.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }


        }
    }
    }
