CREATE DATABASE BTD210_Asg2_5;

USE BTD210_Asg2_5;

CREATE TABLE Graduate_attributes (
    Graduate_ID INT PRIMARY KEY,
    Graduate_attributes VARCHAR(255) NOT NULL
);

CREATE TABLE PLO (
    PLO_ID INT PRIMARY KEY,
    PLO VARCHAR(255) NOT NULL
);

CREATE TABLE Professor (
    Professor_ID INT PRIMARY KEY,
    Professor VARCHAR(255) NOT NULL
);

CREATE TABLE Book (
    BOOK_ID INT PRIMARY KEY,
    ISBN VARCHAR(20) ,
    Textbook_name VARCHAR(255),
    Author VARCHAR(255) ,
    Publisher VARCHAR(255) 
);
CREATE TABLE Course (
    Course_code VARCHAR(10) PRIMARY KEY,
    Course_Name VARCHAR(255) NOT NULL,
    Semester INT NOT NULL,
    Course_Description TEXT,
    Contact_Hours_Week INT NOT NULL,
);

CREATE TABLE Method_of_Instruction (
    Method_of_Instruction_ID INT PRIMARY KEY,
    Method_of_Instruction VARCHAR(255) NOT NULL,
    Course_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (Course_code) REFERENCES Course (Course_code)
);

CREATE TABLE PLO_Bridge (
    PLO_Bridge_ID INT PRIMARY KEY,
    PLO_ID INT NOT NULL,
    Course_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (PLO_ID) REFERENCES PLO (PLO_ID),
    FOREIGN KEY (Course_code) REFERENCES Course (Course_code)
);

CREATE TABLE Book_Bridge (
    Book_Bridge_ID INT PRIMARY KEY,
    BOOK_ID INT NOT NULL,
    Course_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (BOOK_ID) REFERENCES Book (BOOK_ID),
    FOREIGN KEY (Course_code) REFERENCES Course (Course_code)
);

CREATE TABLE Graduate_Bridge (
    Graduate_Bridge_ID INT PRIMARY KEY,
    Course_code VARCHAR(10) NOT NULL,
    Graduate_ID INT NOT NULL,
    FOREIGN KEY (Course_code) REFERENCES Course (Course_code),
    FOREIGN KEY (Graduate_ID) REFERENCES Graduate_attributes (Graduate_ID)
);

CREATE TABLE CLO (
    CLO_ID INT PRIMARY KEY,
    Course_code VARCHAR(10) NOT NULL,
    Learning_Outcomes VARCHAR(255) NOT NULL,
    FOREIGN KEY (Course_code) REFERENCES Course (Course_code)
);

CREATE TABLE Prerequisite (
    Prerequisite_ID INT PRIMARY KEY,
    Prerequisite VARCHAR(255) NOT NULL,
    Course_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (Course_code) REFERENCES Course (Course_code)
);
CREATE TABLE DevelopedBy (
    DevelopedBy_ID INT PRIMARY KEY,
    DeveloperName VARCHAR(100) NOT NULL,
	Course_code VARCHAR(10) NOT NULL,
	FOREIGN KEY (Course_code) REFERENCES Course (Course_code)
);

CREATE TABLE Term (
    Term_Code INT PRIMARY KEY,
	Batch VARCHAR(100) NOT NULL,
	Term INT NOT NULL
);

CREATE TABLE Section_Bridge (
    Section_Bridge_ID INT PRIMARY KEY,
	Course_code VARCHAR(10) NOT NULL,
	Professor_ID INT NOT NULL,
	Term_Code INT NOT NULL,
	FOREIGN KEY (Term_Code) REFERENCES Term (Term_Code),
	FOREIGN KEY (Professor_ID) REFERENCES Professor (Professor_ID),
	FOREIGN KEY (Course_code) REFERENCES Course (Course_code)
);

