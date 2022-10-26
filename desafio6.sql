SELECT 
    ROUND(MIN(s.subscription_value), 2) AS faturamento_minimo,
    ROUND(MAX(s.subscription_value), 2) AS faturamento_maximo,
    ROUND(AVG(s.subscription_value), 2) AS faturamento_medio,
    ROUND(SUM(s.subscription_value), 2) AS faturamento_total
FROM
    user AS u
INNER JOIN
    subscription AS s ON s.subscription_id = u.subscription_id;