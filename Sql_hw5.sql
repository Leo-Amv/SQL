-- 1

CREATE OR REPLACE VIEW friendly_user AS
SELECT
from_user_id AS user_id, users.firstname, users.lastname,
COUNT(*) AS messages
FROM messages
JOIN users ON users.id = messages.from_user_id
WHERE to_user_id = 9
GROUP BY from_user_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 2

SELECT * FROM friendly_user;

-- 3

DROP VIEW friendly_user;

-- 4

SELECT 
	COUNT(*) AS news_count,
	user_id,
	email AS user_email
FROM media
JOIN users ON users.id = media.user_id 
GROUP BY user_id;