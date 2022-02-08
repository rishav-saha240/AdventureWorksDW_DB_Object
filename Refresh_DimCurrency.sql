USE [AdventureWorks_Warehouse]
GO

CREATE PROCEDURE [dbo].[Refresh_DimCurrency]
AS
BEGIN
	INSERT INTO [dbo].[DimCurrency]
		(
			[CurrencyAlternateKey]
			, [CurrencyName]
		)
	SELECT
		STG.[CurrencyCode]
		, STG.[Name]
	FROM [AdventureWorks_Stage].[erp].[Currency] STG (NOLOCK)
	LEFT JOIN [dbo].[DimCurrency] DIM (NOLOCK) ON STG.[CurrencyCode] = DIM.[CurrencyAlternateKey]
	WHERE DIM.[CurrencyAlternateKey] IS NULL

	UPDATE DIM
	SET DIM.[CurrencyName] = STG.[Name]
	FROM [dbo].[DimCurrency] DIM (NOLOCK)
	INNER JOIN [AdventureWorks_Stage].[erp].[Currency] STG (NOLOCK) ON STG.[CurrencyCode] = DIM.[CurrencyAlternateKey]
END
