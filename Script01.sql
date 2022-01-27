use [master];
go

-- creating AdventureWorks_Stage DB
create database [AdventureWorks_Stage];
go
use [AdventureWorks_Stage];
go
-- creating two schemas (erp and hr) in AdventureWorks_Stage DB
create schema [erp];
go
create schema [hr];
go

-- ================================================
-- Table related to 'erp' schema
-- ================================================

create table [erp].[BusinessEntity] (
	[rowguid] uniqueidentifier null,
	[ModifiedDate] datetime null,
	[BusinessEntityID] int null,
	[Created_Dt] datetime null,
	[SSISTrackId] int null
)

create table [erp].[Currency] (
	[CurrencyCode] nvarchar(3) null,
	[Name] nvarchar(50) null,
	[ModifiedDate] datetime null,
	[Created_Dt] datetime null,
	[SSISTrackId] int null
)

CREATE TABLE [erp].[Customer](
	[CustomerID] [int] NULL,
	[PersonID] [int] NULL,
	[StoreID] [int] NULL,
	[TerritoryID] [int] NULL,
	[AccountNumber] [varchar](10) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL
)

CREATE TABLE [erp].[Person](
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[BusinessEntityID] [int] NULL,
	[PersonType] [nvarchar](2) NULL,
	[NameStyle] [bit] NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NULL,
	[AdditionalContactInfo] [nvarchar](max) NULL,
	[Demographics] [nvarchar](max) NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
)

CREATE TABLE [erp].[PersonAddress](
	[BusinessEntityID] [int] NULL,
	[AddressID] [int] NULL,
	[AddressTypeID] [int] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[City] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[StateProvinceID] [int] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
)

CREATE TABLE [erp].[Product](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[MakeFlag] [bit] NULL,
	[FinishedGoodsFlag] [bit] NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NULL,
	[ReorderPoint] [smallint] NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nvarchar](3) NULL,
	[WeightUnitMeasureCode] [nvarchar](3) NULL,
	[Weight] [numeric](8, 2) NULL,
	[DaysToManufacture] [int] NULL,
	[ProductLine] [nvarchar](2) NULL,
	[Class] [nvarchar](2) NULL,
	[Style] [nvarchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime] NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
)

CREATE TABLE [erp].[ProductCategory](
	[ModifiedDate] [datetime] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
)

CREATE TABLE [erp].[ProductSubCategory](
	[ProductSubcategoryID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL
)

CREATE TABLE [erp].[SalesHeader](
	[SalesOrderID] [int] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[RevisionNumber] [tinyint] NULL,
	[OrderDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[OnlineOrderFlag] [bit] NULL,
	[SalesOrderNumber] [nvarchar](25) NULL,
	[PurchaseOrderNumber] [nvarchar](25) NULL,
	[AccountNumber] [nvarchar](15) NULL,
	[CustomerID] [int] NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShipToAddressID] [int] NULL,
	[ShipMethodID] [int] NULL,
	[CreditCardID] [int] NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[CurrencyRateID] [int] NULL,
	[SubTotal] [money] NULL,
	[TaxAmt] [money] NULL,
	[Freight] [money] NULL,
	[TotalDue] [money] NULL,
	[Comment] [nvarchar](128) NULL,
	[SSIS_ID] [bigint] NULL
) ON [PRIMARY]

CREATE TABLE [erp].[SalesOrderDetail](
	[SalesOrderID] [int] NULL,
	[SalesOrderDetailID] [int] NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [smallint] NULL,
	[ProductID] [int] NULL,
	[SpecialOfferID] [int] NULL,
	[UnitPrice] [money] NULL,
	[UnitPriceDiscount] [money] NULL,
	[LineTotal] [numeric](38, 6) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
)

CREATE TABLE [erp].[SalesTerritory](
	[TerritoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[Group] [nvarchar](50) NULL
)

CREATE TABLE [erp].[Store](
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Demographics] [nvarchar](max) NULL,
	[BusinessEntityID] [int] NULL
)

-- ================================================
-- Table related to 'hr' schema
-- ================================================

CREATE TABLE [hr].[Employee](
	[BusinessEntityID] [int] NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[LoginID] [nvarchar](256) NULL,
	[OrganizationNode] [binary](892) NULL,
	[OrganizationLevel] [smallint] NULL,
	[JobTitle] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nvarchar](1) NULL,
	[Gender] [nvarchar](1) NULL,
	[HireDate] [date] NULL,
	[SalariedFlag] [bit] NULL,
	[VacationHours] [smallint] NULL,
	[SickLeaveHours] [smallint] NULL,
	[CurrentFlag] [bit] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
)

CREATE TABLE [hr].[EmployeeDepartmentHistory](
	[BusinessEntityID] [int] NULL,
	[DepartmentID] [smallint] NULL,
	[ShiftID] [tinyint] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ModifiedDate] [datetime] NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
)

CREATE TABLE [hr].[EmployeePayHistory](
	[BusinessEntityID] [int] NULL,
	[RateChangeDate] [datetime] NULL,
	[Rate] [money] NULL,
	[PayFrequency] [tinyint] NULL,
	[ModifiedDate] [datetime] NULL
)

-- ================================================
-- View using 'erp' and 'hr' schema
-- ================================================

