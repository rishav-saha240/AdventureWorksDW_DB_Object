USE [AdventureWorks2019OLTP]
GO

CREATE VIEW [dbo].[vOLTP_Stage_EmployeeDepartmentHistory]
AS (
	SELECT
		EDH.[BusinessEntityID]
		, EDH.[ModifiedDate]
		, EDH.[DepartmentID]
		, EDH.[ShiftID]
		, EDH.[StartDate]
		, EDH.[EndDate]
		, D.[Name] AS [DepartmentName]
	FROM [AdventureWorks2019OLTP].[HumanResources].[EmployeeDepartmentHistory] EDH
	INNER JOIN [AdventureWorks2019OLTP].[HumanResources].[Department] D ON EDH.DepartmentID = D.DepartmentID
);