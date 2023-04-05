SELECT 
    user_name AS pessoa_usuaria,
    COUNT(h.song_id) AS musicas_ouvidas,
    ROUND(SUM(seconds_length / 60), 2) AS total_minutos
FROM
    SpotifyClone.users AS u
        INNER JOIN
    SpotifyClone.history AS h ON u.user_id = h.user_id
        INNER JOIN
    SpotifyClone.songs AS s ON h.song_id = s.song_id
GROUP BY u.user_name
ORDER BY u.user_name;