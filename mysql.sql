SELECT DISTINCT ArtistId  , AlbumId
FROM Album;

SELECT Title
FROM Album;

SELECT count(DISTINCT Title)
FROM Album;

SELECT FirstName , State
FROM Customer
WHERE State LIKE 'NULL'
ORDER by State
LIMIT 7;

SELECT FirstName , State
FROM Customer
WHERE State<>NULL
ORDER BY State
LIMIT 7;

SELECT FirstName , State
FROM Customer
WHERE NOT State IS NULL
ORDER by LastName;

-- quastion 1. all customer not from the USA
SELECT *
FROM Customer
WHERE Country<>'USA'
LIMIT 50;

-- quastion 2. show all invoices for customer from USE but not from CA
SELECT *
FROM
    (SELECT *
    FROM Invoice
    WHERE BillingCountry='USA')
WHERE BillingState<>'CA';

-- quastion 2. show all invoices for customer from USE but not from CA
SELECT *
FROM Invoice
WHERE BillingCountry='USA' AND BillingState<>'CA';

-- quastion 3. 

SELECT count(FirstName)
FROM Customer
WHERE Country LIKE 'Brazil' OR Country LIKE 'France';

-- quastion 3
SELECT count(FirstName)
FROM Customer
WHERE Country LIKE 'Brazil' OR 'France';

-- quastion 4
SELECT *
FROM Invoice
WHERE BillingCountry='France' AND Total=(SELECT MAX(Total) FROM Invoice WHERE BillingCountry='France');


-- quastion 4
SELECT *
FROM Invoice
WHERE BillingCountry='France'
ORDER BY Total DESC
LIMIT 1;

-- quastion 5
SELECT SUM(InvoiceId)
FROM Invoice
WHERE BillingCountry='Ireland';

-- quastion 6
SELECT count(*)
FROM Invoice
WHERE BillingCountry LIKE '%and';

-- quastion 7. What is the number of orders for each country
SELECT BillingCountry,  count(BillingCountry) as amount
FROM Invoice
GROUP BY BillingCountry
ORDER BY amount DESC;

-- quastion 8. What is the number of orders for each country that end in and.
SELECT BillingCountry,  count(BillingCountry) as amount
FROM Invoice
WHERE BillingCountry LIKE '%and'
GROUP BY BillingCountry
ORDER BY amount DESC;

-- quastion 9. What countries have total order cost (money) that is above the average of all countries
SELECT BillingCountry,  sum(Total) as sumTotal
FROM Invoice
GROUP BY BillingCountry
HAVING sumTotal > (
    SELECT avg(Total)
    FROM(
        SELECT BillingCountry, sum(Total) as Total
        FROM Invoice
        GROUP BY BillingCountry)
        )
ORDER BY sumTotal DESC;

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

-- quastion 11. Provide a query that includes the track name with each invoice line item, only for customer from Germany
SELECT InvoiceLineId,
    InvoiceId,
    (SELECT Name
    FROM Track
    WHERE TrackId=InvoiceLine.TrackId) as TrackName,
    UnitPrice,
    Quantity
FROM InvoiceLine
WHERE (SELECT BillingCountry
    FROM Invoice
    WHERE InvoiceId=InvoiceLine.InvoiceId) LIKE 'Germany'
ORDER BY TrackId;
