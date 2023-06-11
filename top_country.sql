-- Which country's customers spent the most?
SELECT BillingCountry,
    sum(Invoice.Total) as CountryTotal
FROM Invoice
GROUP BY BillingCountry
ORDER BY CountryTotal DESC
LIMIT 1;