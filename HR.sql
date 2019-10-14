
IF OBJECT_ID('DEPT_MGR_FK', 'F') IS NOT NULL  
	alter table departments drop constraint DEPT_MGR_FK;
IF OBJECT_ID('LOC_C_ID_FK', 'F') IS NOT NULL  
	alter table locations drop constraint LOC_C_ID_FK;
IF OBJECT_ID('COUNTR_REG_FK', 'F') IS NOT NULL  
	alter table countries drop constraint COUNTR_REG_FK;
IF OBJECT_ID('EMP_DEPT_FK', 'F') IS NOT NULL  
	alter table employees drop constraint EMP_DEPT_FK;
	
IF OBJECT_ID('job_history', 'U') IS NOT NULL  
	DROP TABLE job_history ;
IF OBJECT_ID('employees', 'U') IS NOT NULL  
	DROP TABLE employees   ;
IF OBJECT_ID('jobs', 'U') IS NOT NULL  
	DROP TABLE jobs ;
IF OBJECT_ID('departments', 'U') IS NOT NULL  	
	DROP TABLE departments ;
IF OBJECT_ID('locations', 'U') IS NOT NULL  
	DROP TABLE locations  
IF OBJECT_ID('countries', 'U') IS NOT NULL  
DROP TABLE countries   ;
IF OBJECT_ID('regions', 'U') IS NOT NULL  
	DROP TABLE regions ;





GO
CREATE TABLE COUNTRIES 
    ( 
     COUNTRY_ID CHAR (2 )  NOT NULL primary key, 
     COUNTRY_NAME VARCHAR (40 ) , 
     REGION_ID int 
    )  




CREATE TABLE DEPARTMENTS 
    ( 
     DEPARTMENT_ID Integer  NOT NULL PRIMARY KEY , 
     DEPARTMENT_NAME VARCHAR (30 )  NOT NULL , 
     MANAGER_ID INT , 
     LOCATION_ID INT 
    ) 
;
CREATE TABLE EMPLOYEES 
    ( 
     EMPLOYEE_ID INT  NOT NULL PRIMARY KEY , 
     FIRST_NAME VARCHAR (20) , 
     LAST_NAME VARCHAR (25)  NOT NULL , 
     EMAIL VARCHAR (25)  NOT NULL , 
     PHONE_NUMBER VARCHAR (20 ) , 
     HIRE_DATE DATE  NOT NULL , 
     JOB_ID VARCHAR (10)  NOT NULL , 
     SALARY MONEY , 
     COMMISSION_PCT FLOAT  , 
     MANAGER_ID INT , 
     DEPARTMENT_ID INT 
    ) 
;



ALTER TABLE EMPLOYEES 
    ADD CONSTRAINT EMP_SALARY_MIN 
    CHECK ( salary > 0) 
;
ALTER TABLE EMPLOYEES 
    ADD CONSTRAINT EMP_EMAIL_UK UNIQUE ( EMAIL ) ;



CREATE TABLE JOBS 
    ( 
     JOB_ID VARCHAR (10 )  NOT NULL PRIMARY KEY, 
     JOB_TITLE VARCHAR (35 )  NOT NULL , 
     MIN_SALARY INT , 
     MAX_SALARY INT 
    ) 
;
CREATE TABLE JOB_HISTORY 
    ( 
     EMPLOYEE_ID INT NOT NULL,
     START_DATE DATE  NOT NULL , 
     END_DATE DATE  NOT NULL , 
     JOB_ID VARCHAR (10 )  NOT NULL , 
     DEPARTMENT_ID INT,
	 PRIMARY KEY (EMPLOYEE_ID, START_DATE)
    ) 
;

CREATE TABLE LOCATIONS 
    ( 
     LOCATION_ID INT  NOT NULL PRIMARY KEY , 
     STREET_ADDRESS VARCHAR (40) , 
     POSTAL_CODE VARCHAR (12) , 
     CITY VARCHAR (30)  NOT NULL , 
     STATE_PROVINCE VARCHAR (25 ) , 
     COUNTRY_ID CHAR (2 ) 
    ) 
;
CREATE TABLE REGIONS 
    ( 
     REGION_ID  INT NOT NULL PRIMARY KEY , 
     REGION_NAME VARCHAR (25) 
    ) 
;

ALTER TABLE COUNTRIES 
    ADD CONSTRAINT COUNTR_REG_FK FOREIGN KEY 
    ( 
     REGION_ID
    ) 
    REFERENCES REGIONS 
    ( 
     REGION_ID
    ) 
;

ALTER TABLE DEPARTMENTS 
    ADD CONSTRAINT DEPT_LOC_FK FOREIGN KEY 
    ( 
     LOCATION_ID
    ) 
    REFERENCES LOCATIONS 
    ( 
     LOCATION_ID
    ) 
;

