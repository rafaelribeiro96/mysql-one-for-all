SELECT 
    art.artist_name AS artista,
    alb.album_name AS album,
    COUNT(*) AS seguidores
FROM
    artist AS art
INNER JOIN
    album AS alb ON alb.artist_id = art.artist_id
INNER JOIN
    following_artists AS f ON f.artist_id = art.artist_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;