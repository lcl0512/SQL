CREATE DATABASE enterprise;
GO
USE enterprise;
/*ְ����ְԱ��Ϣ��ְԱ��ţ��������Ա𣬳������ڣ���ϵ��ʽ����ͥסַ�����ᣬְ���������ţ����ʣ�primary key��ְԱ��ţ�*/
CREATE TABLE employee(
emNumber CHAR(6),
emName VARCHAR(12) NOT NULL,
emSex CHAR(2) CHECK(emSex IN('��','Ů')) NOT NULL,
emBirthday DATE,
emPhoneNumber CHAR(11),
emAddress VARCHAR(20),
emCitizenship VARCHAR(18),
emPosition VARCHAR(10) NOT NULL,
department VARCHAR(12) NOT NULL,
baseSalary FLOAT(2) CHECK(baseSalary BETWEEN 800 AND 6000),
PRIMARY KEY(emNumber)
);
/*����������Ϣ�������ţ��������Ա���ϵ�绰���������ţ����ʣ�primary key�������ţ�*/
CREATE TABLE employeeMannager(
managerNumber CHAR(2),
managerName VARCHAR(12),
managerSex CHAR(2) CHECK(managerSex IN('��','Ů')),
managerPhoneNumber CHAR(11),
department VARCHAR(12) NOT NULL,
baseSalary FLOAT(2) CHECK(baseSalary BETWEEN 6000 AND 24000),
primary key(managerNumber)
);

/*������Ŀ��Ϣ�����ʱ�ְԱ��ţ��������ʣ��������𣬴����۳����ܹ��ʣ�
primary key���������ʣ��������𣬴����۳���foreign key��ְԱ��ţ�*/
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

/*����Ա��������Ϣ��ͼ
ְԱ���,����,�Ա�,��������,��ϵ��ʽ,��ͥסַ,����,ְ��,��������*/
CREATE VIEW employeeView
AS
SELECT emNumber ,emName ,emBirthday ,emPhoneNumber ,emAddress ,emCitizenship ,emPosition ,department
FROM employee;
GO
/*��ѯ��ҵְ�����ӹ�����Ϣ����ͼ
ְԱ���,����,��������,ְ��,�ܹ���,��������,�����۳�*/
create view Wageview
AS
SELECT employee.emNumber,emName,department,emPosition,totalSalary,bonus,penalty
FROM employee,salary
WHERE employee.emPhoneNumber=salary.emNumber;
GO
/*���뾭����Ϣ*/
insert employeeMannager values('01','����','��','13452438901','���²�','10000');
insert employeeMannager values('02','������','Ů','15128932450','������','8000');
insert employeeMannager values('03','����','��','13567902358','���۲�','8800');
insert employeeMannager values('04','������','��','15247890123','������','9800');
insert employeeMannager values('05','������','Ů','15247890453','����','10800');
insert employeeMannager values('06','᯸�','��','13987603521','���ز�','12000');
/*����ְԱ��Ϣ*/
insert employee values('000001','����','��','1973-02-02','13425891230','������������','����','Ա��','���²�','3600.00');
insert employee values('000002','��ǿ','Ů','1974-05-01','13568901123','�����ж�����','����','����','������','4500');
insert employee values('000003','����','��','1978-12-25','15123567890','������������','����','Ա��','���۲�','3400');
insert employee values('000004','�Զ�','��','1973-03-15','13401189765','�����з�̨��','����','Ա��','���۲�','3600');
insert employee values('000005','�Բ���','��','1978-12-12','13678890145','�����к�����','�½�','Ա��','���۲�','3600');
insert employee values('000006','������','Ů','1981-09-11','13408761345','�����г�����','����','Ա��','���۲�','3600');
insert employee values('000007','����','Ů','1979-03-24','13156790132','�����к�����','����','Ա��','���²�','3600');
insert employee values('000008','������','��','1969-11-23','13456798745','�����г�����','ʯ��ׯ','Ա��','���²�','3600');
insert employee values('000009','������','��','1973-02-12','13245890122','������������','���','Ա��','���²�','3600');
insert employee values('000010','����','��','1972-01-04','13589012331','�����к�����','����','����','������','2800');
insert employee values('000011','������','��','1977-04-02','13568001456','�����г�����','����','����','������','2800');
insert employee values('000012','�Ž�','��','1971-01-04','13901123678','�����ж�����','���ɹ�','����','������','2800');
insert employee values('000013','�����','Ů','1974-01-25','15189001245','�����к�����','����','Ա��','����','2800');
insert employee values('000014','�ⳤ��','��','1980-11-30','13678901123','�����г�����','����','Ա��','����','2800');
insert employee values('000015','����','Ů','1982-04-11','13567904589','������������','ɽ��','Ա��','����','2800');
insert employee values('000016','���Ļ�','��','1969-08-31','15327890023','�����к�����','����','����','������','4000');
insert employee values('000017','����','��','1968-03-01','13409981897','�����ж�����','����','����','������','4000');
insert employee values('000018','��h','Ů','1974-05-23','13589023788','�����г�����','����','����','������','4000');
insert employee values('000019','���ǿ','��','1969-06-09','15698012578','������������','����','Ա��','���ز�','3800');
insert employee values('000020','��˼Զ','Ů','1982-04-11','13980234789','�����г�����','����','Ա��','���ز�','3800');
/*���빤����Ϣ*/
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

/*���崥����,��ɾ��Ա��ʱͬ��ɾ�����ʱ�*/
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

/*��ѯ����*/

Select employee.emName,employee.emPhoneNumber,salary.baseSalary
From employee, salary
Where employee.emNumber=salary.emNumber and salary.baseSalary>3000
	
Select * from employee
Where employee.department='����';

Select managerName,managerPhoneNumber
From employeeMannager
Where department in
(select department
 From employee
 Where emName='��ǿ'
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

exec employee_info '����';