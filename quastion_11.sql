-- quastion 11. Provide a query that includes the track name with each invoice line item, only for customer from Germany
SELECT InvoiceLineId,
    InvoiceId,
    UnitPrice,
    Quantity,
    (SELECT Name
    FROM Track
    WHERE TrackId=InvoiceLine.TrackId) as TrackName
FROM InvoiceLine
WHERE (SELECT BillingCountry
    FROM Invoice
    WHERE InvoiceId=InvoiceLine.InvoiceId) LIKE 'Germany'
ORDER BY TrackId;

-- quastion 11. Provide a query that includes the track name with each invoice line item, only for customer from Germany
SELECT I1.InvoiceLineId, I1.InvoiceId, I1.UnitPrice, I1.Quantity, T.name
from InvoiceLine AS I1
    INNER JOIN Track AS T ON I1.TrackId = T.TrackId
    INNER JOIN Invoice AS I2 ON I2.InvoiceId = I1.InvoiceId
    WHERE I2.BillingCountry LIKE 'Germany'
ORDER BY T.TrackId;