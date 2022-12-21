Select name, population, area
from World
where (area >=3000000 or population >=25000000)
----------------------------------------------------

select product_id
from Products
where (low_fats ="Y" and recyclable = "Y")
----------------------------------------------------

select name
from Customer
where (referee_id <> 2 or referee_id is null)
----------------------------------------------------

select name Customers
from Customers
left join Orders
    on Customers.id = Orders.customerId
where Orders.customerId is null
----------------------------------------------------

select employee_id,
case
    when employee_id % 2 <> 0 and name not like 'M%' then salary
    else 0
end
as bonus
from Employees
order by employee_id
----------------------------------------------------

update Salary
set 
    sex = case sex
    when 'm' then 'f'
    else 'm'
    end

update Salary
set 
    sex = case 
    when sex='m' then 'f'
    when sex='f' then 'm'
    end
where sex='f' or sex='m'
----------------------------------------------------

delete person2
from Person person1
join Person person2
    on person1.email = person2.email
where person1.id<person2.id
----------------------------------------------------

select employee_id
from Employees 
where employee_id not in(select employee_id from Salaries)
union
select employee_id
from Salaries
where employee_id not in(select employee_id from Employees)
order by employee_id asc
---------------------------------------------------------

select product_id, 'store1' store, store1 price
from Products
where store1 is not null
union
select product_id, 'store2' store, store2 price
from Products
where store2 is not null
union
select product_id, 'store3' store, store3 price
from Products
where store3 is not null
----------------------------------------------------------

# Write your MySQL query statement below
select id, 'Root' type
from Tree
where p_id is null
union
select id, 'Leaf' type
from Tree
where id not in(select distinct p_id from Tree where p_id is not null) and p_id is not null
union
select id, 'Inner' type
from Tree
where id in(select distinct p_id from Tree where p_id is not null) and p_id is not null
-------------------------------------------------------------------------------------------------------

select ifnull((
    select distinct salary 
    from Employee
    order by salary desc
    limit 1 offset 1),
    null)
    as SecondHighestSalary
--------------------------------------------------------

select 
    sell_date, 
    count(distinct product) num_sold,
    group_concat(distinct product order by product asc) products
from Activities
group by sell_date
order by 1 asc
----------------------------------------------------------
























