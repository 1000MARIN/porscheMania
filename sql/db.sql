create user 'cacao'@'%' identified by '1234';
GRANT ALL PRIVILEGES ON *.* TO 'cacao'@'%';
create database cacaodb;

use cacaodb;


CREATE TABLE `cacaodb`.`attach` (
`uuid` VARCHAR(36) NOT NULL,
`uploadpath` VARCHAR(10) NULL,
`filename` VARCHAR(255) NULL,
`filetype` VARCHAR(1) NULL,
`bno` INT NULL,
PRIMARY KEY (`uuid`));

CREATE TABLE `cacaodb`.`board` (
`num` INT NOT NULL,
`mid` VARCHAR(20) NULL,
`subject` VARCHAR(50) NULL,
`content` TEXT NULL,
`readcount` INT NULL,
`reg_date` DATETIME NULL,
`ipaddr` VARCHAR(20) NULL,
`re_ref` INT NULL COMMENT '글그룹 번호',
`re_lev` INT NULL COMMENT '화면에 표시할 들여쓰기 레벨',
`re_seq` INT NULL COMMENT '같은 글그룹 안에서의 순번',
PRIMARY KEY (`num`));

CREATE TABLE `cacaodb`.`member` (
`id` VARCHAR(20) NOT NULL,
`passwd` VARCHAR(60) NOT NULL,
`name` VARCHAR(20) NULL,
`birthday` VARCHAR(8) NULL,
`postcode` VARCHAR(10) NULL,
`address` VARCHAR(255) NULL,
`detail_address` VARCHAR(255) NULL,
`extra_address` VARCHAR(255) NULL,
`email` VARCHAR(45) NULL,
`recv_email` VARCHAR(1) NULL,
`reg_date` DATETIME NULL,
PRIMARY KEY (`id`));

INSERT INTO member(id, passwd, birthday, postcode, address, detail_address, extra_address, email, recv_email, reg_date) 
values ('admin', '1234', '19880119', '48043', '서울 서초구', '서초대로', '(서초동)', 'admin@admin.com', 'Y', 202132323);

INSERT INTO board(num, mid, subject, content, readcount, reg_date, ipaddr, re_ref, re_lev, re_seq) 
values (1, 'admin', '테스트 제목', '내용 테스트입니다.', 5, 202132323, '192.10.10.112', 1, 2, 3);

INSERT INTO board(num, mid, subject, content, readcount, reg_date, ipaddr, re_ref, re_lev, re_seq) 
values (2, 'admin', '테스트 제목', '내용 테스트입니다.', 5, 202132323, '192.10.10.112', 0, 2, 3);