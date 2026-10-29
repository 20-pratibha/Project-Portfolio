Create database Assignment;
Use assignment;

select* 
from online_retail
limit 10;

#Data cleaning- no duplicates
select *from online_retail
group by (invoiceno),(stockcode),(description),(quantity),(invoicedate),(unitprice),(Customerid),(Country)
having count(*)<1;

#Locate missing data (do one by one for all the columns)
select *from online_retail
where((invoiceno) is null);


select *from online_retail
where((stockcode)is null);

select *from online_retail
where((description) is null);

select *from online_retail
where((Quantity) is null);

select *from online_retail
where((invoicedate) is null);

select *from online_retail
where((unitprice) is null);

select *from online_retail
where((customerid) is null);

select *from online_retail
where((country) is null);

#there are no missing data in the dataset provided

#Total revenue=412835.12
select sum(quantity*unitprice)
from online_retail;

#Top 5 products by total revenue

select description,sum(quantity*unitprice)
from online_retail
group by description
order by sum(quantity*unitprice)desc
limit 5;


select quantity
from online_retail
group by (quantity)
order by (quantity)desc
limit 5;

#top 5 customers based on their total spending
select customerid,Round(sum(quantity*unitprice),2) as Totalspent
from online_retail
group by (customerid)
order by Totalspent desc
limit 5;


#group transactions by month/week to extract sales trends over the time- check
select invoicedate/10000 as year_part,
(invoicedate%10000)/100 as month_part,
count(*) as total_count
from online_retail
group by invoicedate/1000,
(invoicedate%10000)/100
order by year_part,
month_part;

#ASSIGNMENT 2 from Mohit
create database assignment2;
Use assignment2;
CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(2),
city VARCHAR(20)
);
INSERT INTO student (rollno, name, marks, grade, city)
VALUES
(101, 'Mohit', 44, 'B', 'Lucknow'),
(102, 'Ashmeet', 33, 'D', 'Kerala'),
(103, 'Lekha', 65, 'C', 'Pune'),
(104, 'Mahantesh', 61, 'A', 'Kerala'),
(105, 'Aditya', 58, 'B', 'Lucknow'),
(106, 'Ritu', 71, 'A', 'Hyderabad'),
(107, 'Anjali', 90, 'C', 'Chennai'),
(108, 'Raj', 75, 'C', 'Hyderabad'),
(109, 'Simran', 70, 'B', 'Paris'),
(110, 'Amit', 97, 'D', 'Delhi'),
(111, 'Neha', 64, 'C', 'Pune'),
(112, 'Arjun', 65, 'C', 'Hyderabad'),
(113, 'Priya', 38, 'C', 'Mumbai'),
(114, 'Karan', 94, 'C', 'Paris'),
(115, 'Meera', 31, 'A', 'Chennai'),
(116, 'Suresh', 79, 'A', 'Pune'),
(117, 'Divya', 84, 'A', 'Kerala'),
(118, 'Nikhil', 82, 'C', 'Delhi'),
(119, 'Sneha', 67, 'A', 'Lucknow'),
(120, 'Vikas', 40, 'C', 'Hyderabad');
#change name to full_name
Alter table student
change name full_name VARCHAR (20);

select* from student;

#Delete all the students who scored marks less than 70
set sql_safe_updates=0;

Delete from student
where marks<70;

#Delete the column for grades
Alter table student
drop column grade;

#for the given table ,find the total paymemt done with each payment  method

create database bank;
use bank;
create table customer(
customer_id int primary key,
customer VARCHAR(50),
mode VARCHAR(20),
city VARCHAR(30)
);

INSERT INTO customer (customer_id, customer, mode, city)
VALUES
(201, 'Rahul', 'netbanking', 'Delhi'),
(202, 'Sneha', 'credit card', 'Mumbai'),
(203, 'Amit', 'debit card', 'Bangalore'),
(204, 'Priya', 'netbanking', 'Chennai'),
(205, 'Karan', 'credit card', 'Hyderabad'),
(206, 'Neha', 'debit card', 'Pune'),
(207, 'Rohit', 'netbanking', 'Kolkata'),
(208, 'Divya', 'credit card', 'Lucknow'),
(209, 'Arjun', 'debit card', 'Jaipur'),
(210, 'Meera', 'netbanking', 'Ahmedabad');

select mode, 
count(customer_id) from customer
group by mode;

CREATE DATABASE IF NOT EXISTS assignment3;
USE assignment3;
# imported table under assignment3 by using table data import wizard under tables in database assignment3
SELECT* from customer_support_tickets
LIMIT 10;

#Missing or duplicate records
select *from customer_support_tickets
group by (ticketID),(CustomerName),(IssueType),(Priority),(Status),(DateCreated),(Country)
having count(*)<1;

#Locate missing data (do one by one for all the columns)
select *from customer_support_tickets
where((ticketID) is null);

select *from customer_support_tickets
where((CustomerName) is null);

select *from customer_support_tickets
where((IssueType) is null);

select *from customer_support_tickets
where((Priority) is null);

select *from customer_support_tickets
where((status) is null);

select *from customer_support_tickets
where((DateCreated) is null);

select *from customer_support_tickets
where((Country) is null);

#Ticket Volume Analysis
#count how many total tickets exist
select count(TicketID)
from customer_support_tickets;

#count how many are currently “Open” or “In Progress”.
select CustomerName, count(Status)
from customer_support_tickets
Where status="open"
group by Customername;

select CustomerName, count(Status)
from customer_support_tickets
Where status="In progress"
group by Customername;

#Issue type breakdown
#Which issue type occurs most frequently?

select Issuetype,
count(CustomerName)
from customer_support_tickets
group by Issuetype;

#Write a query to count each IssueType and sort it in descending order.
select customername,issuetype
from customer_support_tickets
group by customername
order by issuetype desc;

#How many tickets are marked as High and Urgent

select CustomerName, count(priority)
from customer_support_tickets
Where priority="High"
group by Customername;

select CustomerName, count(priority)
from customer_support_tickets
Where priority="urgent"
group by Customername;

#How many tickets are still unresolved in each priority level?
select Priority, count(status)
from customer_support_tickets
where status="Open" 
group by Priority
having priority="medium"
order by priority
limit 100;


select Priority, count(status)
from customer_support_tickets
where status="Open" 
group by Priority
having priority="high"
order by priority;

select Priority, count(status)
from customer_support_tickets
where status="Open" 
group by Priority
having priority="urgent"
order by priority;

select Priority, count(status)
from customer_support_tickets
where status="Open" 
group by Priority
having priority="low"
order by priority;

# Which countries report the most tickets?

select country,
count(TicketID)
from customer_support_tickets
group by Country;

#Write a query to count tickets by Country, sorted descending.

select country,TicketID
from customer_support_tickets
group by (Country)
order by TicketID desc;

#Write a query to group ticket creation by month and count total tickets.


select month(datecreated) as month,
count(ticketid) as totaltickets
from customer_support_tickets
group by month(datecreated);

select date_format(datecreated,'%Y-%m')as year_month
count(ticketid) as totaltickets
from customer_support_tickets
group by year_month
order by year_month;

select Year(datecreated) as year,
month(datecreated) as month,
count(ticketid) as total_tickets
from customer_support_tickets
group by year(datecreated),month(datecreated)
order by year(datecreated),month(datecreated);
