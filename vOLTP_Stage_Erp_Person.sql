USE [AdventureWorks2019OLTP]
GO

CREATE VIEW [vOLTP_Stage_Erp_Person]
AS (
	SELECT
		PA.AddressID
		, PA.AddressLine1
		, PA.City
		, PA.StateProvinceID
		, PA.PostalCode
		, PA.rowguid
		, PA.ModifiedDate
		, PBEA.BusinessEntityID
		, PBEA.AddressTypeID
	FROM [AdventureWorks2019OLTP].[Person].[Address] PA
	INNER JOIN [AdventureWorks2019OLTP].[Person].[BusinessEntityAddress] PBEA ON PA.AddressID = PBEA.AddressID
)