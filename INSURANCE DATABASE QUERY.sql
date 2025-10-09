CREATE DATABASE program;
USE program;

CREATE TABLE person (driver_id VARCHAR(10), name VARCHAR(20), address VARCHAR(30), 
    PRIMARY KEY(driver_id)
);

CREATE TABLE car (reg_num VARCHAR(10), model VARCHAR(10), year INT, 
    PRIMARY KEY(reg_num)
);

CREATE TABLE accident (report_num INT, accident_date DATE, location VARCHAR(20), 
    PRIMARY KEY(report_num)
);

CREATE TABLE owns (driver_id VARCHAR(10), reg_num VARCHAR(10), 
    PRIMARY KEY(driver_id, reg_num),
    FOREIGN KEY(driver_id) REFERENCES person(driver_id), 
    FOREIGN KEY(reg_num) REFERENCES car(reg_num)
);

CREATE TABLE participated (driver_id VARCHAR(10), reg_num VARCHAR(10), report_num INT, damage_amount INT,  
    PRIMARY KEY(driver_id, reg_num, report_num),
    FOREIGN KEY(driver_id) REFERENCES person(driver_id),
    FOREIGN KEY(reg_num) REFERENCES car(reg_num),
    FOREIGN KEY(report_num) REFERENCES accident(report_num)
);

INSERT INTO person(driver_id, name, address) 
VALUES('A01', 'Richard', 'Srinivas Nagar'),('A02', 'Pradeep', 'Rajajinagar'),('A03', 'Praveen', 'Girinagar'),('A04', 'Hansh', 'Maleshwaram'),('A05', 'Pranav', 'Whitefield');

INSERT INTO car(reg_num, model, year)
VALUES('KA031181', 'Lancer', 1957),('KA039876', 'Lancer', 1992),('KA035577', 'Lancer', 1998),('KA037005', 'Lancer', 2002),('KA037891', 'Lancer', 2005);

INSERT INTO accident(report_num, accident_date, location)
VALUES(11, '2001-01-03', 'Mysore Road'),(12, '2002-02-04', 'Southend Circle'),(13, '2008-01-03', 'Bulltemple Road'),(14, '1990-02-08', 'Mysore Road'),(15, '2009-03-05', 'Kanakpura Road');
INSERT INTO owns(driver_id, reg_num)
VALUES('A01', 'KA031181'),('A02', 'KA035577'),('A03', 'KA039876'),('A04', 'KA037891'),('A05', 'KA037005');
insert into participated (driver_id, reg_num, report_num, damage_amount)
values('A01', 'KA031181', 11, 40000),('A02', 'KA035577', 12, 50000),('A03', 'KA039876', 13, 15000),('A04', 'KA037891', 14, 60000),('A05', 'KA037005', 15, 25000);
select accident_date, location 
from accident;
select driver_id
from participated where damage_amount >=25000;
select * from participated order by damage_amount DESC;
select AVG(damage_amount) from participated;
select MAX(damage_amount) from particpated;
select name from personA,particpated B WHERE A.driver_id=B.driver_id AND damage_amount>(select AVG(damage_amount) from participated);






    
    
