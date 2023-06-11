-- Provide a query that shows the top 3 best selling artists.
SELECT Artist.Name , count(InvoiceLineid) AS  bestSellingArtists
FROM InvoiceLine
JOIN Track ON Track.TrackId = InvoiceLine.TrackId
JOIN Album on Album.AlbumId = Track.TrackId
JOIN Artist ON Artist.ArtistId = Album.ArtistId
GROUP BY Album.ArtistId
ORDER BY bestSellingArtists DESC
LIMIT 3;