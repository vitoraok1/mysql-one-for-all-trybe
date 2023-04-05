SELECT 
    CASE
        WHEN u.age <= 30 THEN 'Até 30 anos'
        WHEN u.age BETWEEN 30 AND 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
    END AS faixa_etaria,
    COUNT(DISTINCT u.user_id) AS total_pessoas_usuarias,
    COUNT(f.user_id) AS total_favoritadas
FROM
    SpotifyClone.users AS u
        LEFT JOIN
    SpotifyClone.favorite_songs AS f ON u.user_id = f.user_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria;