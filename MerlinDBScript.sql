USE [master]
GO
/****** Object:  Database [MerlinDatabase_Base]    Script Date: 5/29/2025 12:21:01 PM ******/
CREATE DATABASE [MerlinDatabase_Base]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MerlinDatabase_Base', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MerlinDatabase_Base.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MerlinDatabase_Base_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MerlinDatabase_Base_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MerlinDatabase_Base] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MerlinDatabase_Base].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MerlinDatabase_Base] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET ARITHABORT OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MerlinDatabase_Base] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MerlinDatabase_Base] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MerlinDatabase_Base] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MerlinDatabase_Base] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MerlinDatabase_Base] SET  MULTI_USER 
GO
ALTER DATABASE [MerlinDatabase_Base] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MerlinDatabase_Base] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MerlinDatabase_Base] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MerlinDatabase_Base] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MerlinDatabase_Base] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MerlinDatabase_Base] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MerlinDatabase_Base] SET QUERY_STORE = ON
GO
ALTER DATABASE [MerlinDatabase_Base] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MerlinDatabase_Base]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 5/29/2025 12:21:01 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Adjustments]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adjustments](
	[PrimaryKey] [int] IDENTITY(1,1) NOT NULL,
	[AdjustmentID] [char](50) NULL,
	[LocationID] [char](4) NULL,
	[SKU] [char](9) NULL,
	[AdjustmentDate] [date] NULL,
	[AdjustmentTime] [time](7) NULL,
	[AdjustmentEmployeeID] [char](6) NULL,
	[Quantity] [int] NULL,
	[AdjustmentType] [char](20) NULL,
	[Shrink] [decimal](12, 2) NULL,
	[DefectiveShrink] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [char](9) NULL,
	[AppointmentLocationID] [char](4) NULL,
	[AppointmentCustomerID] [char](50) NULL,
	[AppointmentCustomerFirstName] [nchar](25) NULL,
	[AppointmentCustomerLastName] [nchar](50) NULL,
	[AppointmentCustomerPhoneNumber] [char](12) NULL,
	[AppointmentCustomerEmail] [nchar](50) NULL,
	[AppointmentDate] [date] NULL,
	[AppointmentTime] [time](7) NULL,
	[AppointmentEmployeeID] [char](6) NULL,
	[AppointmentServices] [nvarchar](max) NULL,
	[AppointmentServiceAddOns] [nvarchar](max) NULL,
	[AppointmentServiceFees] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartonDetails]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartonDetails](
	[CartonID] [char](25) NULL,
	[CartonOrigin] [char](6) NULL,
	[CartonDestination] [char](6) NULL,
	[SKU] [char](9) NULL,
	[ProductSerialNumber] [nchar](50) NULL,
	[ProductQuantityShipped] [int] NULL,
	[ProductQuantityReceived] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cartons]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cartons](
	[CartonID] [char](25) NULL,
	[CartonOrigin] [char](4) NULL,
	[CartonDestination] [char](6) NULL,
	[CartonCarrier] [nchar](25) NULL,
	[CartonTrackingNumber] [nchar](50) NULL,
	[CartonShipDate] [date] NULL,
	[CartonReceiveDate] [date] NULL,
	[CartonReceiveEmployee] [char](6) NULL,
	[CartonStatus] [nchar](25) NULL,
	[TotalItemsShipped] [int] NULL,
	[TotalItemsReceived] [int] NULL,
	[CartonHasDiscrepancy] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[SKU] [char](9) NOT NULL,
	[UPC] [char](12) NULL,
	[ProductName] [nchar](50) NOT NULL,
	[CategoryID] [char](3) NOT NULL,
	[Cost] [decimal](12, 2) NULL,
	[Price] [decimal](12, 2) NULL,
	[TradeValue] [decimal](12, 2) NULL,
	[Variant1Name] [nchar](50) NULL,
	[Variant2Name] [nchar](50) NULL,
	[Variant3Name] [nchar](50) NULL,
	[Variant1Properties] [nvarchar](max) NULL,
	[Variant2Properties] [nvarchar](max) NULL,
	[Variant3Properties] [nvarchar](max) NULL,
	[IsBaseSKU] [bit] NULL,
	[IsVariantSKU] [bit] NULL,
	[VariantAssignedToBaseSKU] [char](9) NULL,
	[VendorID] [char](6) NULL,
	[ReleaseDate] [date] NULL,
	[IsInventoryTracked] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryMap]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryMap](
	[CategoryID] [char](3) NOT NULL,
	[CategoryName] [nchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryTraits]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTraits](
	[CategoryID] [char](3) NULL,
	[TraitName] [nchar](50) NULL,
	[IsRequired] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComboItems]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComboItems](
	[ComboSKU] [char](9) NULL,
	[ProductSKU] [char](9) NULL,
	[CategoryID] [char](3) NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Combos]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combos](
	[PrimaryKey] [int] IDENTITY(1,1) NOT NULL,
	[ComboSKU] [char](9) NULL,
	[ComboName] [nchar](50) NULL,
	[ComboPrice] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountDetails]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountDetails](
	[CountID] [char](50) NULL,
	[LocationID] [char](4) NULL,
	[SKU] [char](9) NULL,
	[SKUQuantityExpected] [int] NULL,
	[SKUQuantityActual] [int] NULL,
	[SKUDiscrepancy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counts]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counts](
	[PrimaryKey] [int] IDENTITY(1,1) NOT NULL,
	[CountID] [char](50) NULL,
	[LocationID] [char](4) NULL,
	[CountType] [char](15) NULL,
	[CountCategory] [char](3) NULL,
	[CountStartDate] [date] NULL,
	[CountCompletionDate] [date] NULL,
	[CountEmployeeIDStarted] [char](6) NULL,
	[CountEmployeeIDCompleted] [char](6) NULL,
	[CountQuantityExpectedTotal] [int] NULL,
	[CountQuantityActualTotal] [int] NULL,
	[CountTotalDiscrepancies] [int] NULL,
	[CountAccuracy] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [char](50) NOT NULL,
	[CustomerFirstName] [nchar](25) NOT NULL,
	[CustomerLastName] [nchar](50) NOT NULL,
	[CustomerPhoneNumber] [char](12) NOT NULL,
	[CustomerEmail] [nchar](50) NOT NULL,
	[CustomerStreetAddress] [nchar](150) NULL,
	[CustomerCity] [nchar](50) NULL,
	[CustomerState] [char](2) NULL,
	[CustomerZIP] [char](5) NULL,
	[CustomerLoyalty] [bit] NULL,
	[CustomerLoyaltyPaid] [bit] NULL,
	[CustomerPoints] [int] NULL,
	[CustomerStoreCredit] [decimal](12, 2) NULL,
	[CustomerLoyaltyExpiration] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[DistrictID] [char](4) NULL,
	[DistrictName] [nchar](50) NULL,
	[DistrictSupervisorID] [char](6) NULL,
	[RegionID] [char](4) NULL,
	[MarketID] [char](4) NULL,
	[DivisionID] [char](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Divisions]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Divisions](
	[DivisionID] [char](4) NULL,
	[DivisionName] [nchar](50) NULL,
	[DivisionSupervisorID] [char](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [char](6) NOT NULL,
	[EmployeePrimaryLocationID] [char](4) NULL,
	[EmployeeSupervisorID] [char](6) NULL,
	[EmployeeFirstName] [nchar](25) NOT NULL,
	[EmployeeLastName] [nchar](50) NOT NULL,
	[EmployeePhoneNumber] [char](12) NOT NULL,
	[EmployeeEmail] [nchar](50) NULL,
	[EmployeeStreetAddress] [nchar](150) NOT NULL,
	[EmployeeCity] [nchar](50) NOT NULL,
	[EmployeeState] [char](2) NOT NULL,
	[EmployeeZIP] [char](5) NOT NULL,
	[EmployeeSSN] [char](9) NULL,
	[EmployeeInitials] [char](3) NULL,
	[EmployeePassword] [nchar](50) NULL,
	[EmployeeTransactionPIN] [nchar](50) NULL,
	[EmployeeType] [char](25) NULL,
	[EmployeeWage] [decimal](12, 2) NULL,
	[EmployeePayRate] [char](10) NULL,
	[EmployeePayFrequency] [char](10) NULL,
	[EmployeeOvertimeEligible] [bit] NULL,
	[EmployeeOvertimeWage] [decimal](12, 2) NULL,
	[EmployeeCommissionEligible] [bit] NULL,
	[EmployeeCommissionRate] [decimal](12, 2) NULL,
	[EmployeeCommissionLimit] [decimal](12, 2) NULL,
	[EmployeeTipEligible] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[SKU] [char](9) NOT NULL,
	[UPC] [char](12) NULL,
	[LocationID] [char](4) NOT NULL,
	[ProductName] [nchar](50) NULL,
	[CategoryID] [char](3) NOT NULL,
	[QuantityOnHandSellable] [int] NULL,
	[QuantityOnHandDefective] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemMovement]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMovement](
	[PrimaryKey] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [char](4) NULL,
	[SKU] [char](9) NULL,
	[MoveDate] [date] NULL,
	[MoveType] [char](20) NULL,
	[MoveEmployeeID] [char](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KPI_Custom]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPI_Custom](
	[PrimaryKey] [int] IDENTITY(1,1) NOT NULL,
	[KPIID] [char](50) NOT NULL,
	[KPIName] [nvarchar](50) NULL,
	[KPITarget] [nvarchar](max) NULL,
	[KPIActual] [decimal](12, 2) NULL,
	[KPIPlan] [decimal](12, 2) NULL,
	[KPIGoal] [decimal](12, 2) NULL,
	[KPICompareTo] [nvarchar](50) NULL,
	[KPIDisplayAs] [nvarchar](50) NULL,
	[KPIPlanDisplayAs] [nvarchar](50) NULL,
	[KPIGoalDisplayAs] [nvarchar](50) NULL,
	[KPIDependency] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [char](4) NOT NULL,
	[LocationManagerID] [char](6) NULL,
	[LocationPhoneNumber] [char](12) NULL,
	[LocationStreetAddress] [nchar](150) NULL,
	[LocationCity] [nchar](50) NULL,
	[LocationState] [char](2) NULL,
	[LocationZIP] [char](5) NULL,
	[LocationType] [char](10) NULL,
	[LocationIsTradeHold] [bit] NULL,
	[LocationTradeHoldDuration] [int] NULL,
	[LocationDistrictID] [char](10) NULL,
	[LocationRegionID] [char](10) NULL,
	[LocationMarketID] [char](10) NULL,
	[LocationDivisionID] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationBusinessDay]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationBusinessDay](
	[PrimaryKey] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [char](4) NULL,
	[BusinessDate] [date] NULL,
	[LocationOpenDate] [date] NULL,
	[LocationOpenTime] [time](7) NULL,
	[LocationOpenFunds] [decimal](12, 2) NULL,
	[LocationOpenEmployeeID] [char](6) NULL,
	[LocationCloseDate] [date] NULL,
	[LocationCloseTime] [time](7) NULL,
	[LocationCloseFunds] [decimal](12, 2) NULL,
	[LocationCloseEmployeeID] [char](6) NULL,
	[LocationDepositExpected] [decimal](12, 2) NULL,
	[LocationDepositActual] [decimal](12, 2) NULL,
	[LocationDepositDiscrepancy] [decimal](12, 2) NULL,
	[IsLocationOpen] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationPayroll]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationPayroll](
	[LocationID] [char](4) NULL,
	[LocationPayrollHoursAllocated] [decimal](12, 2) NULL,
	[LocationPayrollHoursOvertime] [decimal](12, 2) NULL,
	[LocationPayrollHoursActual] [decimal](12, 2) NULL,
	[LocationPayrollProjectedCost] [decimal](12, 2) NULL,
	[LocationPayrollWeekEnding] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationPerformance]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationPerformance](
	[LocationID] [char](4) NULL,
	[LocationPayrollHoursAllocated] [decimal](12, 2) NULL,
	[LocationPayrollHoursOvertime] [decimal](12, 2) NULL,
	[LocationPayrollHoursActual] [decimal](12, 2) NULL,
	[LocationPayrollProjectedCost] [decimal](12, 2) NULL,
	[LocationPayrollActualCost] [decimal](12, 2) NULL,
	[LocationSalesPlan] [decimal](12, 2) NULL,
	[LocationSalesActual] [decimal](12, 2) NULL,
	[LocationShrinkPlan] [decimal](12, 2) NULL,
	[LocationShrinkActual] [decimal](12, 2) NULL,
	[LocationShrinkDefective] [decimal](12, 2) NULL,
	[LocationShrinkDepositDiscrepancy] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationQuickSelect]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationQuickSelect](
	[LocationID] [char](4) NULL,
	[SKU] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationSchedule]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationSchedule](
	[LocationID] [char](4) NULL,
	[EmployeeID] [char](6) NULL,
	[ShiftStartDate] [date] NULL,
	[ShiftStartTime] [time](7) NULL,
	[ShiftEndDate] [date] NULL,
	[ShiftEndTime] [time](7) NULL,
	[ShiftBreakTotal] [decimal](12, 2) NULL,
	[ShiftStartDay] [char](10) NULL,
	[ShiftEndDay] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationTimeCard]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationTimeCard](
	[LocationID] [char](4) NULL,
	[EmployeeID] [char](6) NULL,
	[TimePunchDate] [date] NULL,
	[TimePunchTime] [time](7) NULL,
	[TimePunchType] [char](25) NULL,
	[TotalShiftTips] [decimal](12, 2) NULL,
	[TotalShiftCommission] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationTradeHold]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationTradeHold](
	[LocationID] [char](4) NULL,
	[TradeHoldCartonID] [char](25) NULL,
	[TradeHoldCartonCreationDate] [date] NULL,
	[TradeHoldCartonExpirationDate] [date] NULL,
	[TradeHoldCartonExpectedQuantity] [int] NULL,
	[TradeHoldCartonTotalQuantity] [int] NULL,
	[TradeHoldCartonTotalDiscrepancyQuantity] [int] NULL,
	[TradeHoldCartonIsFinalized] [bit] NULL,
	[TradeHoldCartonFinalizedEmployeeID] [char](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationTradeHoldCartonDetails]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationTradeHoldCartonDetails](
	[LocationID] [char](4) NULL,
	[LocationTradeHoldCartonID] [char](25) NULL,
	[SKU] [char](9) NULL,
	[CartonExpectedQuantitySKUSellable] [int] NULL,
	[CartonExpectedQuantitySKUDefective] [int] NULL,
	[CartonActualQuantitySKUSellable] [int] NULL,
	[CartonActualQuantitySKUDefective] [int] NULL,
	[CartonDiscrepancySKUSellable] [int] NULL,
	[CartonDiscrepancySKUDefective] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loyalty]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loyalty](
	[PrimaryKey] [int] IDENTITY(1,1) NOT NULL,
	[LoyaltySKU] [char](6) NULL,
	[LoyaltyProgramName] [nchar](50) NULL,
	[LoyaltyTier1Name] [nchar](10) NULL,
	[LoyaltyTier2Name] [nchar](10) NULL,
	[LoyaltyTier3Name] [nchar](10) NULL,
	[LoyaltyTier1IsPaid] [bit] NULL,
	[LoyaltyTier2IsPaid] [bit] NULL,
	[LoyaltyTier3IsPaid] [bit] NULL,
	[LoyaltyTier1MonthlyPrice] [decimal](12, 2) NULL,
	[LoyaltyTier1AnnualPrice] [decimal](12, 2) NULL,
	[LoyaltyTier2MonthlyPrice] [decimal](12, 2) NULL,
	[LoyaltyTier2AnnualPrice] [decimal](12, 2) NULL,
	[LoyaltyTier3MonthlyPrice] [decimal](12, 2) NULL,
	[LoyaltyTier3AnnualPrice] [decimal](12, 2) NULL,
	[LoyaltyTier1TermMonthly] [bit] NULL,
	[LoyaltyTier1TermAnnual] [bit] NULL,
	[LoyaltyTier2TermMonthly] [bit] NULL,
	[LoyaltyTier2TermAnnual] [bit] NULL,
	[LoyaltyTier3TermMonthly] [bit] NULL,
	[LoyaltyTier3TermAnnual] [bit] NULL,
	[LoyaltyTier1PointsPerDollar] [int] NULL,
	[LoyaltyTier2PointsPerDollar] [int] NULL,
	[LoyaltyTier3PointsPerDollar] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markets]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markets](
	[MarketID] [char](4) NULL,
	[MarketName] [nchar](50) NULL,
	[MarketSupervisorID] [char](6) NULL,
	[DivisionID] [char](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PromotionID] [char](20) NULL,
	[PromotionName] [nchar](50) NULL,
	[PromotionStartDate] [date] NULL,
	[PromotionEndDate] [date] NULL,
	[PromotionTargetSKU] [char](9) NULL,
	[PromotionTargetCategory] [char](3) NULL,
	[PromotionTargetLoyaltyTier] [char](9) NULL,
	[PromotionTargetPriceLessThanOrEqualTo] [decimal](12, 2) NULL,
	[PromotionTargetPriceGreaterThanOrEqualTo] [decimal](12, 2) NULL,
	[IsPromotionGeneral] [bit] NULL,
	[IsPromotionLoyalty] [bit] NULL,
	[IsPromotionPermanent] [bit] NULL,
	[IsPromotionPercentageValue] [bit] NULL,
	[IsPromotionDollarValue] [bit] NULL,
	[PromotionDiscountValue] [decimal](12, 2) NULL,
	[IsPromotionCodeActivated] [bit] NULL,
	[PromotionActivationCode] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[RegionID] [char](4) NULL,
	[RegionName] [nchar](50) NULL,
	[RegionSupervisorID] [char](6) NULL,
	[MarketID] [char](6) NULL,
	[DivisionID] [char](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SerialNumberLog]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SerialNumberLog](
	[LocationID] [char](6) NULL,
	[SKU] [char](9) NULL,
	[SerialNumber] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceAddOns]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceAddOns](
	[ServiceID] [char](9) NULL,
	[ServicePlusID] [char](9) NULL,
	[ServicePlusName] [nchar](50) NULL,
	[ServicePlusPrice] [decimal](12, 2) NULL,
	[ServicePlusPricedBy] [char](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceFees]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceFees](
	[ServiceID] [char](9) NULL,
	[ServiceFeeID] [char](9) NULL,
	[ServiceFeeName] [nchar](50) NULL,
	[ServiceFeePrice] [decimal](12, 2) NULL,
	[ServiceFeePricedBy] [char](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [char](9) NULL,
	[ServiceName] [nchar](50) NULL,
	[ServicePrice] [decimal](12, 2) NULL,
	[ServicePricedBy] [char](15) NULL,
	[ServicePlus] [bit] NULL,
	[ServiceFees] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetails](
	[PrimaryKey] [int] IDENTITY(1,1) NOT NULL,
	[TransactionID] [char](50) NULL,
	[TransactionNumber] [int] NULL,
	[RegisterNumber] [char](2) NULL,
	[LocationID] [char](4) NULL,
	[TransactionDate] [date] NULL,
	[SKU] [char](9) NULL,
	[ComboSKU] [char](9) NULL,
	[CategoryID] [char](3) NULL,
	[SerialNumber] [nchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](12, 2) NULL,
	[DiscountLoyalty] [decimal](12, 2) NULL,
	[DiscountManual] [decimal](12, 2) NULL,
	[ChargeID] [char](100) NULL,
	[Description] [char](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[PrimaryKey] [int] IDENTITY(1,1) NOT NULL,
	[TransactionID] [char](50) NULL,
	[TransactionNumber] [int] NULL,
	[RegisterNumber] [char](2) NULL,
	[LocationID] [char](4) NULL,
	[TransactionDate] [date] NULL,
	[TransactionTime] [time](7) NULL,
	[EmployeeID] [char](6) NULL,
	[CustomerID] [char](50) NULL,
	[Subtotal] [decimal](12, 2) NULL,
	[Taxes] [decimal](12, 2) NULL,
	[Fees] [decimal](12, 2) NULL,
	[DiscountsLoyalty] [decimal](12, 2) NULL,
	[DiscountsManual] [decimal](12, 2) NULL,
	[PaymentMethod] [char](50) NULL,
	[TotalAmount] [decimal](12, 2) NULL,
	[NetCash] [decimal](12, 2) NULL,
	[ChargeID] [char](100) NULL,
	[IsSuspended] [bit] NULL,
	[IsPostVoid] [bit] NULL,
	[PostVoidDate] [date] NULL,
	[PostVoidTime] [time](7) NULL,
	[PostVoidEmployeeID] [char](6) NULL,
	[TipsTotal] [decimal](12, 2) NULL,
	[CommissionTotal] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 5/29/2025 12:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorID] [char](6) NULL,
	[VendorName] [nchar](50) NULL,
	[VendorContact] [nchar](50) NULL,
	[VendorSalesRep] [nchar](50) NULL,
	[VendorContactPhone] [char](10) NULL,
	[VendorSalesRepPhone] [char](10) NULL,
	[VendorContactEmail] [nchar](50) NULL,
	[VendorSalesRepEmail] [nchar](50) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [MerlinDatabase_Base] SET  READ_WRITE 
GO
