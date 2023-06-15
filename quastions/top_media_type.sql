-- Provide a query that shows the most purchased Media Type.
SELECT MediaType.Name , count(InvoiceLine.InvoiceLineId)
FROM InvoiceLine
JOIN Track ON Track.TrackId = InvoiceLine.TrackId
JOIN MediaType ON MediaType.MediaTypeId = Track.MediaTypeId
GROUP BY MediaType.MediaTypeId
LIMIT 1;