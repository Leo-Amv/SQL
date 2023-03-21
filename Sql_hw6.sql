-- 1

USE `vk`;
DROP function IF EXISTS `delete_all_info_about_user`;

USE `vk`;
DROP function IF EXISTS `vk`.`delete_all_info_about_user`;
;

DELIMITER $$
USE `vk`$$
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

-- 2

USE `vk`;
DROP procedure IF EXISTS `delete_info`;

DELIMITER $$
USE `vk`$$
CREATE PROCEDURE `delete_info` (check_user_id BIGINT UNSIGNED, OUT tran_result VARCHAR(200))
BEGIN
	DECLARE `_rollback` BIT DEFAULT 0;
    DECLARE code VARCHAR(100);
    DECLARE error_string VARCHAR(100);
	DECLARE user_phone_number BIGINT;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
		SET `_rollback` = 1;
	  GET stacked diagnostics condition 1
		 code = returned_sqlstate, error_string = message_text;
		SET tran_result := concat('CODE: ', code, '. ERROR: ', error_string);
	END;
			
    SET user_phone_number = (
		SELECT phone
        FROM vk.users
        WHERE users.id = check_user_id
    );
	START TRANSACTION;
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
        
        IF `_rollback` THEN
			ROLLBACK;
		ELSE
			SET tran_result := user_phone_number;
			COMMIT;
		END IF;
END$$

DELIMITER ;

CALL delete_info(5,@tran_result);
SELECT @tran_result;

