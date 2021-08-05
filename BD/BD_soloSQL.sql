CREATE LOGIN ada369 WITH PASSWORD = 'softwarereal'

GO
Use BASEADA ;
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ada369')
BEGIN
    CREATE USER [ada369] FOR LOGIN [ada369]
    EXEC sp_addrolemember N'db_owner', N'ada369'
    EXEC master..sp_addsrvrolemember @loginame = N'ada369', @rolename = N'sysadmin'
END;
GO</value>
  </data>
  <data name="txtArgumentosini.Text" xml:space="preserve">
    <value>;SQL Server 2014 Configuration File
[OPTIONS]



; Especifica un flujo de trabajo de instalación, como INSTALL, UNINSTALL o UPGRADE. Es un parámetro necesario. 

ACTION="Install"

; No se ha definido aún ayuda detallada para el argumento de la línea de comandos ROLE. 

ROLE="AllFeatures_WithDefaults"

; Use el parámetro /ENU para instalar la versión en inglés de SQL Server en el sistema operativo Windows traducido. 

ENU="False"

; Parámetro que controla el comportamiento de la interfaz de usuario. Los valores válidos son Normal para la interfaz de usuario completa, AutoAdvance para una interfaz de usuario simplificada y EnableUIOnServerCore para omitir la parte gráfica de la instalación de Server Core. 


; La instalación no mostrará ninguna interfaz de usuario. 

QUIET="False"

; El programa de instalación sólo mostrará el progreso, sin la interacción del usuario. 

QUIETSIMPLE="True"

; Especifique si el programa de instalación de SQL Server debe detectar e incluir actualizaciones del producto. Los valores válidos son True y False o 1 y 0. De forma predeterminada, el programa de instalación de SQL Server incluirá las actualizaciones que encuentre. 

UpdateEnabled="False"

; Especifique si se puede informar de los errores a Microsoft para mejorar las futuras versiones de SQL Server. Elija 1 o True para habilitar esta característica, o bien 0 o False para deshabilitarla. 

ERRORREPORTING="False"

; Si se proporciona este parámetro, el equipo usará Microsoft Update para comprobar las actualizaciones. 

USEMICROSOFTUPDATE="False"

; Especifica las características que se van a instalar, desinstalar o actualizar. La lista de las características de nivel superior incluye SQL, AS, RS, IS, MDS y Herramientas. La característica SQL instalará el motor de base de datos, la replicación, el texto completo y el servidor Data Quality Services (DQS). La característica Herramientas instalará las herramientas de administración, los componentes de Libros en pantalla, SQL Server Data Tools y el resto de los componentes compartidos. 

FEATURES=SQLENGINE,REPLICATION

; Especifique la ubicación en la que el programa de instalación de SQL Server obtendrá actualizaciones del producto. Los valores válidos son "MU" para buscar en Microsoft Update, una ruta de acceso de carpeta válida, una ruta de acceso relativa, como .\MisActualizaciones, o un recurso compartido UNC. De forma predeterminada, el programa de instalación de SQL Server buscará en Microsoft Update o en el servicio Windows Update mediante Windows Server Update Services. 

UpdateSource="MU"

; Muestra el uso de los parámetros de la línea de comandos 

HELP="False"

; Especifica que el registro de instalación detallado debe redireccionarse a la consola. 

INDICATEPROGRESS="False"

; Especifica que el programa de instalación debe realizar la instalación en WOW64. Este argumento de la línea de comandos no se admite en sistemas IA64 ni de 32 bits. 

X86="False"

; Especifique el directorio de instalación raíz de los componentes compartidos. Este directorio no cambia después de instalar los componentes compartidos. 

INSTALLSHAREDDIR="C:\Program Files\Microsoft SQL Server"

; Especifique una instancia predeterminada o con nombre. MSSQLSERVER y SQLExpress son las instancias predeterminadas de las ediciones que no son Express y de las Express, respectivamente. Se requiere este parámetro al instalar el motor de base de datos de SQL Server (SQL), Analysis Services (AS) o Reporting Services (RS). 

INSTANCENAME="PRUEBAFINAL22"

; Especifique si los datos de uso de las características de SQL Server se pueden recopilar y enviar a Microsoft. Elija 1 o True para habilitar esta característica, o bien 0 o False para deshabilitarla. 

SQMREPORTING="False"

; Especifique el identificador de instancia de las características de SQL Server que ha indicado. Las estructuras de directorios y del Registro, así como los nombres de los servicios SQL Server incorporarán el identificador de instancia de SQL Server. 

INSTANCEID="PRUEBAFINAL22"

; Especifique el directorio de instalación. 

INSTANCEDIR="C:\Program Files (x86)\Microsoft SQL Server"

; Nombre de cuenta del Agente 

AGTSVCACCOUNT="NT AUTHORITY\Servicio de red"

; Iniciar servicio automáticamente después de la instalación.  

AGTSVCSTARTUPTYPE="Disabled"

; Puerto de comunicación TCP del brick de CM 

COMMFABRICPORT="0"

; Cómo usará la matriz las redes privadas 

COMMFABRICNETWORKLEVEL="0"

; Cómo se protegerá la comunicación entre bricks 

COMMFABRICENCRYPTION="0"

; Puerto TCP usado por el brick de CM 

MATRIXCMBRICKCOMMPORT="0"

; Tipo de inicio para el servicio SQL Server. 

SQLSVCSTARTUPTYPE="Automatic"

; Nivel para habilitar la característica FILESTREAM en (0, 1, 2 o 3). 

FILESTREAMLEVEL="0"

; Establézcalo en "1" para habilitar RANU para SQL Server Express. 

ENABLERANU="True"

; Especifica una intercalación de Windows o SQL que se va a utilizar para el motor de base de datos. 

SQLCOLLATION="Modern_Spanish_CI_AS"

; Cuenta para el servicio de SQL Server: Dominio\Usuario o cuenta de sistema. 

SQLSVCACCOUNT="NT Service\MSSQL$PRUEBAFINAL22"

; Cuentas de Windows que se suministran como administradores del sistema de SQL Server. 


; Autenticación de Windows predeterminada. Use "SQL" para el modo mixto de autenticación de Windows. 


; Aprovisione el usuario actual como administrador del sistema del motor de base de datos para %SQL_PRODUCT_SHORT_NAME% Express. 

ADDCURRENTUSERASSQLADMIN="False"

; Especifique 0 para deshabilitar el protocolo TCP/IP, o 1 para habilitarlo. 

TCPENABLED="1"

; Especifique 0 para deshabilitar el protocolo Named Pipes, o 1 para habilitarlo. 

NPENABLED="0"

; Tipo de inicio para el servicio SQL Server Browser. 

BROWSERSVCSTARTUPTYPE="Disabled"</value>
  </data>
  <data name="txtCrear_procedimientos.Text" xml:space="preserve">
    <value>USE [master]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BASEADACURSO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BASEADACURSO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BASEADACURSO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BASEADACURSO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BASEADACURSO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BASEADACURSO] SET ARITHABORT OFF 
GO
ALTER DATABASE [BASEADACURSO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BASEADACURSO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BASEADACURSO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BASEADACURSO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BASEADACURSO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BASEADACURSO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BASEADACURSO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BASEADACURSO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BASEADACURSO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BASEADACURSO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BASEADACURSO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BASEADACURSO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BASEADACURSO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BASEADACURSO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BASEADACURSO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BASEADACURSO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BASEADACURSO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BASEADACURSO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BASEADACURSO] SET  MULTI_USER 
GO
ALTER DATABASE [BASEADACURSO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BASEADACURSO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BASEADACURSO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BASEADACURSO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BASEADACURSO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BASEADACURSO] SET QUERY_STORE = OFF
GO
USE [BASEADACURSO]
GO
/****** Object:  User [pruebas2020]    Script Date: 20/09/2020 07:49:16 p.m. ******/
CREATE USER [pruebas2020] FOR LOGIN [pruebas2020] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [pruebas2020]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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








