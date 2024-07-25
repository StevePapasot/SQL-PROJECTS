use data_new;
-- 1  Show all columns and rows in the table 
SELECT * FROM data_new.salaries;

-- 2 Show only Employee name and job title columns
SELECT EmployeeName, JobTitle from data_new.salaries;

-- 3 Show the number of employees in the table
SELECT count(*) FROM data_new.salaries;

-- 4 Show the unique job titles in the table
SELECT DISTINCT JobTitle FROM data_new.salaries;

-- 5	Show the job title and overtime pay for all employees with 
-- overtime pay greater than 50000.
SELECT JobTitle, OvertimePay FROM  data_new.salaries WHERE OvertimePay > 50000;

-- 6	Show the average base pay for all employees.
SELECT AVG(BasePay) FROM data_new.salaries;

-- 7	Show the top 10 highest paid employees.
SELECT EmployeeName, TotalPay FROM data_new.salaries ORDER BY TotalPay desc limit 10;

-- 8	Show the average of BasePay, OvertimePay, and OtherPay for each employee:
SELECT EmployeeName, (BasePay + OvertimePay + OtherPay)/3  FROM data_new.salaries;

-- 9	Show all employees who have the word "Manager" in their job title.
SELECT EmployeeName,JobTitle FROM data_new.salaries WHERE JobTitle LIKE "%Manager%";

-- 10	Show all employees with a job title not equal to "Manager".
SELECT EmployeeName,JobTitle FROM data_new.salaries WHERE JobTitle NOT LIKE "%Manager%";

-- 11	Show all employees with a total pay between 50,000 and 75,000.
SELECT * FROM  data_new.salaries WHERE TotalPay > 500000 AND TotalPay < 750000;

-- 12	Show all employees with a base pay less than 50,000 
-- or a total pay greater than 100,000.
SELECT * FROM  data_new.salaries WHERE BasePay > 500000 OR TotalPay > 100000;

-- 13	Show all employees with a total pay benefits value 
-- between 125,000 and 150,000 and a job title containing the word "Director".
SELECT * FROM data_new.salaries WHERE JobTitle LIKE "%Director%" AND TotalPayBenefits BETWEEN 125000 AND 150000;

-- 14	Show all employees ordered by their total pay benefits in descending order.
SELECT * FROM data_new.salaries ORDER BY TotalPayBenefits DESC;

-- 15	Show all job titles with an average base pay of 
-- at least 100,000 and order them by the average base pay in descending order.
select JobTitle, AVG(BasePay) as "avgbasepay" from salaries
group by JobTitle
having avg(BasePay) >=100000
order by avgbasepay desc;

-- 16	Delete the column.
select * from salaries;
alter table salaries
drop column Notes;
select * from salaries;

-- 17	Update the base pay of all employees with 
-- the job title containing "Manager" by increasing it by 10%.
update salaries
set BasePay = BasePay * 1.1
where JobTitle Like "%Manager%";
select * from salaries;

-- 18	Delete all employees who have no OvertimePay.
select count(*) from salaries
where OvertimePay =0;
delete from salaries
where OvertimePay =0;
select count(*) from salaries
where OvertimePay =