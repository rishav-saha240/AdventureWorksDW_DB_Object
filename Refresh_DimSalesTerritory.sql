USE [AdventureWorks_Warehouse]
GO

CREATE PROCEDURE [dbo].[RefreshDimSalesTerritory]
AS
BEGIN

INSERT INTO [dbo].[DimSalesTerritory]
(
	[SalesTerritoryAlternateKey]
	, [SalesTerritoryRegion]
	, [SalesTerritoryCountry]
	, [SalesTerritoryGroup]
)
SELECT
	STG.[TerritoryID]
	, STG.[Name]
	, STG.[CountryRegionCode]
	, STG.[Group]
FROM [AdventureWorks_Stage].[erp].[SalesTerritory] STG (NOLOCK)
LEFT JOIN [dbo].[DimSalesTerritory] DIM (NOLOCK)
ON DIM.[SalesTerritoryAlternateKey] = STG.[TerritoryID]
WHERE DIM.[SalesTerritoryAlternateKey] IS NULL

UPDATE DIM
	SET
		DIM.[SalesTerritoryRegion] = STG.[NAME]
		, DIM.[SalesTerritoryCountry] = STG.[CountryRegionCode]
		, DIM.[SalesTerritoryGroup] = STG.[Group]
FROM [dbo].[DimSalesTerritory] DIM (NOLOCK)
INNER JOIN [AdventureWorks_Stage].[erp].[SalesTerritory] STG (NOLOCK)
ON DIM.[SalesTerritoryAlternateKey] = STG.[TerritoryID]

END