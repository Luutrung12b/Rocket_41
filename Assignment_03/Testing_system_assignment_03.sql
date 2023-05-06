-- Tạo database lesson03_user_management
-- kiểm nếu đã tồn tại database lesson03_user_management thì xóa đi
DROP DATABASE IF EXISTS lesson03_user_management;

-- tạo database lesson03_user_management
CREATE DATABASE lesson03_user_management;

-- dùng database lesson03_user_management
USE lesson03_user_management ;
 
 
 -- kiểm nếu đã tồn tại table team thì xóa đi
DROP TABLE IF EXISTS team;
-- tạo table team
CREATE TABLE team (
	 id TINYINT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- 1 2
	`name` VARCHAR(30)
);
-- thêm data cho bảng team

INSERT INTO team(`name`)
VALUES
('Nhóm 1'),
('Nhóm 2'),
('Nhóm 3');

-- xem team

SELECT * FROM team;


-- kiểm nếu đã tồn tại table  `user` thì xóa đi
DROP TABLE IF EXISTS `user`;
-- tạo table `user`
CREATE TABLE `user`(
	id SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- 1 2
    team_id TINYINT NOT NULL,  -- thuộc nhóm nào
    first_name VARCHAR(30) CHAR SET utf8mb4 NOT NULL,-- họ
    last_name VARCHAR(30) CHAR SET utf8mb4 NOT NULL,-- tên
	user_name VARCHAR(20) NOT NULL UNIQUE KEY,-- tên đăng nhập
    email VARCHAR(50) NOT NULL UNIQUE KEY, -- địa chỉ email
    `password` VARCHAR(100),-- mật khẩu
    phone VARCHAR(11) NOT NULL UNIQUE KEY,-- số điện thoại
    gender ENUM('MALE','FEMALE','UNKNOWN') NOT NULL,-- giới tính : MALE: Nam ; FEMALE: Nữ ; UNKNOWN: chưa xác định
	date_of_birth DATE NOT NULL, -- ngày sinh
    address VARCHAR(100) CHAR SET utf8mb4,-- địa chỉ
    salary TINYINT, -- lương tính bằng man của Nhật
    FOREIGN KEY(team_id) REFERENCES team(id) -- khai báo khóa ngoại
);

-- thêm data cho bảng `user
INSERT INTO  `user` (`team_id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `phone`, `gender`, `date_of_birth`, `address`, `salary`) 
VALUES 
('1', 'Nguyễn Văn', 'Kha', 'vana', 'vana@gmail.com', MD5('123'), '09123123', 'MALE', '1997-01-01', 'Hà Nội', '20'),
('2', 'Nguyễn Văn', 'B', 'vanb', 'vanb@gmail.com', MD5('123'), '09123124', 'FEMALE', '1998-01-01', 'Hà Nội', '10'),
('3', 'Nguyễn Văn', 'C', 'vanc', 'vanc@gmail.com', MD5('123'), '09123125', 'FEMALE', '1998-01-01', 'HCM', '15'),
('1', 'Nguyễn Văn', 'D', 'vand', 'vand@gmail.com', MD5('123'), '09123126', 'FEMALE', '1999-01-01', null, '30'),
('2', 'Trịnh Văn', 'E', 'vane', 'vane@gmail.com', MD5('123'), '09123127', 'MALE', '1996-01-01', 'HCM', '5'),
('2', 'Trần Văn', 'F', 'vanf', 'vanf@gmail.com', MD5('123'), '09123128', 'MALE', '1996-01-01', 'QUẢNG BÌNH', '5'),
('2', 'vladimir', 'putin', 'vang', 'vang@gmail.com', MD5('123'), '09123129', 'MALE', '1996-01-01', 'NGHỆ AN', '5');


-- xem data bảng user 
SELECT * FROM `user`;

-- **************************** ***** THỰC HÀNH ********************************

-- 1. Câu lệnh SELECT căn bản
-- 1.1. chọn tất cả các cột trong cột
-- hiển thị thông tin người dùng
	SELECT * FROM `user`;
	
	
	
-- 1.2. chọn cột first_name, last_name trong bảng
-- hiển thị họ và tên của người dùng
	SELECT first_name, last_name FROM `user`;

-- 2. WHERE - Operator: điều kiện và toán tử 
-- 2.1. AND/OR
-- AND: và
-- hiển thị thông tin nhân viên Nữ và có địa chỉ ở Hà Nội
	SELECT * FROM `user`
    WHERE gender = 'FEMALE' AND address = 'Hà Nội';
-- OR: hoặc
-- -- hiển thị thông tin nhân viên Nữ hoặc có địa chỉ ở Hà Nội
	SELECT * FROM `user`
    WHERE gender = 'FEMALE' OR address = 'Hà Nội';

