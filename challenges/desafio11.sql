SELECT 
    a.album_name AS album, COUNT(f.song_id) AS favoritadas
FROM
    SpotifyClone.albums AS a
        INNER JOIN
    SpotifyClone.songs AS s ON a.album_id = s.album_id
        INNER JOIN
    SpotifyClone.favorite_songs AS f ON s.song_id = f.song_id
GROUP BY a.album_name
ORDER BY favoritadas DESC , album
LIMIT 3;