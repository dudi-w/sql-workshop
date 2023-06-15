-- Provide a query that shows the count of customers assigned to each sales agent
SELECT Employee.LastName,
    Employee.FirstName,
    count(Customer.CustomerId)
FROM Customer
    JOIN Employee ON Employee.EmployeeId = Customer.SupportRepId
GROUP BY Employee.EmployeeId