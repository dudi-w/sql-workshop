-- Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
select *
FROM Invoice
join Customer on Customer.CustomerId = Invoice.CustomerId