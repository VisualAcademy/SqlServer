-- Create Course table
CREATE TABLE Course
(
    CourseId INT IDENTITY(1, 1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Tecaher NVARCHAR(256) NOT NULL
)
GO