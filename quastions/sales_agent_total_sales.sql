-- Provide a query that shows total sales made by each sales agent.
SELECT Employee.LastName || '' || Employee.FirstName as [Agent Name],
    sum(Invoice.Total)
FROM Invoice
    JOIN Customer on Customer.CustomerId = Invoice.CustomerId
    JOIN Employee on Employee.EmployeeId = Customer.SupportRepId
GROUP BY Employee.EmployeeId;