-- 2.2. BETWEEN...AND...
-- hiển thi thông tin nhân viên có lương thuộc nằm trong khoảng 5 đến 20 man
	SELECT * FROM `user`
    WHERE salary BETWEEN '5' AND '20';

-- 2.3. IN/ NOT IN
-- IN
-- hiển thị thông tin nhân viên có địa chỉ thuộc Hà Nội, HCM
	SELECT * FROM `user`
    WHERE address IN (' Hà Nội ',' HCM' );

-- NOT IN
-- hiển thị thông tin nhân viên không có địa chỉ thuộc Hà Nội, HCM
	SELECT * FROM `user`
    WHERE address NOT IN (' Hà Nội ',' HCM' );

-- 2.4. LIKE / NOT LIKE (Ký tự đại diện: % _)
-- LIKE với %
-- hiện thị thông tin nhân viên có họ bắt đầu bằng chữ n
	SELECT * FROM `user`
    WHERE first_name LIKE ('n%');
		
-- hiện thị thông tin nhân viên có tên kết thúc bằng chữ A
	SELECT * FROM `user`
    WHERE last_name LIKE ('%a');
        
-- hiển thị thông tin nhân viên có địa chỉ chứa chữ 'n'
	SELECT * FROM `user`
    WHERE address LIKE ('%n%');
		
 
-- NOT LIKE với %
-- hiện thị thông tin nhân viên có họ không bắt đầu bằng chữ n
	SELECT * FROM `user`
    WHERE last_name NOT LIKE ('n%');
-- hiện thị thông tin nhân viên có tên không kết thúc bằng chữ A
	SELECT * FROM `user`
    WHERE first_name NOT LIKE ('%A');
-- hiển thị thông tin nhân viên có địa chỉ không chứa chữ 'n'
	SELECT * FROM `user`
    WHERE address NOT LIKE ('%n%');


-- LIKE kết hợp % và _
-- dấu _ dùng để đại diện cho một ký tự bất kỳ
-- tìm thông tin nhân viên có họ với định dạng tr_n
	SELECT * FROM `user`
    WHERE first_name LIKE 'Tr_%n';
-- tìm thông tin nhân viên có tên người dùng bắt đầu với định dạng v_n
	 SELECT * FROM `user`
    WHERE last_name LIKE 'v_%n';
        
  
-- 2.5. IS NULL / IS NOT NULL
-- Hiển thị thông tin của nhân viên không có địa chỉ(địa chỉ = null)
	SELECT * FROM `user`
    WHERE address IS NULL ;
	
-- Hiển thị thông tin của nhân viên đã có địa chỉ
	SELECT * FROM `user`
    WHERE address IS NOT NULL ;
  
-- 2.6. Các toán tử so sánh  = , >, <, >=, <=, !=, <>
-- hiển thị thông tin của nhân viên có địa chỉ ở Quảng Bình
	SELECT * FROM `user`
    WHERE address = 'Quảng Bình' ;
	
-- hiển thị thông tin nhân viên có lương lớn hơn 5 man
	SELECT * FROM `user`
    WHERE salary > '5';
	
-- hiển thị thông tin nhân viên có lương nhỏ hơn 20 man
	SELECT * FROM `user`
    WHERE salary < '20';
-- hiển thị thông tin nhân viên có lương từ 5 man trở lên
	SELECT * FROM `user`
    WHERE salary >= '5';
-- hiển thị thông tin nhân viên có lương từ 20 man trở xuống
 	SELECT * FROM `user`
    WHERE salary <= '5';
-- hiển thị thông tin nhân viên có lương khác 5 man
	SELECT * FROM `user`
    WHERE salary != '5'; 
        
-- hiển thị thông tin nhân viên có địa chỉ khác Hà Nội
	 SELECT * FROM `user`
     WHERE address != 'Hà Nội';
	 

        
-- 2.7. DISTINCT và ORDER BY
-- DISTINCT
-- dùng để loại bỏ giá trị trùng lặp trong cột
-- hiển thị các địa chỉ của nhân viên
   
   SELECT DISTINCT address FROM `user`;

-- ORDER BY
-- dùng để sắp xếp tăng dần hoặc giảm dần danh sách bản ghi/dòng theo giá trị của một hoặc nhiều cột 
-- Sắp xếp danh sách nhân viên tăng dần theo id(mã nhân viên)
	SELECT * FROM `user`
    ORDER BY id ;
    
-- Sắp xếp danh sách nhân viên giảm dần theo id(mã nhân viên)
	SELECT * FROM `user`
    ORDER BY id DESC ;

-- 2.8. Aggregate functions(Hàm tập hợp)
-- COUNT(*), COUNT(field_name), COUNT(DISTINCT field_name), COUNT(1)

-- đếm số nhân viên 


-- COUNT(*): đếm theo tất cả các cột và cho kết quả chậm nhất
	
    SELECT COUNT(*) AS nhan_vien FROM `user`;

