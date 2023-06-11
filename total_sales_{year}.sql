--  What are the respective total sales for each of those years?
SELECT strftime('%Y', InvoiceDate) as year, sum(Total)
FROM Invoice
where year in ('2009' , '2011')
GROUP BY year;