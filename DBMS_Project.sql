USE Clinic_Managment


--DROPPING FOREIGN KEY CONSTRAINTS

GO
if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_doctor_name_lookup')
alter table Clinic_Managment_Doctor drop CONSTRAINT fk_clinic_doctor_name_lookup

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_patient_doctor_id')
alter table Clinic_Managment_Patient drop CONSTRAINT fk_clinic_patient_doctor_id

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_appointment_concernedDocName')
alter table Clinic_Managment_Appointment drop CONSTRAINT fk_clinic_appointment_concernedDocName

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_appointment_patient_id')
alter table Clinic_Managment_Appointment drop CONSTRAINT fk_clinic_appointment_patient_id

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_laboratory_TestPerformedBy')
alter table Clinic_Managment_Laboratory drop CONSTRAINT fk_clinic_laboratory_TestPerformedBy

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_laboratory_doctor_id')
alter table Clinic_Managment_Laboratory drop CONSTRAINT fk_clinic_laboratory_doctor_id

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_laboratory_patient_id')
alter table Clinic_Managment_Laboratory drop CONSTRAINT fk_clinic_laboratory_patient_id

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_report_lookup')
alter table Clinic_Managment_Laboratory drop CONSTRAINT fk_clinic_report_lookup

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_prescription_patient_id')
alter table Clinic_Managment_Prescription drop CONSTRAINT fk_clinic_prescription_patient_id

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_prescription_medicine_id')
alter table Clinic_Managment_Prescription drop CONSTRAINT fk_clinic_prescription_medicine_id


if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_prescription_doctor_id')
alter table Clinic_Managment_Prescription drop CONSTRAINT fk_clinic_prescription_doctor_id


if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_insurance_patient_id')
alter table Clinic_Managment_Insurance drop CONSTRAINT fk_clinic_insurance_patient_id


if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_clinic_insurance_lookup')
alter table Clinic_Managment_Insurance drop CONSTRAINT fk_clinic_insurance_lookup

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_laboratory_staff')
alter table Clinic_Managment_Staff drop CONSTRAINT fk_laboratory_staff

if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Clinic_Managment_Staff_department')
alter table Clinic_Managment_Staff drop CONSTRAINT fk_Clinic_Managment_Staff_department


if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_bill_Patient_id')
alter table Clinic_Managment_Bills drop CONSTRAINT fk_bill_Patient_id


if exists (SELECT * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_NAME='fk_Clinic_Managment_bill_paymentType')
alter table Clinic_Managment_Bills drop CONSTRAINT fk_Clinic_Managment_bill_paymentType

--DROPPING TABLES

GO

if exists(select * from sys.objects where name='Clinic_Managment_staff_designation_lookup')
	drop table Clinic_Managment_staff_designation_lookup
if exists(select * from sys.objects where name='Clinic_Managment_bill_lookup')
	drop table Clinic_Managment_bill_lookup
if exists(select * from sys.objects where name='Clinic_Managment_Insurance_Lookup')
	drop table Clinic_Managment_Insurance_Lookup
if exists(select * from sys.objects where name='Clinic_Managment_Bills')
	drop table Clinic_Managment_Bills
if exists(select * from sys.objects where name='Clinic_Managment_Report_Lookup')
	drop table Clinic_Managment_Report_Lookup
if exists (select * from sys.objects where name='Clinic_Managment_Laboratory')
    drop table Clinic_Managment_Laboratory
if exists(select * from sys.objects where name='Clinic_Managment_Staff')
	drop table Clinic_Managment_Staff
if exists(select * from sys.objects where name='Clinic_Managment_Prescription')
  drop table Clinic_Managment_Prescription
if exists (select * from sys.objects where name='Clinic_Managment_Insurance')
    drop table Clinic_Managment_Insurance
if exists (select * from sys.objects where name='Clinic_Managment_Clinic_Review')
   drop table Clinic_Managment_Clinic_Review
if exists (select * from sys.objects where name='Clinic_Managment_Medicine')
    drop table Clinic_Managment_Medicine
if exists (select * from sys.objects where name='Clinic_Managment_Appointment')
    drop table Clinic_Managment_Appointment
if exists(select * from sys.objects where name='Clinic_Managment_Patient')
  drop table Clinic_Managment_Patient
if exists(select * from sys.objects where name='Clinic_Managment_Doctor')
  drop table Clinic_Managment_Doctor
if exists(select * from sys.objects where name='Clinic_Managment_Doctor_Lookup')
	drop table Clinic_Managment_Doctor_Lookup

--Dropping Views

if exists(select * from sys.objects where name='Patients_Appointment')
	drop view Patients_Appointment

