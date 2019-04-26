create database student;
use student;
create table stu(
id int(5) primary key auto_increment,
name char(10) not null,
sex  enum('男', '女'),
age int,
height int,
weight int
);
insert into stu values(null, '小甲', '男', 18, 164, 66);
insert into stu values(null, '小乙', '男', 20, 187, 74);
insert into stu values(null, '小丙', '女', 22, 155, 45);
insert into stu values(null, '小丁', '男', 21, 169, 57);
insert into stu values(null, '小戊', '女', 23, 171, 56);
insert into stu values(null, '小己', '女', 18, 152, 45);
insert into stu values(null, '小庚', '男', 19, 191, 83);
insert into stu values(null, '小辛', '男', 21, 182, 75);
insert into stu values(null, '小壬', '男', 22, 174, 83);
insert into stu values(null, '小癸', '女', 21, 165, 53);
insert into stu values(null, '大甲', '女', 19, 165, 53);
insert into stu values(null, '大乙', '男', 23, 185, 83);
insert into stu values(null, '大丙', '女', 20, 174, 59);