INSERT INTO Graduate_attributes (Graduate_ID, Graduate_attributes) 
VALUES
(1, 'Knowledge Base'),
(2, 'Problem Analysis'),
(3, 'Investigation'),
(4, 'Design'),
(5, 'Use of Engineering Tools'),
(6, 'Individual and Team Work'),
(7, 'Communication Skills'),
(8, 'Professionalism'),
(9, 'Impact on Society and the Environment'),
(10, 'Ethics and Equity'),
(11, 'Economics and Project Management'),
(12, 'Life-long Learning');


INSERT INTO PLO (PLO_ID, PLO)
VALUES
(1, 'Apply mathematics, natural sciences, and engineering fundamentals to solve engineering problems.'),
(2, 'Create software engineering solutions that satisfy technical and business requirements.'),
(3, 'Design an optimal solution using artificial intelligence, data mining, and machine learning tools for complex and open-ended problems.'),
(4, 'Employ interpersonal, teambuilding, and leadership skills to solve problems independently and in diverse teams.'),
(5, 'Communicate complex engineering problems and solutions to fellow software engineers and designers as well as non-technical audiences.'),
(6, 'Act ethically and responsibly with public welfare and environmental protection as a guiding professional practice.'),
(7, 'Plan and manage the scope, cost, timing, and quality of the project for success as defined by the project stakeholders.'),
(8, 'Utilize investigative practices and self-awareness techniques to identify and pursue lifelong learning opportunities within their field of study and more broadly.');

INSERT INTO Professor (Professor_ID, Professor)
VALUES 
(1, 'Arif Obaid'),
(2, 'Jacky Lau'),
(3, 'Mufleh Al-Shatnawi'),
(4, 'Ali Sanaee'),
(5, 'Allan Randall'),
(6, 'Kifah Al-Ansari'),
(7, 'Vida Movahedi');

INSERT INTO Course (Course_code, Course_Name, Semester, Course_Description, Contact_Hours_Week) 
VALUES
('SEM305', 'Discrete Mathematics', 1, 
 'The mathematics of modern computer science is built almost entirely on discrete math. Students are introduced to discrete structures in order to formulate abstract concepts and techniques using the language of propositional and predicate logic and set theory.', 
 56),
('MEC110', 'Mechanics', 1, 
 'This course introduces the subject of statics. The study of particles and rigid bodies in equilibrium. Students study, and solve problems involving, the equilibrium of particles and rigid bodies in two and in three dimensions. In particular, they calculate the forces in the members of trusses and frames. They also learn to calculate the coordinates of the centroids of two-dimensional geometric figures as well as the centre of gravity of homogeneous solid bodies. Problems involving machines and equilibrium problems which include dry friction are studied as well.', 
 84),
('SES250', 'Electromagnetics', 2, 
 'Students are introduced to electrostatics, magnetism and circuit theory with an emphasis on circuit and machine design. Electromagnetics is the foundation of all studies in electronics, wireless communications, and electrical machines. Electromagnetism is one of the four fundamental interactions (commonly called forces) in nature, together with the strong interaction, the weak interaction, and gravitation.',
 84),
('BTD210', 'Database Design Principles', 3, 
 'This course introduces the principles of relational database design and use. Students learn a methodology for relational database design that uses Entity Relationship Diagrams and normalization of data. The design is then used to create a database schema, and to implement a database by using an introductory subset of SQL (Structured Query Language). Students also use SQL to perform query and data modification operations. A modern and a widely-used database server is used to host the database.',
 56),
('SEH300', 'Digital and Analog Circuits', 3, 
 'An introduction to the basic concepts of electricity, magnetism, electric circuits, and basic combinational and sequential digital circuits. Students develop an understanding of microprocessors and computer architecture in software driven hardware. DC and AC driven circuits, and digital circuits are studied in detail. Fundamental electronic components are examined such as resistors, inductors, capacitors, diodes, transistors, operational amplifiers and digital logic gates.',
 56),

