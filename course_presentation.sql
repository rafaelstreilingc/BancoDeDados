-- Creating table for the overall Course Information
CREATE TABLE CourseInfo (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Description VARCHAR(255),
    DurationMonths INT
);

-- Creating table for Modules
CREATE TABLE Modules (
    ModuleID INT PRIMARY KEY,
    ModuleName VARCHAR(100),
    ModuleDescription VARCHAR(255),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES CourseInfo(CourseID)
);

-- Creating table for Instructors
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(100),
    Expertise VARCHAR(100)
);

-- Creating table for Schedule
CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    ModuleID INT,
    InstructorID INT,
    DayOfWeek VARCHAR(15),
    TimeSlot VARCHAR(15),
    FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

-- Inserting data into CourseInfo
INSERT INTO CourseInfo (CourseID, CourseName, Description, DurationMonths) VALUES
(1, 'Technical Systems Development', 'Comprehensive course covering software development, database management, and web development', 24);

-- Inserting data into Modules
INSERT INTO Modules (ModuleID, ModuleName, ModuleDescription, CourseID) VALUES
(1, 'Introduction to Programming', 'Basics of programming using Python', 1),
(2, 'Web Development', 'HTML, CSS, and JavaScript for building web pages', 1),
(3, 'Database Management', 'Fundamentals of database design and SQL', 1);

-- Inserting data into Instructors
INSERT INTO Instructors (InstructorID, InstructorName, Expertise) VALUES
(1, 'Dr. Alice Johnson', 'Python and Data Science'),
(2, 'Mr. Bob Smith', 'Web Development'),
(3, 'Ms. Charlie Brown', 'Database Systems');

-- Inserting data into Schedule
INSERT INTO Schedule (ScheduleID, ModuleID, InstructorID, DayOfWeek, TimeSlot) VALUES
(1, 1, 1, 'Monday', '10:00-12:00'),
(2, 2, 2, 'Wednesday', '14:00-16:00'),
(3, 3, 3, 'Friday', '09:00-11:00');

-- Query to display Course Information
SELECT 
    CourseName,
    Description,
    DurationMonths
FROM 
    CourseInfo;

-- Query to display all Modules with their descriptions and corresponding course
SELECT 
    Modules.ModuleName,
    Modules.ModuleDescription,
    CourseInfo.CourseName
FROM 
    Modules
JOIN 
    CourseInfo ON Modules.CourseID = CourseInfo.CourseID;

-- Query to display Instructors and their expertise
SELECT 
    InstructorName,
    Expertise
FROM 
    Instructors;

-- Query to display the schedule for each module
SELECT 
    Modules.ModuleName,
    Instructors.InstructorName,
    Schedule.DayOfWeek,
    Schedule.TimeSlot
FROM 
    Schedule
JOIN 
    Modules ON Schedule.ModuleID = Modules.ModuleID
JOIN 
    Instructors ON Schedule.InstructorID = Instructors.InstructorID;
