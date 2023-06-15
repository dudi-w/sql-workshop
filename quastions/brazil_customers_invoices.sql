-- Provide a query showing the Invoices of customers whoare from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
select Customer.FirstName , Customer.LastName , invoice.InvoiceId , invoice.InvoiceDate , invoice.BillingCountry
from invoice
join Customer on invoice.Customerid = Customer.Customerid
where invoice.BillingCountry like 'Brazil';