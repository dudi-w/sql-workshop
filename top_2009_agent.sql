-- Which sales agent made the most in sales in 2009?
SELECT Employee.LastName || ' ' || Employee.FirstName as [Agent Name],
    sum(Invoice.Total) as sumTotal
FROM Invoice
    JOIN Customer on Customer.CustomerId = Invoice.CustomerId
    JOIN Employee on Employee.EmployeeId = Customer.SupportRepId
WHERE strftime('%Y', InvoiceDate) = '2009'
GROUP BY Employee.EmployeeId
ORDER By sumTotal DESC
limit 1;