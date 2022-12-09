--Создаем представления dbo.vw_SKUPriceв (view)
create view dbo.vw_SKUPriceв as
select Code, Name, dbo.udf_GetSKUPrice(ID) as cost
from dbo.SKU
