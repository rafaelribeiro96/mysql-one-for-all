SELECT 
    u.user_name AS usuario,
    COUNT(*) AS qt_de_musicas_ouvidas,
    ROUND(SUM(m.music_length) / 60, 2) AS total_minutos
FROM
    SpotifyClone.user AS u
INNER JOIN
    SpotifyClone.history AS h ON h.user_id = u.user_id
INNER JOIN
    SpotifyClone.music AS m ON m.music_id = h.music_id
GROUP BY usuario
ORDER BY usuario;