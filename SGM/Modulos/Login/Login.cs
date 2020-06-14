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
        int contadorCajas;
        int contador_Movimientos_de_caja;
        public Login()
        {
            InitializeComponent();

        }
        public void dibujarUsuarios()
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
        private void mostrarPermisos()
        {
            // SqlCommand cmd = new SqlCommand();
            // cmd.CommandType = CommandType.StoredProcedure;

            SqlCommand com = new SqlCommand("mostrarPermisosUsuarioRol", ConexionMaestra.conexion);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@LOGIN", txtlogin.Text);
            string importe;
            try
            {
                ConexionMaestra.conexion.Open();

                importe = Convert.ToString(com.ExecuteScalar());
                ConexionMaestra.conexion.Close();

                //lblRol.Text = importe;
            }
            catch (Exception ex)
            {

            }
        }
        private void miEventoImagen(System.Object sender, EventArgs e)
        {
            txtlogin.Text = ((PictureBox)sender).Tag.ToString();
            panel3.Visible = true;
            panel1.Visible = false;
            mostrarPermisos();
        }

        private void mieventoLabel(System.Object sender, EventArgs e)
        {
            txtlogin.Text = ((Label)sender).Text;
            panel3.Visible = true;
            panel1.Visible = false;
            mostrarPermisos();
        }
        private void Login_Load(object sender, EventArgs e)
        {
            dibujarUsuarios();
            panel3.Visible = false;
            timer1.Start();
        }

        private void txtpassword_Paint(object sender, PaintEventArgs e)
        {
            iniciarSesionCorrecto();
        }

        private void flowLayoutPanel1_Click(object sender, EventArgs e)
        {

        }

        private void listarAperturaDetalleCierreCaja()
        {
            try
            {

                DataTable dt = new DataTable();
                SqlDataAdapter da;
                ConexionMaestra.conexion.Open();
                SqlCommand cmd = new SqlCommand();
                // cmd = new SqlCommand("insertar_usuario", ConexionMaestra.conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                da = new SqlDataAdapter("mostrarMovimientoCajaSerial", ConexionMaestra.conexion);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@serial", lblSerialPc.Text);
                da.Fill(dt);
                datalistado_detalle_cierre_de_caja.DataSource = dt;
                ConexionMaestra.conexion.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }


        }

        private void txtpassword_TextChanged(object sender, EventArgs e)
        {
            iniciarSesionCorrecto();
        }

        private void iniciarSesionCorrecto()
        {
            cargarusuarios();
            contar();
            try
            {
                // IDUSUARIO.Text = datalistado.SelectedCells[1].Value.ToString();
                // txtnombre.Text = datalistado.SelectedCells[2].Value.ToString();
            }
            catch
            {

            }

            if (contador > 0)
            {
                listarAperturaDetalleCierreCaja();
                contarAperturaDetalleCierreCaja();
                
                if (contadorCajas == 0 & lblRol.Text != "Solo Ventas (no esta autorizado para manejar dinero)")
                {
                    aperturaDetalleCierreCaja();
                    lblApertura_De_caja.Text = "Nuevo*****";
                    timer2.Start();

                }
                else
                {
                    if (lblRol.Text != "Solo Ventas (no esta autorizado para manejar dinero)")
                    {
                        mostrarMovimientosCajaSerialUsuario();

                        contarMostrarMovimientoscajaSerialUsuario();
                        try
                        {
                            lblusuario_queinicioCaja.Text = datalistado_detalle_cierre_de_caja.SelectedCells[1].Value.ToString();
                            lblnombredeCajero.Text = datalistado_detalle_cierre_de_caja.SelectedCells[2].Value.ToString();
                        }
                        catch
                        {

                        }
                        if (contador_Movimientos_de_caja == 0)
                        {

                            if (lblusuario_queinicioCaja.Text != "admin" & txtlogin.Text == "admin")
                            {
                                MessageBox.Show("Continuaras Turno de *" + lblnombredeCajero.Text + " Todos los Registros seran con ese Usuario", "Caja Iniciada", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                lblpermisodeCaja.Text = "correcto";
                            }
                            if (lblusuario_queinicioCaja.Text == "admin" & txtlogin.Text == "admin")
                            {

                                lblpermisodeCaja.Text = "correcto";
                            }

                            else if (lblusuario_queinicioCaja.Text != txtlogin.Text)
                            {
                                MessageBox.Show("Para poder continuar con el Turno de *" + lblnombredeCajero.Text + "* ,Inicia sesion con el Usuario " + lblusuario_queinicioCaja.Text + " -ó-el Usuario *admin*", "Caja Iniciada", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                lblpermisodeCaja.Text = "vacio";

                            }
                            else if (lblusuario_queinicioCaja.Text == txtlogin.Text)
                            {
                                lblpermisodeCaja.Text = "correcto";
                            }
                        }
                        else
                        {
                            lblpermisodeCaja.Text = "correcto";
                        }

                        if (lblpermisodeCaja.Text == "correcto")
                        {
                            lblApertura_De_caja.Text = "Aperturado";
                            timer2.Start();

                        }

                    }
                    else
                    {
                        timer2.Start();
                    }


                }

            }

        }
        private void mostrarMovimientosCajaSerialUsuario()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                // SqlCommand cmd = new SqlCommand();
                // cmd.CommandType = CommandType.StoredProcedure;
                ConexionMaestra.conexion.Open();

                da = new SqlDataAdapter("mostrarMovimientoCajaSerialUsuario", ConexionMaestra.conexion);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.AddWithValue("@serial", lblSerialPc.Text);
                da.SelectCommand.Parameters.AddWithValue("@idusuario", IDUSUARIO.Text);
                da.Fill(dt);
                datalistado_movimientos_validar.DataSource = dt;
                ConexionMaestra.conexion.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }


        }
        private void contarMostrarMovimientoscajaSerialUsuario()
        {
            int x;

            x = datalistado_movimientos_validar.Rows.Count;
            contador_Movimientos_de_caja = (x);

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
                // SqlCommand cmd = new SqlCommand();
                // cmd.CommandType = CommandType.StoredProcedure;
                ConexionMaestra.conexion.Open();

                da = new SqlDataAdapter("validarUsuario", ConexionMaestra.conexion);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.AddWithValue("@password", txtpassword.Text);
                da.SelectCommand.Parameters.AddWithValue("@login", txtlogin.Text);

                da.Fill(dt);
                datalistado.DataSource = dt;
                ConexionMaestra.conexion.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
        }
        private void mostrarCorreos()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                // SqlCommand cmd = new SqlCommand();
                // cmd.CommandType = CommandType.StoredProcedure;
                ConexionMaestra.conexion.Open();

                da = new SqlDataAdapter("select Correo from Usuarios where Estado='ACTIVO", ConexionMaestra.conexion);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

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

        private void button1_Click(object sender, EventArgs e)
        {
            PanelRestaurarCuenta.Visible = true;
            mostrar_correos();

        }

        private void Button4_Click(object sender, EventArgs e)
        {
            PanelRestaurarCuenta.Visible = false;

        }
        private void mostrarUsuariosPorCorreo()
        {
            try
            {
                string resultado;
                // SqlConnection con = new SqlConnection();
                // con.ConnectionString = CONEXION.CONEXIONMAESTRA.conexion;
                SqlCommand da = new SqlCommand("buscarUsuarioCorreo", ConexionMaestra.conexion);
                da.CommandType = CommandType.StoredProcedure;
                da.Parameters.AddWithValue("@correo", txtcorreo.Text);

                ConexionMaestra.conexion.Open();
                // con.Open();
                lblResultadoContraseña.Text = Convert.ToString(da.ExecuteScalar());
                ConexionMaestra.conexion.Close();



            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }



        }
        private void contarAperturaDetalleCierreCaja()
        {
            int x;

            x = datalistado_detalle_cierre_de_caja.Rows.Count;
            contadorCajas = (x);

        }

        private void aperturaDetalleCierreCaja()
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;

                // SqlCommand com = new SqlCommand("insertarDetalleCierreCaja", ConexionMaestra.conexion);
                // com.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@fechaini", DateTime.Today);
                cmd.Parameters.AddWithValue("@fechafin", DateTime.Today);
                cmd.Parameters.AddWithValue("@fechacierre", DateTime.Today);
                cmd.Parameters.AddWithValue("@ingresos", "0.00");
                cmd.Parameters.AddWithValue("@egresos", "0.00");
                cmd.Parameters.AddWithValue("@saldo", "0.00");
                cmd.Parameters.AddWithValue("@idusuario", IDUSUARIO.Text);
                cmd.Parameters.AddWithValue("@totalcaluclado", "0.00");
                cmd.Parameters.AddWithValue("@totalreal", "0.00");

                cmd.Parameters.AddWithValue("@estado", "CAJA APERTURADA");
                cmd.Parameters.AddWithValue("@diferencia", "0.00");
                cmd.Parameters.AddWithValue("@id_caja", txtidcaja.Text);

                cmd.ExecuteNonQuery();
                ConexionMaestra.conexion.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
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
                // SqlCommand cmd = new SqlCommand();
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
        private void mostrarCajaserial()
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
                // SqlCommand cmd = new SqlCommand();
                // cmd = new SqlCommand("insertar_usuario", ConexionMaestra.conexion);
                // cmd.CommandType = CommandType.StoredProcedure;

                da = new SqlDataAdapter("mostrarCajasSerialDisco", ConexionMaestra.conexion);

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
        private void mostrarUsuariosCorreo()
        {
            try
            {
                string resultado;
                // SqlConnection con = new SqlConnection();
                //con.ConnectionString = CONEXION.CONEXIONMAESTRA.conexion;

                ConexionMaestra.conexion.Open();
                // con.Open();
                // SqlCommand cmd = new SqlCommand();
                // cmd = new SqlCommand("insertar_usuario", ConexionMaestra.conexion);
                // cmd.CommandType = CommandType.StoredProcedure;

                SqlCommand da = new SqlCommand("buscarUsuarioCorreo", ConexionMaestra.conexion);
                da.CommandType = CommandType.StoredProcedure;

                // da.CommandType = CommandType.StoredProcedure;
                da.Parameters.AddWithValue("@correo", txtcorreo.Text);

                // ConexionMaestra.conexion.Open();


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

                da = new SqlDataAdapter("mostrarCajaSerialDisco", ConexionMaestra.conexion);
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

        private void btn0_Click(object sender, EventArgs e)
        {
            txtpassword.Text = txtpassword.Text + "0";
        }

        private void btn1_Click(object sender, EventArgs e)
        {
            txtpassword.Text = txtpassword.Text + "1";
        }

        private void btn2_Click(object sender, EventArgs e)
        {
            txtpassword.Text = txtpassword.Text + "2";
        }

        private void btn3_Click(object sender, EventArgs e)
        {
            txtpassword.Text = txtpassword.Text + "3";
        }

        private void btn4_Click(object sender, EventArgs e)
        {
            txtpassword.Text = txtpassword.Text + "4";
        }

        private void btn5_Click(object sender, EventArgs e)
        {
            txtpassword.Text = txtpassword.Text + "5";
        }

        private void btn6_Click(object sender, EventArgs e)
        {
            txtpassword.Text = txtpassword.Text + "6";
        }

        private void btn7_Click(object sender, EventArgs e)
        {
            txtpassword.Text = txtpassword.Text + "7";
        }

        private void btn8_Click(object sender, EventArgs e)
        {
            txtpassword.Text = txtpassword.Text + "8";
        }

        private void btn9_Click(object sender, EventArgs e)
        {
            txtpassword.Text = txtpassword.Text + "9";
        }

        private void btnborrartodo_Click(object sender, EventArgs e)
        {
            txtpassword.Clear();
        }

        private void btnborrarderecha_Click(object sender, EventArgs e)
        {
            try
            {
                int largo;
                if (txtpassword.Text != "")
                {
                    largo = txtpassword.Text.Length;
                    txtpassword.Text = Mid(txtpassword.Text, 1, largo - 1);
                }
            }
            catch
            {

            }
        }

        public static string Mid(string param, int startIndex, int length)
        {
            string result = param.Substring(startIndex, length);
            return result;
        }

        private void tver_Click(object sender, EventArgs e)
        {

            txtpassword.PasswordChar = '\0';
            tocultar.Visible = true;
            tver.Visible = false;
        }

        private void tocultar_Click(object sender, EventArgs e)
        {
            txtpassword.PasswordChar = '*';
            tocultar.Visible = false;
            tver.Visible = true;
        }

        private void btn_insertar_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Usuario o contraseña Incorrectos", "Datos Incorrectos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            if (progressBar1.Value < 100)
            {
                BackColor = Color.FromArgb(26, 26, 26);
                progressBar1.Value = progressBar1.Value + 10;
                // PictureBox2.Visible = true;

            }
            else
            {
                progressBar1.Value = 0;
                timer2.Stop();
                if (lblApertura_De_caja.Text == "Nuevo*****" & lblRol.Text != "Solo Ventas (no esta autorizado para manejar dinero)")
                {
                    this.Hide();
                    Caja.AperturaCaja frm = new Caja.AperturaCaja();
                    frm.ShowDialog();
                    this.Hide();
                }
                else
                {
                    this.Hide();
                    Ventas.VentasMenuPrincipal frm = new Ventas.VentasMenuPrincipal();
                    frm.ShowDialog();
                    this.Hide();

                }

            }
        }

    }
}
