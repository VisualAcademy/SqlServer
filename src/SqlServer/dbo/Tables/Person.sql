-- Create Person table
CREATE TABLE Person
(
    PersonId INT IDENTITY(1, 1) PRIMARY KEY,
    FirstName NVARCHAR(128) NOT NULL,
    MiddleInitial NVARCHAR(10) NULL,
    LastName NVARCHAR(128) NOT NULL,
    DateOfBirth DATE NOT NULL DEFAULT(GetDate())
)
Go
