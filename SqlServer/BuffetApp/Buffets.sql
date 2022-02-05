Use BuffetApp
Go

-- 국물
Create Table Broths (
	[Id] Int Not Null Identity, 
	[Name] NVarChar(100) Not Null,
	[IsVegan] Bit Not Null,
	Constraint [PK_Broths] Primary Key ([Id])
);
-- 국수
Create Table Noodles (
	[Id] Int Not Null Identity, 
	[Name] NVarChar(100) Not Null,
	[BrothId] Int Null,
	Constraint [PK_Noodles] Primary Key ([Id]),
	Constraint [FK_Noodles_Broths_BrothId] Foreign Key ([BrothId]) References [Broths] ([Id])
);
-- 고명
Create Table Garnishes (
	[Id] Int Not Null Identity, 
	[Name] NVarChar(100) Not Null,
	--[Calories] Decimal(18,2) Not Null,
	[NoodleId] Int Null,
	Constraint [PK_Garnishes] Primary Key ([Id]),
	Constraint [FK_Garnishes_Noodles_NoodleId] Foreign Key ([NoodleId]) References [Noodles] ([Id])
);
