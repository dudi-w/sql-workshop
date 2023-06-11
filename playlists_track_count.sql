-- Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.
SELECT Playlist.Name , count(PlaylistTrack.TrackId)
from PlaylistTrack
join Playlist on Playlist.PlaylistId = PlaylistTrack.PlaylistId
GROUP BY PlaylistTrack.PlaylistId;