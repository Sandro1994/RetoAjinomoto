USE [master]
GO
/****** Object:  Database [BD_Ajinomoto]    Script Date: 22/08/2024 07:51:30 ******/
CREATE DATABASE [BD_Ajinomoto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_Ajinomoto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_Ajinomoto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_Ajinomoto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_Ajinomoto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_Ajinomoto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_Ajinomoto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_Ajinomoto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BD_Ajinomoto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_Ajinomoto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_Ajinomoto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_Ajinomoto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_Ajinomoto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_Ajinomoto] SET  MULTI_USER 
GO
ALTER DATABASE [BD_Ajinomoto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_Ajinomoto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_Ajinomoto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_Ajinomoto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_Ajinomoto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_Ajinomoto] SET QUERY_STORE = OFF
GO
USE [BD_Ajinomoto]
GO
/****** Object:  Table [dbo].[EstadoTarea]    Script Date: 22/08/2024 07:51:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoTarea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
 CONSTRAINT [PK_EstadoTarea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tareas]    Script Date: 22/08/2024 07:51:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tareas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](200) NULL,
	[Descripcion] [varchar](200) NULL,
	[IdEstadoTarea] [int] NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [int] NULL,
	[FechaModificacion] [datetime] NULL,
	[UsuarioModificacion] [int] NULL,
 CONSTRAINT [PK_Tareas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/08/2024 07:51:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [varchar](100) NULL,
	[Contrasena] [varchar](100) NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EstadoTarea] ON 

INSERT [dbo].[EstadoTarea] ([Id], [Nombre]) VALUES (1, N'Incompletas')
INSERT [dbo].[EstadoTarea] ([Id], [Nombre]) VALUES (2, N'Completas')
SET IDENTITY_INSERT [dbo].[EstadoTarea] OFF
SET IDENTITY_INSERT [dbo].[Tareas] ON 

INSERT [dbo].[Tareas] ([Id], [Titulo], [Descripcion], [IdEstadoTarea], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (3, N'Generar Reporte de Ventas', N'Realizar un reporte estadistico de las ventas abril', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Descripcion], [IdEstadoTarea], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (4, N'Entrega de equipos seguridad', N'fotocheck, carnets', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Descripcion], [IdEstadoTarea], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (15, N'TAREA INCOMPLETA', N'AAAA', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tareas] ([Id], [Titulo], [Descripcion], [IdEstadoTarea], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion]) VALUES (16, N'Proyecto prueba', N'migracion', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tareas] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Correo], [Contrasena], [Nombres], [Apellidos]) VALUES (1, N'alexandrasb06@gmail.com', N'MTIz', N'Alexandra Adelayda', N'Sosa Benites')
INSERT [dbo].[Usuarios] ([Id], [Correo], [Contrasena], [Nombres], [Apellidos]) VALUES (2, N'jcalderonmeza@gmail.com', N'MTIz', N'Juan Alfonso', N'Calderon Meza')
INSERT [dbo].[Usuarios] ([Id], [Correo], [Contrasena], [Nombres], [Apellidos]) VALUES (3, N'acordova98@gmail.com', N'MTIz', N'Alfredo Miguel', N'Cordova Martinez')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
USE [master]
GO
ALTER DATABASE [BD_Ajinomoto] SET  READ_WRITE 
GO
