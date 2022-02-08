select * from AdventureWorks_Stage.dbo.Stg_vw_Erp_Employee

select * from AdventureWorks_Warehouse.dbo.DimEmployee
where EmployeeNationalIDAlternateKey=112457891
order by EmployeeKey desc

exec dbo.Refresh_DimEmployee

delete from dbo.DimEmployee
dbcc checkident ('dbo.DimEmployee', reseed, 0)

update AdventureWorks_Stage.hr.Employee
set MaritalStatus = 'S'
where NationalIDNumber = 112457891

select * from AdventureWorks_Stage.hr.Employee
where NationalIDNumber = 112457891


/*
update edh
set edh.EndDate = cast(getdate() as date)
, edh.isActiveRecord = 0
from AdventureWorks_Stage.hr.EmployeeDepartmentHistory edh
inner join AdventureWorks_Stage.hr.Employee e on e.BusinessEntityID = edh.BusinessEntityID
where NationalIDNumber = 112457891 
and DepartmentName = 'Tool Design'

insert into
AdventureWorks_Stage.hr.EmployeeDepartmentHistory (
[BusinessEntityID],
[DepartmentID],
[ShiftID],
[StartDate],
[EndDate],
[ModifiedDate],
[DepartmentName],
[Created_Dt],
[SSISTrackId],
[isActiveRecord]
)
values (
	4,
	9999,
	1,
	cast('2022-02-07' as date),
	null,
	getdate(),
	'Analytics',
	getdate(),
	0,
	1
)
*/

select * from dbo.DimEmployee
select * from AdventureWorks_Stage.dbo.Stg_vw_Erp_Employee

-- ===============================================================