use test;
create table stu(Sno char(9) primary key,Sname char(10) not null,Ssex char(2),age int,Sdept char(20));
create table course(Cno char unique,Cname char(20),Cpno int,Ccredit int);
create table SC(Sno char(9),Cno char,Grade int);
insert into stu values('201215121','����','��',20,'CS');
insert into stu values('201215122','����','Ů',19,'CS');
insert into stu values('201215123','����','Ů',18,'MA');
insert into stu values('201215124','����','��',19,'IS');
insert into course values(1,'���ݿ�',5,4);
insert into course values(2,'��ѧ',null,2);
insert into course values(3,'��Ϣϵͳ',1,4);
insert into course values(4,'����ϵͳ',6,3);
insert into course values(5,'���ݽṹ',7,4);
insert into course values(6,'���ݴ���',null,2);
insert into course values(7,'PASCAL����',6,4);
insert into SC values(201515121,1,92);
insert into SC values(201515121,2,85);
insert into SC values(201515121,3,88);
insert into SC values(201515122,2,90);
insert into SC values(201515122,3,80);


