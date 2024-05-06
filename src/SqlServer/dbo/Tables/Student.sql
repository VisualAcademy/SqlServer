-- Create Student table
CREATE TABLE Student
(
    StudentId INT IDENTITY(1, 1) PRIMARY KEY,
    PersonId INT REFERENCES Person (PersonId),
    Email NVARCHAR(256)
)
Go
