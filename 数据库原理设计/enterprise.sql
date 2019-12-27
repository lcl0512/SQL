CREATE DATABASE enterprise;
GO
USE enterprise;
/*职工：职员信息表（职员编号，姓名，性别，出生日期，联系方式，家庭住址，籍贯，职务，所属部门，工资）primary key（职员编号）*/
CREATE TABLE employee(
emNumber CHAR(6),
emName VARCHAR(12) NOT NULL,
emSex CHAR(2) CHECK(emSex IN('男','女')) NOT NULL,
emBirthday DATE,
emPhoneNumber CHAR(11),
emAddress VARCHAR(20),
emCitizenship VARCHAR(18),
emPosition VARCHAR(10) NOT NULL,
department VARCHAR(12) NOT NULL,
baseSalary FLOAT(2) CHECK(baseSalary BETWEEN 800 AND 6000),
PRIMARY KEY(emNumber)
);
/*经理：经理信息表（经理编号，姓名，性别，联系电话，所属部门，工资）primary key（经理编号）*/
CREATE TABLE employeeMannager(
managerNumber CHAR(2),
managerName VARCHAR(12),
managerSex CHAR(2) CHECK(managerSex IN('男','女')),
managerPhoneNumber CHAR(11),
department VARCHAR(12) NOT NULL,
baseSalary FLOAT(2) CHECK(baseSalary BETWEEN 6000 AND 24000),
primary key(managerNumber)
);

/*工资项目信息：工资表（职员编号，基本工资，补贴奖金，处罚扣除，总工资）
primary key（基本工资，补贴奖金，处罚扣除）foreign key（职员编号）*/
CREATE TABLE salary(
emNumber CHAR(6),
baseSalary FLOAT(2) CHECK(baseSalary BETWEEN 800 AND 6000),
bonus FLOAT(2) CHECK(bonus BETWEEN 0 AND 800),
penalty FLOAT(2) CHECK(penalty BETWEEN 0 AND 1000),
totalSalary FLOAT(2) CHECK(totalSalary BETWEEN 800 AND 8000),
PRIMARY KEY(baseSalary,bonus,penalty),
FOREIGN KEY(emNumber) REFERENCES  employee(emNumber)
);
GO

