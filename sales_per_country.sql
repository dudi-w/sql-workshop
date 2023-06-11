-- Provide a query that shows the total sales per country.
SELECT BillingCountry , sum(Invoice.Total)
FROM Invoice
GROUP BY BillingCountry;