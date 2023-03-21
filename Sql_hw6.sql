DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `delete_all_info_about_user`(check_user_id BIGINT UNSIGNED) RETURNS bigint
    READS SQL DATA
BEGIN
	DECLARE user_phone_number BIGINT;
    SET user_phone_number = (
		SELECT phone
        FROM vk.users
        WHERE users.id = check_user_id
    );
    DELETE FROM vk.users
    WHERE users.id = check_user_id;
    
    DELETE FROM vk.messages
    WHERE messages.from_user_id = check_user_id OR messages.to_user_id = check_user_id;
    
    DELETE FROM vk.likes
    WHERE likes.user_id = check_user_id;
    
    DELETE FROM vk.media
    WHERE media.user_id = check_user_id;
    
    DELETE FROM vk.profiles
    WHERE profiles.user_id = check_user_id;
    
RETURN user_phone_number;
END$$
DELIMITER ;


