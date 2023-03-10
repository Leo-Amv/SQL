-- 1

SELECT DISTINCT firstname
FROM vk.users
ORDER BY firstname;

-- 2

SELECT COUNT(*)
FROM vk.profiles
WHERE gender='m' AND (birthday + INTERVAL 35 YEAR) < NOW(); -- TIMESTAMPDIFF (YEAR, birthday, NOW()) > 34

-- 3

SELECT COUNT(*) AS requests, status
FROM vk.friend_requests
GROUP BY status;

-- 4

SELECT COUNT(*) AS requests, initiator_user_id 
FROM vk.friend_requests
GROUP BY initiator_user_id
LIMIT 1;

-- 5

SELECT id, name
FROM vk.communities
WHERE name LIKE '_____';