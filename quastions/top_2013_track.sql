-- Provide a query that shows the most purchased track of 2013.
SELECT Track.Name,
    count(InvoiceLine.Quantity) as bestSale
FROM InvoiceLine
    JOIN Track ON Track.TrackId = InvoiceLine.TrackId
    JOIN Invoice ON Invoice.InvoiceId = InvoiceLine.InvoiceId
WHERE strftime('%Y', Invoice.InvoiceDate) = '2013'
GROUP BY InvoiceLine.TrackId
ORDER BY bestSale DESC
LIMIT 1;