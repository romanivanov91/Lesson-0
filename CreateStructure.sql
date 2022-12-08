-- Создание схемы dbo
if not exists (
	select 1
	from sys.schemas
	where name = 'dbo'
)
begin
	exec('create schema dbo');
end
go

-- Создание таблицы dbo.SKU
if object_id('dbo.SKU') is null
begin
	create table dbo.SKU (ID int not null identity(1, 1))
	alter table dbo.SKU add constraint PK_onboarding_Position primary key (ID)
	alter table dbo.SKU add Code as ('s' + cast(ID as varchar(255)))
	alter table dbo.SKU add constraint UNIQUE_Code unique (Code)
	alter table dbo.SKU add Name varchar(255) not null
end
go

-- --Вариант создания таблицы dbo.SKU с объектом последовательности
-- if object_id('dbo.SKU') is null
-- begin
-- 	create sequence dbo.CodeDef
--  	start with 1

-- 	drop table dbo.SKU
-- 	create table dbo.SKU (ID int not null identity(1, 1))
-- 	alter table dbo.SKU add constraint PK_onboarding_Position primary key (ID)
-- 	alter table dbo.SKU add Code varchar(255) null
-- 	alter table dbo.SKU add constraint UNIQUE_Code unique (Code)
-- 	alter table dbo.SKU add constraint DF_Code default concat('s', cast(NEXT VALUE FOR dbo.CodeDef  as varchar(255))) for Code
-- 	alter table dbo.SKU add Name varchar(255) not null
-- end
-- go

--Создание таблицы dbo.Basket
if object_id('dbo.Basket') is null
begin
	create table dbo.Basket (ID int not null identity(1, 1))
	alter table dbo.Basket add constraint PK_dbo_Basket primary key (ID)
	alter table dbo.Basket add ID_SKU int not null
	alter table dbo.Basket add constraint FK_DBO_BASKET_ID_SKU foreign key (ID_SKU) references dbo.SKU(ID)
	alter table dbo.Basket add Quantity int not null
	alter table dbo.Basket add constraint CHECK_dbo_Basket_Quantity check (Quantity > 0)
	alter table dbo.Basket add Value int not null
	alter table dbo.Basket add constraint CHECK_dbo_Basket_Value check (Value > 0)
	alter table dbo.Basket add PurchaseDate date not null
	alter table dbo.Basket add constraint DF_dbo_Basket_PurchaseDate default(getdate()) for PurchaseDate
	alter table dbo.Basket add DiscountValue int not null
end
go

--Создание таблицы  dbo.Family
if object_id('dbo.Family') is null
begin
	create table dbo.Family (ID int not null identity(1, 1))
	alter table dbo.Family add FamilySurName varchar(255) not null
	alter table dbo.Family add BudgetValue int not null
end
go
