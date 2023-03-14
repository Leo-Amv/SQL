-- 1

SELECT user_id,
(SELECT firstname
FROM vk.users
WHERE user_id = vk.users.id) AS user_name,
(SELECT lastname
FROM vk.users
WHERE user_id = vk.users.id) AS user_lastname,
COUNT(*) AS number_of_groups
FROM vk.users_communities
GROUP BY user_id;

-- 2

SELECT community_id,
(SELECT name FROM vk.communities WHERE id = vk.users_communities.community_id) AS group_name,
COUNT(*) AS users
FROM vk.users_communities
GROUP BY community_id;

-- 3

SELECT
from_user_id AS user_id, users.firstname, users.lastname,
COUNT(*) AS messages
FROM messages
JOIN users ON users.id = messages.from_user_id
WHERE to_user_id = 9
GROUP BY from_user_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 4

SELECT COUNT(*) AS likes
FROM vk.likes
JOIN users ON likes.user_id = users.id
JOIN profiles ON users.id = profiles.user_id
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 19;