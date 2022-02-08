USE [AdventureWorks_Warehouse]
GO

CREATE PROCEDURE [dbo].[Refresh_DimCustomer]
AS
BEGIN

	MERGE INTO [dbo].[DimCustomer] CUS
	USING [AdventureWorks_Stage].[dbo].[Stg_vw_Erp_Customer] STG
	ON CUS.[CustomerAlternateKey] = STG.[CustomerID]

	WHEN MATCHED AND (CUS.[EmailAddress] <> STG.[EmailPromotion]
						OR CUS.[AddressLine1] <> STG.[AddressLine1]
						OR CUS.[AddressLine2] <> STG.[City])
	THEN
		UPDATE SET CUS.[EmailAddress] = STG.[EmailPromotion]
				 , CUS.[AddressLine1] = STG.[AddressLine1]
				 , CUS.[AddressLine2] = STG.[City]

	WHEN NOT MATCHED BY TARGET
	THEN
		INSERT ([CustomerAlternateKey]
				, [Title]
				, [FirstName]
				, [LastName]
				, [NameStyle]
				, [EmailAddress]
				, [AddressLine1]
				, [AddressLine2])
		VALUES (STG.[CustomerID]
				, STG.[Title]
				, STG.[Firstname]
				, STG.[LastName]
				, STG.[NameStyle]
				, STG.[EmailPromotion]
				, STG.[AddressLine1]
				, STG.[City])
		;
END