ALTER TABLE DEPARTMENTS 
    ADD CONSTRAINT DEPT_MGR_FK FOREIGN KEY 
    ( 
     MANAGER_ID
    ) 
    REFERENCES EMPLOYEES 
    ( 
     EMPLOYEE_ID
    ) 
    
;



ALTER TABLE EMPLOYEES 
    ADD CONSTRAINT EMP_DEPT_FK FOREIGN KEY 
    ( 
     DEPARTMENT_ID
    ) 
    REFERENCES DEPARTMENTS 
    ( 
     DEPARTMENT_ID
    ) 
    
;

ALTER TABLE EMPLOYEES 
    ADD CONSTRAINT EMP_JOB_FK FOREIGN KEY 
    ( 
     JOB_ID
    ) 
    REFERENCES JOBS 
    ( 
     JOB_ID
    ) 
;
ALTER TABLE EMPLOYEES 
    ADD CONSTRAINT EMP_MANAGER_FK FOREIGN KEY 
    ( 
     MANAGER_ID
    ) 
    REFERENCES EMPLOYEES 
    ( 
     EMPLOYEE_ID
    ) 
;

ALTER TABLE JOB_HISTORY 
    ADD CONSTRAINT JHIST_DEPT_FK FOREIGN KEY 
    ( 
     DEPARTMENT_ID
    ) 
    REFERENCES DEPARTMENTS 
    ( 
     DEPARTMENT_ID
    ) 
;

ALTER TABLE JOB_HISTORY 
    ADD CONSTRAINT JHIST_EMP_FK FOREIGN KEY 
    ( 
     EMPLOYEE_ID
    ) 
    REFERENCES EMPLOYEES 
    ( 
     EMPLOYEE_ID
    ) 
;
ALTER TABLE JOB_HISTORY 
    ADD CONSTRAINT JHIST_JOB_FK FOREIGN KEY 
    ( 
     JOB_ID
    ) 
    REFERENCES JOBS 
    ( 
     JOB_ID
    ) 
;
ALTER TABLE LOCATIONS 
    ADD CONSTRAINT LOC_C_ID_FK FOREIGN KEY 
    ( 
     COUNTRY_ID
    ) 
    REFERENCES COUNTRIES 
    ( 
     COUNTRY_ID
    ) 
;


