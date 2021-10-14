-- all orders
select * from hw.orders;
-- All first name, last name, and email of customers
select first_name, last_name, email from hw.customers;
--  All staffs ordered based in the last name.
select * from hw.staffs order by last_name;
--  All staffs ordered based in the last name with limit 4
select * from hw.staffs order by last_name limit 4;
-- The distinct values of city attribute in customers
select distinct city from hw.customers;
-- Customers whose last names start with a letter M to Z
select first_name, last_name from hw.customers where last_name >= 'M' AND last_name<='Z';
-- Customers that are in Beloit
select first_name, last_name from hw.customers where city='Beloit';
-- Staffs who are working at Beloit store
select first_name, last_name from hw.staffs where store_id IN (select store_id from hw.stores where city='Beloit');
-- All orders that are delivered
select * from hw.orders where order_status='delivered';
-- Find the number of customers
select count(customer_id) from hw.customers;
-- All orders that have status shipped from store in Beloit.
select * from hw.orders where order_status='shipped' and store_id IN (select store_id from hw.stores where city='Beloit');
-- All orders that have status shipped on September 2021 from store in Beloit
select * from hw.orders where order_status='shipped' and store_id IN (select store_id from hw.stores where city='Beloit') and shipped_date LIKE '2021-09%';
-- Orders that delivered to Nam Hoang and shipped from Beloit store.
select * from hw.orders where order_status='delivered' and store_id IN (select store_id from hw.stores where city='Beloit') and customer_id=1;
-- Orders that shipped or delivered to Auras.
select * from hw.orders where (order_status='delivered' or order_status='shipped') and customer_id=2;
-- Staff whose manager is Brice.
select first_name, last_name from hw.staffs where manager_id in (select manager_id from hw.staffs where manager_id=5);
-- Staffs who supported Kathryn and Phuc in their orders
select first_name, last_name from hw.staffs where staff_id IN (SELECT staff_id from hw.orders WHERE customer_id IN (SELECT customer_id from hw.customers WHERE first_name = 'Kathryn' OR first_name='Phuc'));
-- Add attribute total_charge to orders.
ALTER TABLE hw.orders ADD total_charge float;
select * from hw.orders;
-- Insert data related to total_charge for each order.
UPDATE hw.orders set total_charge=100 where customer_id=3;
UPDATE hw.orders set total_charge=75 where customer_id=1;
UPDATE hw.orders set total_charge=120 where customer_id=2;
UPDATE hw.orders set total_charge=150 where customer_id=4;
-- Find the statistics regarding the total_charge of the orders.
select avg(total_charge), sum(total_charge), max(total_charge), min(total_charge), count(total_charge) from hw.orders;
-- First name, last name, Salary, Salary after increasing 15% from staff.
UPDATE hw.staffs set salary= 1.15*salary;
select first_name, last_name, salary from hw.staffs;
-- How many staff are living in Beloit and not in Beloit.
SELECT 
	(SELECT COUNT(staff_id) FROM hw.staffs WHERE store_id IN
		(SELECT store_id FROM hw.stores WHERE city = 'Beloit')) AS "staffs_living_in_Beloit", 
    (SELECT COUNT(staff_id) FROM hw.staffs WHERE store_id IN 
		(SELECT store_id FROM hw.stores WHERE city <> 'Beloit')) AS "staffs_not_living_in_Beloit";

-- Sum and average of the salaries of staffs who are working in Beloit store.
select sum(salary), avg(salary) from hw.staffs where store_id in (select store_id from hw.stores where city = 'Beloit');