GO
/****** Object:  StoredProcedure [dbo].[aplicar_precio_mayoreo]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[aplicar_precio_mayoreo]
@idproducto int,
@iddetalleventa int
as
declare @preciomayoreo numeric(18,2)
set @preciomayoreo= (select Precio_mayoreo from Producto1 where Producto1.Id_Producto1 = @idproducto )
if Exists(select Precio_mayoreo,Id_Producto1 from Producto1 where Precio_mayoreo=0 and Producto1.Id_Producto1 =@idproducto)
Raiserror('No se configuro un precio al moyero para este producto',16,1)
else

update detalle_venta set preciounitario=@preciomayoreo
where Id_producto =@idproducto and detalle_venta.iddetalle_venta =@iddetalleventa 
GO
/****** Object:  StoredProcedure [dbo].[aumentar_saldo_a_cliente]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[aumentar_saldo_a_cliente]
@idcliente as integer,
@Saldo numeric(18,2)          
as 
update clientes set          
			Saldo =Saldo+@Saldo 
where idclientev =@idcliente 











GO
/****** Object:  StoredProcedure [dbo].[aumentar_stock_en_detalle_de_venta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[aumentar_stock_en_detalle_de_venta]
@Id_Producto1 as int,
@cantidad as numeric (18,2)

as
update detalle_venta   set Stock=Stock+@cantidad where Id_producto   =@Id_Producto1 AND Stock  &lt;&gt;'Ilimitado'







GO
/****** Object:  StoredProcedure [dbo].[aumentarStock]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[aumentarStock]
@idproducto int,
@cantidad numeric(18,2)
as
Update Producto1 set Stock = Stock+@cantidad 
where Id_Producto1=@idproducto and Usa_inventarios = 'SI'
GO
/****** Object:  StoredProcedure [dbo].[buscar_clientes]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[buscar_clientes]
@letra varchar(max)
As
SELECT        idclientev , Nombre, Direccion, IdentificadorFiscal as [Identificador Fiscal] , Celular, Estado, Saldo
FROM            dbo.clientes
where Nombre+IdentificadorFiscal+Celular   Like '%' + @letra + '%'  AND Nombre&lt;&gt;'GENERICO'





GO
/****** Object:  StoredProcedure [dbo].[buscar_conceptos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[buscar_conceptos]
@letra varchar(max)
as
select Id_concepto,Descripcion as Concepto from Conceptos
where Descripcion  Like '%' + @letra + '%' 







GO
/****** Object:  StoredProcedure [dbo].[Buscar_id_USUARIOS]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Buscar_id_USUARIOS]
@Nombre_y_Apelllidos varchar(50)
as
select * from USUARIO2 
where Nombres_y_Apellidos =@Nombre_y_Apelllidos
order by idUsuario desc

















GO
/****** Object:  StoredProcedure [dbo].[buscar_MOVIMIENTOS_DE_KARDEX]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[buscar_MOVIMIENTOS_DE_KARDEX]
@idProducto int
AS BEGIN
SELECT       KARDEX.Fecha ,Producto1.Descripcion ,KARDEX.Motivo as Movimiento, KARDEX.Habia ,KARDEX.Tipo ,KARDEX.Cantidad ,KARDEX.Hay ,USUARIO2.Nombres_y_Apellidos as Cajero ,Grupo_de_Productos.Linea as Categoria
,EMPRESA.Nombre_Empresa,EMPRESA.Logo 
FROM            dbo.KARDEX INNER JOIN Producto1 on Producto1.Id_Producto1=KARDEX.Id_producto inner join USUARIO2 on USUARIO2.idUsuario =KARDEX.Id_usuario 
               cross join EMPRESA
			INNER JOIN Grupo_de_Productos on
Grupo_de_Productos.Idline=Producto1.Id_grupo
						 
WHEre Producto1.Id_Producto1=@idProducto   order by KARDEX.Fecha Desc

END
















GO
/****** Object:  StoredProcedure [dbo].[buscar_MOVIMIENTOS_DE_KARDEX_filtros ]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[buscar_MOVIMIENTOS_DE_KARDEX_filtros ]
@fecha date,
@tipo varchar(50),
@Id_usuario int 
AS BEGIN
SELECT       KARDEX.Fecha ,Producto1.Descripcion ,KARDEX.Motivo as Movimiento, KARDEX.Habia ,KARDEX.Tipo ,KARDEX.Cantidad ,KARDEX.Hay ,USUARIO2.Nombres_y_Apellidos as Usuario ,Grupo_de_Productos .Linea as Categoria
,USUARIO2.idUsuario,@fecha as Fecha_consulta, @tipo as Tipo_consulta, EMPRESA.Nombre_Empresa ,EMPRESA.Logo 
 FROM            dbo.KARDEX INNER JOIN Producto1 on Producto1.Id_Producto1=KARDEX.Id_producto inner join USUARIO2 on USUARIO2.idUsuario =KARDEX.Id_usuario 
         INNER JOIN Grupo_de_Productos on Grupo_de_Productos.Idline=Producto1.Id_grupo 
						 CROSS JOIN EMPRESA 
WHEre KARDEX.Id_usuario =@Id_usuario and (KARDEX.Tipo=@tipo or @tipo ='-Todos-') and convert(date,KARDEX.Fecha) =convert(date,@fecha )
END
















GO
/****** Object:  StoredProcedure [dbo].[buscar_MOVIMIENTOS_DE_KARDEX_filtros_acumulado]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[buscar_MOVIMIENTOS_DE_KARDEX_filtros_acumulado]
@fecha date,
@tipo varchar(50),
@Id_usuario int 
AS BEGIN
SELECT     Producto1.Descripcion ,KARDEX.Tipo ,sum (KARDEX.Cantidad) Cantidad_Total ,@fecha as fecha, USUARIO2.Nombres_y_Apellidos,@tipo as Tipo_consultado
 FROM            dbo.KARDEX INNER JOIN Producto1 on Producto1.Id_Producto1=KARDEX.Id_producto inner join USUARIO2 on USUARIO2.idUsuario =KARDEX.Id_usuario 
         
				 
WHEre KARDEX.Id_usuario =@Id_usuario and (KARDEX.Tipo=@tipo or @tipo ='-Todos-') and convert(date,KARDEX.Fecha) =convert(date,@fecha )
group by Producto1.Descripcion,KARDEX.Tipo,USUARIO2.Nombres_y_Apellidos
ORDER BY sum (KARDEX.Cantidad) DESC
END
















GO
/****** Object:  StoredProcedure [dbo].[buscar_producto_por_descripcion]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[buscar_producto_por_descripcion]
@letra VARCHAR(50)
AS BEGIN
select top 10 Id_Producto1,Codigo , Grupo_de_Productos.Linea as Grupo,Descripcion ,Impuesto,Usa_inventarios ,Precio_de_compra AS P_Compra,Precio_mayoreo as P_mayoreo,Se_vende_a as Se_vende_por,Stock_minimo ,Fecha_de_vencimiento as F_vencimiento ,Stock,Precio_de_venta as P_venta 
,Grupo_de_Productos.Idline,A_partir_de 

FROM            dbo.Producto1 
INNER JOIN Grupo_de_Productos on
Grupo_de_Productos.Idline=Producto1.Id_grupo
              
WHEre (dbo.Producto1.Descripcion)+Codigo +Grupo_de_Productos.Linea   LIKE  '%' + @letra+'%' ORDER BY DBO.Producto1.Descripcion  asc
 
END
















GO
/****** Object:  StoredProcedure [dbo].[BUSCAR_PRODUCTOS_KARDEX]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BUSCAR_PRODUCTOS_KARDEX]

@letrab VARCHAR(50)
AS 
SELECT       top 10 Id_Producto1, (Descripcion) AS Descripcion, Imagen, Grupo_de_Productos.Linea, Usa_inventarios, Stock, Precio_de_compra, Fecha_de_vencimiento, Precio_de_venta, Codigo, Se_vende_a, Impuesto, Stock_minimo, Precio_mayoreo, Sub_total_pv, 
                         Sub_total_pm
FROM            dbo.Producto1 
                      	INNER JOIN Grupo_de_Productos on
Grupo_de_Productos.Idline=Producto1.Id_grupo
  
						 where  (Descripcion+Grupo_de_Productos.Linea  + Codigo) LIKE  '%' + @letrab+'%' and Usa_inventarios ='SI'

















GO
/****** Object:  StoredProcedure [dbo].[BUSCAR_PRODUCTOS_oka]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[BUSCAR_PRODUCTOS_oka]

@letrab VARCHAR(50)
AS 
BEGIN
SELECT      TOP 10  Id_Producto1,(Descripcion+' /Precio: '+EMPRESA.Moneda   +' '+ convert(varchar(50),Precio_de_venta)  +' /Codigo: '+ Codigo  ) AS Descripcion
, Usa_inventarios, Stock, Precio_de_compra, Precio_de_venta, Codigo, Se_vende_a
,Descripcion as Descripcion2, Codigo 
FROM            dbo.Producto1  cross join EMPRESA 
INNER JOIN Grupo_de_Productos on
Grupo_de_Productos.Idline=Producto1.Id_grupo   
              
where  (Descripcion+' /Precio: '+EMPRESA.Moneda   +' '+ convert(varchar(50),Precio_de_venta)  +' /Codigo: '+ Codigo  ) LIKE  '%' + @letrab+'%' 
end  













GO
/****** Object:  StoredProcedure [dbo].[buscar_productos_vencidos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[buscar_productos_vencidos]
@letra as varchar(50)
as

select Id_Producto1,Codigo ,Descripcion 

,Fecha_de_vencimiento as F_vencimiento ,Stock,empresa.Nombre_Empresa,empresa.Logo
,datediff(day,Fecha_de_vencimiento,CONVERT(DATE,GETDATE ()))as [Dias Vencidos] from Producto1
cross join EMPRESA 
where   Descripcion +codigo LIKE  '%' + @letra+'%' and Fecha_de_vencimiento &lt;&gt;'NO APLICA' AND Fecha_de_vencimiento &lt;= CONVERT(DATE,GETDATE ()) 
order by (datediff(day,Fecha_de_vencimiento,CONVERT(DATE,GETDATE ()))) asc

















GO
/****** Object:  StoredProcedure [dbo].[buscar_Proveedores]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[buscar_Proveedores]
@letra varchar(max)
As
SELECT        IdProveedor, Nombre, Direccion, IdentificadorFiscal as [Identificador Fiscal] , Celular, Estado, Saldo
FROM            dbo.Proveedores
where Nombre+IdentificadorFiscal+Celular   Like '%' + @letra + '%' 





GO
/****** Object:  StoredProcedure [dbo].[buscar_Tipo_de_documentos_para_insertar_en_ventas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[buscar_Tipo_de_documentos_para_insertar_en_ventas]
@letra VARCHAR(50)
AS BEGIN

SELECT        Serializacion.tipodoc   AS COMPROBANTE ,
dbo.Serializacion.Serie ,dbo.Serializacion.Cantidad_de_numeros  , dbo.Serializacion.numerofin ,
dbo.Serializacion.Id_serializacion ,
(dbo.Serializacion.Serie  +' - '+ dbo.Serializacion.Cantidad_de_numeros + dbo.Serializacion.numerofin) as serie_completa
FROM            dbo.Serializacion 
 
 WHEre Serializacion.tipodoc =@letra  and dbo.Serializacion .Destino  ='VENTAS'
 end












GO
/****** Object:  StoredProcedure [dbo].[buscar_usuario]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[buscar_usuario]
@letra varchar(50)
as
select  idUsuario,Nombres_y_Apellidos AS Nombres,Login,Password
,Icono ,Nombre_de_icono ,Correo ,rol  FROM USUARIO2

where Nombres_y_Apellidos + Login      LIKE '%'+ @letra +'%' AND Estado='ACTIVO'

















GO
/****** Object:  StoredProcedure [dbo].[buscar_USUARIO_por_correo]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[buscar_USUARIO_por_correo]
@correo VARCHAR(max)

AS 
SELECT        Password 
FROM            dbo.USUARIO2						 
WHEre Correo =@correo

















GO
/****** Object:  StoredProcedure [dbo].[buscarVentas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[buscarVentas]
@busqueda varchar(50)
as
SELECT        dbo.ventas.idventa, dbo.ventas.fecha_venta as Fecha, (dbo.ventas.Comprobante + ' ' + ventas.Numero_de_doc) as Comprobante, dbo.ventas.Monto_total, 
dbo.USUARIO2.Nombres_y_Apellidos, dbo.ventas.Pago_con,( dbo.EMPRESA.Moneda+' ' + convert(varchar(50), ventas.Monto_total)) as Total  ,
dbo.clientes.Nombre as Cliente, 
                         dbo.ventas.Tipo_de_pago, dbo.ventas.Vuelto
FROM            dbo.ventas INNER JOIN
                         dbo.USUARIO2 ON dbo.ventas.Id_usuario = dbo.USUARIO2.idUsuario INNER JOIN
                         dbo.clientes ON dbo.ventas.idclientev = dbo.clientes.idclientev CROSS JOIN
                         dbo.EMPRESA
						  where Comprobante+Numero_de_doc LIKE '%' + @busqueda + '%' and ventas.Monto_total &gt;0
GO
/****** Object:  StoredProcedure [dbo].[buscarVentasPorFechas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[buscarVentasPorFechas]
@fi date,
@ff date
as
SELECT        dbo.ventas.idventa, dbo.ventas.fecha_venta as Fecha, (dbo.ventas.Comprobante + ' ' + ventas.Numero_de_doc) as Comprobante, dbo.ventas.Monto_total, 
dbo.USUARIO2.Nombres_y_Apellidos, dbo.ventas.Pago_con,( dbo.EMPRESA.Moneda+' ' + convert(varchar(50), ventas.Monto_total)) as Total  ,
dbo.clientes.Nombre as Cliente, 
                         dbo.ventas.Tipo_de_pago, dbo.ventas.Vuelto
FROM            dbo.ventas INNER JOIN
                         dbo.USUARIO2 ON dbo.ventas.Id_usuario = dbo.USUARIO2.idUsuario INNER JOIN
                         dbo.clientes ON dbo.ventas.idclientev = dbo.clientes.idclientev CROSS JOIN
                         dbo.EMPRESA
						  where convert(date,ventas.fecha_venta)&gt;=@fi and convert(date,ventas.fecha_venta)&lt;=@ff and ventas.Monto_total &gt;0
GO
/****** Object:  StoredProcedure [dbo].[cambio_de_Caja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cambio_de_Caja]
@idcaja int, 
@idventa int
as
update ventas set Id_caja = @idcaja 
where idventa=@idcaja 








GO
/****** Object:  StoredProcedure [dbo].[cerrarCaja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[cerrarCaja]

@fechafin As datetime,
@fechacierre As datetime,
@ingresos As numeric(18,2),
@egresos As numeric(18,2),
@Saldo_queda_en_caja As numeric(18,2),
@Id_usuario As int,
@Total_calculado As numeric(18,2),
@Total_real As numeric(18,2),
@Estado As varchar(50),
@Diferencia As numeric(18,2),
@Id_caja As int
As
UPDATE MOVIMIENTOCAJACIERRE Set


fechafin=@fechafin,
fechacierre=@fechacierre,
ingresos=@ingresos,
egresos=@egresos,
Saldo_queda_en_caja=@Saldo_queda_en_caja,
Id_usuario=@Id_usuario,
Total_calculado=@Total_calculado,
Total_real=@Total_real,
Estado=@Estado,
Diferencia=@Diferencia
Where Id_caja =@Id_caja


GO
/****** Object:  StoredProcedure [dbo].[Confirmar_venta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Confirmar_venta]
@idventa int,
@montototal as numeric(18,2),
@IGV as numeric(18,2)
,@Saldo numeric(18,2),
@Tipo_de_pago varchar(50),
@Estado varchar(50),
@Comprobante varchar(50),
@Numero_de_doc varchar(50),
@fecha_venta datetime,
@ACCION varchar(50),
@Fecha_de_pago varchar(50),
@idcliente int,
@Pago_con numeric(18,2),
@Referencia_tarjeta varchar(50),
@Vuelto as numeric(18,2),
@Efectivo as numeric(18,2),
@Credito numeric(18,2),
@Tarjeta numeric(18,2)
as
BEGIN
if EXISTS (SELECT Numero_de_doc  FROM ventas  where Numero_de_doc  = @Numero_de_doc  )
RAISERROR ('Ya existe un Numero de Comprobante con ese Numero y Serie', 16,1)
else
BEGIN
update ventas set Monto_total  =@montototal, IGV=@IGV ,Saldo=@Saldo,
Tipo_de_pago=@Tipo_de_pago 
,Estado=@Estado ,
Comprobante =@Comprobante ,
Numero_de_doc=@Numero_de_doc ,
fecha_venta=@fecha_venta ,
ACCION=@ACCION ,Fecha_de_pago =@Fecha_de_pago ,idclientev=@idcliente ,
Pago_con=@Pago_con,Referencia_tarjeta=@Referencia_tarjeta,
Vuelto=@Vuelto ,Efectivo=@Efectivo,Credito=@Credito,Tarjeta=@Tarjeta 
where idventa =@idventa 
END
END















GO
/****** Object:  StoredProcedure [dbo].[contar_productos_vencidos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[contar_productos_vencidos]
as
select 
count (Id_Producto1 )as  id
from Producto1 where Fecha_de_vencimiento &lt;&gt;'NO APLICA' and Fecha_de_vencimiento &lt;= CONVERT (DATE,GETDATE())













GO
/****** Object:  StoredProcedure [dbo].[contarVentasEspera]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[contarVentasEspera]
as
Select count (idventa) from ventas 
where Estado='EN ESPERA'
GO
/****** Object:  StoredProcedure [dbo].[DetalleventaDevolucion]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DetalleventaDevolucion]
@iddetalle int,
@cantidad numeric(18,2),
@cantidadMostrada numeric(18,2)
as
update detalle_venta set cantidad=cantidad- @cantidad,Cantidad_mostrada=Cantidad_mostrada- @cantidadMostrada
where iddetalle_venta=@iddetalle
delete from detalle_venta where iddetalle_venta = @iddetalle and cantidad=0
GO
/****** Object:  StoredProcedure [dbo].[disminuir_stock]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[disminuir_stock]
@idproducto as int,
@cantidad as numeric (18,2)
as
update Producto1 set Stock =Stock -@cantidad
where Id_Producto1=@idproducto and Usa_inventarios ='SI' and Stock &gt;=@cantidad 








GO
/****** Object:  StoredProcedure [dbo].[disminuir_stock_en_detalle_de_venta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[disminuir_stock_en_detalle_de_venta]
@Id_Producto1 as int,
@cantidad as numeric (18,2)

as
update detalle_venta   set Stock=Stock-@cantidad where Id_producto   =@Id_Producto1 AND Stock  &lt;&gt;'Ilimitado'







GO
/****** Object:  StoredProcedure [dbo].[disminuirSaldocliente]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create proc [dbo].[disminuirSaldocliente]
@idcliente int,
@monto numeric(18,2)
as
update clientes set Saldo = Saldo - @monto 
where idclientev=@idcliente 
GO
/****** Object:  StoredProcedure [dbo].[editar_caja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[editar_caja]
@idcaja integer,
@descripcion varchar(50)

 as       
 if EXISTS (SELECT Descripcion  FROM Caja  where (Descripcion  = @descripcion and Id_Caja  &lt;&gt;@idcaja ) )

RAISERROR ('YA EXISTE UN REGISTRO  CON ESTE NOMBRE, POR FAVOR INGRESE DE NUEVO', 16,1)
else          		
 
update Caja set 
Descripcion  =@descripcion 

where Id_Caja    =@idcaja   













GO
/****** Object:  StoredProcedure [dbo].[editar_caja_impresoras]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[editar_caja_impresoras]
@idcaja integer,


	   @Impresora_Ticket varchar(max),
	   @Impresora_A4 varchar(max)
        
           		
as 
update Caja set 
 Impresora_Ticket=@Impresora_Ticket
 ,Impresora_A4= @Impresora_A4
where Id_Caja    =@idcaja    




GO
/****** Object:  StoredProcedure [dbo].[editar_clientes]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[editar_clientes]
@Idcliente As int,
@Nombre As varchar(MAX),
@Direccion As varchar(MAX),
@IdentificadorFiscal As varchar(MAX),
@Celular As varchar(MAX)
As
if EXISTS(select Nombre  from clientes where Nombre=@Nombre and idclientev  &lt;&gt; @Idcliente )
RAISERROR('Registro ya existente', 16,1)
else
UPDATE clientes Set

Nombre=@Nombre,
Direccion=@Direccion,
IdentificadorFiscal=@IdentificadorFiscal,
Celular=@Celular
Where idclientev =@Idcliente






GO
/****** Object:  StoredProcedure [dbo].[editar_Conceptos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_Conceptos]
@Id_concepto As int,
@Descripcion As varchar(MAX)
As
if Exists(select Descripcion  from Conceptos where Descripcion =@Descripcion and Id_concepto&lt;&gt;@Id_concepto   )
Raiserror('Concepto ya registrado',16,1 )
else
UPDATE Conceptos Set

Descripcion=@Descripcion
Where Id_concepto=@Id_concepto







GO
/****** Object:  StoredProcedure [dbo].[editar_correo_base]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[editar_correo_base]
@Correo varchar(max),
@Password varchar(max),
@Estado_De_envio varchar(50)

as

update  CorreoBase set Correo =@Correo,
Password=@Password,EstadoEnvio=@Estado_De_envio


GO
/****** Object:  StoredProcedure [dbo].[editar_CreditoPorPagar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[editar_CreditoPorPagar]
@Id_credito As int,
@Descripcion As varchar(MAX),
@Fecha_registro As datetime,
@Fecha_vencimiento As date,
@Total As numeric(18,2),
@Saldo As numeric(18,2),
@Estado As varchar(MAX),
@Id_caja As int,
@Id_Proveedor As int
As
UPDATE CreditoPorPagar Set

Descripcion=@Descripcion,
Fecha_registro=@Fecha_registro,
Fecha_vencimiento=@Fecha_vencimiento,
Total=@Total,
Saldo=@Saldo,
Estado=@Estado,
Id_caja=@Id_caja,
Id_Proveedor=@Id_Proveedor
Where Id_credito=@Id_credito






GO
/****** Object:  StoredProcedure [dbo].[editar_detalle_venta_CANTIDAD]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editar_detalle_venta_CANTIDAD]
@Id_producto int,
@cantidad as numeric(18,2),
@Cantidad_mostrada numeric(18,2),
@Id_venta as int
as
DECLARE @APARTIR_DE as numeric(18,2)
DECLARE @Precio_normal as numeric (18,2)
DECLARE @Precio_pormayor as numeric(18,2)
SET @APARTIR_DE= (SELECT A_partir_de  FROM Producto1  where Producto1.Id_Producto1 = @Id_producto )
SET @Precio_normal =(SELECT Precio_de_venta  FROM Producto1 where Producto1.Id_Producto1 =@Id_producto  )
SET @Precio_pormayor =(SELECT Precio_mayoreo  FROM Producto1 where Producto1.Id_Producto1 = @Id_producto )
PRINT @APARTIR_DE
PRINT @Precio_normal
PRINT @Precio_pormayor

begin
update detalle_venta set 
cantidad=@cantidad ,
Cantidad_mostrada=@Cantidad_mostrada
where detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta 
end

begin
if EXISTS( SELECT Descripcion,cantidad,Id_producto ,idventa  FROM detalle_venta where cantidad &gt;=@APARTIR_DE and detalle_venta.Id_producto=@Id_producto AND  detalle_venta.idventa =@Id_venta AND detalle_venta.Codigo &lt;&gt;'0')
UPDATE detalle_venta set
preciounitario =@Precio_pormayor 
where detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta and @Precio_pormayor &gt;0 and @APARTIR_DE &gt;0
end

begin
if EXISTS(SELECT cantidad  FROM detalle_venta where cantidad &lt;@APARTIR_DE and detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta and detalle_venta.Codigo &lt;&gt;'0')
update detalle_venta set
preciounitario =@Precio_normal 
where detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta 
end

begin
IF EXISTS(SELECT cantidad FROM detalle_venta WHERE detalle_venta .idventa =@Id_venta and detalle_venta.Codigo ='0')

update detalle_venta set 
Codigo = 0 
where detalle_venta.Codigo='0' and detalle_venta.idventa =@Id_venta 
end















GO
/****** Object:  StoredProcedure [dbo].[editar_detalle_venta_restar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_detalle_venta_restar]
@iddetalle_venta INT,
@cantidad as numeric(18, 2),
@Cantidad_mostrada  numeric(18, 2) ,
  @Id_producto varchar(50)   
    ,@Id_venta  as int

	as
	DECLARE @APARTIR_DE as numeric(18,2)
DECLARE @Precio_normal as numeric (18,2)
DECLARE @Precio_pormayor as numeric(18,2)
SET @APARTIR_DE= (SELECT A_partir_de  FROM Producto1  where Producto1.Id_Producto1 = @Id_producto )
SET @Precio_normal =(SELECT Precio_de_venta  FROM Producto1 where Producto1.Id_Producto1 =@Id_producto  )
SET @Precio_pormayor =(SELECT Precio_mayoreo  FROM Producto1 where Producto1.Id_Producto1 = @Id_producto )
PRINT @APARTIR_DE
PRINT @Precio_normal
PRINT @Precio_pormayor

BEGIN

update detalle_venta set 
cantidad=cantidad-@cantidad 
, Cantidad_mostrada=Cantidad_mostrada-@Cantidad_mostrada
where detalle_venta.Id_producto = @Id_producto and detalle_venta.idventa=@Id_venta
END

begin
delete from detalle_venta where  detalle_venta.idventa =@Id_venta and cantidad &lt;=0
end

begin
if EXISTS( SELECT Descripcion,cantidad,Id_producto ,idventa  FROM detalle_venta where cantidad &gt;=@APARTIR_DE and detalle_venta.Id_producto=@Id_producto AND  detalle_venta.idventa =@Id_venta AND detalle_venta.Codigo &lt;&gt;'0')
UPDATE detalle_venta set
preciounitario =@Precio_pormayor 
where detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta and @Precio_pormayor &gt;0 and @APARTIR_DE &gt;0
end

begin
if EXISTS(SELECT cantidad  FROM detalle_venta where cantidad &lt;@APARTIR_DE and detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta and detalle_venta.Codigo &lt;&gt;'0')
update detalle_venta set
preciounitario =@Precio_normal 
where detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta 
end

begin
IF EXISTS(SELECT cantidad FROM detalle_venta WHERE detalle_venta .idventa =@Id_venta and detalle_venta.Codigo ='0')
update detalle_venta set 
Codigo = 0 
where detalle_venta.Codigo='0' and detalle_venta.idventa =@Id_venta 
end













GO
/****** Object:  StoredProcedure [dbo].[editar_detalle_venta_sumar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editar_detalle_venta_sumar]
@Id_producto int,
@cantidad as numeric(18,2),
@Cantidad_mostrada numeric(18,2),
@Id_venta as int
as
DECLARE @APARTIR_DE as numeric(18,2)
DECLARE @Precio_normal as numeric (18,2)
DECLARE @Precio_pormayor as numeric(18,2)
SET @APARTIR_DE= (SELECT A_partir_de  FROM Producto1  where Producto1.Id_Producto1 = @Id_producto )
SET @Precio_normal =(SELECT Precio_de_venta  FROM Producto1 where Producto1.Id_Producto1 =@Id_producto  )
SET @Precio_pormayor =(SELECT Precio_mayoreo  FROM Producto1 where Producto1.Id_Producto1 = @Id_producto )
PRINT @APARTIR_DE
PRINT @Precio_normal
PRINT @Precio_pormayor

begin
update detalle_venta set 
cantidad=cantidad + @cantidad ,
Cantidad_mostrada=Cantidad_mostrada+@Cantidad_mostrada
where detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta 
end

begin
if EXISTS( SELECT Descripcion,cantidad,Id_producto ,idventa  FROM detalle_venta where cantidad &gt;=@APARTIR_DE and detalle_venta.Id_producto=@Id_producto AND  detalle_venta.idventa =@Id_venta AND detalle_venta.Codigo &lt;&gt;'0')
UPDATE detalle_venta set
preciounitario =@Precio_pormayor 
where detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta and @Precio_pormayor &gt;0 and @APARTIR_DE &gt;0
end

begin
if EXISTS(SELECT cantidad  FROM detalle_venta where cantidad &lt;@APARTIR_DE and detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta and detalle_venta.Codigo &lt;&gt;'0')
update detalle_venta set
preciounitario =@Precio_normal 
where detalle_venta.Id_producto =@Id_producto and detalle_venta.idventa =@Id_venta 
end

begin
IF EXISTS(SELECT cantidad FROM detalle_venta WHERE detalle_venta .idventa =@Id_venta and detalle_venta.Codigo ='0')

update detalle_venta set 
Codigo = 0 
where detalle_venta.Codigo='0' and detalle_venta.idventa =@Id_venta 
end















GO
/****** Object:  StoredProcedure [dbo].[editar_dinero_caja_inicial]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editar_dinero_caja_inicial]
@Id_caja as integer,
@saldo numeric(18,2)


as
update MOVIMIENTOCAJACIERRE  set  Saldo_queda_en_caja =@saldo
where Id_caja =@Id_caja AND Estado ='CAJA APERTURADA'

















GO
/****** Object:  StoredProcedure [dbo].[editar_eleccion_impresoras]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[editar_eleccion_impresoras]
@idcaja integer,
@Impresora_Ticket varchar(max)	                     		
as 
update Caja set 
 Impresora_Ticket=@Impresora_Ticket
where Id_Caja    =@idcaja  











GO
/****** Object:  StoredProcedure [dbo].[editar_Empresa]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_Empresa]
@Nombre_Empresa  varchar(50),
@logo as image,
@Impuesto varchar(50),
@Porcentaje_impuesto numeric(18,0),
@Moneda varchar(50),
@Trabajas_con_impuestos VARCHAR(50),
@Modo_de_busqueda VARCHAR(50),
@Carpeta_para_copias_de_seguridad varchar(max),
@Correo_para_envio_de_reportes varchar(50)
as
update  EMPRESA set Nombre_Empresa=@Nombre_Empresa,Logo=@logo ,Impuesto=@Impuesto ,
Porcentaje_impuesto=@Porcentaje_impuesto,Moneda=@Moneda,Trabajas_con_impuestos=@Trabajas_con_impuestos
,Modo_de_busqueda=@Modo_de_busqueda 
,Carpeta_para_copias_de_seguridad =@Carpeta_para_copias_de_seguridad 
,Correo_para_envio_de_reportes =@Correo_para_envio_de_reportes 













GO
/****** Object:  StoredProcedure [dbo].[editar_FORMATO_TICKET]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[editar_FORMATO_TICKET]
    	  @Identificador_fiscal varchar(max),
           @Direccion varchar(max),
         
           @Provincia_Departamento_Pais varchar(max),
           @Nombre_de_Moneda varchar(max),
           @Agradecimiento varchar(max),
           @pagina_Web_Facebook varchar(max),
           @Anuncio varchar(max),
	   @Datos_fiscales_de_autorizacion varchar(max),
	   @Por_defecto  varchar(max),
	   @Nombre_Empresa varchar(max),
	   @Logo image
    as
	begin
    update Ticket set  
	Identificador_fiscal=@Identificador_fiscal ,
          Direccion =@Direccion ,    
           Provincia_Departamento_Pais=@Provincia_Departamento_Pais ,
           Nombre_de_Moneda=@Nombre_de_Moneda ,
          Agradecimiento  =@Agradecimiento ,
          pagina_Web_Facebook = @pagina_Web_Facebook ,
         Anuncio =  @Anuncio,
		   Datos_fiscales_de_autorizacion=@Datos_fiscales_de_autorizacion,
		   Por_defecto=@Por_defecto
		   end 

		   begin
		    update EMPRESA  set  
			Nombre_Empresa=@Nombre_Empresa, 
			Logo=@Logo 
			end 













GO
/****** Object:  StoredProcedure [dbo].[editar_Gastos_varios]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[editar_Gastos_varios]
@Id_gasto As int,
@Fecha As datetime,
@Nro_documento As varchar(MAX),
@Tipo_comprobante As varchar(MAX),
@Importe As numeric(18,2),
@Descripcion As varchar(MAX),
@Id_caja As int,
@Id_concepto As int
As
UPDATE Gastos_varios Set

Fecha=@Fecha,
Nro_documento=@Nro_documento,
Tipo_comprobante=@Tipo_comprobante,
Importe=@Importe,
Descripcion=@Descripcion,
Id_caja=@Id_caja,
Id_concepto=@Id_concepto
Where Id_gasto=@Id_gasto







GO
/****** Object:  StoredProcedure [dbo].[editar_Grupo]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[editar_Grupo]
@id int,
@Grupo varchar(50)

as
if EXISTS (SELECT Linea FROM Grupo_de_Productos  where Linea = @Grupo and Idline&lt;&gt;@id  )
RAISERROR ('YA EXISTE UN GRUPO CON ESTE NOMBRE, Ingrese de nuevo', 16,1)
else
update  Grupo_de_Productos set Linea=@grupo
where Idline=@id


















GO
/****** Object:  StoredProcedure [dbo].[editar_inicio_De_sesion]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editar_inicio_De_sesion]

 
 @Id_serial_Pc varchar(max),
 @id_usuario int
  as
update Inicios_de_sesion_por_caja set 
Id_usuario =@id_usuario 
where Id_serial_Pc=@Id_serial_Pc 



GO
/****** Object:  StoredProcedure [dbo].[EDITAR_marcan_a]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EDITAR_marcan_a]

	@e varchar(max),
	@fa varchar(max),
	@f  varchar(max),
	@s varchar(max)
    as
	
    UPDATE Marcan SET E=@e, FA=@fa, F=@f 
	where S=@s 

GO
/****** Object:  StoredProcedure [dbo].[editar_Producto1]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editar_Producto1]
@Id_Producto1 int,
 @Descripcion varchar(50),
		    @Imagen varchar(50),			         
         
          @Id_grupo INT,
		  @Usa_inventarios varchar(50),
	  @Stock varchar(50),
           @Precio_de_compra numeric(18,2),
           @Fecha_de_vencimiento varchar(50),
           @Precio_de_venta numeric(18,2),
           @Codigo varchar(50),
           @Se_vende_a varchar(50),
           @Impuesto varchar(50),
           @Stock_minimo numeric(18,2),
           @Precio_mayoreo numeric(18,2)
		 	,@A_partir_de numeric(18,2)
as 

if EXISTS (SELECT Descripcion FROM Producto1  where (Descripcion = @Descripcion and Id_Producto1 &lt;&gt;@Id_Producto1 ) )

RAISERROR ('YA EXISTE UN PRODUCTO  CON ESTE NOMBRE, POR FAVOR INGRESE DE NUEVO', 16,1)

else if EXISTS (SELECT Codigo  FROM Producto1  where (Codigo  = @Codigo  and Id_Producto1 &lt;&gt;@Id_Producto1 ))

RAISERROR ('YA EXISTE UN PRODUCTO  CON ESTE CODIGO, POR FAVOR INGRESE DE NUEVO/ SE GENERARA CODIGO AUTOMATICO', 16,1)

else if EXISTS (SELECT Descripcion,Codigo  FROM Producto1  where (Id_Producto1 =@Id_Producto1 ))

update Producto1 set  

      Descripcion =@Descripcion ,
		  Imagen =  @Imagen ,			         
         
         Id_grupo = @Id_grupo 	,
		  Usa_inventarios =@Usa_inventarios ,
		  Stock = @Stock ,
           Precio_de_compra =@Precio_de_compra ,
        Fecha_de_vencimiento =   @Fecha_de_vencimiento ,
          Precio_de_venta = @Precio_de_venta ,
         Codigo =  @Codigo ,
         Se_vende_a =  @Se_vende_a ,
           Impuesto =@Impuesto,
           Stock_minimo =@Stock_minimo ,
         Precio_mayoreo =  @Precio_mayoreo 
		 	,A_partir_de=@A_partir_de 
where id_Producto1=@Id_Producto1






















GO
/****** Object:  StoredProcedure [dbo].[editar_Proveedores]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[editar_Proveedores]
@IdProveedor As int,
@Nombre As varchar(MAX),
@Direccion As varchar(MAX),
@IdentificadorFiscal As varchar(MAX),
@Celular As varchar(MAX)
As
if EXISTS(select Nombre  from Proveedores where Nombre=@Nombre and IdProveedor &lt;&gt; @IdProveedor )
RAISERROR('Registro ya existente', 16,1)
else
UPDATE Proveedores Set

Nombre=@Nombre,
Direccion=@Direccion,
IdentificadorFiscal=@IdentificadorFiscal,
Celular=@Celular
Where IdProveedor=@IdProveedor






GO
/****** Object:  StoredProcedure [dbo].[editar_serializacion]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_serializacion]
@serie VARCHAR(50)  ,
@Cantidad_de_numeros AS VARCHAR(50)    ,
@numerofin as varchar(50) ,
@Tipo as varchar(50), 
   @Id_serie as int
as 
update Serializacion set  Serie =@serie   ,Cantidad_de_numeros=@Cantidad_de_numeros ,numerofin=@numerofin   
         ,tipodoc =@Tipo 
where Id_serializacion=@Id_serie 
















GO
/****** Object:  StoredProcedure [dbo].[editar_serializacion_POR_DEFECTO]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_serializacion_POR_DEFECTO]


   @Id_serie as int
as 

BEGIN
update Serializacion set  Por_defecto  ='-' 
     END


	 BEGIN
	 update Serializacion set  Por_defecto  ='SI'
where Id_serializacion=@Id_serie 

END














GO
/****** Object:  StoredProcedure [dbo].[editar_usuario]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_usuario]
@idUsuario int,
@nombres varchar(50) ,
@Login varchar(50),
@Password VARCHAR(50),
@Icono image,
@Nombre_de_icono varchar(max),
@Correo varchar(max),
@Rol varchar(max)
as
if EXISTS (SELECT Login,idUsuario FROM USUARIO2 where (Login  = @login  AND idUsuario&lt;&gt;@idUsuario and Estado='ACTIVO') or (Nombres_y_Apellidos   = @nombres  AND idUsuario&lt;&gt;@idUsuario and Estado='ACTIVO'))
raiserror('YA EXISTE UN USUARIO CON ESE LOGIN O CON ESE ICONO, POR FAVOR INGRESE DE NUEVO',16,1 )

ELSE

update USUARIO2 set Nombres_y_Apellidos=@nombres ,Password =@Password , Icono=@Icono ,Nombre_de_icono =@Nombre_de_icono
 ,Correo =@Correo , Rol=@rol , Login =@Login
 where idUsuario=@idUsuario 


















GO
/****** Object:  StoredProcedure [dbo].[EditarBascula]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EditarBascula]
@idcaja int,
@Puerto varchar(max),
@Estado varchar(50)

as
update Caja set   PuertoBalanza=@Puerto , EstadoBalanza = @Estado 
where Id_Caja = @idcaja
GO
/****** Object:  StoredProcedure [dbo].[EditarPreciosProductos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditarPreciosProductos]
@idproducto int,
@precioventa numeric(18,2),
@costo numeric(18,2),
@preciomayoreo numeric(18,2),
@cantidadAgregada numeric(18,2)

as
update Producto1 set 
Precio_de_venta=@precioventa ,
Precio_de_compra = @costo ,
Precio_mayoreo=@preciomayoreo ,
Stock = Stock + @cantidadAgregada
where Id_Producto1=@idproducto and Usa_inventarios = 'SI'
GO
/****** Object:  StoredProcedure [dbo].[editarPrecioVenta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editarPrecioVenta]
@iddetalleventa int,
@precio numeric(18,2)
as
update detalle_venta set preciounitario=@precio 
where iddetalle_venta=@iddetalleventa 
GO
/****** Object:  StoredProcedure [dbo].[editarRespaldos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editarRespaldos]

@Ultima_fecha_de_copia_de_seguridad  varchar(50),
@Carpeta_para_copias_de_seguridad varchar (max),
@Ultima_fecha_de_copia_date datetime,
@Frecuencia_de_copias int
as
update EMPRESA  set Ultima_fecha_de_copia_de_seguridad =@Ultima_fecha_de_copia_de_seguridad ,
Carpeta_para_copias_de_seguridad =@Carpeta_para_copias_de_seguridad ,Ultima_fecha_de_copia_date=@Ultima_fecha_de_copia_date
,Frecuencia_de_copias= @Frecuencia_de_copias 



GO
/****** Object:  StoredProcedure [dbo].[EditarTemaCaja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditarTemaCaja]
@idcaja int, 
@tema varchar(50)
as
update Caja set Tema= @tema 
where Id_Caja=@idcaja 
GO
/****** Object:  StoredProcedure [dbo].[editarVenta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editarVenta]
@idventa int,
@monto numeric(18,2)
as
if @monto &lt;&gt;0
update ventas set Monto_total=@monto 
where idventa = @idventa 
else
delete from ventas 
where idventa = @idventa 
GO
/****** Object:  StoredProcedure [dbo].[eliminar_caja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_caja]
@idcaja integer
as
update Caja set
Estado  ='Caja Eliminada'
where Id_Caja    =@idcaja













GO
/****** Object:  StoredProcedure [dbo].[eliminar_clientes]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[eliminar_clientes]
@Idcliente As int

As
update   clientes
set Estado ='ELIMINADO'
WHERE idclientev =@Idcliente





GO
/****** Object:  StoredProcedure [dbo].[eliminar_CreditoPorPagar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[eliminar_CreditoPorPagar]
@Id_credito As int

As
DELETE FROM CreditoPorPagar
WHERE Id_credito=@Id_credito





GO
/****** Object:  StoredProcedure [dbo].[eliminar_detalle_venta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_detalle_venta]
@iddetalleventa as int
as
delete detalle_venta where iddetalle_venta=@iddetalleventa 













GO
/****** Object:  StoredProcedure [dbo].[eliminar_gasto]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_gasto]
@idgasto integer
as
delete from Gastos_varios   where Id_gasto  =@idgasto 





GO
/****** Object:  StoredProcedure [dbo].[eliminar_ingreso]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_ingreso]
@idingreso integer
as
delete from Ingresos_varios    where Id_ingreso  =@idingreso 






GO
/****** Object:  StoredProcedure [dbo].[eliminar_Producto1]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[eliminar_Producto1]
@id  int
as
delete from Producto1  where Id_Producto1 =@id 
















GO
/****** Object:  StoredProcedure [dbo].[eliminar_Proveedores]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[eliminar_Proveedores]
@IdProveedor As int

As
update   Proveedores
set Estado ='ELIMINADO'
WHERE IdProveedor=@IdProveedor





GO
/****** Object:  StoredProcedure [dbo].[eliminar_Serializacion]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_Serializacion]
@id integer
as
if EXISTS (SELECT Destino FROM Serializacion  where Destino &lt;&gt;'OTROS' AND ID_SERIALIZACION=@id )
RAISERROR ('Este Comprobante no se Eliminara ya que generaria Error', 16,1)
else
delete from Serializacion   where Id_serializacion   =@id and Destino='OTROS'

















GO
/****** Object:  StoredProcedure [dbo].[eliminar_usuario]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[eliminar_usuario]
@idusuario int,
@login varchar(50)
as
if exists(select login from USUARIO2 where @login ='admin')
raiserror('El Usuario *Admin* es Inborrable, si se borraria Eliminarias el Acceso al Sistema de porvida, Accion Denegada', 16,1)
else
UPDATE  USUARIO2 SET Estado='ELIMINADO'
 WHERE idUsuario =@idusuario and Login &lt;&gt;'admin'


















GO
/****** Object:  StoredProcedure [dbo].[eliminar_venta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_venta]
@idventa as integer
as
delete from ventas where idventa=@idventa 













GO
/****** Object:  StoredProcedure [dbo].[eliminarControlCobro]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminarControlCobro]
@idcontrol int 
as
delete from ControlCobros
where IdcontrolCobro=@idcontrol 
GO
/****** Object:  StoredProcedure [dbo].[imprimir_inventarios_todos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[imprimir_inventarios_todos]


AS 
SELECT    Codigo ,Descripcion,Precio_de_compra as Costo,Precio_de_venta as [Precio_Venta], Stock, Stock_minimo as [Stock_Minimo]
,Grupo_de_Productos.Linea  AS Categoria ,Precio_de_compra*Stock as Importe,EMPRESA.Nombre_Empresa,EMPRESA.Logo 
FROM         
						 dbo.Producto1 
						  cross join EMPRESA
						   inner join Grupo_de_Productos on Grupo_de_Productos.Idline=Producto1.Id_grupo 
















GO
/****** Object:  StoredProcedure [dbo].[ingresar_nombre_a_venta_en_espera]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ingresar_nombre_a_venta_en_espera]
@idventa int,
@nombre varchar(50)
as
update ventas set Comprobante =@nombre , Estado='EN ESPERA' where idventa = @idventa 







GO
/****** Object:  StoredProcedure [dbo].[Insertar_caja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Insertar_caja]

	
	@descripcion varchar(50),


	 @Tema varchar(50),
	  @Serial_PC varchar(max),
	   @Impresora_Ticket varchar(max),
	   @Impresora_A4 varchar(max),
	   @Tipo varchar(50)
    as
		declare @PuertoBalanza varchar(max)
	declare @EstadoBalanza varchar(50)
	set @PuertoBalanza='-'
	set @EstadoBalanza = 'PENDIENTE'
if EXISTS (SELECT  Descripcion,Serial_PC      FROM Caja    where  Descripcion=@descripcion and Serial_PC =@Serial_PC   )
RAISERROR ('Ya Existe una Caja con ese Nombre', 16,1)
else

declare @Estado as varchar(50)
set @Estado ='RECIEN CREADA'

    INSERT INTO Caja values 
	(@descripcion,@Tema ,@Serial_PC ,@Impresora_Ticket,@Impresora_A4,@Estado,@Tipo,@PuertoBalanza,@EstadoBalanza )





GO
/****** Object:  StoredProcedure [dbo].[insertar_clientes]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[insertar_clientes]
@Nombre As varchar(MAX),
@Direccion As varchar(MAX),
@IdentificadorFiscal As varchar(MAX),
@Celular As varchar(MAX),
@Estado As varchar(50),
@Saldo As numeric(18,2)
As
if EXISTS(select Nombre  from clientes  where Nombre=@Nombre )
RAISERROR('Registro ya existente', 16,1)
else
INSERT INTO clientes
Values (
@Nombre,
@Direccion,
@IdentificadorFiscal,
@Celular,
@Estado,
@Saldo)





GO
/****** Object:  StoredProcedure [dbo].[insertar_Conceptos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertar_Conceptos]
@Descripcion As varchar(MAX)
As
if Exists(select Descripcion  from Conceptos where Descripcion =@Descripcion  )
Raiserror('Concepto ya registrado',16,1 )
else
INSERT INTO Conceptos
Values (
@Descripcion)







GO
/****** Object:  StoredProcedure [dbo].[insertar_ControlCobros]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[insertar_ControlCobros]
@Monto As numeric(18,2),
@Fecha As datetime,
@Detalle As varchar(MAX),
@IdCliente As int,
@IdUsuario As int,
@IdCaja As int,
@Comprobante As varchar(MAX),
@efectivo numeric(18,2),
@tarjeta numeric(18,2)
As
INSERT INTO ControlCobros
Values (
@Monto,
@Fecha,
@Detalle,
@IdCliente,
@IdUsuario,
@IdCaja,
@Comprobante,
@efectivo,
@tarjeta)
GO
/****** Object:  StoredProcedure [dbo].[insertar_CreditoPorCobrar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertar_CreditoPorCobrar]
@Descripcion As varchar(MAX),
@Fecha_registro As datetime,
@Fecha_vencimiento As date,
@Total As numeric(18,2),
@Saldo As numeric(18,2),
@Estado As varchar(MAX),
@Id_caja As int,
@Id_cliente As int
As
INSERT INTO CreditoPorCobrar
Values (
@Descripcion,
@Fecha_registro,
@Fecha_vencimiento,
@Total,
@Saldo,
@Estado,
@Id_caja,
@Id_cliente)





GO
/****** Object:  StoredProcedure [dbo].[insertar_CreditoPorPagar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[insertar_CreditoPorPagar]
@Descripcion As varchar(MAX),
@Fecha_registro As datetime,
@Fecha_vencimiento As date,
@Total As numeric(18,2),
@Saldo As numeric(18,2),
@Estado As varchar(MAX),
@Id_caja As int,
@Id_Proveedor As int
As
INSERT INTO CreditoPorPagar
Values (
@Descripcion,
@Fecha_registro,
@Fecha_vencimiento,
@Total,
@Saldo,
@Estado,
@Id_caja,
@Id_Proveedor)






GO
/****** Object:  StoredProcedure [dbo].[insertar_DETALLE_cierre_de_caja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertar_DETALLE_cierre_de_caja]
	@fechaini datetime,
	 @fechafin datetime,
	 @fechacierre datetime, 
	  @ingresos numeric(18,2), 
    @egresos numeric(18,2),
	@saldo numeric(18,2),
	@idusuario int,
	 @totalcaluclado numeric(18,2),
	  @totalreal numeric(18,2), 
	 
	 @estado as varchar(50),
	 @diferencia as numeric(18,2)	,
	 @id_caja as int   
  AS BEGIN

if EXISTS (SELECT Estado FROM MOVIMIENTOCAJACIERRE 
 where  MOVIMIENTOCAJACIERRE.Estado='CAJA APERTURADA' and Id_caja =@id_caja )
RAISERROR ('Ya Fue Iniciado el Turno de esta Caja', 16,1)
else
BEGIN
    INSERT INTO MOVIMIENTOCAJACIERRE values 
	(@fechaini ,
	 @fechafin ,
	 @fechacierre , 
	  @ingresos , 
    @egresos ,
	@saldo ,
	@idusuario ,
	 @totalcaluclado ,
	  @totalreal , 
	
	 @estado ,
	 @diferencia ,
	 @id_caja )


	 end
	 end


















GO
/****** Object:  StoredProcedure [dbo].[insertar_detalle_venta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_detalle_venta]
@idventa as integer,
@Id_presentacionfraccionada as int,
@cantidad as numeric(18, 2),
@preciounitario as numeric(18, 2),
@moneda as varchar(50),

@unidades as varchar(50),
@Cantidad_mostrada as numeric(18,2),
@Estado as varchar(50),
@Descripcion varchar(50),
@Codigo varchar(50),
@Stock varchar(50),
@Se_vende_a VARCHAR(50),
@Usa_inventarios VARCHAR(50),
@Costo numeric(18,2)
as
BEGIN
if EXISTS (SELECT Id_producto,idventa   FROM detalle_venta 
inner join Producto1 on Producto1.Id_Producto1=detalle_venta.Id_producto 
  where Producto1. Id_Producto1  = @Id_presentacionfraccionada AND idventa=@idventa  ) 
update detalle_venta set 
cantidad    =cantidad +@cantidad  , 
Cantidad_mostrada=Cantidad_mostrada+@Cantidad_mostrada
where Id_producto =@Id_presentacionfraccionada 


else

BEGIN

insert into detalle_venta 

 values (@idventa,@Id_presentacionfraccionada ,@cantidad,@preciounitario,@moneda,@unidades,@Cantidad_mostrada
,@Estado,@Descripcion,@Codigo,@Stock ,@Se_vende_a ,@Usa_inventarios,@Costo)


END
END














GO
/****** Object:  StoredProcedure [dbo].[insertar_Empresa]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_Empresa]
@Nombre_Empresa  varchar(50),
@logo as image,
@Impuesto varchar(50),
@Porcentaje_impuesto numeric(18,0),
@Moneda varchar(50),

@Trabajas_con_impuestos VARCHAR(50),
@Modo_de_busqueda VARCHAR(50),
@Carpeta_para_copias_de_seguridad varchar(max),
@Correo_para_envio_de_reportes varchar(50),
@Ultima_fecha_de_copia_de_seguridad varchar(50),

@Ultima_fecha_de_copia_date datetime,
@Frecuencia_de_copias int,
@Estado varchar(50),
@Tipo_de_empresa varchar(50),
@Pais varchar(max),
@Redondeo_de_total varchar(50)

as
if EXISTS (SELECT Nombre_Empresa   FROM EMPRESA   where Nombre_Empresa  = @Nombre_Empresa   )
RAISERROR ('YA EXISTE UNA EMPRESA CON ESE NOMBRE, Ingrese un nombre diferente', 16,1)
else
insert into EMPRESA 
VALUES (@Nombre_Empresa,@logo,@Impuesto,@Porcentaje_impuesto,@Moneda ,@Trabajas_con_impuestos,@Modo_de_busqueda,
@Carpeta_para_copias_de_seguridad,@Correo_para_envio_de_reportes,@Ultima_fecha_de_copia_de_seguridad,
@Ultima_fecha_de_copia_date ,
@Frecuencia_de_copias ,
@Estado ,@Tipo_de_empresa,@Pais,@Redondeo_de_total)















GO
/****** Object:  StoredProcedure [dbo].[Insertar_FORMATO_TICKET]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Insertar_FORMATO_TICKET]

  
	  @Identificador_fiscal varchar(max),
           @Direccion varchar(max),
         
           @Provincia_Departamento_Pais varchar(max),
           @Nombre_de_Moneda varchar(max),
           @Agradecimiento varchar(max),
           @pagina_Web_Facebook varchar(max),
           @Anuncio varchar(max),
	   @Datos_fiscales_de_autorizacion varchar(max),
	   @Por_defecto as varchar(max)
	  
    as
	 DECLARE @Id_Empresa int  = (Select Id_empresa from EMPRESA )
    INSERT INTO Ticket values 

	(  
	@Id_Empresa ,
	  @Identificador_fiscal ,
           @Direccion,
         
           @Provincia_Departamento_Pais,
           @Nombre_de_Moneda ,
           @Agradecimiento ,
           @pagina_Web_Facebook ,
           @Anuncio,
	   @Datos_fiscales_de_autorizacion,
	   @Por_defecto )















GO
/****** Object:  StoredProcedure [dbo].[insertar_Gastos_varios]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[insertar_Gastos_varios]
@Fecha As datetime,
@Nro_documento As varchar(MAX),
@Tipo_comprobante As varchar(MAX),
@Importe As numeric(18,2),
@Descripcion As varchar(MAX),
@Id_caja As int,
@Id_concepto As int
As
INSERT INTO Gastos_varios
Values (
@Fecha,
@Nro_documento,
@Tipo_comprobante,
@Importe,
@Descripcion,
@Id_caja,
@Id_concepto)







GO
/****** Object:  StoredProcedure [dbo].[insertar_Grupo]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertar_Grupo]
@Grupo varchar(50),
@Por_defecto varchar(50)
as
if EXISTS (SELECT Linea FROM Grupo_de_Productos  where Linea = @Grupo  )
RAISERROR ('YA EXISTE UN GRUPO CON ESTE NOMBRE, Ingrese de nuevo', 16,1)
else
insert into Grupo_de_Productos  values (@Grupo, @Por_defecto)

















GO
/****** Object:  StoredProcedure [dbo].[insertar_Ingresos_varios]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[insertar_Ingresos_varios]
@Fecha As datetime,
@Nro_comprobante As varchar(MAX),
@Tipo_comprobante As varchar(MAX),
@Importe As numeric(18,2),
@Descripcion As varchar(MAX),
@Id_caja As int
As
INSERT INTO Ingresos_varios
Values (
@Fecha,
@Nro_comprobante,
@Tipo_comprobante,
@Importe,
@Descripcion,
@Id_caja)







GO
/****** Object:  StoredProcedure [dbo].[insertar_inicio_De_sesion]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[insertar_inicio_De_sesion]

 
 @Id_serial_Pc varchar(max)

  as
  declare @id_usuario_nuevo as int
  set @id_usuario_nuevo = (SELECT max(idUsuario)  FROM USUARIO2  )

insert into Inicios_de_sesion_por_caja

values (@Id_serial_Pc,@id_usuario_nuevo )















GO
/****** Object:  StoredProcedure [dbo].[insertar_KARDEX_Entrada]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_KARDEX_Entrada]
           @Fecha datetime,
		   @Motivo varchar(max),
		   @Cantidad as numeric(18,2),
		   @Id_producto int	,
	       @Id_usuario as int,
		   @Tipo as varchar(50),
		    @Estado varchar(50),
			@Id_caja int
			as
			declare @Hay as numeric(18,2)
			declare @Habia as numeric(18,2)
			declare @Costo_unt numeric(18,2)
			set @Hay = (select Stock  from Producto1 where Id_Producto1 =@Id_producto and Usa_inventarios ='SI')
			set @Costo_unt=(select Precio_de_compra   from Producto1 where Id_Producto1 =@Id_producto and Usa_inventarios ='SI')
			set @Habia = @Hay-@Cantidad 

			insert into KARDEX 
			Values(
			 @Fecha ,
		     @Motivo ,			         
             @Cantidad 	,
	         @Id_producto 	,
	         @Id_usuario ,	
	         @Tipo,
		     @Estado ,@Costo_unt, @Habia ,@Hay ,@Id_caja)
GO
/****** Object:  StoredProcedure [dbo].[insertar_KARDEX_SALIDA]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_KARDEX_SALIDA]
           @Fecha datetime,
		   @Motivo varchar(max),
		   @Cantidad as numeric(18,2),
		   @Id_producto int	,
	       @Id_usuario as int,
		   @Tipo as varchar(50),
		    @Estado varchar(50),
			@Id_caja int
			as
			declare @Hay as numeric(18,2)
			declare @Habia as numeric(18,2)
			declare @Costo_unt numeric(18,2)
			set @Hay = (select Stock  from Producto1 where Id_Producto1 =@Id_producto and Usa_inventarios ='SI')
			set @Costo_unt=(select Precio_de_compra   from Producto1 where Id_Producto1 =@Id_producto and Usa_inventarios ='SI')
			set @Habia = @Hay+@Cantidad 

			insert into KARDEX 
			Values(
			 @Fecha ,
		     @Motivo ,			         
             @Cantidad 	,
	         @Id_producto 	,
	         @Id_usuario ,	
	         @Tipo,
		     @Estado ,@Costo_unt, @Habia ,@Hay ,@Id_caja)

	








GO
/****** Object:  StoredProcedure [dbo].[Insertar_marcan]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Insertar_marcan]

	
	@s varchar(MAX),
	@f varchar(MAX),
	@e varchar(MAX),
	@fa varchar(MAX)
    as
	
    INSERT INTO Marcan values 
	(@s,@f,@e ,@fa)















GO
/****** Object:  StoredProcedure [dbo].[insertar_Producto]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertar_Producto]   
           --Empezamos a declara primero los parametros para Productos
           @Descripcion varchar(50),
		    @Imagen varchar(50),			         
         
          @Id_grupo as int	,
		  @Usa_inventarios varchar(50),
		   @Stock varchar(50),
           @Precio_de_compra numeric(18,2),
           @Fecha_de_vencimiento varchar(50),
           @Precio_de_venta numeric(18,2),
           @Codigo varchar(50),
           @Se_vende_a varchar(50),
           @Impuesto varchar(50),
           @Stock_minimo numeric(18,2),
           @Precio_mayoreo numeric(18,2)
	,@A_partir_de numeric(18,2),
	--Ahora declaramos los parametros para el Ingreso a Kardex que es donde se controla el Inventario
	@Fecha datetime,
		    @Motivo varchar(200),			               
          @Cantidad as numeric(18,0)	,
	 
	   @Id_usuario as int,	
	   @Tipo as varchar(50),
	   @Estado varchar(50)	,   	   		
		@Id_caja int
		   AS 
		   --Ahora VALIDAMOS para que no se agregen productos con el mismo nombre y codigo de barras
		   BEGIN
		
if EXISTS (SELECT Descripcion,Codigo  FROM Producto1  where Descripcion = @Descripcion and Codigo=@Codigo  )
RAISERROR ('YA EXISTE UN PRODUCTO  CON ESTE NOMBRE/CODIGO, POR FAVOR INGRESE DE NUEVO/ SE GENERARA CODIGO AUTOMATICO', 16,1)
else
BEGIN
DECLARE  @Id_producto  INT
		   INSERT INTO Producto1
     VALUES
		    (
           @Descripcion        
           ,@Imagen         
		    ,@Id_grupo 
		,@Usa_inventarios	,
		@Stock ,
           @Precio_de_compra ,
           @Fecha_de_vencimiento ,
           @Precio_de_venta ,
           @Codigo ,
           @Se_vende_a ,
           @Impuesto ,
           @Stock_minimo ,
           @Precio_mayoreo,
		   @A_partir_de
		 )
		 --Ahora Obtenemos el Id del producto que se acaba de ingresar
		    SELECT  @id_producto = scope_identity()
			 --Ahora Obtenemos los datos del producto ingresado para que sean insertados en la Tabla KARDEX
			  DECLARE @Hay AS numeric(18,2)
		 DECLARE @Habia as numeric(18,2)
		 declare @Costo_unt numeric(18,2)
		
       SET @Hay = (SELECT Stock  FROM Producto1 WHERE Producto1.Id_Producto1   =@Id_producto and Producto1.Usa_inventarios ='SI' )
       SET @Costo_unt = (SELECT Producto1.Precio_de_compra   FROM Producto1 WHERE Producto1.Id_Producto1   =@Id_producto and Producto1.Usa_inventarios ='SI' )		   
       SET @Habia = 0
	   --Ahora vamos a saber si el Producto usa Inventarios o no
		  set @Usa_inventarios = (SELECT Usa_inventarios   FROM Producto1 WHERE Producto1.Id_Producto1   =@Id_producto and Producto1.Usa_inventarios ='SI' )
		 --Ahora en caso si Use inventarios Entonces Pasamos a Insertar datos en la Tabla Kardex
		   if @Usa_inventarios ='SI'
		   BEGIN	 
		   INSERT INTO KARDEX
        VALUES
		    (
        @Fecha ,
		    @Motivo ,			                  
          @Cantidad 	,

	  @Id_producto 	,
	   @Id_usuario ,	
	   @Tipo,		
		@Estado ,@Costo_unt, @Habia ,@Hay ,@Id_caja)
		END
		
END
END

















GO
/****** Object:  StoredProcedure [dbo].[insertar_Producto_Importacion]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertar_Producto_Importacion]   
           --Empezamos a declara primero los parametros para Productos
           @Descripcion varchar(50),
		    @Imagen varchar(50),			         
         
     
		  @Usa_inventarios varchar(50),
		   @Stock varchar(50),
           @Precio_de_compra numeric(18,2),
           @Fecha_de_vencimiento varchar(50),
           @Precio_de_venta numeric(18,2),
           @Codigo varchar(50),
           @Se_vende_a varchar(50),
           @Impuesto varchar(50),
           @Stock_minimo numeric(18,2),
           @Precio_mayoreo numeric(18,2)
	,@A_partir_de numeric(18,2),
	--Ahora declaramos los parametros para el Ingreso a Kardex que es donde se controla el Inventario
	@Fecha datetime,
		    @Motivo varchar(200),			               
          @Cantidad as numeric(18,0)	,
	 
	   @Id_usuario as int,	
	   @Tipo as varchar(50),
	   @Estado varchar(50)	,   	   		
		@Id_caja int
		   AS 
		    declare    @Id_grupo as int	
			set @Id_grupo= (Select Idline  from Grupo_de_Productos where Grupo_de_Productos.Linea= 'General')
		   --Ahora VALIDAMOS para que no se agregen productos con el mismo nombre y codigo de barras
		   BEGIN
		
if EXISTS (SELECT Descripcion,Codigo  FROM Producto1  where (Descripcion = @Descripcion and Codigo=@Codigo) or Descripcion ='' )
select top 0 *from Producto1
else
BEGIN
DECLARE  @Id_producto  INT
		   INSERT INTO Producto1
     VALUES
		    (
           @Descripcion        
           ,@Imagen         
		    ,@Id_grupo 
		,@Usa_inventarios	,
		@Stock ,
           @Precio_de_compra ,
           @Fecha_de_vencimiento ,
           @Precio_de_venta ,
           @Codigo ,
           @Se_vende_a ,
           @Impuesto ,
           @Stock_minimo ,
           @Precio_mayoreo,
		   @A_partir_de
		 )
		 --Ahora Obtenemos el Id del producto que se acaba de ingresar
		    SELECT  @id_producto = scope_identity()
			 --Ahora Obtenemos los datos del producto ingresado para que sean insertados en la Tabla KARDEX
			  DECLARE @Hay AS numeric(18,2)
		 DECLARE @Habia as numeric(18,2)
		 declare @Costo_unt numeric(18,2)
		
       SET @Hay = (SELECT Stock  FROM Producto1 WHERE Producto1.Id_Producto1   =@Id_producto and Producto1.Usa_inventarios ='SI' )
       SET @Costo_unt = (SELECT Producto1.Precio_de_compra   FROM Producto1 WHERE Producto1.Id_Producto1   =@Id_producto and Producto1.Usa_inventarios ='SI' )		   
       SET @Habia = 0
	   --Ahora vamos a saber si el Producto usa Inventarios o no
		  set @Usa_inventarios = (SELECT Usa_inventarios   FROM Producto1 WHERE Producto1.Id_Producto1   =@Id_producto and Producto1.Usa_inventarios ='SI' )
		 --Ahora en caso si Use inventarios Entonces Pasamos a Insertar datos en la Tabla Kardex
		   if @Usa_inventarios ='SI'

		   

		   BEGIN	 
		   INSERT INTO KARDEX
        VALUES
		    (
        @Fecha ,
		    @Motivo ,			                  
          @Cantidad 	,

	  @Id_producto 	,
	   @Id_usuario ,	
	   @Tipo,		
		@Estado ,@Costo_unt, @Habia ,@Hay ,@Id_caja)
		END
		
		begin
		update Producto1 set Codigo=Id_Producto1 
		where Codigo = 'VACIO@'
		end

		begin
		delete from Producto1 where Descripcion ='VACIO@'
		end

		begin
		delete from Producto1 where Descripcion ='Descripcion'
		end

END
END

















GO
/****** Object:  StoredProcedure [dbo].[insertar_Proveedores]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertar_Proveedores]
@Nombre As varchar(MAX),
@Direccion As varchar(MAX),
@IdentificadorFiscal As varchar(MAX),
@Celular As varchar(MAX),
@Estado As varchar(50),
@Saldo As numeric(18,2)
As
if EXISTS(select Nombre  from Proveedores where Nombre=@Nombre )
RAISERROR('Registro ya existente', 16,1)
else
INSERT INTO Proveedores
Values (
@Nombre,
@Direccion,
@IdentificadorFiscal,
@Celular,
@Estado,
@Saldo)





GO
/****** Object:  StoredProcedure [dbo].[insertar_Serializacion]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_Serializacion]

@Serie varchar (50),
@numeroinicio as varchar (50),
@numerofin as varchar (50),
@Destino as varchar(50),
@tipodoc varchar(50)
,@Por_defecto varchar(50)
as 
if EXISTS (SELECT tipodoc  FROM Serializacion  where  tipodoc= @tipodoc )
RAISERROR ('YA EXISTE ESTE COMPROBANTE INGRESE UNO NUEVO', 16,1)
else

insert into Serializacion  values (@Serie ,
@numeroinicio ,
@numerofin,@Destino ,@tipodoc ,@Por_defecto)
















GO
/****** Object:  StoredProcedure [dbo].[insertar_usuario]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertar_usuario]
@nombres varchar(50) ,
@Login varchar(50),
@Password VARCHAR(50),
@Icono image,
@Nombre_de_icono varchar(max),
@Correo varchar(max),
@Rol varchar(max),
@Estado varchar(50)
as
if exists (select Login FROM USUARIO2 where Login=@Login and Estado='ACTIVO')
raiserror('YA EXISTE UN USUARIO CON ESE LOGIN O CON ESE ICONO, POR FAVOR INGRESE DE NUEVO',16,1 )
ELSE

insert into USUARIO2 
values(@nombres,@Login,@Password,@Icono,@Nombre_de_icono,@Correo,@Rol,@Estado  )

















GO
/****** Object:  StoredProcedure [dbo].[insertar_venta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_venta]
@idcliente as integer,
@fecha_venta as datetime,

@nume_documento as varchar(50),
@montototal  as numeric(18,2),
@Tipo_de_pago as varchar(50),
@estado as varchar(50),
@IGV as numeric(18, 1),

@Comprobante as VARCHAR(50),
@id_usuario as int,
@Fecha_de_pago as varchar(50),
@ACCION VARCHAR(50),
@Saldo numeric(18,2),
@Pago_con numeric(18,2),
@Porcentaje_IGV numeric(18,2),
@Id_caja int,
@Referencia_tarjeta varchar(50)

as 
declare @vuelto numeric(18,2)
declare @Efectivo numeric(18,2)
declare @id_numero varchar(50)
declare @Credito numeric(18,2)
declare @Tarjeta numeric(18,2)
SET @vuelto =0
SET @Efectivo =0
SET @id_numero= (select max(idventa)+1 from ventas )
SET @Credito =0
SET @Tarjeta =0
insert into ventas 
values (@idcliente,@fecha_venta,@nume_documento ,@montototal ,@Tipo_de_pago,@estado ,@IGV 
,@Comprobante +' '+ @id_numero ,@id_usuario,@Fecha_de_pago,@ACCION ,@Saldo,@Pago_con,@Porcentaje_IGV,
@Id_caja,@Referencia_tarjeta,
@vuelto ,@Efectivo,@Credito,@Tarjeta )













GO
/****** Object:  StoredProcedure [dbo].[insertarCorreoBase]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertarCorreoBase]
@Correo varchar(max),
@Password varchar(max),
@Estado_De_envio varchar(50)
as
Insert into CorreoBase values(@Correo,@Password,@Estado_De_envio)


GO
/****** Object:  StoredProcedure [dbo].[M_ventas_credito_por_turno]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[M_ventas_credito_por_turno]
@idcaja int, 
@fi datetime,
@ff datetime
as
select sum(Credito) from ventas 
where (fecha_venta &gt;=@fi and fecha_venta &lt;=@ff) and Id_caja=@idcaja





GO
/****** Object:  StoredProcedure [dbo].[M_ventas_Tarjeta_por_turno]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[M_ventas_Tarjeta_por_turno]
@idcaja int, 
@fi datetime,
@ff datetime
as
select sum(Tarjeta) from ventas 
where (fecha_venta &gt;=@fi and fecha_venta &lt;=@ff) and Id_caja=@idcaja 





GO
/****** Object:  StoredProcedure [dbo].[MarcanVencidas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MarcanVencidas]
@E varchar(max)
as
update Marcan set E=@E
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_caja_principal]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Mostrar_caja_principal]
as
if Exists(Select MOVIMIENTOCAJACIERRE.Id_caja   from MOVIMIENTOCAJACIERRE inner join 
Caja on caja.Id_Caja=MOVIMIENTOCAJACIERRE.Id_caja where Caja.tipo='PRINCIPAL' )

Select Caja.*, USUARIO2.Nombres_y_Apellidos  ,MAX(MOVIMIENTOCAJACIERRE.idcierrecaja )    
from MOVIMIENTOCAJACIERRE inner join 
Caja on caja.Id_Caja=MOVIMIENTOCAJACIERRE.Id_caja 
inner join USUARIO2 on USUARIO2.idUsuario= MOVIMIENTOCAJACIERRE.Id_usuario 
where Caja.tipo='PRINCIPAL' 
GROUP BY Caja.Serial_PC, Caja.Id_Caja,Caja.Descripcion,Caja.Tema,Caja.Impresora_A4,Caja.Impresora_Ticket 
,Caja.Estado,CAJA.Tipo  , USUARIO2.Nombres_y_Apellidos, Caja.PuertoBalanza , Caja.EstadoBalanza 

else

Select Caja.*, USUARIO2.Nombres_y_Apellidos  from Caja
cross join USUARIO2 
 where tipo='PRINCIPAL' and USUARIO2.Login  ='admin'

GO
/****** Object:  StoredProcedure [dbo].[Mostrar_caja_remota]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Mostrar_caja_remota]
as
if Exists(Select MOVIMIENTOCAJACIERRE.Id_caja   from MOVIMIENTOCAJACIERRE inner join 
Caja on caja.Id_Caja=MOVIMIENTOCAJACIERRE.Id_caja where Caja.tipo='SECUNDARIA' )

Select Caja.*, USUARIO2.Nombres_y_Apellidos   ,MAX(MOVIMIENTOCAJACIERRE.idcierrecaja )    
from MOVIMIENTOCAJACIERRE inner join 
Caja on caja.Id_Caja=MOVIMIENTOCAJACIERRE.Id_caja 
inner join USUARIO2 on USUARIO2.idUsuario= MOVIMIENTOCAJACIERRE.Id_usuario 
where Caja.tipo='SECUNDARIA' 
GROUP BY Caja.Serial_PC, Caja.Id_Caja,Caja.Descripcion,Caja.Tema,Caja.Impresora_A4,Caja.Impresora_Ticket 
,Caja.Estado,CAJA.Tipo  , USUARIO2.Nombres_y_Apellidos ,Caja.PuertoBalanza , Caja.EstadoBalanza
else

Select Caja.*, USUARIO2.Nombres_y_Apellidos  from Caja
cross join USUARIO2 
 where tipo='SECUNDARIA' and USUARIO2.Login  ='admin'
















GO
/****** Object:  StoredProcedure [dbo].[mostrar_cajas_por_Serial_de_DiscoDuro]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[mostrar_cajas_por_Serial_de_DiscoDuro]
@Serial as varchar(max)
as
select Id_Caja  ,Descripcion ,Impresora_Ticket,Impresora_A4,Estado,Tipo,Tema
from Caja 
where Serial_PC =@Serial



GO
/****** Object:  StoredProcedure [dbo].[mostrar_cierre_de_caja_pendiente]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_cierre_de_caja_pendiente]
@idcaja int
as
select Id_caja,fechainicio,Saldo_queda_en_caja as SaldoInicial from MOVIMIENTOCAJACIERRE 
where Id_caja=@idcaja and Estado='CAJA APERTURADA'





GO
/****** Object:  StoredProcedure [dbo].[mostrar_clientes]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[mostrar_clientes]
As
SELECT        idclientev , Nombre, Direccion, IdentificadorFiscal as [Identificador Fiscal] , Celular, Estado, Saldo
FROM            dbo.clientes where Nombre&lt;&gt;'GENERICO'





GO
/****** Object:  StoredProcedure [dbo].[mostrar_cobros_en_efectivo_por_turno]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_cobros_en_efectivo_por_turno]
@idcaja int, 
@fi datetime,
@ff datetime
as
select sum(Efectivo ) from ControlCobros  
where (Fecha &gt;=@fi and Fecha &lt;=@ff) and IdCaja =@idcaja 

GO
/****** Object:  StoredProcedure [dbo].[mostrar_cobros_tarjeta_por_turno]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_cobros_tarjeta_por_turno]
@idcaja int, 
@fi datetime,
@ff datetime
as
select sum(Tarjeta ) from ControlCobros  
where (Fecha &gt;=@fi and Fecha &lt;=@ff) and IdCaja =@idcaja 
GO
/****** Object:  StoredProcedure [dbo].[mostrar_ControlCobros]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[mostrar_ControlCobros]
As
Select * FROM ControlCobros

GO
/****** Object:  StoredProcedure [dbo].[mostrar_CreditoPorPagar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[mostrar_CreditoPorPagar]
As
Select * FROM CreditoPorPagar







GO
/****** Object:  StoredProcedure [dbo].[mostrar_descripcion_produco_sin_repetir]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[mostrar_descripcion_produco_sin_repetir]

@buscar varchar(50)
as begin
select TOP 10 Descripcion  from Producto1  Where Descripcion  LIKE  '%' + @buscar +'%'
end

















GO
/****** Object:  StoredProcedure [dbo].[mostrar_Empresa]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_Empresa]
as
select LOGO, Nombre_Empresa as Empresa ,(Impuesto + ' ('+  CONVERT(VARCHAR(50),Porcentaje_impuesto) + ')') Impuesto 
,Moneda  ,Id_empresa  
,Porcentaje_impuesto  ,Impuesto ,Modo_de_busqueda ,Trabajas_con_impuestos ,Trabajas_con_impuestos,
Correo_para_envio_de_reportes,
Carpeta_para_copias_de_seguridad  , Pais 
from Empresa













GO
/****** Object:  StoredProcedure [dbo].[Mostrar_formato_ticket]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Mostrar_formato_ticket]
as
select EMPRESA.Logo,Empresa.Nombre_Empresa ,Ticket.*  from Ticket 
INNER JOIN EMPRESA ON EMPRESA.Id_empresa=Ticket.Id_Empresa 














GO
/****** Object:  StoredProcedure [dbo].[mostrar_gastos_por_turnos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_gastos_por_turnos]
@idcaja int,
@fi as datetime,
@ff as datetime
as
SELECT        dbo.Gastos_varios.Id_gasto, dbo.Gastos_varios.Fecha, dbo.Conceptos.Descripcion Concepto,
dbo.Gastos_varios.Descripcion , dbo.Gastos_varios.Importe
FROM            dbo.Conceptos INNER JOIN
                         dbo.Gastos_varios ON dbo.Conceptos.Id_concepto = dbo.Gastos_varios.Id_concepto
						 where Gastos_varios.Id_caja = @idcaja and (Fecha &gt;=@fi and Fecha &lt;=@ff)





GO
/****** Object:  StoredProcedure [dbo].[mostrar_grupos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[mostrar_grupos]

@buscar varchar(50)
as begin
select Idline,Linea  as Grupo from Grupo_de_Productos  Where Linea  LIKE  '%' + @buscar +'%'
end
















GO
/****** Object:  StoredProcedure [dbo].[mostrar_id_venta_por_Id_caja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_id_venta_por_Id_caja]
@Id_caja int
as
select Max(idventa) from ventas 
where Id_caja=@Id_caja 













GO
/****** Object:  StoredProcedure [dbo].[mostrar_impresoras_por_caja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_impresoras_por_caja]
@Serial as varchar(max)
as
select Impresora_Ticket 
from Caja 
where Serial_PC =@Serial














GO
/****** Object:  StoredProcedure [dbo].[mostrar_ingresos_por_turnos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_ingresos_por_turnos]
@idcaja int,
@fi as datetime,
@ff as datetime
as
SELECT        Id_ingreso , Fecha,
Descripcion ,Importe
FROM   Ingresos_varios          

where Id_caja = @idcaja and (Fecha &gt;=@fi and Fecha &lt;=@ff)





GO
/****** Object:  StoredProcedure [dbo].[mostrar_inicio_De_sesion]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[mostrar_inicio_De_sesion]
  @id_serial_pc as varchar(max)
  as
select  Inicios_de_sesion_por_caja.Id_usuario ,USUARIO2.Nombres_y_Apellidos  
from Inicios_de_sesion_por_caja inner join 
USUARIO2 on USUARIO2.idUsuario=Inicios_de_sesion_por_caja.Id_usuario 

where Id_serial_Pc =@id_serial_pc 

GO
/****** Object:  StoredProcedure [dbo].[MOSTRAR_Inventarios_bajo_minimo]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[MOSTRAR_Inventarios_bajo_minimo]
AS
select  Codigo,Descripcion,Precio_de_compra AS [Precio_de_Compra],Grupo_de_Productos. linea as Categoria,
 Stock ,Stock_minimo as [Stock_Minimo],Grupo_de_Productos. linea,EMPRESA.Nombre_Empresa,EMPRESA.Logo  
 from Producto1 cross join EMPRESA
				inner join Grupo_de_Productos on Grupo_de_Productos.Idline=Producto1.Id_grupo 
				where Stock &lt;= Stock_minimo 	and Usa_inventarios ='SI'
















GO
/****** Object:  StoredProcedure [dbo].[mostrar_inventarios_todos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[mostrar_inventarios_todos]

@letra varchar(50)
AS 
SELECT    Codigo ,Descripcion,Precio_de_compra as Costo,Precio_de_venta as [Precio_Venta], Stock, Stock_minimo as [Stock_Minimo]
,Grupo_de_Productos.Linea  AS Categoria ,Precio_de_compra*Stock as Importe,EMPRESA.Nombre_Empresa,EMPRESA.Logo 
FROM         
						 dbo.Producto1 
						  cross join EMPRESA
						   inner join Grupo_de_Productos on Grupo_de_Productos.Idline=Producto1.Id_grupo 
where Descripcion+Codigo   LIKE  '%' + @letra+'%' AND Producto1.Usa_inventarios ='SI'
















GO
/****** Object:  StoredProcedure [dbo].[MOSTRAR_MOVIMIENTOS_DE_CAJA_POR_SERIAL]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MOSTRAR_MOVIMIENTOS_DE_CAJA_POR_SERIAL]

@serial varchar(max)

AS
SELECT USUARIO2.Login,USUARIO2.Nombres_y_Apellidos     FROM MOVIMIENTOCAJACIERRE 
inner join USUARIO2 on USUARIO2.idUsuario=MOVIMIENTOCAJACIERRE.Id_usuario
 inner join Caja on Caja.Id_Caja =MOVIMIENTOCAJACIERRE.Id_caja 
 where Caja.Serial_PC = @serial    AND MOVIMIENTOCAJACIERRE.Estado='CAJA APERTURADA' 






GO
/****** Object:  StoredProcedure [dbo].[MOSTRAR_MOVIMIENTOS_DE_CAJA_POR_SERIAL_y_usuario]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MOSTRAR_MOVIMIENTOS_DE_CAJA_POR_SERIAL_y_usuario]

@serial varchar(50),
@idusuario int

AS
SELECT USUARIO2.Login,USUARIO2.Nombres_y_Apellidos    FROM MOVIMIENTOCAJACIERRE inner join USUARIO2 on USUARIO2.idUsuario=MOVIMIENTOCAJACIERRE.Id_usuario
 inner join Caja on Caja.Id_Caja =MOVIMIENTOCAJACIERRE.Id_caja 
 where Caja.Serial_PC = @serial    AND MOVIMIENTOCAJACIERRE.Estado='CAJA APERTURADA' and MOVIMIENTOCAJACIERRE.Id_usuario =@idusuario and USUARIO2.Estado ='ACTIVO'


















GO
/****** Object:  StoredProcedure [dbo].[MOSTRAR_MOVIMIENTOS_DE_KARDEX]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[MOSTRAR_MOVIMIENTOS_DE_KARDEX]

@idProducto int
AS
SELECT       KARDEX.Fecha ,Producto1.Descripcion ,KARDEX.Motivo as Movimiento, KARDEX.Cantidad ,KARDEX.Tipo ,KARDEX.Cantidad ,KARDEX.Hay  as Hay ,USUARIO2.Nombres_y_Apellidos  as Cajero ,Grupo_de_Productos .linea as Categoria, KARDEX.Costo_unt , KARDEX.Total 
,Grupo_de_Productos .linea ,EMPRESA.Nombre_Empresa,EMPRESA.Logo ,Producto1.Stock,convert(numeric(18,2), Producto1.Stock * KARDEX.Costo_unt) as TotalInventario
FROM            dbo.KARDEX INNER JOIN Producto1 on Producto1.Id_Producto1=KARDEX.Id_producto inner join USUARIO2 on USUARIO2.idUsuario =KARDEX.Id_usuario 
             cross join EMPRESA
			 inner join Grupo_de_Productos on Grupo_de_Productos.Idline=Producto1.Id_grupo 
			where    Producto1.Id_Producto1=@idProducto
			
			 order by KARDEX.Id_kardex  Desc 

















GO
/****** Object:  StoredProcedure [dbo].[mostrar_notas_por_alumno]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[mostrar_notas_por_alumno]
@Id_alumno int
AS
 Select dbo.NOTAS.*, dbo.Alumnos.Nombres +' ' + dbo.Alumnos.Apellido_Paterno + ' ' + Apellido_Materno  , dbo.Alumnos.Nombres, dbo.Alumnos.Codigo
 from NOTAS inner join Alumnos on Alumnos.idalumno =NOTAS.Id_alumno 
 
where NOTAS.Id_alumno =@Id_alumno  order by NOTAS.Id_notas  desc















GO
/****** Object:  StoredProcedure [dbo].[mostrar_permisos_por_usuario_ROL_UNICO]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_permisos_por_usuario_ROL_UNICO]
@idusario int
as 
select 
USUARIO2.Rol 
from USUARIO2 
where USUARIO2.idUsuario  =@idusario and USUARIO2.Estado ='ACTIVO'






GO
/****** Object:  StoredProcedure [dbo].[mostrar_productos_agregados_a_venta]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_productos_agregados_a_venta]
@idventa as int
as
SELECT      detalle_venta . Codigo ,( detalle_venta .Descripcion ) as Producto,
 dbo.detalle_venta.Cantidad_mostrada as Cant, 
dbo.detalle_venta.preciounitario as P_Unit ,
convert(numeric(18,2),dbo.detalle_venta.Total_a_pagar) as Importe,
						  detalle_venta .Id_producto  ,DBO.detalle_venta.iddetalle_venta ,dbo.ventas.Estado 
						 , detalle_venta .Stock ,dbo.detalle_venta.cantidad ,ventas.idclientev 
						 , detalle_venta .Stock ,detalle_venta .Stock ,Usa_inventarios ,
						 Se_vende_a ,detalle_venta.idventa 
FROM            dbo.detalle_venta INNER JOIN
                         ventas ON dbo.detalle_venta.idventa = ventas.idventa 
where dbo.detalle_venta .idventa =@idventa AND detalle_venta.cantidad &gt;0 order by 
detalle_venta.iddetalle_venta desc













GO
/****** Object:  StoredProcedure [dbo].[mostrar_productos_agregados_a_ventas_en_espera]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_productos_agregados_a_ventas_en_espera]
@idventa int
as
SELECT        dbo.detalle_venta.Descripcion as Producto, dbo.detalle_venta.Cantidad_mostrada as Cant,
dbo.detalle_venta.preciounitario as [P Unit], dbo.detalle_venta.Total_a_pagar as Importe
FROM            dbo.ventas INNER JOIN
                         dbo.detalle_venta ON dbo.ventas.idventa = dbo.detalle_venta.idventa
						 where detalle_venta.idventa =@idventa and detalle_venta.cantidad &gt;0







GO
/****** Object:  StoredProcedure [dbo].[mostrar_productos_vencidos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[mostrar_productos_vencidos]
as

select Id_Producto1,Codigo ,Descripcion 

,Fecha_de_vencimiento as F_vencimiento ,Stock
,datediff(day,Fecha_de_vencimiento,CONVERT(DATE,GETDATE ()))as [Dias Vencidos] from Producto1 

where   Fecha_de_vencimiento &lt;&gt;'NO APLICA' AND Fecha_de_vencimiento &lt;= CONVERT(DATE,GETDATE ()) 

















GO
/****** Object:  StoredProcedure [dbo].[mostrar_productos_vencidos_en_menos_de_30_dias]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[mostrar_productos_vencidos_en_menos_de_30_dias]

as

select Id_Producto1,Codigo ,Descripcion 

,Fecha_de_vencimiento as F_vencimiento ,Stock
,(datediff(day,Fecha_de_vencimiento,CONVERT(DATE,GETDATE ())))*(-1)as [Dias a Vencer] from Producto1 

where   Fecha_de_vencimiento &lt;&gt;'NO APLICA' AND Fecha_de_vencimiento &gt; CONVERT(DATE,GETDATE ()) and (datediff(day,Fecha_de_vencimiento,CONVERT(DATE,GETDATE ())))*(-1) &lt;=30
order by (datediff(day,Fecha_de_vencimiento,CONVERT(DATE,GETDATE ())))*(-1) asc
















GO
/****** Object:  StoredProcedure [dbo].[mostrar_Proveedores]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[mostrar_Proveedores]
As
SELECT        IdProveedor, Nombre, Direccion, IdentificadorFiscal as [Identificador Fiscal] , Celular, Estado, Saldo
FROM            dbo.Proveedores





GO
/****** Object:  StoredProcedure [dbo].[mostrar_stock_de_detalle_de_ventas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_stock_de_detalle_de_ventas]
@Id_producto int 
as
select detalle_venta.Stock,detalle_venta.Descripcion   from ventas 
inner join detalle_venta on detalle_venta.idventa=ventas.idventa  
where ventas.Estado ='EN ESPERA' and detalle_venta.Id_producto =@Id_producto and detalle_venta.Usa_inventarios ='SI'













GO
/****** Object:  StoredProcedure [dbo].[mostrar_ticket_impreso]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_ticket_impreso]
@Id_venta int,
@total_en_letras varchar(50)
as
declare @cantidad_de_productos int
set @cantidad_de_productos = (select SUM (cantidad ) from detalle_venta inner join ventas on ventas.idventa = detalle_venta.idventa 
where detalle_venta .idventa = @Id_venta  )

select detalle_venta.Descripcion as Producto , detalle_venta.Cantidad_mostrada as Cant,
detalle_venta.preciounitario as P_Unit , detalle_venta.Total_a_pagar as Importe,
EMPRESA.Nombre_Empresa as Empresa, EMPRESA.Logo, Ticket.*,ventas.fecha_venta as fecha,
(EMPRESA.Impuesto + '(' + convert(varchar(50),ventas.Porcentaje_IGV ) + '%):') as Impuesto
 ,((ventas.Monto_total*ventas.Porcentaje_IGV)/100) as Subtotal_Impuesto,ventas.Monto_total ,
 USUARIO2.Nombres_y_Apellidos as Usuario, ventas.Pago_con , ventas.Vuelto ,EMPRESA .Moneda  ,
 clientes.Nombre ,ventas.Tipo_de_pago , @cantidad_de_productos as Cantidad_de_productos,@total_en_letras
 as total_en_letras, ventas.Comprobante , ventas.Numero_de_doc
 from detalle_venta inner join ventas  on ventas.idventa = detalle_venta.idventa 
inner join USUARIO2 on USUARIO2.idUsuario = ventas.Id_usuario 
inner join clientes on clientes .idclientev= ventas.idclientev
cross join EMPRESA 
cross join Ticket

where detalle_venta.idventa= @Id_venta and ventas.Monto_total &gt;0 order by detalle_venta.iddetalle_venta desc  














GO
/****** Object:  StoredProcedure [dbo].[mostrar_Tipo_de_documentos_para_insertar_estos_mismos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_Tipo_de_documentos_para_insertar_estos_mismos]
as

SELECT       dbo.Serializacion.Serie ,dbo.Serializacion.Cantidad_de_numeros , dbo.Serializacion.numerofin ,dbo.Serializacion.Id_serializacion ,(dbo.Serializacion.Serie  +' - '+ dbo.Serializacion.Cantidad_de_numeros + dbo.Serializacion.numerofin) as serie_completa,Serializacion.tipodoc  AS COMPROBANTE
,Por_defecto 
FROM            dbo.Serializacion where destino='VENTAS' OR destino='OTROS'













GO
/****** Object:  StoredProcedure [dbo].[mostrar_usuario]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_usuario]
as
select  idUsuario,Nombres_y_Apellidos AS Nombres,Login,Password
,Icono ,Nombre_de_icono ,Correo ,rol  FROM USUARIO2 Where Estado='ACTIVO'


















GO
/****** Object:  StoredProcedure [dbo].[mostrar_ventas_en_efectivo_por_turno]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_ventas_en_efectivo_por_turno]
@idcaja int, 
@fi datetime,
@ff datetime
as
select sum(Efectivo) from ventas 
where (fecha_venta &gt;=@fi and fecha_venta &lt;=@ff) and Id_caja=@idcaja 





GO
/****** Object:  StoredProcedure [dbo].[mostrar_ventas_en_espera_con_fecha_y_monto]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_ventas_en_espera_con_fecha_y_monto]
as
select idventa,Comprobante,fecha_venta,Id_caja  from ventas 
where Estado='EN ESPERA'







GO
/****** Object:  StoredProcedure [dbo].[mostrarEstadosCuentaCliente]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrarEstadosCuentaCliente]
@idcliente int
as

SELECT        dbo.detalle_venta.Descripcion, dbo.detalle_venta.Cantidad_mostrada, 
dbo.detalle_venta.preciounitario, dbo.ventas.Credito, dbo.ventas.Estado
FROM            dbo.detalle_venta INNER JOIN
                         dbo.ventas ON dbo.detalle_venta.idventa = dbo.ventas.idventa

 where ventas.idclientev=@idcliente and ventas.Credito &gt;0
GO
/****** Object:  StoredProcedure [dbo].[mostrarPmasVendidos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrarPmasVendidos]
as
select Top 5 sum(detalle_venta.cantidad) as Cantidad, Producto1.Descripcion 
from detalle_venta inner join Producto1 on Producto1.Id_Producto1 = detalle_venta.Id_producto 
group by Producto1.Descripcion
GO
/****** Object:  StoredProcedure [dbo].[mostrarPuertos]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrarPuertos]
@idcaja int
as
select PuertoBalanza,EstadoBalanza from Caja 
where Id_Caja=@idcaja
GO
/****** Object:  StoredProcedure [dbo].[mostrarTemaCaja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrarTemaCaja]
@idcaja int
as
select Tema  from Caja
where Id_Caja=@idcaja 
GO
/****** Object:  StoredProcedure [dbo].[mostrarVentasGrafica]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrarVentasGrafica]
as
declare @anio int
set @anio = DATEPART (YEAR, GETDATE())
select (datename(MONTH, fecha_venta) + ' ' + datename(YEAR,fecha_venta )) as fecha
,sum(Monto_total) as Total
from ventas 
where DATEPART(YEAR,fecha_venta)=@anio 
group by datename(MONTH , fecha_venta), DATENAME (YEAR ,fecha_venta )
GO
/****** Object:  StoredProcedure [dbo].[mostrarVentasGraficaFechas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrarVentasGraficaFechas]
@fi date,
@ff date
as
select (datename(MONTH, fecha_venta) + ' ' + datename(YEAR,fecha_venta )) as fecha
,sum(Monto_total) as Total
from ventas 
where convert(date,fecha_venta)&gt;=@fi and CONVERT(date,fecha_venta)&lt;=@ff
group by datename(MONTH , fecha_venta), DATENAME (YEAR ,fecha_venta )
GO
/****** Object:  StoredProcedure [dbo].[ReporteCuestasPorCobrar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReporteCuestasPorCobrar]
as
select Nombre,Celular, Saldo  from clientes 
where Saldo &gt; 0
GO
/****** Object:  StoredProcedure [dbo].[ReporteCuestasPorPagar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReporteCuestasPorPagar]
as
select Nombre,Celular, Saldo  from Proveedores 
where Saldo &gt; 0
GO
/****** Object:  StoredProcedure [dbo].[ReporteGanancias]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReporteGanancias]
as
select convert(numeric(18,2), sum(Ganancia )) from detalle_venta   
GO
/****** Object:  StoredProcedure [dbo].[ReporteGananciasFecha]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReporteGananciasFecha]
@fi date,
@ff date
as
select convert(numeric(18,2), sum(Ganancia )) from detalle_venta   
inner join ventas on ventas.idventa  = detalle_venta.idventa  
where CONVERT (date,fecha_venta)&gt;=@fi and CONVERT(date,fecha_venta)&lt;=@ff
GO
/****** Object:  StoredProcedure [dbo].[ReporteGastosAnioCombo]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReporteGastosAnioCombo]

as
set Nocount On;
select Distinct DATEPART (year,Fecha) as anio from Gastos_varios 
GO
/****** Object:  StoredProcedure [dbo].[ReporteGastosAnioGrafica]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReporteGastosAnioGrafica]
@anio as int
as
select top 5 Conceptos.Descripcion , SUM(Gastos_varios.Importe) as Monto
from Gastos_varios inner join Conceptos on Conceptos.Id_concepto = Gastos_varios.Id_concepto
where DATEPART (YEAR, Fecha)=@anio 
group by Conceptos.Descripcion 
Order by SUM (Importe) desc
GO
/****** Object:  StoredProcedure [dbo].[ReporteGastosAnioMesGrafica]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReporteGastosAnioMesGrafica]
@anio as int,
@mes as varchar(50)
as
select top 5 Conceptos.Descripcion , SUM(Gastos_varios.Importe) as Monto
from Gastos_varios inner join Conceptos on Conceptos.Id_concepto = Gastos_varios.Id_concepto
where DATEPART (YEAR, Fecha)=@anio and DATENAME(MONTH ,Fecha)=@mes 
group by Conceptos.Descripcion 
Order by SUM (Importe) desc
GO
/****** Object:  StoredProcedure [dbo].[ReporteGastosMesCombo]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReporteGastosMesCombo]
@anio int
as
set Nocount On;
select Distinct datename (MONTH,Fecha) as mes from Gastos_varios 
where datepart(year, Fecha) = @anio
GO
/****** Object:  StoredProcedure [dbo].[ReportePorCobrar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReportePorCobrar]
as
select sum(Saldo) from clientes 
GO
/****** Object:  StoredProcedure [dbo].[ReportePorPagar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReportePorPagar]
as
select sum(Saldo) from Proveedores  
GO
/****** Object:  StoredProcedure [dbo].[ReporteProductoBajoMinimo]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReporteProductoBajoMinimo]
as
select count(Id_Producto1 ) from Producto1    
Where Stock&lt;=Stock_minimo and Usa_inventarios ='SI'
GO
/****** Object:  StoredProcedure [dbo].[ReporteResumenVentasEmpleadoFechas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReporteResumenVentasEmpleadoFechas]
@idEmpleado int,
@fi date,
@ff date
as

select convert(date, ventas.fecha_venta) as fecha_venta, sum(ventas.Monto_total) as Monto,
sum(detalle_venta.Costo * detalle_venta.cantidad ) as Costo,
sum(detalle_venta.Ganancia) as Ganancia, @fi as fi, @ff as ff,USUARIO2.Nombres_y_Apellidos as Empleado
from ventas inner join detalle_venta on detalle_venta.idventa = ventas.idventa
inner join USUARIO2 on USUARIO2.idUsuario = ventas.Id_usuario
Where ventas.Monto_total &gt;0 and ventas.Id_usuario = @idEmpleado and 
(convert(date,ventas.fecha_venta)&gt;=@fi and convert(date,ventas.fecha_venta)&lt;=@ff)

group by convert(date, ventas.fecha_venta),USUARIO2.Nombres_y_Apellidos
GO
/****** Object:  StoredProcedure [dbo].[ReporteResumenVentasFechas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReporteResumenVentasFechas]
@fi date,
@ff date
as
declare @empleado varchar(50)
set @empleado = 'Todos'
select convert(date, ventas.fecha_venta) as fecha_venta, sum(ventas.Monto_total) as Monto,
sum(detalle_venta.Costo * detalle_venta.cantidad ) as Costo,
sum(detalle_venta.Ganancia) as Ganancia, @fi as fi, @ff as ff,@empleado as Empleado
from ventas inner join detalle_venta on detalle_venta.idventa = ventas.idventa
Where ventas.Monto_total &gt;0 and (convert(date,ventas.fecha_venta)&gt;=@fi and convert(date,ventas.fecha_venta)&lt;=@ff)

group by convert(date, ventas.fecha_venta)
GO
/****** Object:  StoredProcedure [dbo].[ReporteResumenVentasHoy]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReporteResumenVentasHoy]
as
declare @fi as varchar(50)
set @fi = 'Siempre'
declare @ff as varchar(50)
set @ff= Convert(varchar(50), GetDate())
declare @empleado varchar(50)
set @empleado = 'Todos'

select convert(date, ventas.fecha_venta) as fecha_venta, sum(ventas.Monto_total) as Monto,
sum(detalle_venta.Costo * detalle_venta.cantidad ) as Costo,
sum(detalle_venta.Ganancia) as Ganancia, @fi as fi, @ff as ff, @empleado as Empleado
from ventas inner join detalle_venta on detalle_venta.idventa = ventas.idventa
Where ventas.Monto_total &gt;0

group by convert(date, ventas.fecha_venta)
GO
/****** Object:  StoredProcedure [dbo].[ReporteResumenVentasHoyEmpleado]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReporteResumenVentasHoyEmpleado]
@idEmpleado int
as

declare @fi as varchar(50)
set @fi = 'Siempre'
declare @ff as varchar(50)
set @ff= Convert(varchar(50), GetDate())

select convert(date, ventas.fecha_venta) as fecha_venta, sum(ventas.Monto_total) as Monto,
sum(detalle_venta.Costo * detalle_venta.cantidad ) as Costo,
sum(detalle_venta.Ganancia) as Ganancia, @fi as fi, @ff as ff,USUARIO2.Nombres_y_Apellidos as Empleado
from ventas inner join detalle_venta on detalle_venta.idventa = ventas.idventa
inner join USUARIO2 on USUARIO2.idUsuario = ventas.Id_usuario
Where ventas.Monto_total &gt;0 and ventas.Id_usuario = @idEmpleado 

group by convert(date, ventas.fecha_venta),USUARIO2.Nombres_y_Apellidos
GO
/****** Object:  StoredProcedure [dbo].[ReporteTotalVentas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReporteTotalVentas]
as
select sum( Monto_total) FROM dbo.ventas 
GO
/****** Object:  StoredProcedure [dbo].[ReporteTotalVentasFechas]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ReporteTotalVentasFechas]
@fi date,
@ff date
as
select sum( Monto_total) FROM dbo.ventas 
where CONVERT (date,fecha_venta)&gt;=@fi and CONVERT(date,fecha_venta)&lt;=@ff
GO
/****** Object:  StoredProcedure [dbo].[restaurar_caja]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[restaurar_caja]
@idcaja integer
as
update Caja set
Estado  ='Caja Restaurada'
where Id_Caja    =@idcaja













GO
/****** Object:  StoredProcedure [dbo].[restaurar_clientes]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[restaurar_clientes]
@Idcliente As int

As
update   clientes 
set Estado ='ACTIVO'
WHERE idclientev =@Idcliente





GO
/****** Object:  StoredProcedure [dbo].[restaurar_Proveedores]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[restaurar_Proveedores]
@IdProveedor As int

As
update   Proveedores
set Estado ='ACTIVO'
WHERE IdProveedor=@IdProveedor





GO
/****** Object:  StoredProcedure [dbo].[sumar_CreditoPorCobrar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sumar_CreditoPorCobrar]
@idcaja int, 
@fi datetime,
@ff datetime
as
select sum(Saldo ) from CreditoPorCobrar 
where (Fecha_registro &gt;=@fi and Fecha_registro &lt;=@ff) and Id_caja=@idcaja 





GO
/****** Object:  StoredProcedure [dbo].[sumar_CreditoPorPagar]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sumar_CreditoPorPagar]
@idcaja int, 
@fi datetime,
@ff datetime
as
select sum(Saldo ) from CreditoPorPagar 
where (Fecha_registro &gt;=@fi and Fecha_registro &lt;=@ff) and Id_caja=@idcaja 





GO
/****** Object:  StoredProcedure [dbo].[sumar_gastos_por_turno]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sumar_gastos_por_turno]
@idcaja int, 
@fi datetime,
@ff datetime
as
select sum(Importe ) from Gastos_varios 
where (Fecha &gt;=@fi and Fecha &lt;=@ff) and Id_caja=@idcaja 





GO
/****** Object:  StoredProcedure [dbo].[sumar_ingresos_por_turno]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sumar_ingresos_por_turno]
@idcaja int, 
@fi datetime,
@ff datetime
as
select sum(Importe ) from Ingresos_varios 
where (Fecha &gt;=@fi and Fecha &lt;=@ff) and Id_caja=@idcaja 





GO
/****** Object:  StoredProcedure [dbo].[validar_usuario]    Script Date: 20/09/2020 07:49:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[validar_usuario]

@password varchar(50),
@login varchar(50)
as
select * from USUARIO2
where  Password   = @password and Login=@Login and Estado ='ACTIVO'


GO
USE [master]
GO
ALTER DATABASE [BASEADACURSO] SET  READ_WRITE 
GO