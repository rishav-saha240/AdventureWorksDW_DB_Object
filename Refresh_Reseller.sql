USE [AdventureWorks_Warehouse]
GO

CREATE PROCEDURE [dbo].[Refresh_Reseller]
AS
BEGIN

INSERT INTO [dbo].[DimReseller]
(
	[ResellerAlternateKey]
	, [ResellerName]
	, [NumberEmployees]
	, [YearOpened]
)

SELECT
	STG.[StoreID]
	, STG.[ResellerName]
	, STG.[NumberOfEmployees]
	, STG.[YearOpened]
FROM 
	[AdventureWorks_Stage].[dbo].[Stg_vw_Erp_Reseller] STG (NOLOCK)
LEFT JOIN [dbo].[DimReseller] DIM (NOLOCK)
		ON STG.[StoreID] = DIM.[ResellerAlternateKey]
WHERE DIM.[ResellerAlternateKey] IS NULL

UPDATE DIM
SET
	DIM.[ResellerName] = STG.ResellerName
FROM [dbo].[DimReseller] DIM (NOLOCK)
INNER JOIN [AdventureWorks_Stage].[dbo].[Stg_vw_Erp_Reseller] STG (NOLOCK)
ON STG.[StoreID] = DIM.[ResellerAlternateKey]

END