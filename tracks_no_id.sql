-- Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
SELECT Track.Name,
    Album.Title,
    MediaType.Name,
    Genre.Name
from Track
    join Album on Album.AlbumId = Track.AlbumId
    join MediaType on MediaType.MediaTypeId = Track.MediaTypeId
    join Genre on Genre.GenreId = Track.GenreId