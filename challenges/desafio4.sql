SELECT 
    u.user_name AS pessoa_usuaria,
    IF(MAX(h.date) > '2020-12-31 23:59:59',
        'Ativa',
        'Inativa') AS status_pessoa_usuaria
FROM
    SpotifyClone.users AS u
        INNER JOIN
    SpotifyClone.history AS h ON u.user_id = h.user_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;