/*创建员工基本信息视图
职员编号,姓名,性别,出生日期,联系方式,家庭住址,籍贯,职务,所属部门*/
CREATE VIEW employeeView
AS
SELECT emNumber ,emName ,emBirthday ,emPhoneNumber ,emAddress ,emCitizenship ,emPosition ,department
FROM employee;
GO
/*查询企业职工增加工资信息的视图
职员编号,姓名,所属部门,职务,总工资,补贴奖金,处罚扣除*/
create view Wageview
AS
SELECT employee.emNumber,emName,department,emPosition,totalSalary,bonus,penalty
FROM employee,salary
WHERE employee.emPhoneNumber=salary.emNumber;
GO
/*插入经理信息*/
insert employeeMannager values('01','王刚','男','13452438901','人事部','10000');
insert employeeMannager values('02','刘晓莉','女','15128932450','生产部','8000');
insert employeeMannager values('03','邓泽','男','13567902358','销售部','8800');
insert employeeMannager values('04','钟立萧','男','15247890123','技术部','9800');
insert employeeMannager values('05','杨丽丽','女','15247890453','财务部','10800');
insert employeeMannager values('06','岑歌','男','13987603521','公关部','12000');
/*插入职员信息*/
insert employee values('000001','王玉','男','1973-02-02','13425891230','北京市西城区','北京','员工','人事部','3600.00');
insert employee values('000002','张强','女','1974-05-01','13568901123','北京市东城区','河南','秘书','生产部','4500');
insert employee values('000003','李奇','男','1978-12-25','15123567890','北京市西城区','江苏','员工','销售部','3400');
insert employee values('000004','赵东','男','1973-03-15','13401189765','北京市丰台区','重庆','员工','销售部','3600');
insert employee values('000005','赵步瑞','男','1978-12-12','13678890145','北京市海淀区','新疆','员工','销售部','3600');
insert employee values('000006','黄瑞琪','女','1981-09-11','13408761345','北京市朝阳区','辽宁','员工','销售部','3600');
insert employee values('000007','唐锐','女','1979-03-24','13156790132','北京市海淀区','湖南','员工','人事部','3600');
insert employee values('000008','方中信','男','1969-11-23','13456798745','北京市朝阳区','石家庄','员工','人事部','3600');
insert employee values('000009','张忠奇','男','1973-02-12','13245890122','北京市宣武区','天津','员工','人事部','3600');
insert employee values('000010','李明','男','1972-01-04','13589012331','北京市海淀区','河南','技工','技术部','2800');
insert employee values('000011','顾铁华','男','1977-04-02','13568001456','北京市朝阳区','河南','技工','技术部','2800');
insert employee values('000012','张江','男','1971-01-04','13901123678','北京市东城区','内蒙古','技工','技术部','2800');
insert employee values('000013','刘皓月','女','1974-01-25','15189001245','北京市海淀区','江西','员工','财务部','2800');
insert employee values('000014','吴长鑫','男','1980-11-30','13678901123','北京市朝阳区','广西','员工','财务部','2800');
insert employee values('000015','王芳','女','1982-04-11','13567904589','北京市宣武区','山西','员工','财务部','2800');
insert employee values('000016','方文化','男','1969-08-31','15327890023','北京市海淀区','大连','秘书','生产部','4000');
insert employee values('000017','彭其','男','1968-03-01','13409981897','北京市东城区','北京','秘书','生产部','4000');
insert employee values('000018','孙玥','女','1974-05-23','13589023788','北京市朝阳区','济南','秘书','生产部','4000');
insert employee values('000019','齐国强','男','1969-06-09','15698012578','北京市宣武区','安徽','员工','公关部','3800');
insert employee values('000020','刘思远','女','1982-04-11','13980234789','北京市朝阳区','北京','员工','公关部','3800');
/*插入工资信息*/
insert salary values('000001','3000','100','400','4600');
insert salary values('000002','3500','200','100','4600');
insert salary values('000003','4000','300','200','5100');
insert salary values('000004','4000','100','500','4600');
insert salary values('000005','2800','900','100','4600');
insert salary values('000006','3200','500','100','4600');
insert salary values('000007','3200','600','200','4600');
insert salary values('000008','2900','800','100','4600');
insert salary values('000009','2900','1000','300','4600');
insert salary values('000010','3000','800','200','4600');
insert salary values('000011','4000','500','400','5100');
insert salary values('000012','4000','100','500','4600');
insert salary values('000013','2800','900','100','4600');
insert salary values('000014','3200','500','100','4600');
insert salary values('000015','3200','600','200','4600');
insert salary values('000016','2900','800','100','4600');
insert salary values('000017','2900','1000','300','4600');
insert salary values('000018','3000','800','200','4600');
insert salary values('000019','3000','700','400','4300');
insert salary values('000020','3200','200','100','4300');
insert salary values('000021','3700','300','200','4300');
insert salary values('000022','3700','100','500','4300');
insert salary values('000023','2500','600','100','4300');
insert salary values('000024','3200','200','100','4300');
insert salary values('000025','3200','400','200','4300');

/*定义触发器,当删除员工时同步删除工资表*/
USE enterprise;
GO
CREATE TRIGGER tri_employee
ON employee
AFTER DELETE
AS 
BEGIN
	DELETE salary
	WHERE emNumber IN(select emNumber from deleted)
END

/*查询分析*/

Select employee.emName,employee.emPhoneNumber,salary.baseSalary
From employee, salary
Where employee.emNumber=salary.emNumber and salary.baseSalary>3000
	
Select * from employee
Where employee.department='财务部';

Select managerName,managerPhoneNumber
From employeeMannager
Where department in
(select department
 From employee
 Where emName='张强'
 );

 Select *
From employee
Where emNumber='000002';
GO
create procedure highEmployee_info as
select employee.emName,employee.emPhoneNumber,emPosition,salary.totalSalary
from employee inner join salary on employee.emNumber=salary.emNumber
where totalSalary > 5000

exec highEmployee_info;

GO
create procedure employee_info @emName VARCHAR(12)
as
select employee.emName,employee.emNumber,employee.department,emPosition,
employeeMannager.managerName,salary.totalSalary
from salary inner join employee on salary.emNumber=employee.emNumber 
inner join employeeMannager on employee.department=employeeMannager.department
where employee.emName like @emName

exec employee_info '唐锐';