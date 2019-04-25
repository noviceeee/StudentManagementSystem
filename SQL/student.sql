create database student;
use student;
create table stu(
id int(10) primary key auto_increment,
name char(10) not null,
sex  enum('男', '女'),
age int,
height int,
weight int
);
insert into stu values(null, '甲', '男', 18, 164, 66);
insert into stu values(null, '乙', '男', 20, 187, 74);
insert into stu values(null, '丙', '女', 22, 155, 45);
insert into stu values(null, '丁', '男', 21, 169, 57);
insert into stu values(null, '戊', '女', 23, 171, 56);
insert into stu values(null, '己', '女', 18, 152, 45);
insert into stu values(null, '庚', '男', 19, 191, 80);
insert into stu values(null, '辛', '男', 21, 182, 75);
insert into stu values(null, '壬', '男', 22, 174, 88);
insert into stu values(null, '癸', '女', 21, 165, 53);

