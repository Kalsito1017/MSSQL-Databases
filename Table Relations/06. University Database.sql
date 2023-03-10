CREATE TABLE Students
(
StudentID INT NOT NULL,
StudentNumber VARCHAR(50),
StudentName VARCHAR(50),
MajorID INT NOT NULL
)
CREATE TABLE Agenda
(
StudentID INT NOT NULL,
SubjectID INT NOT NULL
)
CREATE TABLE Subjects
(
SubjectID INT NOT NULL,
SubjectName VARCHAR(50)
)
CREATE TABLE Majors
(
MajorID INT NOT NULL,
Name VARCHAR(50)
)
CREATE TABLE Payments
(
PaymentID INT NOT NULL,
PaymentDate DATETIME,
PaymentAmount DECIMAL(15,2) NOT NULL,
StudentID INT NOT NULL
)

ALTER TABLE Majors
ADD CONSTRAINT PK_MajorID
PRIMARY KEY(MajorID)
ALTER TABLE Payments
ADD CONSTRAINT PK_PaymentID
PRIMARY KEY(PaymentID)

ALTER TABLE Students
ADD CONSTRAINT PK_StudentID
PRIMARY KEY(StudentID)

ALTER TABLE Payments
ADD CONSTRAINT FK_StudentID 
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)

ALTER TABLE Students
ADD CONSTRAINT FK_MajorID
FOREIGN KEY(MajorID) REFERENCES Majors(MajorID)

ALTER TABLE Subjects
ADD CONSTRAINT PK_SubjectID
PRIMARY KEY(SubjectID)

ALTER TABLE Agenda
ADD CONSTRAINT PK_Agenda
PRIMARY KEY(SubjectID,StudentID)

ALTER TABLE Agenda
ADD CONSTRAINT FK_Agenda
FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
FOREIGN KEY(SubjectID) REFERENCES Subjects(SubjectID)