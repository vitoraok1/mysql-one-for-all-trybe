SELECT 
    a.artist_name AS artista,
    al.album_name AS album,
    COUNT(f.user_id) AS pessoas_seguidoras
FROM
    SpotifyClone.artists AS a
        INNER JOIN
    SpotifyClone.albums AS al ON a.artist_id = al.artist_id
        INNER JOIN
    SpotifyClone.followers AS f ON a.artist_id = f.artist_id
GROUP BY artista , album_name
ORDER BY pessoas_seguidoras DESC , artista , album;