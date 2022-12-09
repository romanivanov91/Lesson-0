--Создаем процедуру dbo.usp_MakeFamilyPurchase
create proc dbo.usp_MakeFamilyPurchase
@FamilySurName as varchar(255)
as
if (@FamilySurName in (select FamilySurName
						from dbo.Family))
	update dbo.Family
	set BudgetValue = BudgetValue - (select sum(Value)
									from dbo.Basket)
	where FamilySurName = @FamilySurName
else
	raiserror ('Такой семьи нет!!!', 11, 1)
