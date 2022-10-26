SELECT 
    m.music_name AS nome, COUNT(h.music_id) AS reproducoes
FROM
    history AS h
        INNER JOIN
    music AS m ON m.music_id = h.music_id
        INNER JOIN
    user AS u ON u.user_id = h.user_id
WHERE
    u.subscription_id IN (1, 4)
GROUP BY h.music_id
ORDER BY music_name;