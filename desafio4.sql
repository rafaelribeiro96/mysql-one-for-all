SELECT 
  u.user_name AS usuario,
	IF (YEAR(MAX(h.reproduction_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM 
  user AS u
INNER JOIN 
  history AS h ON h.user_id = u.user_id
GROUP BY usuario
ORDER BY usuario;