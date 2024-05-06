-- Create Credit table
CREATE TABLE Credit
(
    StudentId INT REFERENCES Student (StudentId),
    CourseId INT REFERENCES Course (CourseId),
    Grade DECIMAL(5, 2) CHECK (Grade <= 100.00),
    Attempt TINYINT,
    CONSTRAINT [UQ_studentgrades] UNIQUE CLUSTERED
    (
        StudentId, CourseId, Grade, Attempt
    )
)
Go