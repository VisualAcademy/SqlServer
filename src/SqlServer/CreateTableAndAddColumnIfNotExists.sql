Use tempdb;

IF OBJECT_ID(N'Sublocation', N'U') IS NULL 
BEGIN   
    CREATE TABLE dbo.Sublocation (
        Id Int Identity(1, 1) Not Null Primary Key, 
        Name NVarChar(255) NOT NULL
    )
END;

Select * From Sublocation;

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = N'Sublocation' AND COLUMN_NAME = N'LocationId'
)
BEGIN
    ALTER TABLE Sublocation ADD LocationId Int NULL
END;

Select * From Sublocation;