-- COUNT(field_name): đếm theo cột và không đếm giá trị  NULL
	
    SELECT COUNT(id) AS nhan_vien FROM `user`;

-- COUNT(DISTINCT field_name):  đếm theo cột và không đếm giá trị trùng lặp hoặc giá trị NULL
	
    SELECT COUNT(DISTINCT gender) AS nhan_vien FROM `user`;
-- COUNT(1): đếm theo cột cố định và cho kết quả nhanh nhất
	SELECT COUNT(1) AS nhan_vien FROM `user`;

-- SUM()
-- dùng để tính tổng
-- tính tổng lương của các nhân viên
  SELECT SUM(salary) FROM `user`;
  
-- tìm lương nhỏ nhất của nhân viên
	SELECT MIN(salary) FROM `user`;

-- tìm lương lớn nhất của nhân viên
 SELECT MAX(salary) FROM `user`;

-- tìm lương lớn trung bình của nhân viên
 
 SELECT AVG(salary) FROM `user`;
-- 2.9. GROUP BY/ HAVING
-- GROUP BY
-- Để nhóm các giá trị giống nhau thành một nhóm sau đó thực hiện tính toán sử dụng các hàm tập hợp(count, sum, min, max, avg)
-- Đếm hoặc thông kê số nhân viên theo giới tính Nam, Nữ, chưa xác định ( select với group by sẽ chọn cùng cột )
	SELECT gender, COUNT(*)  FROM `user`
	GROUP BY gender;

  
  -- Đếm hoặc thông kê số nhân viên theo địa chỉ
	SELECT address, COUNT(*) FROM `user`
	WHERE address IS NOT NULL
	GROUP BY address;

  
-- tìm giới tính có số nhân viên nhiều hơn 3
   SELECT gender, COUNT(*) AS gioi_tinh FROM `user`
   GROUP BY gender
   HAVING COUNT(*) > 3;
-- Đếm hoặc thông kê số nhân viên theo mã nhóm(team_id)
	SELECT team_id, COUNT(*) AS so_luong FROM `user`
    GROUP BY team_id;
	
-- 2.10. LIMIT
	-- là từ khóa dùng để giới hạn số bản ghi mà kết quả trả về
   -- lấy ra thông tin 3 nhân viên
   SELECT * FROM `user`
   LIMIT 3;
	
    
    -- lấy ra thông tin 3 nhân viên giảm dần theo id
	SELECT * FROM `user`
	ORDER BY id DESC
	LIMIT 3;

   
-- 2.11. Alias: bí danh
-- hay còn có là bí danh, được dùng để thay thế cho tên bảng, tên cột
-- Hiển thị tên người dùng và địa chỉ của nhân viên ở Quảng Bình
	SELECT address AS ten_dia_chi
    FROM `user`;
    
	
-- 2.12. MODIFY DATA STATEMENT( Câu lệnh điều chỉnh dữ liệu)
-- câu lệnh thêm mới dữ liệu vào bảng: 
-- Thêm một bản ghi vào bảng 
  INSERT INTO  `user` (`team_id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `phone`, `gender`, `date_of_birth`, `address`, `salary`) VALUES 
('1', 'Vladimir', 'Putin', 'putin', 'VPutin@gmail.com', MD5('123'), '09125123', 'MALE', '1945-08-05', 'Hà Nội', '20');

-- Thêm  nhiều bản ghi vào bảng 
	 INSERT INTO  `user` (`team_id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `phone`, `gender`, `date_of_birth`, `address`, `salary`) VALUES
    ('2', 'Dmitri', 'Medvedev', 'medvedev', 'VlPutin@gmail.com', MD5('123'), '0922123', 'MALE', '1945-08-05', 'Hà Nội', '20'),
    ('3', 'Vladimir', 'Mig-17', 'Mig-17', 'VlaPutin@gmail.com', MD5('123'), '091151213', 'MALE', '1945-08-05', 'Hà Nội', '20'),
    ('3', 'Vladimir', 'Mig-19', 'Mig-19', 'VladPutin@gmail.com', MD5('123'), '091255123', 'MALE', '1945-08-05', 'Hà Nội', '20'),
    ('1', 'Vladimir', 'Mig-21', 'Mig-21', 'VladimPutin@gmail.com', MD5('123'), '091281123', 'MALE', '1945-08-05', 'Hà Nội', '20');
SELECT * FROM `user`;
-- Câu lệnh cập nhật dữ liệu của bảng
-- Thay đổi địa chỉ của nhân viên có id(mã nhân viên) = 1 thành Quảng Ninh
	UPDATE `user`
	SET address = 'Quảng Ninh'
	WHERE id = 1;
    
    SELECT * FROM `user`;


-- Câu lệnh xóa dữ liệu của bảng
	DELETE
	FROM  `user`
    WHERE address IS NOT NULL;

	