('SEP200', 'Object-Oriented Programming', 2, 'Students expand their knowledge of programming fundamentals with the C++ language by examining the fundamentals of object-oriented programming – encapsulation, inheritance, and polymorphism. An introduction to the standard template library is given, as well as an introduction to UML. The principles of object-oriented programming presented here are applicable to a wide variety of languages and are fundamental to modular software development within a large code base.', 56);


INSERT INTO CLO(CLO_ID, Course_code, Learning_Outcomes)
VALUES
(1, 'SEM305', 'Compare logical constructs and proofs to verify mathematical statements.'),
(2, 'SEM305', 'Arrange sets as a building block for the types of objects considered in discrete mathematics.'),
(3, 'SEM305', 'Construct matrices for mathematical transformations of physical systems.'),
(4, 'SEM305', 'Classify algorithms according to growth to minimize computing time.'),
(5, 'SEM305', 'Apply the principles of induction for mathematical proofs.'),
(6, 'SEM305', 'Assemble graphs to show the relationships between objects.'),
(7, 'SEM305', 'Construct trees to model computer algorithms.'),
(8, 'SEM305', 'Design logic circuits using the principles of Boolean algebra.'),
(9, 'MEC110', 'Calculate the resultant of a number of concurrent forces in two or three dimensions.'),
(10, 'MEC110', 'Calculate the magnitude and direction of a force required to keep a given force system in equilibrium.'),
(11, 'MEC110', 'Draw a free-body diagram of a particle acted on by forces and use the diagram as an aid to calculate the magnitudes and directions of the unknown force(s) if equilibrium is to be obtained.'),
(12, 'MEC110', 'Use the concepts of moments and couples to calculate the single force and the single couple which is equivalent to a system of coplanar couples and/or non-concurrent forces.'),
(13, 'MEC110', 'Define a rigid body and use free body diagrams to aid in solving for the unknown forces and/or couples required to maintain a two-dimensional rigid body in equilibrium.'),
(14, 'MEC110', 'Calculate the coordinates of the centroids of plane areas and of the centers of gravity of homogeneous plates having uniform thickness. '),
(15, 'MEC110', 'Calculate the magnitudes of the unknown forces acting in some or all of the members of a truss, machine, or frame which is acted on by a number of external forces and/or couples and which is in equilibrium.'),
(16, 'MEC110', 'Explain dry friction and use the equations of dry friction to solve the problems of statics equilibrium.'),
(17, 'SES250', 'Examine electrostatic induction in machines for commercial applications.'),
(18, 'SES250', 'Explore the role of electrical resistance in controlling current and voltage in hardware applications.'),
(19, 'SES250', 'Apply magnetic induction to electric motors.'),
(20, 'SES250', 'Connect the interaction between electric and magnetic fields in simple circuits.'),
(21, 'SES250', 'Predict component current and voltage for various circuit configurations.'),
(22, 'SES250', 'Design simple AC and DC circuits for electrical power transfer.'),
(23, 'BTD210', 'Compose SQL to retrieve data from databases.'),
(24, 'BTD210', 'Compose SQL to create and modify tables in databases.'),
(25, 'BTD210', 'Prepare a physical relational database schema for specific business applications.'),
(26, 'BTD210', 'Prepare a logical relational database schema for specific business applications.'),
(27, 'BTD210', 'Compose an Entity Relationship Diagram for specific business applications.'),
(28, 'BTD210', 'Re-organize data to third normal form.'),
(29, 'BTD210', 'Distinguish the differences between relational, hierarchical, and network databases.'),
(30, 'BTD210', 'Differentiate between the basic functions of a Database Management System.'),
(31, 'BTD210', 'Describe the responsibilities of a Database administrator in an organization.'),
(32, 'BTD210', 'Compose such specialized material as Entity Relationship Diagrams, normalized database schemas, and databases.'),
(33, 'SEH300', 'Apply engineering fundamentals to solve hardware problems.'),
(34, 'SEH300', 'Connect the effect of moving electric and magnetic fields on circuits to protect against component damage and ensure correctness of operation.'),
(35, 'SEH300', 'Employ the operating modes of analog electronic components for linear or non-linear operation.'),
(36, 'SEH300','Design simple analog circuits for low power and high-power applications.'),
(37, 'SEH300','Characterize digital components for combinational or sequential operation.'),
(38, 'SEH300','Create simple digital circuits for synchronous or asynchronous applications'),
(39, 'SEH300','Design mixed analog and digital circuit design for interfacing to a computer.');