if exists(select * from sys.objects where name='Patient_Visited')
	drop view Patient_Visited

--Dropping Storing Procedures

if exists(select * from sys.objects where name = 'Patients_details')
	drop PROCEDURE Patients_details

-- CLINIC_MANAGMENT_STAFF_DESIGNATION_LOOKUP

GO

CREATE TABLE Clinic_Managment_staff_designation_lookup(
	[staff_department_id] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Clinic_Managment_Staff_department_ID] PRIMARY KEY ([staff_department_id])
 )

-- CLINIC_MANAGMENT_BILL_LOOKUP
GO

CREATE TABLE Clinic_Managment_Bill_lookup(
	bill_payment_method_name [varchar] (20) NOT NULL,
 CONSTRAINT [PK_Clinic_Managment_Bill_lookup_method_name] PRIMARY KEY ([bill_payment_method_name])
 )

--CLINIC_MANAGMENT_REPORT_LOOKUP
GO

CREATE TABLE Clinic_Managment_Report_Lookup(
	report_AvailStatus [varchar] (10) NOT NULL,
 CONSTRAINT [PK_Clinic_Managment_Report_Lookup_Status] PRIMARY KEY ([report_AvailStatus])
 )

--CLINIC_MANAGMENT_DOCTOR_LOOKUP

GO
CREATE TABLE Clinic_Managment_Doctor_Lookup(
	doctor_name [varchar] (20) NOT NULL,
 CONSTRAINT [PK_Clinic_Managment_Doctor_Lookup_doctor_name] PRIMARY KEY ([doctor_name])
 )


--CLINIC_INSURANCE_LOOKUP
GO
CREATE TABLE Clinic_Managment_Insurance_Lookup(
	insurance_type [varchar] (20) NOT NULL,
 CONSTRAINT [PK_Clinic_Managment_Insurance_LookUP_Type] PRIMARY KEY ([insurance_type])
 )

 GO
create table Clinic_Managment_Doctor
(
	doctor_id int identity not null,
    doctor_name VARCHAR(20) not null,
    doctor_contactNo bigint not null,
    doctor_specialist VARCHAR(20) not null,
    doctor_degree VARCHAR(30) not null,
    doctor_JoinDate date not null,
    doctor_serviceEndDate date not null,
    constraint pk_clinic_doctor_id primary key (doctor_id),
    constraint uk_clinic_doctor_contactNo UNIQUE(doctor_contactNo),
    CONSTRAINT fk_clinic_doctor_name_lookup FOREIGN KEY(doctor_name) REFERENCES Clinic_Managment_doctor_lookup(doctor_name)
)


GO
create table Clinic_Managment_Patient
(
    patient_firstname varchar(20) not null,
    patient_lastname varchar(20) not null,
    patient_weight decimal(8,2) not null,
    patient_height DECIMAL(8,2) not null,
    patient_age int not null,
    patient_dob date not null,
    patient_id int identity not null,
    patient_sex varchar(10) not null,
    patient_contactNo bigint not null,
    patient_SSN varchar(15) not null,
    patient_doctor_id int NOT NULL,
    constraint pk_clinic_patient_id primary key (patient_id),
    constraint uk_clinic_patient_SSN UNIQUE(patient_SSN),
    --constraint uk_clinic_patient_contactNo UNIQUE(patient_contactNo),
    constraint fk_clinic_patient_doctor_id foreign key (patient_doctor_id) references Clinic_Managment_Doctor(doctor_id)
    
)



GO
create table Clinic_Managment_Appointment
(

  appointment_date DATETIME not null,
  appointment_time TIME not null,
  appointment_reasonToVisit VARCHAR(20) not null,
  appointment_id int identity not  null,
  appointment_concernedDocName int not null,
  appointment_patient_id int not null,
  constraint pk_clinic_appointment_id primary key (appointment_id),
  constraint fk_clinic_appointment_concernedDocName foreign key (appointment_concernedDocName) references Clinic_Managment_doctor(doctor_id),
  constraint fk_clinic_appointment_patient_id foreign key (appointment_patient_id) references Clinic_Managment_Patient(patient_id)

)
CREATE TABLE Clinic_Managment_Staff(
	staff_id int IDENTITY NOT NULL,
	staff_ssn char(15) NOT NULL,
	staff_lastname varchar(50) NOT NULL,
	staff_firstname varchar(50) NOT NULL,
    staff_contactnumber bigint,
	staff_department varchar(30) NOT NULL,
 CONSTRAINT PK_Staff_ID PRIMARY KEY (staff_id ),
 CONSTRAINT fk_Clinic_Managment_Staff_department FOREIGN KEY (staff_department) REFERENCES Clinic_Managment_staff_designation_lookup(staff_department_id)
 )

