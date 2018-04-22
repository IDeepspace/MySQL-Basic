# 0.本地连接数据库
# mysql -hlocalhost -uroot -p --local-infile

# 1.创建数据库employee_db
create database employee_db;

# 1.1 列出数据库
# SHOW DATABASES;

# 1.2 切换数据库
# use employee_db;

# 2.在数据库employee_db中创建table：`Employee`

CREATE TABLE IF NOT EXISTS `Employee`(
   `id` INT ,
   `name` VARCHAR(40) NOT NULL,
   `age` INT,
   `gender` VARCHAR(20),
   `companyId` INT,
   `salary` INT,
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 3.将`employee-data.csv`文件中的数据导入数据表Employee中
LOAD DATA LOCAL INFILE '/Users/xinchen/Documents/WorkSpace/Java-Training/Mysql-Basic/employee-data.csv'
INTO TABLE Employee
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# 4.在数据库employee_db中创建table：`Company`
CREATE TABLE IF NOT EXISTS `Company`(
   `id` INT,
   `companyName` VARCHAR(40) NOT NULL,
   `employeeNumber` INT,
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 5.将`company-data.csv`文件中的数据导入Company数据表中
LOAD DATA LOCAL INFILE '/Users/xinchen/Documents/WorkSpace/Java-Training/Mysql-Basic/company-data.csv'
INTO TABLE Company
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# 6.找出Employee表中姓名包含`n`字符并且薪资大于6000的雇员所有个人信息
SELECT * FROM Employee WHERE name like "%n%" AND `salary` > 6000;

# ps:本练习中只需要将6的结果复制到`result.txt`文件中