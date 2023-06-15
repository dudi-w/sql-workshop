-- Provide a query that shows the most purchased Media Type.
SELECT Genre.Name,
    count(InvoiceLine.InvoiceLineId)
FROM InvoiceLine
    JOIN Track ON Track.TrackId = InvoiceLine.TrackId
    JOIN Genre ON Genre.GenreId = Track.GenreId
GROUP BY Genre.GenreId
LIMIT 1;