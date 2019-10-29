use test;
create table stu(Sno char(9) primary key,Sname char(10) not null,Ssex char(2),age int,Sdept char(20));
create table course(Cno char unique,Cname char(20),Cpno int,Ccredit int);
create table SC(Sno char(9),Cno char,Grade int);
insert into stu values('201215121','李勇','男',20,'CS');
insert into stu values('201215122','刘晨','女',19,'CS');
insert into stu values('201215123','王敏','女',18,'MA');
insert into stu values('201215124','张立','男',19,'IS');
insert into course values(1,'数据库',5,4);
insert into course values(2,'数学',null,2);
insert into course values(3,'信息系统',1,4);
insert into course values(4,'操作系统',6,3);
insert into course values(5,'数据结构',7,4);
insert into course values(6,'数据处理',null,2);
insert into course values(7,'PASCAL语言',6,4);
insert into SC values(201515121,1,92);
insert into SC values(201515121,2,85);
insert into SC values(201515121,3,88);
insert into SC values(201515122,2,90);
insert into SC values(201515122,3,80);


