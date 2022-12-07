--Создаем представления dbo.vw_SKUPriceв (view)
create view dbo.vw_SKUPriceв as
select *, dbo.udf_GetSKUPrice(ID_SKU)
from dbo.SKU as s
	join
	dbo.Basket as b
	on s.ID = b.ID_SKU