INSERT INTO PLO_Bridge (PLO_Bridge_ID, PLO_ID, Course_code)
VALUES
(1, 1, 'SEM305'),
(2, 3, 'SEM305'),
(3, 1, 'MEC110'),
(4, 1, 'SES250'),
(5, 2, 'BTD210'),
(6, 3, 'BTD210'),
(7, 1, 'SEH300')

INSERT INTO Method_of_Instruction (Method_of_Instruction_ID, Method_of_Instruction, Course_code) 
VALUES
(1, 'Lecture', 'SEM305'),
(2, 'Laboratory', 'SEM305'),
(3, 'Lecture', 'MEC110'),
(4, 'Lecture', 'SES250'),
(5, 'Laboratory', 'SES250'),
(6, 'Lecture', 'BTD210'),
(7, 'Laboratory', 'BTD210'),
(8, 'Lecture', 'SEH300'),
(9, 'Laboratory', 'SEH300');

INSERT INTO Book (BOOK_ID, ISBN, Textbook_name, Author, Publisher) 
VALUES
(1, '978-1260091991', 'Discrete Mathematics and Its Applications (8th Edition)', 'Kenneth H. Rosen', 'McGraw-Hill Education'),
(2, '978-0070799233', 'Vector Mechanics for Engineers: Statics and Dynamics (5th Edition)', 'Ferdinand P. Beer and E. Russell Johnston Jr.', 'McGraw-Hill'),
(3, '978-1107014022', 'Electricity and Magnetism', 'Edward M. Purcell and David J. Morin', 'Cambridge University Press'),
(4, '978130562748', 'Database Systems: Design, Implementation, & Management (12th Edition)', 'Carlos Coronel and Steven Morris', 'Course Technology'),
(5, NULL, NULL, NULL, NULL);


INSERT INTO Prerequisite (Prerequisite_ID, Prerequisite, Course_code)
VALUES 
(1, 'None', 'SEM305'),
(2, 'None', 'MEC110'),
(3, 'MEC110', 'SES250'),
(4, 'None', 'BTD210'),
(5, 'SES250', 'SEH300'),
(6, 'SEM305', 'SEH300');

INSERT INTO DevelopedBy (DevelopedBy_ID, DeveloperName, Course_code)
VALUES 
(1, 'Jacky Lau', 'MEC110'),
(2, 'Jacky Lau', 'SES250'),
(3, 'Allan Randall', 'SEM305'),
(4, 'Kifah Al-Ansari', 'SEH300'),
(5, 'Vida Movahedi', 'BTD210');



INSERT INTO Book_Bridge (Book_Bridge_ID, BOOK_ID, Course_code)
VALUES
(1, 1, 'SEM305'),
(2, 2, 'MEC110'),
(3, 3, 'SES250'),
(4, 4, 'BTD210'),
(5, 5, 'SEH300');

INSERT INTO Term (Term_Code,Batch, Term) 
VALUES
(1,'NAA_', 2244), 
(2,'NAA_', 2247), 
(3,'NBB_', 2247);

INSERT INTO Graduate_Bridge (Graduate_Bridge_ID, Course_code, Graduate_ID)
VALUES
(1, 'SEM305', 1),
(2, 'MEC110', 1),
(3, 'SES250', 1),
(4, 'BTD210', 1),
(5, 'BTD210', 2),
(6, 'BTD210', 4),
(7, 'BTD210', 5),
(8, 'SEH300', 1),
(9, 'SEH300', 2),
(10, 'SEH300', 5);


