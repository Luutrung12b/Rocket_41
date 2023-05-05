DROP DATABASE Testing_system_assignment_01;
CREATE DATABASE Testing_system_assignment_01;
USE Testing_system_assignment_01;

CREATE TABLE department (
department_ID 	INT PRIMARY KEY AUTO_INCREMENT ,
    department_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE positionn (
	position_ID INT PRIMARY KEY AUTO_INCREMENT,
    position_name ENUM('dev' , 'test', 'scrum master', 'PM') UNIQUE NOT NULL  
    
);
CREATE TABLE accountt (
		account_ID INT PRIMARY KEY AUTO_INCREMENT,
		email VARCHAR(50) UNIQUE NOT NULL,
        user_name VARCHAR(50) UNIQUE NOT NULL,
        full_name VARCHAR(50) NOT NULL,
        department_ID INT NOT NULL ,
        position_ID INT NOT NULL,
        create_date DATETIME NOT NULL DEFAULT NOW(),
      FOREIGN KEY  (department_ID) REFERENCES department(department_ID),
	FOREIGN KEY  (position_ID) REFERENCES positionn(position_ID)
);

CREATE TABLE groupp (
	group_ID INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(50)  NOT NULL,
    creator_ID INT NOT NULL,
    create_date DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (creator_ID) REFERENCES accountt(account_ID)

);
CREATE TABLE group_account (
	group_ID INT NOT NULL ,
    account_ID INT NOT NULL ,
    join_date DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY (group_ID, account_ID),
    FOREIGN KEY (group_ID) REFERENCES groupp(group_ID),
    FOREIGN KEY (account_ID) REFERENCES accountt(account_ID)
    
);

CREATE TABLE type_question (
	type_ID INT PRIMARY KEY AUTO_INCREMENT,
    type_name ENUM('Essay' , ' multi-choice' ) UNIQUE NOT NULL
    
);

CREATE TABLE category_question (
	category_ID INT PRIMARY KEY AUTO_INCREMENT,
    category_name ENUM('JAVA' , '.NET' , 'SQL' , 'POSTMAN' , 'RUBY') NOT NULL
);

CREATE TABLE question (
	question_ID INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50) NOT NULL,
    category_ID INT NOT NULL,
    type_ID INT NOT NULL,
    creator_ID INT NOT NULL,
    create_date DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (category_ID) REFERENCES category_question(category_ID),
    FOREIGN KEY (type_ID) REFERENCES type_question(type_ID),
    FOREIGN KEY (creator_ID) REFERENCES accountt(account_ID)
);
CREATE TABLE answer (
	answer_ID INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50) NOT NULL,
    question_ID INT NOT NULL,
    isCorrect ENUM('true' , 'false'),
    FOREIGN KEY (question_ID) REFERENCES question(question_ID)
    
);

CREATE TABLE exam (
	exam_ID INT PRIMARY KEY AUTO_INCREMENT,
    codee INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    category_ID INT NOT NULL,
    duration INT NOT NULL,
    creator_ID INT NOT NULL,
    create_date DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (creator_ID) REFERENCES accountt(account_ID),
    FOREIGN KEY (category_ID) REFERENCES category_question(category_ID)
    
);


