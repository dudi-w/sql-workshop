-- Provide a query that shows the top 5 most purchased tracks over all.
SELECT Track.Name, count(InvoiceLine.Quantity) as bestSale
FROM InvoiceLine
    JOIN Track ON Track.TrackId = InvoiceLine.TrackId
GROUP BY InvoiceLine.TrackId
ORDER BY bestSale DESC
LIMIT 5;