create table Clinic_Managment_Laboratory
(
  laboratory_id int identity not null,
  laboratory_TestPerformedBy INT not null,
  laboratory_TestPerformed varchar(20) not null,
  laboratory_date_Time datetime not null,
  laboratory_reportNo int not null,
  laboratory_reportAvailStatus varchar(10) not null,
  laboratory_doctor_id int not null,
  laboratory_patient_id int not null,
  constraint pk_clinic_laboratory_id primary key (laboratory_id),
  constraint fk_clinic_laboratory_TestPerformedBy foreign key (laboratory_TestPerformedBy) references Clinic_Managment_Staff(staff_id), 
  constraint fk_laboratory_doctor_id foreign key (laboratory_doctor_id) references Clinic_Managment_Doctor(doctor_id),
  constraint fk_laboratory_patient_id foreign key (laboratory_patient_id) references Clinic_Managment_Patient(patient_id),
  constraint uk_clinic_laboratory_reportNo UNIQUE(laboratory_reportNo),
  CONSTRAINT fk_clinic_report_lookup FOREIGN KEY(laboratory_reportAvailStatus) REFERENCES Clinic_Managment_Report_Lookup(report_AvailStatus)

)

create table Clinic_Managment_Clinic_Review
(
  clinic_review_id int not null,
  clinic_review_RatingValue int not null,
  clinic_review_RatingComment varchar(30) null,
  clinic_review_patient_id int not null,
  constraint pk_clinic_review_id primary key (clinic_review_id)
  )

create table Clinic_Managment_Medicine
(
  medicine_name VARCHAR(30) not null,
  medicine_mfgDate date not null,
  medicine_expDate date not null,
  medicine_manufacturerName VARCHAR(30) not null,
  medicine_rackNo varchar(3) not null,
  medicine_id int identity not null,
  medicine_availableStock INT not null,
  constraint pk_clinic_medicine_id primary key (medicine_id),
  constraint uk_clinic_medicine_name UNIQUE(medicine_name)
)

create table Clinic_Managment_Prescription
(
  prescription_id int identity not null,
  prescription_Date date not null,
  prescription_patient_id int not null,
  prescription_doctor_id int not null,
  prescription_medicine_id int not null,
  constraint pk_clinic_prescription_id primary key (prescription_id),
  constraint fk_clinic_prescription_patient_id
  foreign key (prescription_patient_id) references Clinic_Managment_Patient(patient_id),
  constraint fk_clinic_prescription_medicine_id
  foreign key (prescription_medicine_id) references Clinic_Managment_Medicine(medicine_id),
  constraint fk_clinic_prescription_doctor_id
  foreign key (prescription_doctor_id) references Clinic_Managment_Doctor(doctor_id)

)

create table Clinic_Managment_Insurance
(
  insurance_id int identity not null,
  insurance_type varchar(20) not null,
  insurance_PlanName varchar(20) not null,
  insurance_MaturityDate date not null,
  insurance_ProviderName varchar(20) not null,
  insurance_ClaimsLeft int not null,
  insurance_patient_id int not null,
  constraint pk_clinic_insurance_id primary key (insurance_id),
  constraint fk_clinic_insurance_patient_id foreign key (insurance_patient_id) references Clinic_Managment_Patient(patient_id),
  CONSTRAINT fk_clinic_insurance_lookup FOREIGN KEY(insurance_type) REFERENCES Clinic_Managment_Insurance_Lookup(insurance_type)

)

GO
CREATE TABLE Clinic_Managment_Bills(
	bill_id int identity NOT NULL,
	bill_date DATETIME NOT NULL,
	bill_payer_name varchar(50),
    bill_patient_id int NOT NULL,
	bill_patient_name varchar(50) NOT NULL,
    bill_payment_method_name varchar(20),
	bill_amount money NOT NULL,
 CONSTRAINT PK_Bills_ID PRIMARY KEY (bill_id ),
 CONSTRAINT fk_bill_Patient_id FOREIGN KEY (bill_patient_id) REFERENCES Clinic_Managment_Patient(Patient_id),
 CONSTRAINT fk_Clinic_Managment_bill_paymentType FOREIGN KEY (bill_payment_method_name) REFERENCES Clinic_Managment_Bill_lookup(bill_payment_method_name)
)

--VIEWS

GO

--VIEW OF PATIENT HAVING INSURANCE

