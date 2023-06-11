-- Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
select Invoice.Total, (Customer.LastName||' '||Customer.FirstName) as CustomerName , (Employee.FirstName ||' '|| Employee.LastName) as [Sale Agent]
from Invoice
join Customer on Customer.CustomerId = Invoice.CustomerId
join Employee on Employee.EmployeeId = Customer.SupportRepId
