/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.name, categories.name
FROM products
INNER JOIN categories
ON products.CategoryID = categories.CategoryID
Where Categories.name='computers';

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.name, products.price, reviews.rating
FROM products
INNER JOIN reviews on reviews.ProductID = products.ProductID
WHERE reviews.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select employees.FirstName, employees.LastName, sum(sales.Quantity)
FROM employees
INNER JOIN sales 
ON employees.EmployeeID= sales.EmployeeID
GROUP BY employees.EmployeeID
Order by sum(sales.Quantity) DESC
LIMIT 5;



/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.name, categories.name
FROM departments
INNER JOIN categories 
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name= 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.name, sum(sales.Quantity), sum(sales.PricePerUnit * sales.Quantity)
 FROM products
 INNER JOIN sales
 ON products.ProductID = sales.ProductID
 WHERE name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.name, reviews.reviewer, reviews.rating, reviews.Comment
FROM products
INNER JOIN reviews
ON products.productID = reviews.ProductID
WHERE products.name = 'Visio TV' AND reviews.rating <= 5;



-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */


SELECT employees.employeeID, employees.FirstName, employees.LastName, products.name, sum(sales.Quantity)
FROM employees
INNER JOIN sales 
ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products
ON products.ProductID = sales.ProductID
Group by employees.EmployeeID, sales.ProductID;
