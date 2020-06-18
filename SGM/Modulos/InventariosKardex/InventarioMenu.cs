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
using System.Globalization;
using System.Data.OleDb;
using System.IO;
using System.Threading;

namespace SGM.Modulos.InventariosKardex
{
    public partial class InventarioMenu : Form
    {
        public InventarioMenu()
        {
            InitializeComponent();
        }

        private void buscarProductosMovimientos()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();

                da = new SqlDataAdapter("buscarProductosKardex", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@letrab", txtbuscarMovimiento.Text);
                da.Fill(dt);
                DATALISTADO_PRODUCTOS_Movimientos.DataSource = dt;
                con.Close();


                DATALISTADO_PRODUCTOS_Movimientos.Columns[1].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[3].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[4].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[5].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[6].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[7].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[8].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[9].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[10].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[11].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[12].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[13].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[14].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[15].Visible = false;
                DATALISTADO_PRODUCTOS_Movimientos.Columns[16].Visible = false;

                Conexion.TamañoAutomaticoDatatable.Multilinea(ref DATALISTADO_PRODUCTOS_Movimientos);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void mostrarInventariosBajoMinimo()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();

                da = new SqlDataAdapter("MOSTRAR_Inventarios_bajo_minimo", con);

                da.Fill(dt);
                datalistadoInventarioBAJO.DataSource = dt;
                con.Close();


                datalistadoInventarioBAJO.Columns[0].Visible = false;
                datalistadoInventarioBAJO.Columns[4].Visible = false;
                datalistadoInventarioBAJO.Columns[7].Visible = false;
                datalistadoInventarioBAJO.Columns[8].Visible = false;
                datalistadoInventarioBAJO.Columns[9].Visible = false;

                Conexion.TamañoAutomaticoDatatable.Multilinea(ref datalistadoInventarioBAJO);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void txtbuscarMovimiento_TextChanged(object sender, EventArgs e)
        {
            if (txtbuscarMovimiento.Text == "Buscar producto" | txtbuscarMovimiento.Text == "")
            {
                DATALISTADO_PRODUCTOS_Movimientos.Visible = false;

            }
            else
            {
                DATALISTADO_PRODUCTOS_Movimientos.Visible = true;
                buscarProductosMovimientos();
            }



        }

        private void DATALISTADO_PRODUCTOS_Movimientos_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void DATALISTADO_PRODUCTOS_Movimientos_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtbuscarMovimiento.Text = DATALISTADO_PRODUCTOS_Movimientos.SelectedCells[2].Value.ToString();
            DATALISTADO_PRODUCTOS_Movimientos.Visible = false;
            buscarMovimientosKardex();
        }
        private void buscarMovimientosKardex()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();

