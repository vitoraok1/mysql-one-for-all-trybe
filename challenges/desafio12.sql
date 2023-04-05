SELECT 
    a.artist_name AS artista,
    CASE 
        WHEN COUNT(f.song_id) >= 5 THEN 'A'
        WHEN COUNT(f.song_id) BETWEEN 3 AND 5 THEN 'B'
        WHEN COUNT(f.song_id) BETWEEN 1 AND 3 THEN 'C'
        ELSE '-'
    END AS ranking
FROM
    SpotifyClone.artists AS a
        INNER JOIN
    SpotifyClone.albums AS al ON a.artist_id = al.artist_id
        INNER JOIN
    SpotifyClone.songs AS s ON al.album_id = s.album_id
        LEFT JOIN
    SpotifyClone.favorite_songs AS f ON s.song_id = f.song_id
GROUP BY artista
ORDER BY COUNT(f.song_id) DESC , artista;