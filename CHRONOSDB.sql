USE [master]
GO
/****** Object:  Database [CHRONOSDB]    Script Date: 7/24/2018 12:16:15 AM ******/
CREATE DATABASE [CHRONOSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CHRONOSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CHRONOSDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CHRONOSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CHRONOSDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CHRONOSDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHRONOSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHRONOSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHRONOSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHRONOSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHRONOSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHRONOSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHRONOSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CHRONOSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHRONOSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHRONOSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHRONOSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHRONOSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHRONOSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHRONOSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHRONOSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHRONOSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CHRONOSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHRONOSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHRONOSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CHRONOSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CHRONOSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHRONOSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHRONOSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CHRONOSDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CHRONOSDB] SET  MULTI_USER 
GO
ALTER DATABASE [CHRONOSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHRONOSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CHRONOSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CHRONOSDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CHRONOSDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CHRONOSDB] SET QUERY_STORE = OFF
GO
USE [CHRONOSDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CHRONOSDB]
GO
/****** Object:  Table [dbo].[ClientesAutorizados]    Script Date: 7/24/2018 12:16:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientesAutorizados](
	[IdCliente] [int] IDENTITY(1000,1) NOT NULL,
	[ClienteAutorizado] [varchar](50) NOT NULL,
	[CentroFuncional] [varchar](50) NOT NULL,
	[Telefono] [varchar](15) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_tbClientes_Autorizados] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 7/24/2018 12:16:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[IdDepartamento] [int] IDENTITY(1000,1) NOT NULL,
	[Departamento] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_tbDepartamentos] PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoSolicitudes]    Script Date: 7/24/2018 12:16:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoSolicitudes](
	[IdEstado] [int] IDENTITY(1000,1) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_tbEstado_Solicitudes] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialActualizacionesSolicitudes]    Script Date: 7/24/2018 12:16:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialActualizacionesSolicitudes](
	[IdActualizacion] [int] NOT NULL,
	[Solicitud] [int] NOT NULL,
	[CambiaDepartamento] [bit] NOT NULL,
	[DepartamentoPrevio] [int] NULL,
	[CambiaEstado] [bit] NOT NULL,
	[EstadoPrevio] [int] NULL,
	[CambiaUsuarioAsignado] [bit] NOT NULL,
	[UsuarioPrevio] [int] NOT NULL,
	[FechaCambio] [datetime] NOT NULL,
 CONSTRAINT [PK_tbHistorialActualizacionesSolicitudes] PRIMARY KEY CLUSTERED 
(
	[IdActualizacion] ASC,
	[Solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maquinas]    Script Date: 7/24/2018 12:16:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maquinas](
	[IdMaquina] [int] IDENTITY(1000,1) NOT NULL,
	[Maquina] [varchar](50) NOT NULL,
	[Departamento] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_tbMaquinas] PRIMARY KEY CLUSTERED 
(
	[IdMaquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolicitudesServicio]    Script Date: 7/24/2018 12:16:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitudesServicio](
	[IdSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[Cliente] [int] NOT NULL,
	[NumeroCuenta] [bigint] NOT NULL,
	[Solicitante] [varchar](50) NOT NULL,
	[Aprobado] [varchar](50) NOT NULL,
	[FechaEmision] [datetime] NOT NULL,
	[TipoEntrega] [int] NOT NULL,
	[DireccionEntrega] [varchar](100) NOT NULL,
	[DetalleServicio] [varchar](300) NOT NULL,
	[ReproduccionesTotales] [int] NOT NULL,
	[CostoTotal] [float] NOT NULL,
	[EstadoActual] [int] NOT NULL,
	[DepartamentoActual] [int] NOT NULL,
	[MaquinaAsignada] [int] NULL,
	[UsuarioAsignado] [int] NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_tbSolicitudes_Servicio] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposEntrega]    Script Date: 7/24/2018 12:16:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposEntrega](
	[IdTipoEntrega] [int] IDENTITY(1000,1) NOT NULL,
	[TipoEntrega] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Table_1tbTipos_Entrega] PRIMARY KEY CLUSTERED 
(
	[IdTipoEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 7/24/2018 12:16:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1000,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[NombreDeUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Departamento] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HistorialActualizacionesSolicitudes]  WITH CHECK ADD  CONSTRAINT [FK_tbHistorialActualizacionesSolicitudes_tbDepartamentos] FOREIGN KEY([DepartamentoPrevio])
REFERENCES [dbo].[Departamentos] ([IdDepartamento])
GO
ALTER TABLE [dbo].[HistorialActualizacionesSolicitudes] CHECK CONSTRAINT [FK_tbHistorialActualizacionesSolicitudes_tbDepartamentos]
GO
ALTER TABLE [dbo].[HistorialActualizacionesSolicitudes]  WITH CHECK ADD  CONSTRAINT [FK_tbHistorialActualizacionesSolicitudes_tbEstadoSolicitudes] FOREIGN KEY([EstadoPrevio])
REFERENCES [dbo].[EstadoSolicitudes] ([IdEstado])
GO
ALTER TABLE [dbo].[HistorialActualizacionesSolicitudes] CHECK CONSTRAINT [FK_tbHistorialActualizacionesSolicitudes_tbEstadoSolicitudes]
GO
ALTER TABLE [dbo].[HistorialActualizacionesSolicitudes]  WITH CHECK ADD  CONSTRAINT [FK_tbHistorialActualizacionesSolicitudes_tbSolicitudesServicio] FOREIGN KEY([Solicitud])
REFERENCES [dbo].[SolicitudesServicio] ([IdSolicitud])
GO
ALTER TABLE [dbo].[HistorialActualizacionesSolicitudes] CHECK CONSTRAINT [FK_tbHistorialActualizacionesSolicitudes_tbSolicitudesServicio]
GO
ALTER TABLE [dbo].[HistorialActualizacionesSolicitudes]  WITH CHECK ADD  CONSTRAINT [FK_tbHistorialActualizacionesSolicitudes_tbUsuarios] FOREIGN KEY([UsuarioPrevio])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[HistorialActualizacionesSolicitudes] CHECK CONSTRAINT [FK_tbHistorialActualizacionesSolicitudes_tbUsuarios]
GO
ALTER TABLE [dbo].[Maquinas]  WITH CHECK ADD  CONSTRAINT [FK_tbMaquinas_tbDepartamentos] FOREIGN KEY([Departamento])
REFERENCES [dbo].[Departamentos] ([IdDepartamento])
GO
ALTER TABLE [dbo].[Maquinas] CHECK CONSTRAINT [FK_tbMaquinas_tbDepartamentos]
GO
ALTER TABLE [dbo].[SolicitudesServicio]  WITH CHECK ADD  CONSTRAINT [FK_tbSolicitudes_Servicio_tbClientesAutorizados] FOREIGN KEY([Cliente])
REFERENCES [dbo].[ClientesAutorizados] ([IdCliente])
GO
ALTER TABLE [dbo].[SolicitudesServicio] CHECK CONSTRAINT [FK_tbSolicitudes_Servicio_tbClientesAutorizados]
GO
ALTER TABLE [dbo].[SolicitudesServicio]  WITH CHECK ADD  CONSTRAINT [FK_tbSolicitudes_Servicio_tbDepartamentos] FOREIGN KEY([DepartamentoActual])
REFERENCES [dbo].[Departamentos] ([IdDepartamento])
GO
ALTER TABLE [dbo].[SolicitudesServicio] CHECK CONSTRAINT [FK_tbSolicitudes_Servicio_tbDepartamentos]
GO
ALTER TABLE [dbo].[SolicitudesServicio]  WITH CHECK ADD  CONSTRAINT [FK_tbSolicitudes_Servicio_tbEstadoSolicitudes] FOREIGN KEY([EstadoActual])
REFERENCES [dbo].[EstadoSolicitudes] ([IdEstado])
GO
ALTER TABLE [dbo].[SolicitudesServicio] CHECK CONSTRAINT [FK_tbSolicitudes_Servicio_tbEstadoSolicitudes]
GO
ALTER TABLE [dbo].[SolicitudesServicio]  WITH CHECK ADD  CONSTRAINT [FK_tbSolicitudes_Servicio_tbMaquinas] FOREIGN KEY([MaquinaAsignada])
REFERENCES [dbo].[Maquinas] ([IdMaquina])
GO
ALTER TABLE [dbo].[SolicitudesServicio] CHECK CONSTRAINT [FK_tbSolicitudes_Servicio_tbMaquinas]
GO
ALTER TABLE [dbo].[SolicitudesServicio]  WITH CHECK ADD  CONSTRAINT [FK_tbSolicitudes_Servicio_tbTiposEntrega] FOREIGN KEY([TipoEntrega])
REFERENCES [dbo].[TiposEntrega] ([IdTipoEntrega])
GO
ALTER TABLE [dbo].[SolicitudesServicio] CHECK CONSTRAINT [FK_tbSolicitudes_Servicio_tbTiposEntrega]
GO
ALTER TABLE [dbo].[SolicitudesServicio]  WITH CHECK ADD  CONSTRAINT [FK_tbSolicitudes_Servicio_tbUsuarios] FOREIGN KEY([UsuarioAsignado])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[SolicitudesServicio] CHECK CONSTRAINT [FK_tbSolicitudes_Servicio_tbUsuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbDepartamentos] FOREIGN KEY([Departamento])
REFERENCES [dbo].[Departamentos] ([IdDepartamento])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbDepartamentos]
GO
USE [master]
GO
ALTER DATABASE [CHRONOSDB] SET  READ_WRITE 
GO
