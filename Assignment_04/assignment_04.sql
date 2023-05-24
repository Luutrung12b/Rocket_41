	DROP DATABASE IF EXISTS TestingSystem;
	CREATE DATABASE TestingSystem;
	USE TestingSystem;
    
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName NVARCHAR(30) NOT NULL UNIQUE KEY
);

	DROP TABLE IF EXISTS Position;
	CREATE TABLE `Position` (
	PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);
	DROP TABLE IF EXISTS `Account`;
	CREATE TABLE `Account`(
	AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email VARCHAR(50) NOT NULL UNIQUE KEY,
	Username VARCHAR(50) NOT NULL UNIQUE KEY,
	FullName NVARCHAR(50) NOT NULL,
	DepartmentID TINYINT UNSIGNED NOT NULL,
	PositionID TINYINT UNSIGNED NOT NULL,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
	FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);
	DROP TABLE IF EXISTS `Group`;
	CREATE TABLE `Group`(
	GroupID TINYINT UNSIGNED AUTO_INCREMENT
	PRIMARY KEY,

	GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
	CreatorID TINYINT UNSIGNED,
	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
	DROP TABLE IF EXISTS GroupAccount;
	CREATE TABLE GroupAccount(
	GroupID TINYINT UNSIGNED NOT NULL,
	AccountID TINYINT UNSIGNED NOT NULL,
	JoinDate DATETIME DEFAULT NOW(),
	PRIMARY KEY (GroupID,AccountID),
	FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
	FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);
	DROP TABLE IF EXISTS TypeQuestion;
	CREATE TABLE TypeQuestion (
	TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);
	DROP TABLE IF EXISTS CategoryQuestion;
	CREATE TABLE CategoryQuestion(
	CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);
	DROP TABLE IF EXISTS Question;
	CREATE TABLE Question(
	QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content NVARCHAR(100) NOT NULL,
	CategoryID TINYINT UNSIGNED NOT NULL,
	TypeID TINYINT UNSIGNED NOT NULL,
	CreatorID TINYINT UNSIGNED NOT NULL,

	CreateDate DATETIME DEFAULT NOW(),
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
	FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
	DROP TABLE IF EXISTS Answer;
	CREATE TABLE Answer(
	AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content NVARCHAR(100) NOT NULL,
	QuestionID TINYINT UNSIGNED NOT NULL,
	isCorrect BIT DEFAULT 1,
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
	DROP TABLE IF EXISTS Exam;
	CREATE TABLE Exam(
	ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY
	KEY,
	`Code` CHAR(10) NOT NULL,
	Title NVARCHAR(50) NOT NULL,
	CategoryID TINYINT UNSIGNED NOT NULL,
	Duration TINYINT UNSIGNED NOT NULL,
	CreatorID TINYINT UNSIGNED NOT NULL,
	CreateDate DATETIME DEFAULT NOW(),
    
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
	FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
	DROP TABLE IF EXISTS ExamQuestion;
	CREATE TABLE ExamQuestion(
	ExamID TINYINT UNSIGNED NOT NULL,
	QuestionID TINYINT UNSIGNED NOT NULL,
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),

	FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
	PRIMARY KEY (ExamID,QuestionID)
);
	INSERT INTO Department(DepartmentName)
	VALUES

('Marketing' ),
('Sale' ),
('Bảo vệ' ),
('Nhân sự' ),
('Kỹ thuật' ),
('Tài chính' ),
('Phó giám đốc'),
('Giám đốc' ),
('Thư kí' ),
('No person' ),
('Bán hàng' );

INSERT INTO Position (PositionName )
VALUES ('Dev' ),
('Test' ),
('Scrum Master'),
('PM' );

INSERT INTO `Account`(Email , Username, FullName , DepartmentID , PositionID,CreateDate)
VALUES 
('Email13@gmail.com' , 'Username13','Dino' , '10' , '1' , DEFAULT),
('Email1@gmail.com' ,'Username1' ,'Fullname1' , '5' , '1','2020-03-05'),

('Email2@gmail.com' ,'Username2' ,'Fullname2' , '1' , '2','2020-03-05'),

('Email3@gmail.com' , 'Username3' ,'Fullname3', '2' , '2' ,'2020-03-07'),

('Email4@gmail.com' , 'Username4' ,'Fullname4', '3' , '4' ,'2020-03-08'),

('Email5@gmail.com' , 'Username5' ,'Fullname5', '4' , '4' ,'2020-03-10'),

('Email6@gmail.com' , 'Username6' ,'Fullname6', '6' , '3' ,'2020-04-05'),

('Email7@gmail.com' , 'Username7' ,'Fullname7', '2' , '2' , NULL ),
('Email8@gmail.com' , 'Username8' ,'Fullname8', '8' , '1' ,'2020-04-07'),

('Email9@gmail.com' , 'Username9' ,'Fullname9', '2' , '2' ,'2020-04-07'),
('Email10@gmail.com' , 'Username10' ,'Fullname10', '10' , '1' ,'2020-04-09'),

('Email11@gmail.com' , 'Username11' ,'Fullname11', '10' , '1' , DEFAULT),

('Email12@gmail.com' , 'Username12','Fullname12' , '10' , '1' , DEFAULT);

SELECT * FROM `account`;
INSERT INTO `Group` ( GroupName , CreatorID , CreateDate)
VALUES 
('Testing System' , 5,'2019-03-05'),

('Development' , 1,'2020-03-07'),
(N'VTI Sale 01' , 2 ,'2020-03-09'),
(N'VTI Sale 02' , 3 ,'2020-03-10'),
(N'VTI Sale 03' , 4 ,'2020-03-28'),
(N'VTI Creator' , 6 ,'2020-04-06'),
(N'VTI Marketing 01' , 7 ,'2020-04-07'),
(N'Management' , 8 ,'2020-04-08'),
(N'Chat with love' , 9 ,'2020-04-09'),
(N'Vi Ti Ai' , 10 ,'2020-04-10');
INSERT INTO `GroupAccount` ( GroupID , AccountID , JoinDate ) VALUES 
( 1 , 1,'2019-03-05'),

( 1 , 2,'2020-03-07'),

( 3 , 3,'2020-03-09'),

( 3 , 4,'2020-03-10'),

( 5 , 5,'2020-03-28'),

( 1 , 3,'2020-04-06'),

( 1 , 7,'2020-04-07'),

( 8 , 3,'2020-04-08'),

( 1 , 9,'2020-04-09'),

( 10 , 10,'2020-04-10');

INSERT INTO TypeQuestion (TypeName )
VALUES 
('Essay' ),('Multiple-Choice' );

INSERT INTO CategoryQuestion (CategoryName )
VALUES 
('Java' ),
('ASP.NET' ),
('ADO.NET' ),
('SQL' ),
('Postman' ),
('Ruby' ),
('Python' ),
('C++' ),
('C Sharp' ),
('PHP' );

INSERT INTO Question (Content , CategoryID, TypeID , CreatorID, CreateDate )VALUES 
('Câu hỏi về Java' , 1 ,'1' , '2' ,'2020-04-05'),

('Câu Hỏi về PHP' , 10 ,'2' , '2' ,'2020-04-05'),

('Hỏi về C#' , 9 ,'2' , '3' ,'2020-04-06'),

('Hỏi về Ruby' , 6 ,'1' , '4' ,'2020-04-06'),

('Hỏi về Postman' , 5 ,'1' , '5' ,'2020-04-06'),

('Hỏi về ADO.NET' , 3 ,'2' , '6' ,'2020-04-06'),

('Hỏi về ASP.NET' , 2 ,'1' , '7' ,'2020-04-06'),

('Hỏi về C++' , 8 ,'1' , '8' ,'2020-04-07'),

('Hỏi về SQL' , 4 ,'2' , '9' ,'2020-04-07'),

('Hỏi về Python' , 7 ,'1' , '10' ,'2020-04-07');
INSERT INTO Answer ( Content , QuestionID , isCorrect )
VALUES 
('Trả lời 01' , 1 , 0),

('Trả lời 02' , 1 , 1),
('Trả lời 03', 1 , 0 ),
('Trả lời 04', 1 , 1 ),
('Trả lời 05', 2 , 1 ),
('Trả lời 06', 3 , 1 ),
('Trả lời 07', 4 , 0 ),
('Trả lời 08', 8 , 0 ),
('Trả lời 09', 9 , 1 ),
('Trả lời 10', 10 , 1 );

INSERT INTO Exam (`Code` , Title , CategoryID, Duration , CreatorID , CreateDate )
VALUES 
('VTIQ001' , 'Đề thi C#' ,1 , 60 , '5' ,'2019-04-05'),
('VTIQ002' , 'Đề thi PHP' ,10 , 60 , '2' ,'2019-04-05'),
('VTIQ003' , 'Đề thi C++' , 9 ,120 , '2' ,'2019-04-07'),
('VTIQ004' , 'Đề thi Java' , 6 , 60, '3' ,'2020-04-08'),

('VTIQ005' , 'Đề thi Ruby' , 5 , 120, '4' ,'2020-04-10'),

('VTIQ006' , 'Đề thi Postman' , 3 ,60 , '6' ,'2020-04-05'),
('VTIQ007' , 'Đề thi SQL' , 2 ,60 , '7' ,'2020-04-05'),
('VTIQ008' , 'Đề thi Python' , 8 ,60 , '8' ,'2020-04-07'),
('VTIQ009' , 'Đề thi ADO.NET' , 4 ,90 , '9' ,'2020-04-07'),
('VTIQ010' , 'Đề thi ASP.NET' , 7 ,90 , '10' ,'2020-04-08');

INSERT INTO ExamQuestion(ExamID , QuestionID ) VALUES 
( 1 , 5 ),
( 2 , 10 ),
( 3 , 4 ),
( 4 , 3 ),
( 5 , 7 ),
( 6 , 10 ),
( 7 , 2 ),
( 8 , 10 ),
( 9 , 9 ),
( 10 , 8 );

SELECT * FROM `Account`;

-- 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT a.accountID, a.fullName, a.email, d.departmentName
FROM Account a
JOIN Department d ON a.departmentID = d.departmentID;

-- 2 : Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT * FROM `Account`
WHERE CreateDate > '2010-12-20';

-- 3 :Viết lệnh để lấy ra tất cả các Dev
SELECT a.*
FROM Account a
JOIN Position p ON a.PositionID = p.PositionID
WHERE p.PositionName = 'Dev';
-- 4 
SELECT d.DepartmentID, d.DepartmentName, COUNT(a.AccountID) AS EmployeeCount
FROM Department d
JOIN Account a ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
HAVING COUNT(a.AccountID) > 3;

-- 5 Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất


-- 6 Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT cq.CategoryID, cq.CategoryName, count(q.CategoryID) FROM categoryquestion cq
JOIN question q ON cq.CategoryID = q.CategoryID
GROUP BY q.CategoryID;

-- 7 Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT q.QuestionID, COUNT(e.ExamID) AS ExamCount
FROM Question q
JOIN ExamQuestion eq ON q.QuestionID = eq.QuestionID
JOIN Exam e ON eq.ExamID = e.ExamID
GROUP BY q.QuestionID;

-- 8 Lấy ra Question có nhiều câu trả lời nhất
SELECT q.QuestionID, COUNT(a.AnswerID) AS AnswerCount
FROM Question q
JOIN Answer a ON q.QuestionID = a.QuestionID
GROUP BY q.QuestionID
HAVING COUNT(a.AnswerID) = (
    SELECT MAX(AnswerCount)
    FROM (
        SELECT COUNT(AnswerID) AS AnswerCount
        FROM Answer
        GROUP BY QuestionID
    ) AS Counts
);

-- 9 : Thống kê số lượng account trong mỗi group
SELECT g.GroupID, COUNT(a.AccountID) AS AccountCount
FROM groupaccount g
JOIN `groupaccount` a ON g.GroupID = a.GroupID
GROUP BY g.GroupID;

-- 10 : Tìm chức vụ có ít người nhất
SELECT p.PositionName, COUNT(a.AccountID) AS EmployeeCount
FROM Position p
JOIN Account a ON p.PositionID = a.PositionID
GROUP BY p.PositionName
ORDER BY EmployeeCount ASC
LIMIT 1;

-- 11 Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT d.DepartmentID,d.DepartmentName, p.PositionName, COUNT(*) FROM `account` a
 JOIN department d ON a.DepartmentID = d.DepartmentID
 JOIN position p ON a.PositionID = p.PositionID
GROUP BY d.DepartmentID, p.PositionID;

-- 12 Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...

-- 13 Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT t.TypeName, COUNT(q.QuestionID) AS QuestionCount
FROM Question q
JOIN TypeQuestion t ON q.typeID = t.TypeID
GROUP BY t.TypeName;

-- 14 Lấy ra group không có account nào
SELECT * FROM `Group` g
LEFT JOIN groupaccount a ON g.GroupID = a.GroupID
WHERE a.GroupID IS NULL;


-- 15 Lấy ra group không có account nào
-- giống câu 14

-- 16 Lấy ra question không có answer nào
SELECT q.QuestionID 
FROM Question q
LEFT JOIN Answer a ON q.QuestionID = a.QuestionID
WHERE a.QuestionID IS NULL;

-- 17 Lấy các account thuộc nhóm thứ 1
SELECT A.AccountID, A.Username
FROM `Account` A
JOIN groupaccount g ON A.AccountID = g.AccountID
WHERE g.GroupID = 1;

-- 17b Lấy các account thuộc nhóm thứ 2
SELECT A.AccountID, A.Username
FROM `Account` A
JOIN groupaccount g ON A.AccountID = g.AccountID
WHERE g.GroupID = 3;

-- 17c Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT A.AccountID, A.Username
FROM `Account` A
JOIN groupaccount g ON A.AccountID = g.AccountID
WHERE g.GroupID = 1

UNION

SELECT A.AccountID, A.Username
FROM `Account` A
JOIN groupaccount g ON A.AccountID = g.AccountID
WHERE g.GroupID = 3;

-- 18 Lấy các group có lớn hơn 5 thành viên

SELECT g.GroupName, COUNT(ga.GroupID) AS count_account
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) >= 5;

-- 18 b Lấy các group có nhỏ hơn 7 thành viên

SELECT g.GroupName, COUNT(ga.GroupID) AS count_account
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) < 7;
-- 18 c Ghép 2 kết quả từ câu a) và câu b)
SELECT g.GroupName, COUNT(ga.GroupID) AS count_account
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) >= 5

UNION 

SELECT g.GroupName, COUNT(ga.GroupID) AS count_account
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) < 7;














