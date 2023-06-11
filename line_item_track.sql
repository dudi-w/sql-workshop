-- Provide a query that includes the purchased track name with each invoice line item.
SELECT InvoiceLineId, Track.Name
FROM InvoiceLine
join Track on InvoiceLine.TrackId = Track.TrackId
ORDER BY InvoiceLineId;