INSERT INTO Section_Bridge (Section_Bridge_ID, Course_code, Professor_ID, Term_Code)
VALUES 
(1, 'SES250', 1, 1), -- SES250 - Arif Obaid for NAA_ 2244
(2, 'SES250', 2, 1), -- SES250 - Jacky Lau for NAA_ 2244
(3, 'SEP200', 3, 1), -- SEP200 - Mufleh Al-Shatnawi for NAA_ 2244
(4, 'MEC110', 2, 1), -- MEC110 - Jacky Lau for NAA_ 2244
(5, 'MEC110', 4, 1), -- MEC110 - Ali Sanaee for NAA_ 2244
(6, 'MEC110', 2, 2), -- MEC110 - Jacky Lau for NAA_ 2247
(7, 'MEC110', 1, 2), -- MEC110 - Arif Obaid for NAA_ 2247
(8, 'BTD210', 7, 3), -- BTD210 - Vida Movahedi for NBB_ 2247
(9, 'SEH300', 6, 2), -- SEH300 - Kifah Al-Ansari for NAA_ 2247
(10, 'SEH300', 1, 2), -- SEH300 - Arif Obaid for NAA_ 2247
(11, 'SEM305', 5, 2); -- SEM305 - Allan Randall for NBB_ 2247


SELECT Learning_Outcomes 
FROM CLO 
WHERE Course_code = 'BTD210';

SELECT COUNT(PLO_Bridge.Course_code) AS Course_Count , PLO.PLO
FROM PLO 
LEFT JOIN PLO_Bridge ON PLO.PLO_ID = PLO_Bridge.PLO_ID 
GROUP BY PLO.PLO;

SELECT Book.Publisher 
FROM Book 
JOIN Book_Bridge ON Book.BOOK_ID = Book_Bridge.BOOK_ID;


SELECT 
    c.Course_code AS Code, 
    c.DeveloperName AS Title, 
    p_dev.Professor AS Developer,
    p_teach.Professor AS Instructor
FROM DevelopedBy c
JOIN Professor p_dev ON c.DevelopedBy_ID = p_dev.Professor_ID
JOIN Section_Bridge sb ON c.Course_code = sb.Course_code
JOIN Term t ON sb.Term_Code = t.Term_Code
JOIN Professor p_teach ON sb.Professor_ID = p_teach.Professor_ID
WHERE t.Term_Code = 2247;

SELECT 
    c.Course_code, 
    c.Course_Name, 
    b.Textbook_name
FROM 
    Course c
JOIN 
    Book_Bridge bb ON c.Course_code = bb.Course_code
JOIN 
    Book b ON bb.BOOK_ID = b.BOOK_ID
LEFT JOIN 
    CLO clo ON c.Course_code = clo.Course_code
WHERE 
    (c.Course_description LIKE '%circuit%' OR clo.Learning_Outcomes LIKE '%circuit%');

CREATE VIEW CoursePreReqs AS
SELECT c.Course_code, c.Course_Name, p.Prerequisite_ID,p.Prerequisite
FROM Course c
LEFT JOIN Prerequisite p ON c.Course_code = p.Course_code;

SELECT * 
FROM CoursePreReqs;

SELECT Course_code
FROM Course c
WHERE NOT EXISTS (
    SELECT 1
    FROM Method_of_Instruction m
    WHERE m.Course_code = c.Course_code
    AND m.Method_of_Instruction LIKE '%Laboratory%'
);

SELECT SUM(Contact_Hours_Week) AS Total_Hours 
FROM Course;

SELECT 
    SUM(c.Contact_Hours_Week) AS Total_Hours
FROM 
    Course c
JOIN 
    Section_Bridge sb ON c.Course_code = sb.Course_code
JOIN 
    Term t ON sb.Term_Code = t.Term_Code
