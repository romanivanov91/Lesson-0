--Создаем функцию dbo.udf_GetSKUPrice
create function dbo.udf_GetSKUPrice (@ID_SKU as int)
returns decimal(18, 2)
as
	begin
	declare @cost decimal(18, 2)
		select @cost = (Value/Quantity)
		from dbo.Basket
		where ID_SKU = @ID_SKU
	return @cost
	end
go
