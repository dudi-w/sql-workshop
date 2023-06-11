-- How many Invoices were there in 2009 and 2011?
SELECT count(*)
from Invoice
where strftime('%Y', InvoiceDate) like '2009' or strftime('%Y', InvoiceDate) like '2011';