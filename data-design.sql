use fgallegos59;
ALTER DATABASE fgallegos59 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS feedback;
DROP TABLE IF EXISTS content;
DROP TABLE IF EXISTS user;

CREATE TABLE user(
     userId BINARY(16) NOT NULL,
     userEmail VARCHAR(128) NOT NULL,
     userHash CHAR(97) NOT NULL,
     userName VARCHAR(32) NOT NULL,
     userActivationToken CHAR (32),
     UNIQUE(userEmail),
     UNIQUE(userName),
     INDEX(userEmail),
     PRIMARY KEY(userId)
);

CREATE TABLE content(
    contentId BINARY(16) NOT NULL,
    contentGenre VARCHAR(128) NOT NULL,
    contentName VARCHAR(32) NOT NULL,
    UNIQUE (contentId),
    UNIQUE (contentName),
    INDEX (contentName),
    PRIMARY KEY (contentId)
);

CREATE TABLE feedback(
    feedbackId BINARY (16) NOT NULL,
    feedbackUserId BINARY (16) NOT NULL,
    feedbackContentId BINARY (16) NOT NULL,
    PRIMARY KEY (feedbackId),
    FOREIGN KEY (feedbackUserId) REFERENCES user(userID) ,
    FOREIGN KEY (feedbackContentId) REFERENCES content(contentId)
);

