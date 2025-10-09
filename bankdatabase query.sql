create database bankdata;
use bankdata;
create table branch(branch_name varchar(15),branch_city varchar(15),assets real,primary key(branch_name));
create table Bankacc(accno int,branch_name varchar(15),balance real,primary key(accno),foreign key(branch_name) references branch(branch_name));
create table Bankcus(customer_name varchar(20),customer_street varchar(20),customer_city varchar(15),primary key(customer_name));
create table depositer(customer_name varchar(20),accno int,primary key(customer_name, accno),foreign key (customer_name) REFERENCES Bankcus(customer_name),FOREIGN KEY (accno) REFERENCES Bankacc(accno));
CREATE TABLE loan (loan_number INT ,branch_name VARCHAR(15),amount REAL,primary key(loan_number),foreign key(branch_name) REFERENCES branch(branch_name));