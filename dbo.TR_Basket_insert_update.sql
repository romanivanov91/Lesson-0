--Создаем триггер dbo.TR_Basket_insert_update
create trigger dbo.TR_Basket_insert_update on dbo.Basket after insert
as

update dbo.Basket
set DiscountValue = Value * 0.05
where ID in (select ID
			from inserted)
		and ID_SKU in (select ID_SKU
						from inserted
						group by ID_SKU
						having count(ID_SKU) >= 2)

update dbo.Basket
set DiscountValue = 0
where ID in (select ID
			from inserted)
		and ID_SKU in (select ID_SKU
						from inserted
						group by ID_SKU
						having count(ID_SKU) = 1)
