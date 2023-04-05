DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.subscription_plans(
  subscription_id INT AUTO_INCREMENT PRIMARY KEY,
  plan VARCHAR(50) NOT NULL,
  price DECIMAL(4, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(50) NOT NULL,
  age TINYINT NOT NULL,
  subscription_id INT NOT NULL,
  subscription_date DATE NOT NULL,
  FOREIGN KEY(subscription_id) REFERENCES subscription_plans(subscription_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_name VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.followers(
  artist_id INT,
  user_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY(artist_id, user_id),
  FOREIGN KEY(artist_id) REFERENCES artists(artist_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
  album_id INT AUTO_INCREMENT PRIMARY KEY,
  album_name VARCHAR(50) NOT NULL,
  artist_id INT,
  release_year YEAR NOT NULL,
  FOREIGN KEY(artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
  song_id INT AUTO_INCREMENT PRIMARY KEY,
  album_id INT,
  song_name VARCHAR(50) NOT NULL,
  seconds_length INT NOT NULL,
  FOREIGN KEY(album_id) REFERENCES albums(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
  user_id INT,
  song_id INT,
  date DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, song_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  FOREIGN KEY(song_id) REFERENCES songs(song_id)
) engine = InnoDB;

INSERT INTO
  SpotifyClone.subscription_plans (plan, price)
VALUES
  ('gratuito', 0.00),
  ('universitario', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

INSERT INTO
  SpotifyClone.users(
    user_name,
    age,
    subscription_id,
    subscription_date
  )
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 4, '2017-12-30'),
  ('Martin Fowler', 46, 4, '2017-01-17'),
  ('Sandi Metz', 58, 4, '2018-04-29'),
  ('Paulo Freire', 19, 2, '2018-02-14'),
  ('Bell Hooks', 26, 2, '2018-01-05'),
  ('Christopher Alexander', 85, 3, '2019-06-05'),
  ('Judith Butler', 45, 3, '2020-05-13'),
  ('Jorge Amado', 58, 3, '2017-02-17');

INSERT INTO
  SpotifyClone.artists(artist_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.followers (user_id, artist_id)
VALUES
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
  (10, 2);

INSERT INTO
  SpotifyClone.albums(
    album_name,
    artist_id,
    release_year
  )
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

INSERT INTO
  SpotifyClone.songs(
    song_name,
    album_id,
    seconds_length
  )
VALUES
  ("BREAK MY SOUL", 1, 279),
  ("VIRGO'S GROOVE", 1, 369),
  ("ALIEN SUPERSTAR", 1, 116),
  ("Don't Stop Me Now", 2, 203),
  ("Under Pressure", 3, 152),
  ("Como Nossos Pais", 4, 105),
  ("O Medo de Amar é o Medo de Ser Livre", 5, 207),
  ("Samba em Paris", 6, 267),
  ("The Bard's Song", 7, 244),
  ("Feeling Good", 8, 100);

INSERT INTO
  SpotifyClone.history(user_id, song_id, date)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:3'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');