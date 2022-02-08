USE [AdventureWorks_Warehouse]
GO

CREATE PROCEDURE [dbo].[Refresh_DimProduct]
AS
BEGIN

INSERT INTO [dbo].[DimProduct]
(
	[ProductAlternateKey]
	, [EnglishProductName]
	, [StandardCost]
	, [Color]
	, [Size]
	, [SizeRange]
	, [EnglishDescription]
	, [FrenchDescription]
	, [ArabicDescription]
	, [ProductSubcategoryCode]
	, [ProductcategoryCode]
	, [Status]
)

SELECT
	STG.[ProductNumber]
	, STG.[Name]
	, STG.[StandardCost]
	, ISNULL(STG.[Color], 'NA')
	, STG.[Size]
	, STG.[SizeRange]
	, STG.[EnglishDescription]
	, NULL
	, NULL
	, STG.[ProductSubCategoryCode]
	, STG.[ProductCategory]
	, NULL
FROM [AdventureWorks_Stage].[dbo].[Stg_vw_Erp_Product] STG (NOLOCK)
LEFT JOIN [dbo].[DimProduct] DIM (NOLOCK) ON DIM.[ProductAlternateKey] = STG.[ProductNumber]
WHERE DIM.[ProductAlternateKey] IS NULL

UPDATE DIM
	SET DIM.[EnglishDescription] = STG.[EnglishDescription]
FROM [dbo].[DimProduct] DIM (NOLOCK)
INNER JOIN [AdventureWorks_Stage].[dbo].[Stg_vw_Erp_Product] STG (NOLOCK)
ON DIM.[ProductAlternateKey] = STG.[ProductNumber]

END