--Создаем триггер dbo.TR_Basket_insert_update
create trigger dbo.TR_Basket_insert_update on dbo.Basket after insert
as

update dbo.Basket
set DiscountValue = case
						when ID_SKU in (select ID_SKU
						from inserted
						group by ID_SKU
						having count(ID_SKU) >= 2)
						then Value * 0.05
						else 0
						end
where ID in (select ID
			from inserted)
