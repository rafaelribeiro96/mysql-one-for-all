SELECT 
  m.music_name AS cancao, COUNT(h.user_id) AS reproducoes 
FROM 
  music m
	  INNER JOIN 
  history h ON m.music_id = h.music_id
  GROUP BY cancao
  ORDER BY reproducoes DESC, cancao
  LIMIT 2;