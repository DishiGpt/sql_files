-- Create database and use it
CREATE DATABASE gaming_platform;
USE gaming_platform;

-- Create tables
CREATE TABLE games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    game_name VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_date DATE,
    developer VARCHAR(100)
);

CREATE TABLE players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    registration_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE scores (
    score_id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    game_id INT NOT NULL,
    score INT NOT NULL,
    score_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE
);

CREATE TABLE tournaments (
    tournament_id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_name VARCHAR(100) NOT NULL,
    game_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    prize_pool DECIMAL(10, 2),
    FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE
);
INSERT INTO players (username, email, registration_date, age) VALUES
('PlayerOne', 'playerone@example.com', '2024-01-15', 25),
('GamerX', 'gamerx@example.com', '2024-02-10', 30),
('DragonSlayer', 'dragonslayer@example.com', '2024-03-05', 28),
('ShadowNinja', 'shadowninja@example.com', '2024-04-20', 22),
('SpaceExplorer', 'spaceexplorer@example.com', '2024-05-17', 27),
('SpeedRacer', 'speedracer@example.com', '2024-06-30', 24),
('BattleMage', 'battlemage@example.com', '2024-07-25', 26),
('CyberKnight', 'cyberknight@example.com', '2024-08-19', 29),
('IronFist', 'ironfist@example.com', '2024-09-12', 23),
('StarChaser', 'starchaser@example.com', '2024-10-03', 31);

INSERT INTO games (game_name, genre, release_date, developer) VALUES
('Game One', 'Action', '2021-05-01', 'DevStudio A'),
('Game Two', 'Adventure', '2020-08-15', 'DevStudio B'),
('Game Three', 'Puzzle', '2019-03-10', 'PuzzleWorks'),
('Game Four', 'RPG', '2022-01-20', 'FantasyTech'),
('Game Five', 'Shooter', '2020-11-11', 'ShooterPro'),
('Game Six', 'Simulation', '2023-04-22', 'SimWorld'),
('Game Seven', 'Sports', '2021-09-05', 'SportsTech'),
('Game Eight', 'Strategy', '2018-07-18', 'ThinkTank Games'),
('Game Nine', 'MMORPG', '2023-02-10', 'OnlineWorld'),
('Game Ten', 'Horror', '2022-10-31', 'ScaryGames Inc.');

INSERT INTO scores (player_id, game_id, score, score_date) VALUES
(1, 1, 500, '2024-01-01 10:00:00'),
(2, 2, 450, '2024-01-02 11:00:00'),
(3, 3, 600, '2024-01-03 12:00:00'),
(4, 4, 700, '2024-01-04 13:00:00'),
(5, 5, 550, '2024-01-05 14:00:00'),
(6, 6, 480, '2024-01-06 15:00:00'),
(7, 7, 650, '2024-01-07 16:00:00'),
(8, 8, 400, '2024-01-08 17:00:00'),
(9, 9, 530, '2024-01-09 18:00:00'),
(10, 10, 750, '2024-01-10 19:00:00');

INSERT INTO tournaments (tournament_name, game_id, start_date, end_date, prize_pool) VALUES
('Spring Championship', 1, '2024-03-01', '2024-03-10', 1000.00),
('Summer Showdown', 2, '2024-06-01', '2024-06-15', 2000.00),
('Autumn Clash', 3, '2024-09-01', '2024-09-10', 1500.00),
('Winter League', 4, '2024-12-01', '2024-12-20', 2500.00),
('Pro Gaming Cup', 5, '2024-05-01', '2024-05-15', 3000.00),
('Elite Arena', 6, '2024-07-01', '2024-07-10', 1800.00),
('Global Masters', 

-- ALTER TABLE: Add a column
ALTER TABLE players ADD COLUMN age INT;

-- DROP TABLE
DROP TABLE tournaments;

-- TRUNCATE TABLE
TRUNCATE TABLE scores;

-- GRANT
GRANT SELECT, INSERT ON gaming_platform.* TO 'user'@'localhost';

-- REVOKE
REVOKE INSERT ON gaming_platform.* FROM 'user'@'localhost';

-- COMMIT & ROLLBACK
START TRANSACTION;
INSERT INTO players (username, email) VALUES ('test_user', 'test@example.com');
ROLLBACK;

-- RENAME TABLE
RENAME TABLE players TO gamers;

-- WHERE clause
SELECT * FROM games WHERE genre = 'Action';

-- GROUP BY and HAVING
SELECT game_id, AVG(score) AS avg_score
FROM scores
GROUP BY game_id
HAVING avg_score > 50;

-- ORDER BY
SELECT * FROM players ORDER BY registration_date DESC;

-- AND, OR, NOT
SELECT * FROM games WHERE genre = 'Action' AND release_date > '2020-01-01';

-- LIKE, NOT LIKE
SELECT * FROM players WHERE username LIKE 'A%';
SELECT * FROM players WHERE username NOT LIKE 'B%';

-- IN, NOT IN
SELECT * FROM games WHERE genre IN ('Action', 'Adventure');
SELECT * FROM games WHERE genre NOT IN ('Puzzle');

-- UNION
SELECT game_name FROM games WHERE genre = 'Action'
UNION
SELECT game_name FROM games WHERE genre = 'Adventure';

-- EXISTS
SELECT * FROM players WHERE EXISTS (SELECT 1 FROM scores WHERE scores.player_id = players.player_id);

-- INNER JOIN
SELECT p.username, g.game_name, s.score
FROM scores s
INNER JOIN players p ON s.player_id = p.player_id
INNER JOIN games g ON s.game_id = g.game_id;

-- LEFT JOIN
SELECT p.username, s.score
FROM players p
LEFT JOIN scores s ON p.player_id = s.player_id;

-- RIGHT JOIN
SELECT g.game_name, s.score
FROM games g
RIGHT JOIN scores s ON g.game_id = s.game_id;

-- CROSS JOIN
SELECT p.username, g.game_name
FROM players p
CROSS JOIN games g;

-- SUM
SELECT game_id, SUM(score) AS total_score FROM scores GROUP BY game_id;

-- AVG
SELECT game_id, AVG(score) AS average_score FROM scores GROUP BY game_id;

-- MIN, MAX
SELECT MIN(score), MAX(score) FROM scores;

-- COUNT
SELECT COUNT(*) AS total_players FROM players;

-- Uppercase and Lowercase
SELECT UPPER(username), LOWER(username) FROM players;

-- LTRIM, RTRIM
SELECT LTRIM(username), RTRIM(username) FROM players;

-- Date and Current Date
SELECT registration_date, CURDATE() AS current_date FROM players;

-- Length
SELECT LENGTH(username) FROM players;

-- Insert Trigger
DELIMITER //
CREATE TRIGGER before_player_insert
BEFORE INSERT ON players
FOR EACH ROW
BEGIN
    SET NEW.registration_date = CURDATE();
END;
//
DELIMITER ;

-- Update Trigger
DELIMITER //
CREATE TRIGGER after_score_update
AFTER UPDATE ON scores
FOR EACH ROW
BEGIN
    INSERT INTO scores_log (score_id, old_score, new_score, updated_at)
    VALUES (OLD.score_id, OLD.score, NEW.score, NOW());
END;
//
DELIMITER ;
