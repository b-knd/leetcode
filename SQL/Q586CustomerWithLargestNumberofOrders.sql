/*
586. Customer Placing the Largest Number of Orders

Description:
Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

The query result format is in the following example.

 

Example 1:

Input: 
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
Explanation: 
The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.
*/

/* Solution */
select customer_number from Orders group by customer_number 
order by count(*) desc limit 1;

/* Follow up: 
What if more than one customer has the largest number of orders, 
can you find all the customer_number in this case?
*/
select customer_number from Orders group by customer_number 
having count(*) = (select count(*) from Orders group by customer_number order by count(*) desc limit 1);
/* this will return all customer as long as the number of order is equals to the maximum number of order*/

