CREATE DATABASE SearchEngine;

CREATE TABLE SearchEngine.Word(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Token NVARCHAR(60) UNIQUE NOT NULL,
    CONSTRAINT C_Token CHECK(LENGTH(Token) >= 3)
);

CREATE TABLE SearchEngine.Domain(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Host NVARCHAR(1024) UNIQUE NOT NULL,
    CONSTRAINT C_Host CHECK(LENGTH(Host) > 3)
);

CREATE TABLE SearchEngine.Link(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Path NVARCHAR(1024) UNIQUE NOT NULL,
    HostID INTEGER NOT NULL,
    FOREIGN KEY (HostID) REFERENCES Domain (ID),
    CONSTRAINT C_Path CHECK(Path <> '')
);

CREATE TABLE SearchEngine.WordLink(
    WordID INTEGER NOT NULL,
    LinkID INTEGER NOT NULL,
    Count INTEGER NOT NULL,
    FOREIGN KEY (WordID) REFERENCES Word (ID)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (LinkID) REFERENCES Link (ID)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT C_Count CHECK(Count > 0)
);

CREATE TABLE SearchEngine.Graph(
    Source INTEGER NOT NULL,
    Destination INTEGER NOT NULL,
    Count INTEGER NOT NULL DEFAULT 1, 
    FOREIGN KEY (Source) REFERENCES Link (ID)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (Destination) REFERENCES Link (ID)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    constraint k check (Count > 0)
);