WHERE 
    t.Term = 2247;


SELECT 
    ga.Graduate_attributes AS GA, 
    COUNT(DISTINCT gb.Course_code) AS NumberOfCourses
FROM 
    Graduate_attributes ga
JOIN 
    Graduate_Bridge gb ON ga.Graduate_ID = gb.Graduate_ID
GROUP BY 
    ga.Graduate_attributes
HAVING 
    COUNT(DISTINCT gb.Course_code) = (
        SELECT MAX(CourseCount)
        FROM (
            SELECT COUNT(DISTINCT gb.Course_code) AS CourseCount
            FROM Graduate_Bridge gb
            JOIN Graduate_attributes ga ON gb.Graduate_ID = ga.Graduate_ID
            GROUP BY ga.Graduate_attributes
        ) AS Counts
    );

SELECT 
    MIN(CLOCount) AS MinCLOs,
    MAX(CLOCount) AS MaxCLOs,
    AVG(CLOCount) AS AvgCLOs
FROM (
    SELECT 
        Course_code, 
        COUNT(CLO_ID) AS CLOCount
    FROM 
        CLO
    GROUP BY 
        Course_code
) AS CLOCounts;

CREATE VIEW DesignInCLO AS
SELECT 
    Course_code, 
    COUNT(*) AS nDesign
FROM 
    CLO
WHERE 
    Learning_Outcomes LIKE '%design%'
GROUP BY 
    Course_code;

SELECT *
FROM DesignInCLO;

SELECT 
    dic.Course_code, 
    dic.nDesign, 
    CASE 
        WHEN COUNT(ga.Graduate_ID) > 0 THEN 'Yes'
        ELSE 'No'
    END AS CheckedForDesign
FROM 
    DesignInCLO dic
LEFT JOIN 
    Graduate_Bridge gb ON dic.Course_code = gb.Course_code
LEFT JOIN 
    Graduate_attributes ga ON gb.Graduate_ID = ga.Graduate_ID AND ga.Graduate_attributes LIKE '%design%'
WHERE 
    dic.nDesign > 0
GROUP BY 
    dic.Course_code, dic.nDesign;

	

	WITH QUESTIONFIF AS (
    SELECT 
        Course_code, 
        COUNT(*) AS Apply_CLO_Count,
        (SELECT COUNT(*) FROM CLO lo2 WHERE lo2.Course_code = lo.Course_code) AS Total_CLO_Count,
        CONVERT(DECIMAL(5,2), COUNT(*) * 100.0 / 
            (SELECT COUNT(*) FROM CLO lo2 WHERE lo2.Course_code = lo.Course_code)) AS Applied_Percentage
    FROM CLO lo
    WHERE 
        LOWER(CONVERT(VARCHAR(MAX), Learning_Outcomes)) LIKE '%apply%' OR
        LOWER(CONVERT(VARCHAR(MAX), Learning_Outcomes)) LIKE '%use%' OR
        LOWER(CONVERT(VARCHAR(MAX), Learning_Outcomes)) LIKE '%implement%' OR
        LOWER(CONVERT(VARCHAR(MAX), Learning_Outcomes)) LIKE '%demonstrate%' OR
        LOWER(CONVERT(VARCHAR(MAX), Learning_Outcomes)) LIKE '%interpret%' OR
        LOWER(CONVERT(VARCHAR(MAX), Learning_Outcomes)) LIKE '%execute%' OR
        LOWER(CONVERT(VARCHAR(MAX), Learning_Outcomes)) LIKE '%solve%' OR
        LOWER(CONVERT(VARCHAR(MAX), Learning_Outcomes)) LIKE '%calculate%'
    GROUP BY Course_code
)
SELECT 
    Course_code, 
    Apply_CLO_Count,
    Total_CLO_Count,
    Applied_Percentage
FROM QUESTIONFIF
ORDER BY Applied_Percentage DESC;