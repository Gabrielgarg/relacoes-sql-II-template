-- Active: 1680697105859@@127.0.0.1@3306

-- Práticas

CREATE TABLE
    users(
        id TEXT UNIQUE PRIMARY KEY NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        created_at TEXT DEFAULT(DATETIME()) NOT NULL
    );

INSERT INTO
    users (id, name, email, password)
VALUES (
        "1",
        "gabriel",
        "gabriel123@gmail.com",
        "gabriel123"
    ), (
        "2",
        "lucas",
        "lucas123@gmail.com",
        "lucas123"
    ), (
        "3",
        "felipe",
        "felipe123@gmail.com",
        "felipe123"
    );

SELECT * from users;

CREATE TABLE
    follows (
        follower_id TEXT NOT NULL,
        followed_id TEXT NOT NULL,
        FOREIGN KEY (follower_id) REFERENCES users(id),
        FOREIGN KEY (followed_id) REFERENCES users(id)
    );

DROP TABLE follows;

-- Pessoa A segue B e C, e pessoa B segue A, e C não segue ninguém

INSERT INTO
    follows (follower_id, followed_id)
VALUES ("1", "2"), ("1", "3"), ("2", "1");

SELECT * from follows;

SELECT *
from users
    INNER JOIN follows ON users.id = follows.follower_id;

SELECT *
FROM users
    LEFT JOIN follows ON users.id = follows.follower_id;

SELECT
    users.id AS userId,
    users.name AS userName,
    users.email,
    users.created_at,
    follows.followed_id AS followedID,
    usersFollowed.name AS followedName
FROM users
    LEFT JOIN follows ON users.id = follows.follower_id
    LEFT JOIN users AS usersFollowed ON follows.followed_id = usersfollowed.id;