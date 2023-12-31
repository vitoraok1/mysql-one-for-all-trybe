SELECT 
    FORMAT(MIN(price), 2) AS faturamento_minimo,
    FORMAT(MAX(price), 2) AS faturamento_maximo,
    FORMAT(AVG(price), 2) AS faturamento_medio,
    FORMAT(SUM(price), 2) AS faturamento_total
FROM
    SpotifyClone.users AS u
        INNER JOIN
    SpotifyClone.subscription_plans AS sp ON u.subscription_id = sp.subscription_id;