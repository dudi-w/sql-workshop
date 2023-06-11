-- Hint: Use the MAX function on a subquery. top_agent.sql: Which sales agent made the most in sales over all?
SELECT Employee.LastName || ' ' || Employee.FirstName as [Agent Name],
    sum(Invoice.Total) as sumTotal
FROM Invoice
    JOIN Customer on Customer.CustomerId = Invoice.CustomerId
    JOIN Employee on Employee.EmployeeId = Customer.SupportRepId
GROUP BY Employee.EmployeeId
HAVING sumTotal = max(
        (
            SELECT sum(Invoice.Total) as sumTotal
            FROM Invoice
                JOIN Customer on Customer.CustomerId = Invoice.CustomerId
                JOIN Employee on Employee.EmployeeId = Customer.SupportRepId
            GROUP BY Employee.EmployeeId
        )
    );