SET DATEFORMAT YMD
-- ----------------------------
-- Records of REGIONS
-- ----------------------------
INSERT INTO REGIONS VALUES ('1', 'Europe');
INSERT INTO REGIONS VALUES ('2', 'Americas');
INSERT INTO REGIONS VALUES ('3', 'Asia');
INSERT INTO REGIONS VALUES ('4', 'Middle East and Africa');
-- ----------------------------
-- Records of COUNTRIES
-- ----------------------------
INSERT INTO COUNTRIES VALUES ('AR', 'Argentina', '2');
INSERT INTO COUNTRIES VALUES ('AU', 'Australia', '3');
INSERT INTO COUNTRIES VALUES ('BE', 'Belgium', '1');
INSERT INTO COUNTRIES VALUES ('BR', 'Brazil', '2');
INSERT INTO COUNTRIES VALUES ('CA', 'Canada', '2');
INSERT INTO COUNTRIES VALUES ('CH', 'Switzerland', '1');
INSERT INTO COUNTRIES VALUES ('CN', 'China', '3');
INSERT INTO COUNTRIES VALUES ('DE', 'Germany', '1');
INSERT INTO COUNTRIES VALUES ('DK', 'Denmark', '1');
INSERT INTO COUNTRIES VALUES ('EG', 'Egypt', '4');
INSERT INTO COUNTRIES VALUES ('FR', 'France', '1');
INSERT INTO COUNTRIES VALUES ('IL', 'Israel', '4');
INSERT INTO COUNTRIES VALUES ('IN', 'India', '3');
INSERT INTO COUNTRIES VALUES ('IT', 'Italy', '1');
INSERT INTO COUNTRIES VALUES ('JP', 'Japan', '3');
INSERT INTO COUNTRIES VALUES ('KW', 'Kuwait', '4');
INSERT INTO COUNTRIES VALUES ('ML', 'Malaysia', '3');
INSERT INTO COUNTRIES VALUES ('MX', 'Mexico', '2');
INSERT INTO COUNTRIES VALUES ('NG', 'Nigeria', '4');
INSERT INTO COUNTRIES VALUES ('NL', 'Netherlands', '1');
INSERT INTO COUNTRIES VALUES ('SG', 'Singapore', '3');
INSERT INTO COUNTRIES VALUES ('UK', 'United Kingdom', '1');
INSERT INTO COUNTRIES VALUES ('US', 'United States of America', '2');
INSERT INTO COUNTRIES VALUES ('ZM', 'Zambia', '4');
INSERT INTO COUNTRIES VALUES ('ZW', 'Zimbabwe', '4');
-- ----------------------------
-- Records of LOCATIONS
-- ----------------------------
INSERT INTO LOCATIONS VALUES ('1000', '1297 Via Cola di Rie', '00989', 'Roma', null, 'IT');
INSERT INTO LOCATIONS VALUES ('1100', '93091 Calle della Testa', '10934', 'Venice', null, 'IT');
INSERT INTO LOCATIONS VALUES ('1200', '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP');
INSERT INTO LOCATIONS VALUES ('1300', '9450 Kamiya-cho', '6823', 'Hiroshima', null, 'JP');
INSERT INTO LOCATIONS VALUES ('1400', '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO LOCATIONS VALUES ('1500', '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO LOCATIONS VALUES ('1600', '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US');
INSERT INTO LOCATIONS VALUES ('1700', '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO LOCATIONS VALUES ('1800', '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA');
INSERT INTO LOCATIONS VALUES ('1900', '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA');
INSERT INTO LOCATIONS VALUES ('2000', '40-5-12 Laogianggen', '190518', 'Beijing', null, 'CN');
INSERT INTO LOCATIONS VALUES ('2100', '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN');
INSERT INTO LOCATIONS VALUES ('2200', '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU');
INSERT INTO LOCATIONS VALUES ('2300', '198 Clementi North', '540198', 'Singapore', null, 'SG');
INSERT INTO LOCATIONS VALUES ('2400', '8204 Arthur St', null, 'London', null, 'UK');
INSERT INTO LOCATIONS VALUES ('2500', 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');
INSERT INTO LOCATIONS VALUES ('2600', '9702 Chester Road', '09629850293', 'Stretford', 'Manchester', 'UK');
INSERT INTO LOCATIONS VALUES ('2700', 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE');
INSERT INTO LOCATIONS VALUES ('2800', 'Rua Frei Caneca 1360 ', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR');
INSERT INTO LOCATIONS VALUES ('2900', '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH');
INSERT INTO LOCATIONS VALUES ('3000', 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH');
INSERT INTO LOCATIONS VALUES ('3100', 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL');
INSERT INTO LOCATIONS VALUES ('3200', 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal,', 'MX');

go
ALTER TABLE DEPARTMENTS NOCHECK CONSTRAINT ALL
GO
-- ----------------------------
-- Records of DEPARTMENTS
-- ----------------------------
INSERT INTO DEPARTMENTS VALUES ('10', 'Administration', '200', '1700');
INSERT INTO DEPARTMENTS VALUES ('20', 'Marketing', '201', '1800');
INSERT INTO DEPARTMENTS VALUES ('30', 'Purchasing', '114', '1700');
INSERT INTO DEPARTMENTS VALUES ('40', 'Human Resources', '203', '2400');
INSERT INTO DEPARTMENTS VALUES ('50', 'Shipping', '121', '1500');
INSERT INTO DEPARTMENTS VALUES ('60', 'IT', '103', '1400');
INSERT INTO DEPARTMENTS VALUES ('70', 'Public Relations', '204', '2700');
INSERT INTO DEPARTMENTS VALUES ('80', 'Sales', '145', '2500');
INSERT INTO DEPARTMENTS VALUES ('90', 'Executive', '100', '1700');
INSERT INTO DEPARTMENTS VALUES ('100', 'Finance', '108', '1700');
INSERT INTO DEPARTMENTS VALUES ('110', 'Accounting', '205', '1700');
INSERT INTO DEPARTMENTS VALUES ('120', 'Treasury', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('130', 'Corporate Tax', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('140', 'Control And Credit', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('150', 'Shareholder Services', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('160', 'Benefits', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('170', 'Manufacturing', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('180', 'Construction', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('190', 'Contracting', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('200', 'Operations', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('210', 'IT Support', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('220', 'NOC', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('230', 'IT Helpdesk', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('240', 'Government Sales', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('250', 'Retail Sales', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('260', 'Recruiting', null, '1700');
INSERT INTO DEPARTMENTS VALUES ('270', 'Payroll', null, '1700');

-- ----------------------------
-- Records of JOBS
-- ----------------------------
INSERT INTO "JOBS" VALUES ('AD_PRES', 'President', '20080', '40000');
INSERT INTO "JOBS" VALUES ('AD_VP', 'Administration Vice President', '15000', '30000');
INSERT INTO "JOBS" VALUES ('AD_ASST', 'Administration Assistant', '3000', '6000');
INSERT INTO "JOBS" VALUES ('FI_MGR', 'Finance Manager', '8200', '16000');
INSERT INTO "JOBS" VALUES ('FI_ACCOUNT', 'Accountant', '4200', '9000');
INSERT INTO "JOBS" VALUES ('AC_MGR', 'Accounting Manager', '8200', '16000');
INSERT INTO "JOBS" VALUES ('AC_ACCOUNT', 'Public Accountant', '4200', '9000');
INSERT INTO "JOBS" VALUES ('SA_MAN', 'Sales Manager', '10000', '20080');
INSERT INTO "JOBS" VALUES ('SA_REP', 'Sales Representative', '6000', '12008');
INSERT INTO "JOBS" VALUES ('PU_MAN', 'Purchasing Manager', '8000', '15000');
INSERT INTO "JOBS" VALUES ('PU_CLERK', 'Purchasing Clerk', '2500', '5500');
INSERT INTO "JOBS" VALUES ('ST_MAN', 'Stock Manager', '5500', '8500');
INSERT INTO "JOBS" VALUES ('ST_CLERK', 'Stock Clerk', '2008', '5000');
INSERT INTO "JOBS" VALUES ('SH_CLERK', 'Shipping Clerk', '2500', '5500');
INSERT INTO "JOBS" VALUES ('IT_PROG', 'Programmer', '4000', '10000');
INSERT INTO "JOBS" VALUES ('MK_MAN', 'Marketing Manager', '9000', '15000');
INSERT INTO "JOBS" VALUES ('MK_REP', 'Marketing Representative', '4000', '9000');
INSERT INTO "JOBS" VALUES ('HR_REP', 'Human Resources Representative', '4000', '9000');
INSERT INTO "JOBS" VALUES ('PR_REP', 'Public Relations Representative', '4500', '10500');
GO
ALTER TABLE EMPLOYEES NOCHECK CONSTRAINT ALL
GO
-- ----------------------------
-- Records of EMPLOYEES
-- ----------------------------
INSERT INTO EMPLOYEES VALUES ('198', 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '2007-06-21', 'SH_CLERK', '2600', null, '124', '50');
INSERT INTO EMPLOYEES VALUES ('199', 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '2008-01-13', 'SH_CLERK', '2600', null, '124', '50');
INSERT INTO EMPLOYEES VALUES ('200', 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '2003-09-17', 'AD_ASST', '4400', null, '101', '10');
INSERT INTO EMPLOYEES VALUES ('201', 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '2004-02-17', 'MK_MAN', '13000', null, '100', '20');
INSERT INTO EMPLOYEES VALUES ('202', 'Pat', 'Fay', 'PFAY', '603.123.6666', '2005-08-17', 'MK_REP', '6000', null, '201', '20');
INSERT INTO EMPLOYEES VALUES ('203', 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', '2002-06-07', 'HR_REP', '6500', null, '101', '40');
INSERT INTO EMPLOYEES VALUES ('204', 'Hermann', 'Baer', 'HBAER', '515.123.8888', '2002-06-07', 'PR_REP', '10000', null, '101', '70');
INSERT INTO EMPLOYEES VALUES ('205', 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '2002-06-07', 'AC_MGR', '12008', null, '101', '110');
INSERT INTO EMPLOYEES VALUES ('206', 'William', 'Gietz', 'WGIETZ', '515.123.8181', '2002-06-07', 'AC_ACCOUNT', '8300', null, '205', '110');
INSERT INTO EMPLOYEES VALUES ('100', 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17', 'AD_PRES', '24000', null, null, '90');
INSERT INTO EMPLOYEES VALUES ('101', 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_VP', '17000', null, '100', '90');
INSERT INTO EMPLOYEES VALUES ('102', 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '2001-01-13', 'AD_VP', '17000', null, '100', '90');
INSERT INTO EMPLOYEES VALUES ('103', 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03', 'IT_PROG', '9000', null, '102', '60');
INSERT INTO EMPLOYEES VALUES ('104', 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2007-05-21', 'IT_PROG', '6000', null, '103', '60');
INSERT INTO EMPLOYEES VALUES ('105', 'David', 'Austin', 'DAUSTIN', '590.423.4569', '2005-06-25', 'IT_PROG', '4800', null, '103', '60');
INSERT INTO EMPLOYEES VALUES ('106', 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '2006-02-05', 'IT_PROG', '4800', null, '103', '60');
INSERT INTO EMPLOYEES VALUES ('107', 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '2007-02-07', 'IT_PROG', '4200', null, '103', '60');
INSERT INTO EMPLOYEES VALUES ('108', 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '2002-08-17', 'FI_MGR', '12008', null, '101', '100');
INSERT INTO EMPLOYEES VALUES ('109', 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '2002-08-16', 'FI_ACCOUNT', '9000', null, '108', '100');
INSERT INTO EMPLOYEES VALUES ('110', 'John', 'Chen', 'JCHEN', '515.124.4269', '2005-09-28', 'FI_ACCOUNT', '8200', null, '108', '100');
INSERT INTO EMPLOYEES VALUES ('111', 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '2005-09-30', 'FI_ACCOUNT', '7700', null, '108', '100');
INSERT INTO EMPLOYEES VALUES ('112', 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '2006-03-07', 'FI_ACCOUNT', '7800', null, '108', '100');
INSERT INTO EMPLOYEES VALUES ('113', 'Luis', 'Popp', 'LPOPP', '515.124.4567', '2007-12-07', 'FI_ACCOUNT', '6900', null, '108', '100');
INSERT INTO EMPLOYEES VALUES ('114', 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '2002-12-07', 'PU_MAN', '11000', null, '100', '30');
INSERT INTO EMPLOYEES VALUES ('115', 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '2003-05-18', 'PU_CLERK', '3100', null, '114', '30');
INSERT INTO EMPLOYEES VALUES ('116', 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '2005-12-24', 'PU_CLERK', '2900', null, '114', '30');
INSERT INTO EMPLOYEES VALUES ('117', 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '2005-07-24', 'PU_CLERK', '2800', null, '114', '30');
INSERT INTO EMPLOYEES VALUES ('118', 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '2006-11-15', 'PU_CLERK', '2600', null, '114', '30');
INSERT INTO EMPLOYEES VALUES ('119', 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '2007-08-10', 'PU_CLERK', '2500', null, '114', '30');
INSERT INTO EMPLOYEES VALUES ('120', 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '2004-07-18', 'ST_MAN', '8000', null, '100', '50');
INSERT INTO EMPLOYEES VALUES ('121', 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '2005-04-10', 'ST_MAN', '8200', null, '100', '50');
INSERT INTO EMPLOYEES VALUES ('122', 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '2003-05-01', 'ST_MAN', '7900', null, '100', '50');
INSERT INTO EMPLOYEES VALUES ('123', 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '2005-10-10', 'ST_MAN', '6500', null, '100', '50');
INSERT INTO EMPLOYEES VALUES ('124', 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '2007-11-16', 'ST_MAN', '5800', null, '100', '50');
INSERT INTO EMPLOYEES VALUES ('125', 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '2005-07-16', 'ST_CLERK', '3200', null, '120', '50');
INSERT INTO EMPLOYEES VALUES ('126', 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '2006-09-28', 'ST_CLERK', '2700', null, '120', '50');
INSERT INTO EMPLOYEES VALUES ('127', 'James', 'Landry', 'JLANDRY', '650.124.1334', '2007-01-14', 'ST_CLERK', '2400', null, '120', '50');
INSERT INTO EMPLOYEES VALUES ('128', 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '2008-03-08', 'ST_CLERK', '2200', null, '120', '50');
INSERT INTO EMPLOYEES VALUES ('129', 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '2005-08-20', 'ST_CLERK', '3300', null, '121', '50');
INSERT INTO EMPLOYEES VALUES ('130', 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '2005-10-30', 'ST_CLERK', '2800', null, '121', '50');
INSERT INTO EMPLOYEES VALUES ('131', 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '2005-02-16', 'ST_CLERK', '2500', null, '121', '50');
INSERT INTO EMPLOYEES VALUES ('132', 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '2007-04-10', 'ST_CLERK', '2100', null, '121', '50');
INSERT INTO EMPLOYEES VALUES ('133', 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '2004-06-14', 'ST_CLERK', '3300', null, '122', '50');
INSERT INTO EMPLOYEES VALUES ('134', 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '2006-08-26', 'ST_CLERK', '2900', null, '122', '50');
INSERT INTO EMPLOYEES VALUES ('135', 'Ki', 'Gee', 'KGEE', '650.127.1734', '2007-12-12', 'ST_CLERK', '2400', null, '122', '50');
INSERT INTO EMPLOYEES VALUES ('136', 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '2008-02-06', 'ST_CLERK', '2200', null, '122', '50');
INSERT INTO EMPLOYEES VALUES ('137', 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '2003-07-14', 'ST_CLERK', '3600', null, '123', '50');
INSERT INTO EMPLOYEES VALUES ('138', 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', '2005-10-26', 'ST_CLERK', '3200', null, '123', '50');
INSERT INTO EMPLOYEES VALUES ('139', 'John', 'Seo', 'JSEO', '650.121.2019', '2006-02-12', 'ST_CLERK', '2700', null, '123', '50');
INSERT INTO EMPLOYEES VALUES ('140', 'Joshua', 'Patel', 'JPATEL', '650.121.1834', '2006-04-06', 'ST_CLERK', '2500', null, '123', '50');
INSERT INTO EMPLOYEES VALUES ('141', 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '2003-10-17', 'ST_CLERK', '3500', null, '124', '50');
INSERT INTO EMPLOYEES VALUES ('142', 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '2005-01-29', 'ST_CLERK', '3100', null, '124', '50');
INSERT INTO EMPLOYEES VALUES ('143', 'Randall', 'Matos', 'RMATOS', '650.121.2874', '2006-03-15', 'ST_CLERK', '2600', null, '124', '50');
INSERT INTO EMPLOYEES VALUES ('144', 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '2006-07-09', 'ST_CLERK', '2500', null, '124', '50');
INSERT INTO EMPLOYEES VALUES ('145', 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', '2004-10-01', 'SA_MAN', '14000', '0.40', '100', '80');
INSERT INTO EMPLOYEES VALUES ('146', 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', '2005-01-05', 'SA_MAN', '13500', '0.30', '100', '80');
INSERT INTO EMPLOYEES VALUES ('147', 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', '2005-03-10', 'SA_MAN', '12000', '0.30', '100', '80');
INSERT INTO EMPLOYEES VALUES ('148', 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', '2007-10-15', 'SA_MAN', '11000', '0.30', '100', '80');
INSERT INTO EMPLOYEES VALUES ('149', 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '2008-01-29', 'SA_MAN', '10500', '0.20', '100', '80');
INSERT INTO EMPLOYEES VALUES ('150', 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', '2005-01-30', 'SA_REP', '10000', '0.30', '145', '80');
INSERT INTO EMPLOYEES VALUES ('151', 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', '2005-03-24', 'SA_REP', '9500', '0.25', '145', '80');
INSERT INTO EMPLOYEES VALUES ('152', 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', '2005-08-20', 'SA_REP', '9000', '0.25', '145', '80');
INSERT INTO EMPLOYEES VALUES ('153', 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', '2006-03-30', 'SA_REP', '8000', '0.20', '145', '80');
INSERT INTO EMPLOYEES VALUES ('154', 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', '2006-12-09', 'SA_REP', '7500', '0.20', '145', '80');
INSERT INTO EMPLOYEES VALUES ('155', 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', '2007-11-23', 'SA_REP', '7000', '0.15', '145', '80');
INSERT INTO EMPLOYEES VALUES ('156', 'Janette', 'King', 'JKING', '011.44.1345.429268', '2004-01-30', 'SA_REP', '10000', '0.35', '146', '80');
INSERT INTO EMPLOYEES VALUES ('157', 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', '2004-03-04', 'SA_REP', '9500', '0.35', '146', '80');
INSERT INTO EMPLOYEES VALUES ('158', 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', '2004-08-01', 'SA_REP', '9000', '0.35', '146', '80');
INSERT INTO EMPLOYEES VALUES ('159', 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', '2005-03-10', 'SA_REP', '8000', '0.30', '146', '80');
INSERT INTO EMPLOYEES VALUES ('160', 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', '2005-12-15', 'SA_REP', '7500', '0.30', '146', '80');
INSERT INTO EMPLOYEES VALUES ('161', 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', '2006-11-03', 'SA_REP', '7000', '0.25', '146', '80');
INSERT INTO EMPLOYEES VALUES ('162', 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', '2005-11-11', 'SA_REP', '10500', '0.25', '147', '80');
INSERT INTO EMPLOYEES VALUES ('163', 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', '2007-03-19', 'SA_REP', '9500', '0.15', '147', '80');
INSERT INTO EMPLOYEES VALUES ('164', 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', '2008-01-24', 'SA_REP', '7200', '0.10', '147', '80');
INSERT INTO EMPLOYEES VALUES ('165', 'David', 'Lee', 'DLEE', '011.44.1346.529268', '2008-02-23', 'SA_REP', '6800', '0.10', '147', '80');
INSERT INTO EMPLOYEES VALUES ('166', 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', '2008-03-24', 'SA_REP', '6400', '0.10', '147', '80');
INSERT INTO EMPLOYEES VALUES ('167', 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', '2008-04-21', 'SA_REP', '6200', '0.10', '147', '80');
INSERT INTO EMPLOYEES VALUES ('168', 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', '2005-03-11', 'SA_REP', '11500', '0.25', '148', '80');
INSERT INTO EMPLOYEES VALUES ('169', 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', '2006-03-23', 'SA_REP', '10000', '0.20', '148', '80');
INSERT INTO EMPLOYEES VALUES ('170', 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', '2006-01-24', 'SA_REP', '9600', '0.20', '148', '80');
INSERT INTO EMPLOYEES VALUES ('171', 'William', 'Smith', 'WSMITH', '011.44.1343.629268', '2007-02-23', 'SA_REP', '7400', '0.15', '148', '80');
INSERT INTO EMPLOYEES VALUES ('172', 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', '2007-03-24', 'SA_REP', '7300', '0.15', '148', '80');
INSERT INTO EMPLOYEES VALUES ('173', 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', '2008-04-21', 'SA_REP', '6100', '0.10', '148', '80');
INSERT INTO EMPLOYEES VALUES ('174', 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '2004-05-11', 'SA_REP', '11000', '0.30', '149', '80');
INSERT INTO EMPLOYEES VALUES ('175', 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', '2005-03-19', 'SA_REP', '8800', '0.25', '149', '80');
INSERT INTO EMPLOYEES VALUES ('176', 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '2006-03-24', 'SA_REP', '8600', '0.20', '149', '80');
INSERT INTO EMPLOYEES VALUES ('177', 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', '2006-04-23', 'SA_REP', '8400', '0.20', '149', '80');
INSERT INTO EMPLOYEES VALUES ('178', 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '2007-05-24', 'SA_REP', '7000', '0.15', '149', null);
INSERT INTO EMPLOYEES VALUES ('179', 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', '2008-01-04', 'SA_REP', '6200', '0.10', '149', '80');
INSERT INTO EMPLOYEES VALUES ('180', 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', '2006-01-24', 'SH_CLERK', '3200', null, '120', '50');
INSERT INTO EMPLOYEES VALUES ('181', 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', '2006-02-23', 'SH_CLERK', '3100', null, '120', '50');
INSERT INTO EMPLOYEES VALUES ('182', 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', '2007-06-21', 'SH_CLERK', '2500', null, '120', '50');
INSERT INTO EMPLOYEES VALUES ('183', 'Girard', 'Geoni', 'GGEONI', '650.507.9879', '2008-02-03', 'SH_CLERK', '2800', null, '120', '50');
INSERT INTO EMPLOYEES VALUES ('184', 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', '2004-01-27', 'SH_CLERK', '4200', null, '121', '50');
INSERT INTO EMPLOYEES VALUES ('185', 'Alexis', 'Bull', 'ABULL', '650.509.2876', '2005-02-20', 'SH_CLERK', '4100', null, '121', '50');
INSERT INTO EMPLOYEES VALUES ('186', 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', '2006-06-24', 'SH_CLERK', '3400', null, '121', '50');
INSERT INTO EMPLOYEES VALUES ('187', 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', '2007-02-07', 'SH_CLERK', '3000', null, '121', '50');
INSERT INTO EMPLOYEES VALUES ('188', 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', '2005-06-14', 'SH_CLERK', '3800', null, '122', '50');
INSERT INTO EMPLOYEES VALUES ('189', 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', '2005-08-13', 'SH_CLERK', '3600', null, '122', '50');
INSERT INTO EMPLOYEES VALUES ('190', 'Timothy', 'Gates', 'TGATES', '650.505.3876', '2006-07-11', 'SH_CLERK', '2900', null, '122', '50');
INSERT INTO EMPLOYEES VALUES ('191', 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', '2007-12-19', 'SH_CLERK', '2500', null, '122', '50');
INSERT INTO EMPLOYEES VALUES ('192', 'Sarah', 'Bell', 'SBELL', '650.501.1876', '2004-02-04', 'SH_CLERK', '4000', null, '123', '50');
INSERT INTO EMPLOYEES VALUES ('193', 'Britney', 'Everett', 'BEVERETT', '650.501.2876', '2005-03-03', 'SH_CLERK', '3900', null, '123', '50');
INSERT INTO EMPLOYEES VALUES ('194', 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', '2006-07-01', 'SH_CLERK', '3200', null, '123', '50');
INSERT INTO EMPLOYEES VALUES ('195', 'Vance', 'Jones', 'VJONES', '650.501.4876', '2007-03-17', 'SH_CLERK', '2800', null, '123', '50');
INSERT INTO EMPLOYEES VALUES ('196', 'Alana', 'Walsh', 'AWALSH', '650.507.9811', '2006-04-24', 'SH_CLERK', '3100', null, '124', '50');
INSERT INTO EMPLOYEES VALUES ('197', 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', '2006-05-23', 'SH_CLERK', '3000', null, '124', '50');

-- ----------------------------
-- Records of JOB_HISTORY
-- ----------------------------
INSERT INTO JOB_HISTORY VALUES ('102', '2001-01-13 ', '2006-07-24 ', 'IT_PROG', '60');
INSERT INTO JOB_HISTORY VALUES ('101', '1997-09-21 ', '2001-10-27 ', 'AC_ACCOUNT', '110');
INSERT INTO JOB_HISTORY VALUES ('101', '2001-10-28 ', '2005-03-15 ', 'AC_MGR', '110');
INSERT INTO JOB_HISTORY VALUES ('201', '2004-02-17 ', '2007-12-19 ', 'MK_REP', '20');
INSERT INTO JOB_HISTORY VALUES ('114', '2006-03-24 ', '2007-12-31 ', 'ST_CLERK', '50');
INSERT INTO JOB_HISTORY VALUES ('122', '2007-01-01 ', '2007-12-31 ', 'ST_CLERK', '50');
INSERT INTO JOB_HISTORY VALUES ('200', '1995-09-17 ', '2001-06-17 ', 'AD_ASST', '90');
INSERT INTO JOB_HISTORY VALUES ('176', '2006-03-24 ', '2006-12-31 ', 'SA_REP', '80');
INSERT INTO JOB_HISTORY VALUES ('176', '2007-01-01 ', '2007-12-31 ', 'SA_MAN', '80');
INSERT INTO JOB_HISTORY VALUES ('200', '2002-07-01 ', '2006-12-31 ', 'AC_ACCOUNT', '90');

--1 
select (e.FIRST_NAME + e.LAST_NAME) as name, e.SALARY
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID 
where (d.DEPARTMENT_ID = 50 or d.DEPARTMENT_ID = 20 )and e.SALARY >= 5000 and e.SALARY <=12000

--2 Liệt kê nhân viên ( last_name + firstname ), tên công việc  (job_title) của những nhân viên không có người quản lý 
select (e1.FIRST_NAME + e1.LAST_NAME) as Name ,j.JOB_TITLE 
from EMPLOYEES e1  join JOBS j on e1.JOB_ID = j.JOB_ID
where e1.MANAGER_ID is null

--3 Liệt kê employee_id, last_name,firstname, salary ,  
--<New Salary> , Increase, commision_pct (phần trăm hoa hồng). 
--Trường hợp nhân viên không có hoa hồng thì hiển thị “No commision” .  <New Salary> : lương tăng thêm 15.5% Increase = <New Salary> - salary 
select e.EMPLOYEE_ID , e.LAST_NAME, e.FIRST_NAME, e.SALARY,e.SALARY, (e.SALARY *1.155 ) "New Salary",e.SALARY *0.155 "Increase"  ,(Case when e.COMMISSION_PCT is null then 'No commision' else cast(e.COMMISSION_PCT as varchar) end) commission
from EMPLOYEES e

--4 Cho biết  tên công việc và lương trung bình  lớn hơn 10000$ cho các nhân viên có công việc trong quá khứ. 
select j.JOB_TITLE, (j.MAX_SALARY + j.MIN_SALARY)/2 "AVG"
from JOB_HISTORY jh join EMPLOYEES e on e.EMPLOYEE_ID = jh.EMPLOYEE_ID join JOBS j on e.JOB_ID = j.JOB_ID
where (j.MAX_SALARY + j.MIN_SALARY) > 10000 

--5 Tìm lương cao nhất, lương thấp nhất, tổng lương, lương trung bình và số lượng nhân viên của  nhân viên theo từng công việc. 
select  max(e.SALARY) as "MAX SALARY", min(e.SALARY) as "MIN SALARY", Avg(e.SALARY) as "AVG SALARY", sum(e.SALARY)as "SUM SALARY", count(e.EMPLOYEE_ID) as "SL EMPLOYEE"
from  EMPLOYEES e 
group by e.JOB_ID

--6 Cho biết tên nhân viên và người quản lý, nếu nhân viên không có người quản lý hiển thị giá trị null. 
select e1.FIRST_NAME + e1.LAST_NAME as "Name", e2.FIRST_NAME
from EMPLOYEES e1 left join EMPLOYEES e2 on e1.MANAGER_ID = e2.EMPLOYEE_ID

--7 Cho biết các nhân viên vào làm trước người quản lý của họ. Hiển thị tên , ngày vào làm và người quản lý của họ. 
select e1.FIRST_NAME + e1.LAST_NAME as "Name"
from EMPLOYEES e1 left join EMPLOYEES e2 on e1.MANAGER_ID = e2.EMPLOYEE_ID
where e1.HIRE_DATE < e2.HIRE_DATE

--8 Cho biết các nhân viên có mức lương lớn hơn lương trung bình của phòng ban mà họ làm việc . Sắp xếp tăng dần theo lương.
select e.FIRST_NAME, e.SALARY
from EMPLOYEES e
where  e.SALARY > (select   avg(e1.SALARY)
from EMPLOYEES e1
where e1.DEPARTMENT_ID =e.DEPARTMENT_ID
group by e1.DEPARTMENT_ID)
order by e.SALARY

--9 
select e.FIRST_NAME, j.JOB_TITLE, e.EMPLOYEE_ID, j.JOB_ID
from EMPLOYEES e join JOB_HISTORY jh on e.EMPLOYEE_ID = jh.EMPLOYEE_ID join JOBS j on e.JOB_ID = j.JOB_ID
where e.JOB_ID = jh.JOB_ID

--10 Cho biết danh sách công việc và số lượng nhân viên trong phòng ban 10, 50 và 20.

--11 Cho biết tên phòng ban và tên người quản lý phòng ban đó
select  d.DEPARTMENT_NAME, e.FIRST_NAME
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID and e.EMPLOYEE_ID = d.MANAGER_ID


--12 Cho biết phòng ban có số lượng nhân viên lớn nhất.
 select top 1 d.DEPARTMENT_NAME, COUNT(e.EMPLOYEE_ID) as slnv
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
group by d.DEPARTMENT_NAME
order by slnv desc 

---13 Với từng công việc, cho biết thông tin nhân viên có mức lương cao nhất

