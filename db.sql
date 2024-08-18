
CREATE DATABASE `spotify-cloning`

USE `spotify-cloning`;

-- table of user
CREATE TABLE `User` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `birthday` DATE,
    PRIMARY KEY (`id`)
) engine=InnoDB;

-- table of artist
CREATE TABLE `Artist` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `instagram` VARCHAR(255),
    `twitter` VARCHAR(255),
    `wikipedia` VARCHAR(255),
    `bio` TEXT,
    PRIMARY KEY (`id`)
) engine=InnoDB;

-- table of song
CREATE TABLE `Song` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `album_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `duration` INT,
    PRIMARY KEY (`id`)
) engine=InnoDB;

-- table of album
CREATE TABLE `Album` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `release` YEAR,
    `image` VARCHAR(255),
    PRIMARY KEY (`id`)
) engine=InnoDB;

-- table of playlist
CREATE TABLE `Playlist` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `category_id` INT,
    `user_id` INT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `image` VARCHAR(255),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `User`(`id`),
    FOREIGN KEY (`category_id`) REFERENCES `PlaylistCatagory`(`id`)
) engine=InnoDB;

-- category of playlist
CREATE TABLE `PlaylistCatagory` (
    `id` INT NOT NULL auto_increment,
    `name` VARCHAR(255) NOT NULL,
    `icon` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
)engine=InnoDB;

-- podcast of user
CREATE TABLE `Podcast` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `podcastCategory_id` INT,
    `title` VARCHAR(255) NOT NULL,
    `about` TEXT,
    `description` TEXT,
    `image` VARCHAR(255),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `User`(`id`),
    FOREIGN KEY (`podcastCategory_id`) REFERENCES `PodcastCategory` (`id`)
) engine=InnoDB;

-- category of podcast
CREATE TABLE `PodcastCategory` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(250) NOT NULL,
    `icon` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
)engine=InnoDB;

-- episode of podcast
CREATE TABLE `episode`(
    `id` INT NOT NULL auto_increment,
    `podcast_id` INT NOT NULL,
    `description` TEXT,
    `published_at` DATE,
    `duration` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`podcast_id`) REFERENCES `podcast`(`id`)
)engine=InnoDB

-- table of concert
CREATE TABLE `Concert`(
    `id` INT NOT NULL auto_increment,
    `location` VARCHAR(255) NOT NULL,
    `event_at` DATE NOT NULL,
    `artist_id` INT NOT NULL,
    `ion` DOUBLE,
    `iat` DOUBLE,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`artist_id`) REFERENCES `Artist`(`id`)
) engine=InnoDB


--follow artist and user
CREATE TABLE `follow_artist_by_user` (
    `id`  INT NOT NULL auto_increment,
    `id_user` INT NOT NULL,
    `id_artist` INT NOT NULL,
    PRIMARY KEY (`id`)
) engine=InnoDB;

-- follow playlist by user
CREATE Table `followPlaylist` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `playlist_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) engine=InnoDB;

-- content of playlist song
CREATE Table `playlistContent` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `playlist_id` INT NOT NULL,
    `song_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) engine=InnoDB;

-- sing artist of song
CREATE Table `singerArtist` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `song_id` INT NOT NULL,
    `artist_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) engine=InnoDB;

-- album has of artist
CREATE Table `artistAlbum` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `artist_id` INT NOT NULL,
    `album_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) engine=InnoDB;

-- contains album of songs
CREATE TABLE `songAlbum` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `song_id` INT NOT NULL,
    `album_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
)

-- like song by user
CREATE TABLE `like_song_by_user` (
    `id` INT NOT NULL auto_increment,
    `user_id` INT NOT NULL,
    `song_id` INT NOT NULL,
    PRIMARY KEY (`id`)
) engine=InnoDB;

