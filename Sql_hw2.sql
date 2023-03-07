-- 2

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`city` VARCHAR(255) NOT NULL
    );
ALTER TABLE `profiles` ADD COLUMN city_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE `profiles` ADD CONSTRAINT fk_profiles_city_id
    FOREIGN KEY (city_id) REFERENCES cities(id);

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
	`media_id` BIGINT unsigned NOT NULL,

    FOREIGN KEY (media_id) REFERENCES media(id)
);
ALTER TABLE `profiles` ADD CONSTRAINT fk_profiles_photo_id
	FOREIGN KEY (photo_id) REFERENCES photos(id);
    
-- 3

INSERT INTO `users` VALUES 
('Petr', 'Petrov', 'adfg12@example.org', '9134351134'),
('Alex', 'ALexov', 'retyr3@gmail.org', '9134154334'),
('Fedor', 'Fedorov', 'jhkg23@yandex.org', '9456746575'),
('Misha', 'Mishev', 'hjgkt3@mail.org', '9786976565'),
('Oleg', 'Olegov', 'lbnl33@hotmail.org', '9234452136'),
('Vitya', 'Petrov', 'kjljkl@example.org', '9768976435'),
('Vika', 'Petrova', 'vcbes2@gmail.org', '9768969785'),
('Ola', 'Afga', 'nvbrt2@yandex.org', '9345574663'),
('Nadya', 'Nizf', 'vcioup@mail.org', '9123123421'),
('Lida', 'Polfi', 'oiupo7@hotmail.org', '9456657567');

-- 5

DELETE FROM messages
WHERE created_at > NOW();