CREATE VIEW [dbo].[Stg_vw_Erp_Customer]
AS (
	SELECT
		C.[CustomerID],
		P.[Title],
		P.[FirstName],
		P.[LastName],
		P.[NameStyle],
		P.[EmailPromotion],
		PA.[AddressLine1],
		PA.[City]
	FROM [erp].[Customer] C
	INNER JOIN [erp].[Person] P ON C.[PersonID] = P.[BusinessEntityID]
	LEFT JOIN [erp].[PersonAddress] PA ON P.[BusinessEntityID] = PA.[BusinessEntityID]
)
GO

CREATE VIEW [dbo].[Stg_vw_Erp_Employee]
AS (
	SELECT
		E.[NationalIDNumber],
		P.[FirstName],
		P.[LastName],
		NULL AS [NameStyle],
		P.[Title],
		E.[HireDate],
		E.[BirthDate],
		E.[LoginID] AS [EmailAddress],
		N'' AS [Phone],
		E.[MaritalStatus],
		D.[DepartmentName],
		D.[StartDate],
		D.[EndDate]
	FROM [hr].[Employee] E
	LEFT JOIN [erp].[Person] P ON E.[BusinessEntityID] = P.[BusinessEntityID]
	LEFT JOIN [hr].[EmployeeDepartmentHistory] D ON E.[BusinessEntityID] = D.[BusinessEntityID]
)
GO

CREATE VIEW [dbo].[Stg_vw_Erp_Fact_InternetSales]
AS (
	SELECT
		H.[SalesOrderID],
		ROW_NUMBER() OVER (PARTITION BY H.[SalesOrderID] ORDER BY H.[ModifiedDate]) AS [SalesLineNumber],
		P.[ProductNumber],
		CAST(H.[OrderDate] AS DATE) AS [OrderDate],
		CAST(H.[DueDate] AS DATE) AS [DueDate],
		CAST(H.[ShipDate] AS DATE) AS [ShipDate],
		H.[CustomerID],
		H.[TerritoryID],
		N'USD' AS [Currency],
		NULL AS [RevisionNumber],
		O.[OrderQty],
		O.[UnitPrice],
		O.[UnitPriceDiscount],
		O.[LineTotal],
		0 AS [TaxAmt]
	FROM [erp].[SalesHeader] H
	LEFT JOIN [erp].[SalesOrderDetail] O ON H.[SalesOrderID] = O.[SalesOrderID]
	LEFT JOIN [erp].[Product] P ON O.[ProductID] = P.[ProductID]
	WHERE H.[OnlineOrderFlag] = 1
)
GO

CREATE VIEW [dbo].[Stg_vw_Erp_Fact_ResellerSales]
AS (
	SELECT
		H.[SalesOrderID],
		ROW_NUMBER() OVER (PARTITION BY H.[SalesOrderID] ORDER BY H.[ModifiedDate]) AS [SalesLineNumber],
		P.[ProductNumber],
		CAST(H.[OrderDate] AS DATE) AS [OrderDate],
		CAST(H.[DueDate] AS DATE) AS [DueDate],
		CAST(H.[ShipDate] AS DATE) AS [ShipDate],
		CAST(C.[StoreID] AS NVARCHAR(15)) AS [ResellerID],
		H.[TerritoryID],
		E.[NationalIDNumber],
		N'USD' AS [Currency],
		NULL AS [RevisionNumber],
		O.[OrderQty],
		O.[UnitPrice],
		O.[UnitPriceDiscount],
		O.[LineTotal],
		0 AS [TaxAmt]
	FROM [erp].[SalesHeader] H
	LEFT JOIN [erp].[SalesOrderDetail] O ON H.[SalesOrderID] = O.[SalesOrderID]
	LEFT JOIN [erp].[Product] P ON O.[ProductID] = P.[ProductID]
	LEFT JOIN [erp].[Customer] C ON H.[CustomerID] = C.[CustomerID]
	LEFT JOIN [hr].[Employee] E ON E.[BusinessEntityID] = H.[SalesPersonID]
	WHERE H.[OnlineOrderFlag] = 0
)
GO

CREATE VIEW [dbo].[Stg_vw_Erp_Product]
AS (
	SELECT
		P.[ProductNumber],
		P.[Name],
		P.[StandardCost],
		P.[Color],
		P.[Size],
		NULL AS [SizeRange],
		P.[Name] AS [EnglishDescription],
		SC.[Name] AS [ProductSubCategoryCode],
		C.[Name] AS [ProductCategory]
	FROM [erp].[Product] P
	LEFT JOIN [erp].[ProductSubCategory] SC ON P.[ProductSubCategoryID] = SC.[ProductSubCategoryID]
	LEFT JOIN [erp].[ProductCategory] C ON SC.[ProductCategoryID] =  C.[ProductCategoryID]
)
GO

CREATE VIEW [dbo].[Stg_vw_Erp_Reseller]
AS (
	SELECT
		DISTINCT
			C.[StoreID],
			S.[Name] AS [ResellerName],
			NULL AS [YearOpened],
			0 AS [NumberOfEmployees],
			NULL AS [BusinessType]
	FROM [erp].[Customer] C
	LEFT JOIN [erp].[Store] S ON C.[StoreID] = S.[BusinessEntityID]
	WHERE C.[PersonID] is NULL
)
GO

ALTER TABLE [erp].[BusinessEntity] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[Currency] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[Person] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[PersonAddress] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[Product] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [hr].[Employee] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [hr].[EmployeeDepartmentHistory] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO