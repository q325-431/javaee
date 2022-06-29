/**#解决弱密码问题
SHOW VARIABLES LIKE 'validate_password%';
SET GLOBAL validate_password_policy=LOW;
SET GLOBAL validate_password_length=6;
*/
/**#创建一个新用户，该用户只拥有salesystem数据库的权限
CREATE USER sale@`%` IDENTIFIED BY 'sale_admin';
GRANT ALL PRIVILEGES ON salesystem.* TO sale@`%`;
select user,host from mysql.user;
select * from mysql.db;
*/
DROP DATABASE IF EXISTS SALESYSTEM;
CREATE DATABASE SALESYSTEM;
USE SALESYSTEM;
/*
***********************************************
             创建用户信息表
***********************************************
*/
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
	user_id VARCHAR(10) PRIMARY KEY COMMENT '用户ID',
	username VARCHAR(50) COMMENT '用户名',
	`password` VARCHAR(20) NOT NULL COMMENT '用户密码',
	mobile_phone VARCHAR(13) UNIQUE COMMENT '手机号',
	email VARCHAR(50) UNIQUE COMMENT '邮箱',
	head_image MEDIUMBLOB COMMENT '头像',
	realname VARCHAR(30) COMMENT '真实姓名',
	idnumber CHAR(18) COMMENT '身份证号',
	gender VARCHAR(4) COMMENT '性别',
	birthday DATE COMMENT '生日',
	address VARCHAR(200) COMMENT '地址'
);

/*
***********************************************
             创建商品信息表
***********************************************
*/
DROP TABLE IF EXISTS merchandise;
CREATE TABLE merchandise(
	merID VARCHAR(13) PRIMARY KEY COMMENT '商品ID',
	merName VARCHAR(200) NOT NULL COMMENT '商品名称',
	merClass CHAR(8) NOT NULL COMMENT '商品分类',
	merDes TEXT COMMENT '商品描述',
	merPrice DECIMAL(9,2) NOT NULL COMMENT '商品价格',
	merCount INT NOT NULL COMMENT '商品库存'
);
/*
***********************************************
             创建商品图片信息表
***********************************************
*/
DROP TABLE IF EXISTS merImg;
CREATE TABLE merImg(
	merID VARCHAR(13) NOT NULL COMMENT '商品ID',
	merImg MEDIUMBLOB COMMENT '商品图片',
	FOREIGN KEY (merID) REFERENCES merchandise(merID) ON DELETE CASCADE ON UPDATE CASCADE
);
/*
***********************************************
             创建购物车信息表
***********************************************
*/
DROP TABLE IF EXISTS purchaseCart;
CREATE TABLE purchaseCart(
	uID VARCHAR(10) NOT NULL COMMENT '用户ID',
	merID VARCHAR(13) NOT NULL COMMENT '商品ID',
	time_ DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '加入购物车时间',
	FOREIGN KEY (uID) REFERENCES `user`(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (merID) REFERENCES merchandise(merID) ON DELETE CASCADE ON UPDATE CASCADE
);

/*
***********************************************
             创建订单信息表
***********************************************
*/
DROP TABLE IF EXISTS orderStatus;
CREATE TABLE orderStatus(
	uID VARCHAR(10) NOT NULL COMMENT '用户ID',
	merID VARCHAR(13) NOT NULL COMMENT '商品ID',
	status_ ENUM('未付款','待收货','待评价','已完成','我的售卖') COMMENT '订单状态',
	time_ DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建或改变时间',
	FOREIGN KEY (uID) REFERENCES `user`(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (merID) REFERENCES merchandise(merID) ON DELETE CASCADE ON UPDATE CASCADE
);
/*
***********************************************
             创建评价信息表
***********************************************
*/
DROP TABLE IF EXISTS evaluation;
CREATE TABLE evaluation(
	uID VARCHAR(10) NOT NULL COMMENT '用户ID',
	merID VARCHAR(13) NOT NULL COMMENT '商品ID',
	star DECIMAL(1),
	message TEXT COMMENT '评价内容',
	FOREIGN KEY (uID) REFERENCES `user`(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (merID) REFERENCES merchandise(merID) ON DELETE CASCADE ON UPDATE CASCADE
);