create view Patients_Appointment as
	select a.patient_firstname + ' ' + a.patient_lastname AS patient_name, c.appointment_date, c.appointment_time,c.appointment_concernedDocName,
		appointment_reasonToVisit from Clinic_Managment_Patient as a join Clinic_Managment_Appointment as c ON
		a.patient_id = c.appointment_patient_id

-- VIEW OF PATIENT APPOINTMENT DETAILS
GO

CREATE view Patient_Visited AS
	select b.patient_firstname + ' ' + b.patient_lastname AS Patient_Name, b.patient_contactNo, a.*
		from Clinic_Managment_Appointment a join Clinic_Managment_Patient b on a.appointment_patient_id = b.patient_id
	WHERE appointment_date >= DATEADD(day, -7, GETDATE())


--Stored Procedure for Patients

Go

CREATE PROCEDURE Patients_details
AS
SELECT * FROM Clinic_Managment_Patient


--Inserting Data into SQL File

Go

--Clinic_Managment_Doctor_Lookup Insert Statments.

INSERT into Clinic_Managment_Doctor_Lookup (doctor_name) VALUES (N'Dr. Ana Charves')
INSERT into Clinic_Managment_Doctor_Lookup (doctor_name) VALUES (N'Dr.Sherif Hanna')
INSERT into Clinic_Managment_Doctor_Lookup (doctor_name) VALUES (N'Dr.Jack Sparrow')

--CLINIC_MANAGMENT_DOCTOR_BILL_LOOKUP
GO
INSERT into Clinic_Managment_Bill_lookup (bill_payment_method_name) VALUES (N'Credit Card')
INSERT into Clinic_Managment_Bill_lookup (bill_payment_method_name) VALUES (N'Cash')
INSERT into Clinic_Managment_Bill_lookup (bill_payment_method_name) VALUES (N'Claim')

--CLINIC_MANAGMENT_STAFF_DESIGNATION_LOOKUP
GO
INSERT into Clinic_Managment_staff_designation_lookup (staff_department_id) VALUES (N'lab assistant')
INSERT into Clinic_Managment_staff_designation_lookup (staff_department_id) VALUES (N'Receptionist')
INSERT into Clinic_Managment_staff_designation_lookup (staff_department_id) VALUES (N'Pharmacist')

--CLINIC_MANAGMENT_INSURANCE_LOOKUP
GO
INSERT into Clinic_Managment_Insurance_Lookup  (insurance_type) VALUES (N'Government')
INSERT into Clinic_Managment_Insurance_Lookup (insurance_type) VALUES (N'Private')

--CLINIC_MANAGMENT_REPORT_LOOKUP
GO
INSERT into Clinic_Managment_Report_Lookup (report_AvailStatus) VALUES (N'Complete')
INSERT into Clinic_Managment_Report_Lookup (report_AvailStatus) VALUES (N'Incomplete')



-- INSERTING VALUES INTO CLINIC_MANAGMENT_DOCTOR
GO

insert into Clinic_Managment_Doctor
(doctor_name,doctor_contactNo,doctor_specialist,doctor_degree,doctor_JoinDate,doctor_serviceEndDate)
VALUES ('Dr. Ana Charves',3158979855,'Gynecologists','MD','2022-05-01','2024-05-01'),
('Dr.Sherif Hanna',3158945205,'Pediatricians','MD','2022-08-06','2024-08-06'),
('Dr.Jack Sparrow',3154985757,'General Physicians','MD','2022-08-04','2024-08-04')


--select * from Clinic_Managment_Doctor

--INSERTING VALUES INTO CLINIC_MANAGMENT_PATIENT

GO
insert into Clinic_Managment_Patient 
(patient_firstname,patient_lastname,patient_weight,patient_height,patient_age,patient_dob,patient_sex,patient_contactNo,patient_SSN,patient_doctor_id)
VALUES
('Robert', 'Pattinson',154,183,36,'1986-05-13','Male',3158625043,'253-280-9425',1),
('Peter','Parker',142,175,20,'2002-06-05','Male',3152615642,'831-425-0727',2),
('Chris','Hemsworth',189,198,39,'1983-08-11','Male',4521342564,'510-628-9065',2),
('Nicholas','Cage',159,183,42,'1979-12-08','Male',9152341786,'559-646-5437',3),
('Hugh' ,'Jackman',160,192,41,'1978-03-03','Male',4152453622,'714-226-0818',1),
('Leonardo','Decaprio',155,176,43,'1977-09-22','Male',3159528605,'530-743-6888',3),
('Julia','Roberts',135,182,48,'1972-11-26','Female',3156605440,'916-453-3525',2),
('Anne', 'Hathaway' ,133,160,39,'1983-02-14','Female',4159008765,'209-473-6890',1),
('Sandra','Bullock',138,170,44,'1978-08-21','Female',3157894533,'707-765-9367',2),
('Jennifer','Lawrence',139,172,32,'1980-01-17','Female',9521349876,'786-543-8097',3)

