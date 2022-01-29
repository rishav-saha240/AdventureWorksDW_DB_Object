USE [AdventureWorks2019OLTP]
GO

CREATE PROCEDURE [OLTP_Stage_Erp_Person_Obtain] AS
BEGIN
	WITH [OLTP_Stage_Erp_Person] ([AddressID], [AddressLine1], [City]
									, [StateProvinceID], [PostalCode]
									, [rowguid], [ModifiedDate]
									, [BusinessEntityID], [AddressTypeID])
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

	SELECT
		X.[BusinessEntityID]
		, X.[AddressID]
		, X.[AddressTypeID]
		, X.[rowguid]
		, X.[ModifiedDate]
		, X.[AddressLine1]
		, X.[City]
		, X.[PostalCode]
		, X.[StateProvinceID]
	FROM [OLTP_Stage_Erp_Person] X;
END