                da = new SqlDataAdapter("buscarMovimientosKardex", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@idProducto", DATALISTADO_PRODUCTOS_Movimientos.SelectedCells[1].Value.ToString());
                da.Fill(dt);
                DatalistadoMovimientos.DataSource = dt;
                con.Close();


                DatalistadoMovimientos.Columns[0].Visible = false;
                DatalistadoMovimientos.Columns[10].Visible = false;
                DatalistadoMovimientos.Columns[11].Visible = false;
                Conexion.TamañoAutomaticoDatatable.Multilinea(ref DatalistadoMovimientos);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void buscarMovimientosFiltros()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();

                da = new SqlDataAdapter("buscarMovimientosKardexFiltros", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@fecha", txtfechaM.Value);
                da.SelectCommand.Parameters.AddWithValue("@tipo", txtTipoMovi.Text);
                da.SelectCommand.Parameters.AddWithValue("@Id_usuario", txtIdusuario.Text);


                da.Fill(dt);
                DatalistadoMovimientos.DataSource = dt;
                con.Close();


                DatalistadoMovimientos.Columns[0].Visible = false;
                DatalistadoMovimientos.Columns[10].Visible = false;
                DatalistadoMovimientos.Columns[11].Visible = false;

                DatalistadoMovimientos.Columns[9].Visible = false;
                DatalistadoMovimientos.Columns[13].Visible = false;
                DatalistadoMovimientos.Columns[14].Visible = false;
                DatalistadoMovimientos.Columns[12].Visible = false;
                Conexion.TamañoAutomaticoDatatable.Multilinea(ref DatalistadoMovimientos);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        private void buscarMovimientosFiltrosAcumulado()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();

                da = new SqlDataAdapter("buscarMovimientosKardexFiltrosAcumulado", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@fecha", txtfechaM.Value);
                da.SelectCommand.Parameters.AddWithValue("@tipo", txtTipoMovi.Text);
                da.SelectCommand.Parameters.AddWithValue("@Id_usuario", txtIdusuario.Text);


                da.Fill(dt);
                DatalistadoMovimientosACUMULADO_PRODUCTO.DataSource = dt;
                con.Close();


                DatalistadoMovimientosACUMULADO_PRODUCTO.Columns[4].Visible = false;
                DatalistadoMovimientosACUMULADO_PRODUCTO.Columns[5].Visible = false;
                DatalistadoMovimientosACUMULADO_PRODUCTO.Columns[6].Visible = false;

                Conexion.TamañoAutomaticoDatatable.Multilinea(ref DatalistadoMovimientosACUMULADO_PRODUCTO);
                DataGridViewCellStyle styCabeceras = new DataGridViewCellStyle();
                styCabeceras.BackColor = System.Drawing.Color.FromArgb(26, 115, 232);
                styCabeceras.ForeColor = System.Drawing.Color.White;
                styCabeceras.Font = new Font("Segoe UI", 10, FontStyle.Bold);
                DatalistadoMovimientosACUMULADO_PRODUCTO.ColumnHeadersDefaultCellStyle = styCabeceras;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void ToolStripMenuItem4_Click(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
            DATALISTADO_PRODUCTOS_Movimientos.Visible = false;
            txtTipoMovi.Text = "-Todos-";
            buscarMovimientosFiltros();
            buscarMovimientosFiltrosAcumulado();
            panel7.Visible = true;
            MenuStrip2.Visible = false;
            MenuStrip6.Visible = false;
        }

        private void ToolStripMenuItem3_Click(object sender, EventArgs e)
        {

        }

        private void tver_Click(object sender, EventArgs e)
        {
            panel7.Visible = false;
            groupBox1.Visible = false;
            buscarMovimientosKardex();
            txtTipoMovi.Text = "-Todos-";
            txtbuscarMovimiento.Text = "Buscar producto";
            MenuStrip2.Visible = true;
            MenuStrip6.Visible = true;
        }

        private void txtfechaM_ValueChanged(object sender, EventArgs e)
        {
            if (groupBox1.Visible == true)
            {
                buscarMovimientosFiltros();
                buscarMovimientosFiltrosAcumulado();
                
            }


        }

        private void txtTipoMovi_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (groupBox1.Visible == true)
            {
                buscarMovimientosFiltros();
                buscarMovimientosFiltrosAcumulado();
            }
        }

        private void txtUSUARIOS_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (groupBox1.Visible == true)
            {
                Buscar_id_USUARIOS();
                buscarMovimientosFiltros();
                buscarMovimientosFiltrosAcumulado();
            }
        }

        internal void Buscar_id_USUARIOS()
        {

            string resultado;
            string queryMoneda;
            queryMoneda = "Buscar_id_USUARIOS";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Conexion.ConexionMaestra.conexion;

            SqlCommand comMoneda = new SqlCommand(queryMoneda, con);
            comMoneda.CommandType = CommandType.StoredProcedure;
            comMoneda.Parameters.AddWithValue("@Nombre_y_Apelllidos", txtUSUARIOS.Text);
            try
            {
                con.Open();
                resultado = Convert.ToString(comMoneda.ExecuteScalar()); //asignamos el valor del importe
                txtIdusuario.Text = resultado;
                con.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                resultado = "";
            }
        }
        private void buscar_usuario()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();

                da = new SqlDataAdapter("select * from usuarios", con);

                da.Fill(dt);
                txtUSUARIOS.DisplayMember = "Nombres_y_Apellidos";
                txtUSUARIOS.ValueMember = "idUsuario";

                txtUSUARIOS.DataSource = dt;
                //txtIdusuario.Text = txtUSUARIOS.ValueMember;

                con.Close();
                Buscar_id_USUARIOS();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);

            }


        }
        private void INVENTARIO_MENU_Load(object sender, EventArgs e)
        {
            buscar_usuario();

        }

        private void Label6_Click(object sender, EventArgs e)
        {

        }

        private void TNOTAS_Click(object sender, EventArgs e)
        {
            mostrarInventariosBajoMinimo();
        }

        private void TNOTAS_Click_1(object sender, EventArgs e)
        {
            mostrarInventariosBajoMinimo();
        }

        private void panel11_Paint(object sender, PaintEventArgs e)
        {

        }

        private void txtbuscar_inventarios_TextChanged(object sender, EventArgs e)
        {
            if (txtbuscar_inventarios.Text != "Buscar...")
            {
                mostrarInventarioTodos();
            }
        }

        internal void sumarCostoInventarioContarProductos()
        {


            string resultado;
            string queryMoneda;
            queryMoneda = "SELECT Moneda  FROM EMPRESA";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Conexion.ConexionMaestra.conexion;
            SqlCommand comMoneda = new SqlCommand(queryMoneda, con);
            try
            {
                con.Open();
                resultado = Convert.ToString(comMoneda.ExecuteScalar()); //asignamos el valor del importe
                con.Close();
            }
            catch (Exception ex)
            {
                con.Close();
                resultado = "";
            }

            string importe;
            string query;
            query = "SELECT CONVERT(NUMERIC(18,2),sum(Productos.precioCompra * Stock )) as suma FROM  Productos where usaInventarios ='SI'";

            SqlCommand com = new SqlCommand(query, con);
            try
            {
                con.Open();
                importe = Convert.ToString(com.ExecuteScalar()); //asignamos el valor del importe
                con.Close();
                lblcostoInventario.Text = resultado + " " + importe;
            }
            catch (Exception ex)
            {
                con.Close();
                MessageBox.Show(ex.Message);

                lblcostoInventario.Text = resultado + " " + 0;
            }

            string conteoresultado;
            string querycontar;
            querycontar = "select count(idProducto) from Productos";
            SqlCommand comcontar = new SqlCommand(querycontar, con);
            try
            {
                con.Open();
                conteoresultado = Convert.ToString(comcontar.ExecuteScalar()); //asignamos el valor del importe
                con.Close();
                lblcantidaddeProductosEnInventario.Text = conteoresultado;
            }
            catch (Exception ex)
            {
                con.Close();
                MessageBox.Show(ex.Message);

                conteoresultado = "";
                lblcantidaddeProductosEnInventario.Text = "0";
            }

        }

        private void mostrarInventarioTodos()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter da;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Conexion.ConexionMaestra.conexion;
                con.Open();

                da = new SqlDataAdapter("mostrarInventarioTodos", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@letra", txtbuscar_inventarios.Text);

                da.Fill(dt);
                datalistadoInventariosReport.DataSource = dt;
                con.Close();


                datalistadoInventariosReport.Columns[0].Visible = false;
                datalistadoInventariosReport.Columns[9].Visible = false;
                datalistadoInventariosReport.Columns[10].Visible = false;

                Conexion.TamañoAutomaticoDatatable.Multilinea(ref datalistadoInventariosReport);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void TOTROSPAGOS_Click(object sender, EventArgs e)
        {
            sumarCostoInventarioContarProductos();
        }

        private void toolStripMenuItem5_Click(object sender, EventArgs e)
        {
            txtbuscar_inventarios.Clear();
            mostrarInventarioTodos();
        }

        private void datalistadoInventariosReport_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