--select * from Clinic_Managment_Patient

--INSERTING VALUES INTO CLINIC_MANAGMENT_APPOINTMENT
GO

insert into Clinic_Managment_Appointment 
(appointment_date,appointment_time,appointment_reasonToVisit,appointment_concernedDocName,appointment_patient_id)
VALUES
('12-09-2022','06:00:00.000','Fever',1,10),
('12-11-2022','05:30:00.000','Diarrhea',2,8),
('12-05-2022','05:15:00.000','Meningitis',3, 9),
('12-31-2022','05:45:00.000','Conjunctivities',1,4),
('12-04-2022','06:15:00.000','PCB',3,7)

select * from Clinic_Managment_Appointment


--INSERTING VALUES INTO CLINIC_MANAGMENT_STAFF


insert into Clinic_Managment_Staff
(staff_firstName,staff_lastname,staff_department,staff_contactnumber,staff_ssn)
VALUES
('John','Trevor','lab assistant',7676988970,'987-989-0909'),
('Anna','Taylor','Receptionist',3453465678,'656-653-8787'),
('John','Newman','Pharmacist',9089877654,'893-989-7878')

--select * from Clinic_Managment_Staff


--INSERTING VALUES INTO LABORATORY

GO
insert into Clinic_Managment_Laboratory 
(laboratory_TestPerformedBy,laboratory_TestPerformed ,laboratory_date_Time,laboratory_reportNo,laboratory_reportAvailStatus,laboratory_doctor_id,laboratory_patient_id)
VALUES
(2,'X-RAY','2022-10-22 12:34:34.000',123,'Complete',2,4),
(1,'Blood-Tests','2022-11-15 03:08:23.000',456,'Incomplete',1,2)

--select * from Clinic_Managment_Laboratory

GO
--INSERTING VALUES INTO CLINIC_MANAGMENT_CLINIC_REVIEW

insert into Clinic_Managment_Clinic_Review
(clinic_review_id,clinic_review_RatingValue,clinic_review_RatingComment,clinic_review_patient_id)
VALUES
(1,4,'Good',9513),
(2,5,'Caring',1500),
(3,5,'NULL',4069)

--select * from Clinic_Managment_Clinic_Review

--INSERTING VALUES INTO CLINIC_MANAGMENT_MEDICINE
GO


insert into Clinic_Managment_Medicine
(medicine_name,medicine_mfgDate,medicine_expDate,medicine_manufacturerName,medicine_rackNo,medicine_availableStock)
VALUES
('AcnesolGel','2021-12-02','2024-12-02','Johnson & Johnson',1,100),
('AmbrodilSyrup','2022-01-13','2024-01-13','Pfizer Inc',2,200),
('Augmentin625DuoTablet','2022-05-23','2025-05-23',' Merck & Co',3,300),
('Azithral500Tablet','2022-07-13','2025-07-13','AbbVie Inc',4,350),
('AtaraxSyrup','2022-08-27','2024-08-27','Novartis',5,270)

--select * from Clinic_Managment_Medicine

--INSERTING VALUES INTO CLINIC_MANAGMENT_PRESCRIPTION
GO

insert into Clinic_Managment_Prescription 
(prescription_Date,prescription_patient_id,prescription_doctor_id,prescription_medicine_id)
VALUES
('2022-11-29',4,1,1),
('2022-11-27',5,2,2)

--SELECT * FROM CLINIC_MANAGMENT_PRESCRIPTION

--INSERTING VALUES INTO CLINIC_MANAGMENT_INSURANCE

GO

insert into Clinic_Managment_Insurance 
(insurance_type,insurance_PlanName,insurance_MaturityDate,insurance_ProviderName,insurance_ClaimsLeft,insurance_Patient_id)
VALUES
('Government','Aetna CVS Health','2023-12-04','Aetna',4,1),
('Private','United Healthcare','2024-11-12','United',5,2)

--INSERTING VALUES INTO CLINIC_MANAGMENT_BILLS

GO

insert into Clinic_Managment_Bills 
(bill_date,bill_payer_name,bill_patient_name,bill_payment_method_name,bill_amount,bill_patient_id)
VALUES 
(getdate(),'Willy Wonka','Peter Parker','Credit Card','250',1),
(getdate(),'Ben Wiscon','Sandra Bullock','Claim','500',3),
(getdate(),'Jennifer Lawrence','Jennifer Lawrence','Cash','600',5)

