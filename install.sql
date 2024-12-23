CREATE TABLE IF NOT EXISTS `users` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(255) NOT NULL DEFAULT 'anonymous@litter.com' COLLATE 'utf8mb4_general_ci',
	`password` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rank` ENUM('owner','admin','user') NOT NULL DEFAULT 'user' COLLATE 'utf8mb4_general_ci',
	`created` DATE NULL DEFAULT current_timestamp(),
	`last_logins` JSON DEFAULT '[]' NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=8
;

CREATE TABLE IF NOT EXISTS pastes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL DEFAULT 'Untitled',
    content TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    pinned BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id)
)

