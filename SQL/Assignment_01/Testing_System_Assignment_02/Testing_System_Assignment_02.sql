DROP DATABASE Testing_system_assignment_02;
CREATE DATABASE Testing_system_assignment_02;
USE Testing_system_assignment_02;

DROP TABLE IF EXISTS department;
CREATE TABLE department (
	department_ID 	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
    department_name NVARCHAR(30) UNIQUE NOT NULL
);
INSERT INTO department(department_name) 
VALUE  
('Phòng giải trí'),
('Phòng hành chính'),
('Phòng kỹ thuật'),
('Phòng nhân sự'),
('Phòng kế toán');
 SELECT * FROM department;


DROP TABLE IF EXISTS positionn;
CREATE TABLE positionn (
	position_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    position_name ENUM('dev' , 'test', 'scrum master', 'PM') UNIQUE NOT NULL  
    
);

INSERT INTO positionn (position_name) 
VALUE
('Test'),
('Dev'),
('scrum master');
SELECT * FROM positionn;

DROP TABLE IF EXISTS accountt;
CREATE TABLE accountt (
		account_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		email VARCHAR(50) UNIQUE NOT NULL,
        user_name VARCHAR(50) UNIQUE NOT NULL,
        full_name NVARCHAR(50) NOT NULL,
        department_ID TINYINT UNSIGNED NOT NULL ,
        position_ID TINYINT UNSIGNED NOT NULL,
        create_date DATETIME NOT NULL DEFAULT NOW(),
		FOREIGN KEY  (department_ID) REFERENCES department(department_ID),
		FOREIGN KEY  (position_ID) REFERENCES positionn(position_ID)
);
INSERT INTO `assignment_01`.`accountt` ( `email`, `user_name`, `full_name`, `department_id`, `position_id`, `create_date`) VALUES
( 'adagfgfddf', 'sadfdsdf', 'fdw fdfd', '1', '2', '2023/12/1'),
( 'adaddcccdf', 'sadfxsxdf', 'fdss fdfd', '1', '2', '2023/2/1'),
( 'adaadfdddf', 'sacccdfdf', 'fefd fdfd', '1', '2', '2023/2/2'),
( 'adagfgddf', 'sadfddddf', 'fffd fdfd', '1', '2', '2023/2/2'),
( 'adahthtddf', 'sadgggfdf', 'fffd fdfd', '1', '2', '2023/2/2');
SELECT * FROM accountt;

DROP TABLE IF EXISTS groupp;
CREATE TABLE groupp (
	group_ID TINYINT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(50) UNIQUE NOT NULL,
    creator_ID INT UNSIGNED NOT NULL,
    create_date DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (creator_ID) REFERENCES accountt(account_ID)

);
 -- INSERT INTO groupp(group_name, creator_ID) VALUE
-- ('S', '6'),
-- ('Pre-S','7'),
-- ('TC','8'),
-- ('ETC','9');
-- SELECT * FROM groupp;

DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account (
	group_ID TINYINT NOT NULL ,
    account_ID TINYINT NOT NULL ,
    join_date DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY (group_ID, account_ID),
    FOREIGN KEY (group_ID) REFERENCES groupp(group_ID),
    FOREIGN KEY (account_ID) REFERENCES accountt(account_ID)
);


DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question (
	type_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    type_name ENUM('essay' , ' multi-choice' ) UNIQUE NOT NULL
    
);
INSERT INTO type_question(type_name) VALUE
('Essay'),
('Multi-choice');

SELECT * FROM type_question;


DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question (
	category_ID TINYINT PRIMARY KEY AUTO_INCREMENT,
    category_name ENUM('JAVA' , '.NET' , 'SQL' , 'POSTMAN' , 'RUBY') NOT NULL
);
INSERT INTO category_question(category_name) VALUE
('JAVA'),
('.NET'),
('SQL'),
('Postman'),
('Ruby');
SELECT * FROM category_question;

DROP TABLE IF EXISTS question;
CREATE TABLE question (
	question_ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50) NOT NULL,
    category_ID TINYINT NOT NULL,
    type_ID TINYINT UNSIGNED NOT NULL,
    creator_ID TINYINT UNSIGNED NOT NULL,
    create_date DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (category_ID) REFERENCES category_question(category_ID),
    FOREIGN KEY (type_ID) REFERENCES type_question(type_ID),
    FOREIGN KEY (creator_ID) REFERENCES accountt(account_ID)
);

DROP TABLE IF EXISTS answer;
CREATE TABLE answer (
	answer_ID TINYINT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50) NOT NULL,
    question_ID TINYINT NOT NULL,
    isCorrect BIT,
    FOREIGN KEY (question_ID) REFERENCES question(question_ID)
    
);
-- INSERT INTO answer ( content, question_ID, isCorrect) VALUE
-- (' fdfdffdfd' , '1' , b'1'),
-- (' fdfđdffdfd' , '2' , b'1');


DROP TABLE IF EXISTS exam;
CREATE TABLE exam (
	exam_ID TINYINT PRIMARY KEY AUTO_INCREMENT,
    codee VARCHAR(50) NOT NULL,
    title NVARCHAR(50) NOT NULL,
    category_ID TINYINT NOT NULL,
    duration TINYINT NOT NULL,
    creator_ID INT UNSIGNED NOT NULL,
    create_date DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (creator_ID) REFERENCES accountt(account_ID),
    FOREIGN KEY (category_ID) REFERENCES category_question(category_ID)
    
);
DROP TABLE IF EXISTS exam_question;
CREATE TABLE  exam_question(
	exam_ID TINYINT NOT NULL,
    question_ID TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (exam_ID) REFERENCES exam(exam_ID),
    FOREIGN KEY (question_ID) REFERENCES question(question_ID),
    PRIMARY KEY (exam_ID , question_ID)
		
);

