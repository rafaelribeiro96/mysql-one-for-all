DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artist(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(90) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(90) NOT NULL,
  release_year YEAR NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
) ENGINE=InnoDB;

CREATE TABLE music(
  music_id INT PRIMARY KEY AUTO_INCREMENT,
  music_name VARCHAR(90) NOT NULL,
  music_length INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(album_id)
) ENGINE=InnoDB;

CREATE TABLE subscription(
  subscription_id INT PRIMARY KEY AUTO_INCREMENT,
  subscription_name VARCHAR(90) NOT NULL,
  subscription_value DECIMAL(5,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE user(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(90) NOT NULL,
  user_age INT NOT NULL,
  subscription_id INT NOT NULL,
  subscribe_date DATE NOT NULL,
  FOREIGN KEY (subscription_id) REFERENCES subscription(subscription_id)
) ENGINE=InnoDB;

CREATE TABLE history(
  user_id INT NOT NULL,
  music_id INT NOT NULL,
  reproduction_date DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, music_id),
    FOREIGN KEY (music_id) REFERENCES music(music_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
) ENGINE=InnoDB;

CREATE TABLE following_artists(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
) ENGINE=InnoDB;

INSERT INTO artist(artist_name) VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO album(album_name, release_year, artist_id) VALUES
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 4),
  ('Somewhere Far Beyond', 2007, 5),
  ('I Put A Spell On You', 2012, 6);

INSERT INTO music(music_name, music_length, album_id) VALUES
  ('BREAK MY SOUL', 279, 1),
  ('VIRGO’S GROOVE', 369, 1),
  ('ALIEN SUPERSTAR', 116, 1),
  ('Don’t Stop Me Now', 203, 2),
  ('Under Pressure', 152, 3),
  ('Como Nossos Pais', 105, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
  ('Samba em Paris', 267, 6),
  ('The Bard’s Song', 244, 7),
  ('Feeling Good', 100, 8);

INSERT INTO subscription(subscription_name, subscription_value) VALUES
  ('gratuito', 00.00),
  ('familiar', 07.99),
  ('universitario', 05.99),
  ('pessoal', 6.99);

INSERT INTO user(user_name, user_age, subscription_id, subscribe_date) VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler', 46, 2, '2017-01-17'),
  ('Sandi Metz', 58, 2, '2018-04-29'),
  ('Paulo Freire', 19, 3, '2018-02-14'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander', 85, 4, '2019-06-05'),
  ('Judith Butler', 45, 4, '2020-05-13'),
  ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO history(user_id, music_id, reproduction_date) VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-06-03 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');

INSERT INTO following_artists(user_id, artist_id) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (9, 2);