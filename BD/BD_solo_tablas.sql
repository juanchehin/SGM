-- CREATE LOGIN ada369 WITH PASSWORD = 'softwarereal'

GO
Use dbo ;
GO

CREATE TABLE [dbo].[Caja](
	[Id_Caja] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Tema] [varchar](50) NULL,
	[Serial_PC] [varchar](max) NULL,
	[Impresora_Ticket] [varchar](max) NULL,
	[Impresora_A4] [varchar](max) NULL,
	[Estado] [varchar](50) NULL,
	[Tipo] [varchar](50) NULL,
	[PuertoBalanza] [varchar](max) NULL,
	[EstadoBalanza] [varchar](50) NULL,
 CONSTRAINT [PK_Caja_1] PRIMARY KEY CLUSTERED 
(
	[Id_Caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idclientev] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NULL,
	[Direccion] [varchar](max) NULL,
	[IdentificadorFiscal] [varchar](max) NULL,
	[Celular] [varchar](max) NULL,
	[Estado] [varchar](50) NULL,
	[Saldo] [numeric](18, 2) NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[idclientev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conceptos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conceptos](
	[Id_concepto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Conceptos] PRIMARY KEY CLUSTERED 
(
	[Id_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControlCobros]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControlCobros](
	[IdcontrolCobro] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [numeric](18, 2) NULL,
	[Fecha] [datetime] NULL,
	[Detalle] [varchar](max) NULL,
	[IdCliente] [int] NULL,
	[IdUsuario] [int] NULL,
	[IdCaja] [int] NULL,
	[Comprobante] [varchar](max) NULL,
	[Efectivo] [numeric](18, 2) NULL,
	[Tarjeta] [numeric](18, 2) NULL,
 CONSTRAINT [PK_ControlCobros] PRIMARY KEY CLUSTERED 
(
	[IdcontrolCobro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CorreoBase]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorreoBase](
	[IdCorreo] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[EstadoEnvio] [varchar](50) NULL,
 CONSTRAINT [PK_CorreoBase] PRIMARY KEY CLUSTERED 
(
	[IdCorreo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditoPorCobrar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditoPorCobrar](
	[Id_credito] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Fecha_registro] [datetime] NULL,
	[Fecha_vencimiento] [datetime] NULL,
	[Total] [numeric](18, 2) NULL,
	[Saldo] [numeric](18, 2) NULL,
	[Estado] [varchar](max) NULL,
	[Id_caja] [int] NULL,
	[Id_cliente] [int] NULL,
 CONSTRAINT [PK_CreditoPorCobrar] PRIMARY KEY CLUSTERED 
(
	[Id_credito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditoPorPagar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditoPorPagar](
	[Id_credito] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Fecha_registro] [datetime] NULL,
	[Fecha_vencimiento] [date] NULL,
	[Total] [numeric](18, 2) NULL,
	[Saldo] [numeric](18, 2) NULL,
	[Estado] [varchar](max) NULL,
	[Id_caja] [int] NULL,
	[Id_Proveedor] [int] NULL,
 CONSTRAINT [PK_CreditoPorPagar] PRIMARY KEY CLUSTERED 
(
	[Id_credito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NULL,
	[Id_producto] [int] NULL,
	[cantidad] [numeric](18, 2) NULL,
	[preciounitario] [numeric](18, 2) NULL,
	[Moneda] [varchar](50) NULL,
	[Total_a_pagar]  AS ([preciounitario]*[cantidad]),
	[Unidad_de_medida] [varchar](50) NULL,
	[Cantidad_mostrada] [numeric](18, 2) NULL,
	[Estado] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Codigo] [varchar](50) NULL,
	[Stock] [varchar](50) NULL,
	[Se_vende_a] [varchar](50) NULL,
	[Usa_inventarios] [varchar](50) NULL,
	[Costo] [numeric](18, 2) NULL,
	[Ganancia]  AS ([cantidad]*[preciounitario]-[cantidad]*[costo]),
 CONSTRAINT [PK_detalle_venta] PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPRESA]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPRESA](
	[Id_empresa] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Empresa] [varchar](50) NULL,
	[Logo] [image] NULL,
	[Impuesto] [varchar](50) NULL,
	[Porcentaje_impuesto] [numeric](18, 0) NULL,
	[Moneda] [varchar](50) NULL,
	[Trabajas_con_impuestos] [varchar](50) NULL,
	[Modo_de_busqueda] [varchar](50) NULL,
	[Carpeta_para_copias_de_seguridad] [varchar](max) NULL,
	[Correo_para_envio_de_reportes] [varchar](50) NULL,
	[Ultima_fecha_de_copia_de_seguridad] [varchar](50) NULL,
	[Ultima_fecha_de_copia_date] [datetime] NULL,
	[Frecuencia_de_copias] [int] NULL,
	[Estado] [varchar](50) NULL,
	[Tipo_de_empresa] [varchar](50) NULL,
	[Pais] [varchar](max) NULL,
	[Redondeo_de_total] [varchar](50) NULL,
 CONSTRAINT [PK_EMPRESA] PRIMARY KEY CLUSTERED 
(
	[Id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gastos_varios]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gastos_varios](
	[Id_gasto] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Nro_documento] [varchar](max) NULL,
	[Tipo_comprobante] [varchar](max) NULL,
	[Importe] [numeric](18, 2) NULL,
	[Descripcion] [varchar](max) NULL,
	[Id_caja] [int] NULL,
	[Id_concepto] [int] NULL,
 CONSTRAINT [PK_Gastos_varios] PRIMARY KEY CLUSTERED 
(
	[Id_gasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo_de_Productos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo_de_Productos](
	[Idline] [int] IDENTITY(1,1) NOT NULL,
	[Linea] [varchar](50) NULL,
	[Por_defecto] [varchar](50) NULL,
 CONSTRAINT [PK_linea] PRIMARY KEY CLUSTERED 
(
	[Idline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingresos_varios]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingresos_varios](
	[Id_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Nro_comprobante] [varchar](max) NULL,
	[Tipo_comprobante] [varchar](max) NULL,
	[Importe] [numeric](18, 2) NULL,
	[Descripcion] [varchar](max) NULL,
	[Id_caja] [int] NULL,
 CONSTRAINT [PK_Ingresos_varios] PRIMARY KEY CLUSTERED 
(
	[Id_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inicios_de_sesion_por_caja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inicios_de_sesion_por_caja](
	[Id_inicio_sesion] [int] IDENTITY(1,1) NOT NULL,
	[Id_serial_Pc] [varchar](max) NULL,
	[Id_usuario] [int] NULL,
 CONSTRAINT [PK_Inicios_de_sesion] PRIMARY KEY CLUSTERED 
(
	[Id_inicio_sesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KARDEX]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KARDEX](
	[Id_kardex] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Motivo] [varchar](max) NULL,
	[Cantidad] [numeric](18, 2) NULL,
	[Id_producto] [int] NULL,
	[Id_usuario] [int] NULL,
	[Tipo] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[Total]  AS ([Cantidad]*[Costo_unt]),
	[Costo_unt] [numeric](18, 2) NULL,
	[Habia] [numeric](18, 2) NULL,
	[Hay] [numeric](18, 2) NULL,
	[Id_caja] [int] NULL,
 CONSTRAINT [PK_KARDEX] PRIMARY KEY CLUSTERED 
(
	[Id_kardex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcan]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcan](
	[Id_marca] [int] IDENTITY(1,1) NOT NULL,
	[S] [varchar](max) NULL,
	[F] [varchar](max) NULL,
	[E] [varchar](max) NULL,
	[FA] [varchar](max) NULL,
 CONSTRAINT [PK_Licencias] PRIMARY KEY CLUSTERED 
(
	[Id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIMIENTOCAJACIERRE]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIMIENTOCAJACIERRE](
	[idcierrecaja] [int] IDENTITY(1,1) NOT NULL,
	[fechainicio] [datetime] NULL,
	[fechafin] [datetime] NULL,
	[fechacierre] [datetime] NULL,
	[ingresos] [numeric](18, 2) NULL,
	[egresos] [numeric](18, 2) NULL,
	[Saldo_queda_en_caja] [numeric](18, 2) NULL,
	[Id_usuario] [int] NULL,
	[Total_calculado] [numeric](18, 2) NULL,
	[Total_real] [numeric](18, 2) NULL,
	[Estado] [varchar](50) NULL,
	[Diferencia] [numeric](18, 2) NULL,
	[Id_caja] [int] NULL,
 CONSTRAINT [PK_MOVIMIENTOCAJACIERRE] PRIMARY KEY CLUSTERED 
(
	[idcierrecaja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto1]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto1](
	[Id_Producto1] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Imagen] [varchar](50) NULL,
	[Id_grupo] [int] NULL,
	[Usa_inventarios] [varchar](50) NULL,
	[Stock] [varchar](50) NULL,
	[Precio_de_compra] [numeric](18, 2) NULL,
	[Fecha_de_vencimiento] [varchar](50) NULL,
	[Precio_de_venta] [numeric](18, 2) NULL,
	[Codigo] [varchar](50) NULL,
	[Se_vende_a] [varchar](50) NULL,
	[Impuesto] [varchar](50) NULL,
	[Stock_minimo] [numeric](18, 2) NULL,
	[Precio_mayoreo] [numeric](18, 2) NULL,
	[Sub_total_pv]  AS ([Precio_de_venta]-([Precio_de_venta]*[Impuesto])/(100)),
	[Sub_total_pm]  AS ([Precio_mayoreo]-([Precio_mayoreo]*[Impuesto])/(100)),
	[A_partir_de] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Producto1] PRIMARY KEY CLUSTERED 
(
	[Id_Producto1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NULL,
	[Direccion] [varchar](max) NULL,
	[IdentificadorFiscal] [varchar](max) NULL,
	[Celular] [varchar](max) NULL,
	[Estado] [varchar](50) NULL,
	[Saldo] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Serializacion]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serializacion](
	[Id_serializacion] [int] IDENTITY(1,1) NOT NULL,
	[Serie] [varchar](50) NULL,
	[Cantidad_de_numeros] [varchar](50) NULL,
	[numerofin] [varchar](50) NULL,
	[Destino] [varchar](50) NULL,
	[tipodoc] [varchar](50) NULL,
	[Por_defecto] [varchar](50) NULL,
 CONSTRAINT [PK_Serializacion] PRIMARY KEY CLUSTERED 
(
	[Id_serializacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id_ticket] [int] IDENTITY(1,1) NOT NULL,
	[Id_Empresa] [int] NULL,
	[Identificador_fiscal] [varchar](max) NULL,
	[Direccion] [varchar](max) NULL,
	[Provincia_Departamento_Pais] [varchar](max) NULL,
	[Nombre_de_Moneda] [varchar](max) NULL,
	[Agradecimiento] [varchar](max) NULL,
	[pagina_Web_Facebook] [varchar](max) NULL,
	[Anuncio] [varchar](max) NULL,
	[Datos_fiscales_de_autorizacion] [varchar](max) NULL,
	[Por_defecto] [varchar](max) NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO2]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO2](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres_y_Apellidos] [varchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Icono] [image] NULL,
	[Nombre_de_icono] [varchar](max) NULL,
	[Correo] [varchar](max) NULL,
	[Rol] [varchar](max) NULL,
	[Estado] [varchar](50) NULL,
 CONSTRAINT [PK_USUARIO2] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idclientev] [int] NULL,
	[fecha_venta] [datetime] NULL,
	[Numero_de_doc] [varchar](50) NULL,
	[Monto_total] [numeric](18, 2) NULL,
	[Tipo_de_pago] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[IGV] [numeric](18, 1) NULL,
	[Comprobante] [varchar](50) NULL,
	[Id_usuario] [int] NULL,
	[Fecha_de_pago] [varchar](50) NULL,
	[ACCION] [varchar](50) NULL,
	[Saldo] [numeric](18, 2) NULL,
	[Pago_con] [numeric](18, 2) NULL,
	[Porcentaje_IGV] [numeric](18, 2) NULL,
	[Id_caja] [int] NULL,
	[Referencia_tarjeta] [varchar](50) NULL,
	[Vuelto] [numeric](18, 2) NULL,
	[Efectivo] [numeric](18, 2) NULL,
	[Credito] [numeric](18, 2) NULL,
	[Tarjeta] [numeric](18, 2) NULL,
 CONSTRAINT [PK_ventas] PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ControlCobros]  WITH CHECK ADD  CONSTRAINT [FK_ControlCobros_Caja] FOREIGN KEY([IdCaja])
REFERENCES [dbo].[Caja] ([Id_Caja])
GO
ALTER TABLE [dbo].[ControlCobros] CHECK CONSTRAINT [FK_ControlCobros_Caja]
GO
ALTER TABLE [dbo].[ControlCobros]  WITH CHECK ADD  CONSTRAINT [FK_ControlCobros_clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[clientes] ([idclientev])
GO
ALTER TABLE [dbo].[ControlCobros] CHECK CONSTRAINT [FK_ControlCobros_clientes]
GO
ALTER TABLE [dbo].[ControlCobros]  WITH CHECK ADD  CONSTRAINT [FK_ControlCobros_USUARIO2] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO2] ([idUsuario])
GO
ALTER TABLE [dbo].[ControlCobros] CHECK CONSTRAINT [FK_ControlCobros_USUARIO2]
GO
ALTER TABLE [dbo].[CreditoPorCobrar]  WITH CHECK ADD  CONSTRAINT [FK_CreditoPorCobrar_Caja] FOREIGN KEY([Id_caja])
REFERENCES [dbo].[Caja] ([Id_Caja])
GO
ALTER TABLE [dbo].[CreditoPorCobrar] CHECK CONSTRAINT [FK_CreditoPorCobrar_Caja]
GO
ALTER TABLE [dbo].[CreditoPorCobrar]  WITH CHECK ADD  CONSTRAINT [FK_CreditoPorCobrar_clientes] FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[clientes] ([idclientev])
GO
ALTER TABLE [dbo].[CreditoPorCobrar] CHECK CONSTRAINT [FK_CreditoPorCobrar_clientes]
GO
ALTER TABLE [dbo].[CreditoPorPagar]  WITH CHECK ADD  CONSTRAINT [FK_CreditoPorPagar_Caja] FOREIGN KEY([Id_caja])
REFERENCES [dbo].[Caja] ([Id_Caja])
GO
ALTER TABLE [dbo].[CreditoPorPagar] CHECK CONSTRAINT [FK_CreditoPorPagar_Caja]
GO
ALTER TABLE [dbo].[CreditoPorPagar]  WITH CHECK ADD  CONSTRAINT [FK_CreditoPorPagar_Proveedores] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedores] ([IdProveedor])
GO
ALTER TABLE [dbo].[CreditoPorPagar] CHECK CONSTRAINT [FK_CreditoPorPagar_Proveedores]
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK_detalle_venta_ventas] FOREIGN KEY([idventa])
REFERENCES [dbo].[ventas] ([idventa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detalle_venta] CHECK CONSTRAINT [FK_detalle_venta_ventas]
GO
ALTER TABLE [dbo].[Gastos_varios]  WITH CHECK ADD  CONSTRAINT [FK_Gastos_varios_Caja] FOREIGN KEY([Id_caja])
REFERENCES [dbo].[Caja] ([Id_Caja])
GO
ALTER TABLE [dbo].[Gastos_varios] CHECK CONSTRAINT [FK_Gastos_varios_Caja]
GO
ALTER TABLE [dbo].[Gastos_varios]  WITH CHECK ADD  CONSTRAINT [FK_Gastos_varios_Conceptos] FOREIGN KEY([Id_concepto])
REFERENCES [dbo].[Conceptos] ([Id_concepto])
GO
ALTER TABLE [dbo].[Gastos_varios] CHECK CONSTRAINT [FK_Gastos_varios_Conceptos]
GO
ALTER TABLE [dbo].[Ingresos_varios]  WITH CHECK ADD  CONSTRAINT [FK_Ingresos_varios_Caja] FOREIGN KEY([Id_caja])
REFERENCES [dbo].[Caja] ([Id_Caja])
GO
ALTER TABLE [dbo].[Ingresos_varios] CHECK CONSTRAINT [FK_Ingresos_varios_Caja]
GO
ALTER TABLE [dbo].[KARDEX]  WITH CHECK ADD  CONSTRAINT [FK_KARDEX_Caja] FOREIGN KEY([Id_caja])
REFERENCES [dbo].[Caja] ([Id_Caja])
GO
ALTER TABLE [dbo].[KARDEX] CHECK CONSTRAINT [FK_KARDEX_Caja]
GO
ALTER TABLE [dbo].[KARDEX]  WITH CHECK ADD  CONSTRAINT [FK_KARDEX_Producto1] FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Producto1] ([Id_Producto1])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KARDEX] CHECK CONSTRAINT [FK_KARDEX_Producto1]
GO
ALTER TABLE [dbo].[KARDEX]  WITH CHECK ADD  CONSTRAINT [FK_KARDEX_USUARIO2] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[USUARIO2] ([idUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KARDEX] CHECK CONSTRAINT [FK_KARDEX_USUARIO2]
GO
ALTER TABLE [dbo].[MOVIMIENTOCAJACIERRE]  WITH CHECK ADD  CONSTRAINT [FK_MOVIMIENTOCAJACIERRE_Caja] FOREIGN KEY([Id_caja])
REFERENCES [dbo].[Caja] ([Id_Caja])
GO
ALTER TABLE [dbo].[MOVIMIENTOCAJACIERRE] CHECK CONSTRAINT [FK_MOVIMIENTOCAJACIERRE_Caja]
GO
ALTER TABLE [dbo].[MOVIMIENTOCAJACIERRE]  WITH CHECK ADD  CONSTRAINT [FK_MOVIMIENTOCAJACIERRE_USUARIO2] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[USUARIO2] ([idUsuario])
GO
ALTER TABLE [dbo].[MOVIMIENTOCAJACIERRE] CHECK CONSTRAINT [FK_MOVIMIENTOCAJACIERRE_USUARIO2]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_Caja] FOREIGN KEY([Id_caja])
REFERENCES [dbo].[Caja] ([Id_Caja])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_Caja]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_clientes] FOREIGN KEY([idclientev])
REFERENCES [dbo].[clientes] ([idclientev])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_clientes]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_USUARIO2] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[USUARIO2] ([idUsuario])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_USUARIO2]
GO
/****** Object:  StoredProcedure [dbo].[actualizar_serializacion_mas_uno]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[actualizar_serializacion_mas_uno]
@idserie as int  
as 
update Serializacion set  numerofin=numerofin+1          
where Id_serializacion=@idserie 
