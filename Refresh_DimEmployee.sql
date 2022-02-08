USE [AdventureWorks_Warehouse]
GO

/****** Object:  StoredProcedure [dbo].[Refresh_DimEmployee]    Script Date: 07-02-2022 01:07:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




create procedure [dbo].[Refresh_DimEmployee]
as
begin

-- =========================================================================================
-- update MaritalStatus | update Title
-- =========================================================================================

update dim
set dim.MaritalStatus = stg.MaritalStatus
from dbo.DimEmployee dim (nolock)
inner join AdventureWorks_Stage.dbo.Stg_vw_Erp_Employee stg (nolock)
	on stg.NationalIDNumber = dim.EmployeeNationalIDAlternateKey
where dim.MaritalStatus <> stg.MaritalStatus

update dim
set dim.Title = stg.Title
from dbo.DimEmployee dim (nolock)
inner join AdventureWorks_Stage.dbo.Stg_vw_Erp_Employee stg (nolock)
	on stg.NationalIDNumber = dim.EmployeeNationalIDAlternateKey
where dim.Title <> stg.Title

-- =========================================================================================
-- update inactive records
-- =========================================================================================

update dim
set dim.EndDate = stg.EndDate
, dim.isActiveRecord = stg.isActiveRecord
from AdventureWorks_Stage.dbo.Stg_vw_Erp_Employee stg
inner join dbo.DimEmployee dim on stg.NationalIDNumber = dim.EmployeeNationalIDAlternateKey
where dim.isActiveRecord = 1
and stg.isActiveRecord = 0
and stg.DepartmentName = dim.Department

-- =========================================================================================
-- insert new non-matching records
-- =========================================================================================
insert into dbo.DimEmployee
select
	  NationalIDNumber
	, FirstName
	, LastName
	, Title
	, HireDate
	, BirthDate
	, EmailAddress
	, Phone
	, MaritalStatus
	, DepartmentName
	, StartDate
	, EndDate
	, null
	, isActiveRecord
from AdventureWorks_Stage.dbo.Stg_vw_Erp_Employee
except
select
[EmployeeNationalIDAlternateKey]
	, [FirstName]
	, [LastName]
	, [Title]
	, [HireDate]
	, [BirthDate]
	, [EmailAddress]
	, [Phone]
	, [MaritalStatus]
	, [Department]
	, [StartDate]
	, [EndDate]
	, [Status]
	, [isActiveRecord]
from dbo.DimEmployee
-- =========================================================================================

end
GO


