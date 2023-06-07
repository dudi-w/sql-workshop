-- quastion 10. Provide a query that includes the track name with each invoice line item.
SELECT InvoiceLineId,
    InvoiceId,
        (SELECT Name
        FROM Track
        WHERE TrackId=InvoiceLine.TrackId) as TrackName,
    UnitPrice,
    Quantity
FROM InvoiceLine
ORDER BY TrackId;

-- quastion 10. Provide a query that includes the track name with each invoice line item.
SELECT I.InvoiceLineId, I.InvoiceId, I.UnitPrice, I.Quantity , T.name
FROM InvoiceLine AS I, Track AS T
WHERE T.TrackId=I.TrackId
ORDER BY T.TrackId;

-- quastion 10. Provide a query that includes the track name with each invoice line item.
SELECT I.InvoiceLineId, I.InvoiceId, I.UnitPrice, I.Quantity , T.name
from InvoiceLine AS I
    INNER JOIN Track AS T ON I.TrackId = T.TrackId
ORDER BY T.TrackId;