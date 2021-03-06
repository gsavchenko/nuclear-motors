USE [master]
GO
/****** Object:  Database [NuclearMotors2]    Script Date: 09/12/2014 1:18:13 PM ******/
CREATE DATABASE [NuclearMotors2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NuclearMotors2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.JSQL\MSSQL\DATA\NuclearMotors2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NuclearMotors2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.JSQL\MSSQL\DATA\NuclearMotors2_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NuclearMotors2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NuclearMotors2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NuclearMotors2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NuclearMotors2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NuclearMotors2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NuclearMotors2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NuclearMotors2] SET ARITHABORT OFF 
GO
ALTER DATABASE [NuclearMotors2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NuclearMotors2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NuclearMotors2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NuclearMotors2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NuclearMotors2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NuclearMotors2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NuclearMotors2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NuclearMotors2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NuclearMotors2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NuclearMotors2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NuclearMotors2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NuclearMotors2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NuclearMotors2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NuclearMotors2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NuclearMotors2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NuclearMotors2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NuclearMotors2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NuclearMotors2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NuclearMotors2] SET RECOVERY FULL 
GO
ALTER DATABASE [NuclearMotors2] SET  MULTI_USER 
GO
ALTER DATABASE [NuclearMotors2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NuclearMotors2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NuclearMotors2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NuclearMotors2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NuclearMotors2', N'ON'
GO
USE [NuclearMotors2]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 09/12/2014 1:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[custId] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[fName] [varchar](50) NULL,
 CONSTRAINT [PK_tblCustomers] PRIMARY KEY CLUSTERED 
(
	[custId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderLine]    Script Date: 09/12/2014 1:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderLine](
	[lineId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 09/12/2014 1:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[created] [datetime] NULL,
	[closed] [datetime] NULL,
	[orderTotal] [money] NOT NULL,
	[custId] [int] NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 09/12/2014 1:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[paymentId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[PIF] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 09/12/2014 1:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productId] [int] NOT NULL,
	[productDesc] [varchar](50) NULL,
	[productIcon] [varchar](50) NULL,
	[productPrice] [money] NULL,
	[productFacts] [varchar](150) NULL,
	[productImg] [varchar](50) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (1, N'Chevrolet Camaro', N'img/nav/Vehicle_ChevroletCamaro.png', 24000.0000, N'A car made fmaous my the Transformer''s movie series', N'img/prodimg/vehicles/cc.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (2, N'Dodge Charger', N'img/nav/Vehicle_DodgeCharger.png', 23000.0000, N'Used my Canadian Police - the OPP, their new fav chase vehicle', N'img/prodimg/vehicles/dc.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (3, N'Ford Mustang', N'img/nav/Vehicle_FordMustang.png', 21000.0000, N'Beautiful muscle car, starts at 305HP. Rear wheel drive, as all vehicles should', N'img/prodimg/vehicles/fm.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (4, N'Hyundai Genesis', N'img/nav/Vehicle_HyundaiGenesis.png', 28000.0000, N'Non-Canadian sports car, very stylish and sleek', N'img/prodimg/vehicles/hg.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (5, N'Fisker Karma', N'img/nav/Hybrid_FiskerKarma.png', 99000.0000, N'Hybrid boss car', N'img/prodimg/vehicles/fk.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (6, N'Honda CRZ', N'img/nav/Hybrid_HondaCRZ.png', 25000.0000, N'Sporty lookin'' thing', N'img/prodimg/vehicles/hcrz.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (7, N'Lamborghini Aventador', N'img/nav/Hybrid_LamborghiniAventador.png', 250000.0000, N'Beautifully crafted Italian car', N'img/prodimg/vehicles/la.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (8, N'Lamborghini Huracan', N'img/nav/Hybrid_LamborghiniHuracan.png', 210000.0000, N'Yet another Italian beauty', N'img/prodimg/vehicles/lh.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (9, N'Maserati GranTurismo', N'img/nav/Hybrid_MaseratiGranturismo.png', 89000.0000, N'Lookin'' like the coolest kid ever, because your rich', N'img/prodimg/vehicles/mgt.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (10, N'Tesla Model S', N'img/nav/Hybrid_TeslaModelS.png', 70000.0000, N'Whats a gas station anyway? Don''t need ''em in this car', N'img/prodimg/vehicles/tms.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (11, N'Toyota Prius', N'img/nav/Hybrid_ToyotaPrius.png', 40000.0000, N'The family man look, you clearly didn''t do your homework in highschool', N'img/prodimg/vehicles/tp.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (12, N'All-Season Tires', N'img/nav/t_summer.png', 1000.0000, N'Burn some rubber with these tires', N'img/prodimg/accessories/ast.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (13, N'Winter Tires', N'img/nav/t_winter.png', 1400.0000, N'Stop before everyone else with these "ground-magnets"', N'img/prodimg/accessories/wt.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (14, N'Light Truck Tires', N'img/nav/t_LightTrucks.png', 1200.0000, N'Pimp your ride with these sweet wheels', N'img/prodimg/accessories/ltt.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (15, N'Rims Genius', N'img/nav/Rims_Genius.png', 800.0000, N'Wheel rims', N'img/prodimg/accessories/rg.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (16, N'Tuning Pros', N'img/nav/Hubcaps_TuningPros.png', 75.0000, N'Sweet rim covers for any ride', N'img/prodimg/accessories/tph.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (17, N'Pilot Automotive', N'img/nav/Hubcaps_PilotAuto.png', 75.0000, N'Hubcaps for your rims', N'img/prodimg/accessories/ph.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (18, N'Alphena', N'img/nav/Hubcaps_Alphena.png', 80.0000, N'Wheel covers / hubcaps for any tire type or season', N'img/prodimg/accessories/ah.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (19, N'Drive Accessories', N'img/nav/Hubcaps_DriveAccessories.png', 85.0000, N'People will pull over to let your ride by with these sweet hubcaps', N'img/prodimg/accessories/dah.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (20, N'Camera BoomYours', N'img/nav/Camera_BoomYours.png', 200.0000, N'Car camera', N'img/prodimg/accessories/cby.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (21, N'Camera CaproCam', N'img/nav/Camera_CaproCam.png', 210.0000, N'Car camera', N'img/prodimg/accessories/cccam.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (22, N'Camera CC', N'img/nav/Camera_CC.png', 160.0000, N'Car camera', N'img/prodimg/accessories/ccc.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (23, N'Camera EPrance', N'img/nav/Camera_EPrance.png', 245.0000, N'Car camera', N'img/prodimg/accessories/cep.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (24, N'Camera GoldenSupplier', N'img/nav/Camera_GoldenSupplier.png', 350.0000, N'Car camera', N'img/prodimg/accessories/cgs.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (25, N'Camera Hittime', N'img/nav/Camera_Hittime.png', 300.0000, N'Car camera', N'img/prodimg/accessories/cht.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (26, N'Air Spencer', N'img/nav/AirFreshener_AirSpencer.png', 5.0000, N'Car air fresheners', N'img/prodimg/accessories/afas.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (27, N'Febreze', N'img/nav/AirFreshener_Febreze.png', 7.0000, N'Car air fresheners', N'img/prodimg/accessories/afr.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (28, N'Cosatto Moova', N'img/nav/CarSeat_CosattoMoova.png', 94.0000, N'Cool lookin'' car seats', N'img/prodimg/accessories/cscm.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (29, N'Britax', N'img/nav/CarSeat_Britax.png', 96.0000, N'Cover that old chair! Look cooler', N'img/prodimg/accessories/csb.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (30, N'Car Mats', N'img/nav/mats.png', 25.0000, N'Mats to protect your floor', N'img/prodimg/accessories/mats.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (31, N'Fuzzy Dice', N'img/nav/dice.png', 8.0000, N'Fuzzy dice... because everyone has them', N'img/prodimg/accessories/fd.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (32, N'Garmin Nuvi', N'img/nav/GPS_GarminNuvi.png', 160.0000, N'Garmin navigation system', N'img/prodimg/accessories/gps_gn.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (33, N'TomTom', N'img/nav/GPS_TomTom.png', 120.0000, N'TomTom navigation system', N'img/prodimg/accessories/gps_tt.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (34, N'Shelter Logic', N'img/nav/PortableCanopy_ShelterLogic.png', 240.0000, N'A portable shelter for your car, who wants to clean off snow?', N'img/prodimg/accessories/slpc.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (35, N'Infinity Single', N'img/nav/Subwoofer_InfinitySingle.png', 50.0000, N'Subwoofer to get your tunes jammin''', N'img/prodimg/accessories/swif.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (36, N'Pioneer', N'img/nav/Subwoofer_Pioneer.png', 45.0000, N'Subwoofer to get your tunes jammin''', N'img/prodimg/accessories/swpio.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (37, N'Plye', N'img/nav/Subwoofer_Pyle.png', 65.0000, N'Subwoofer to get your tunes jammin''', N'img/prodimg/accessories/swPyle.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (38, N'Dupont Standard', N'img/nav/WiperBlades_DupontStndrd.png', 12.0000, N'Dupont wiper blades to slide dead bugs and weather conditions away', N'img/prodimg/accessories/dswb.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (39, N'Wiper Blades', N'img/nav/WiperBlades.png', 15.0000, N'Wiper blades that won''t streak for the first day.. garunteed', N'img/prodimg/accessories/wb.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (40, N'Anti-Freeze CRC', N'img/nav/AntiFreeze_CRC.png', 13.0000, N'Gas line anti-freeze', N'img/prodimg/accessories/crc_af.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (41, N'Anti-Freeze BeckArnley', N'img/nav/AntiFreeze_BeckArnley.png', 23.0000, N'Gas line anti-freeze', N'img/prodimg/accessories/beck_af.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (42, N'Anti-Freeze Halfords', N'img/nav/AntiFreeze_Halfords.png', 24.0000, N'Gas line anti-freeze', N'img/prodimg/accessories.hal_af.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (43, N'Anti-Freeze Holts', N'img/nav/AntiFreeze_Holts.png', 14.0000, N'Gas line anti-freeze', N'img/prodimg/accessories/holt_af.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (44, N'Anti-Freeze Prestone', N'img/nav/AntiFreeze_Prestone.png', 16.0000, N'Gas line anti-freeze', N'img/prodimg/accessories/prest_af.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (45, N'Anti-Freeze Zerex', N'img/nav/AntiFreeze_Zerex.png', 18.0000, N'Gas line anti-freeze', N'img/prodimg/accessories/zerex_af.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (46, N'Honda Oil', N'img/nav/Oils_GenuineHonda.png', 12.0000, N'Honda certified oil', N'img/prodimg/accessories/sfgh.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (47, N'Lucas Oil', N'img/nav/Oils_LucasOil.png', 10.0000, N'Oil from LucasOil', N'img/prodimg/accessories/lucas_oil.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (48, N'Royal Purple Oil', N'img/nav/Oils_RoyalPurple.png', 9.0000, N'Oil from RoyalPurple', N'img/prodimg/accessories/purp_oil.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (49, N'Shell helix Oil', N'img/nav/Oils_ShellHelix.png', 11.5000, N'Oil from ShellHelix', N'img/prodimg/accessories/helix_oil.jpg')
GO
INSERT [dbo].[tblProducts] ([productId], [productDesc], [productIcon], [productPrice], [productFacts], [productImg]) VALUES (50, N'Shell Rotella Oil', N'img/nav/Oils_ShellRotella.png', 13.0000, N'Oil from ShellRotella', N'img/prodimg/accessories/rotella_oil.jpg')
GO
ALTER TABLE [dbo].[tblOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderLine_tblOrders] FOREIGN KEY([orderId])
REFERENCES [dbo].[tblOrders] ([orderId])
GO
ALTER TABLE [dbo].[tblOrderLine] CHECK CONSTRAINT [FK_tblOrderLine_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderLine_tblProducts] FOREIGN KEY([productId])
REFERENCES [dbo].[tblProducts] ([productId])
GO
ALTER TABLE [dbo].[tblOrderLine] CHECK CONSTRAINT [FK_tblOrderLine_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [ordtocusgt] FOREIGN KEY([custId])
REFERENCES [dbo].[tblCustomers] ([custId])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [ordtocusgt]
GO
ALTER TABLE [dbo].[tblPayment]  WITH CHECK ADD  CONSTRAINT [FK_tblPayment_tblOrders] FOREIGN KEY([orderId])
REFERENCES [dbo].[tblOrders] ([orderId])
GO
ALTER TABLE [dbo].[tblPayment] CHECK CONSTRAINT [FK_tblPayment_tblOrders]
GO
USE [master]
GO
ALTER DATABASE [NuclearMotors2] SET  READ_WRITE 
GO
