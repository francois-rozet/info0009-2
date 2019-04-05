LOAD DATA LOCAL INFILE '/home/s161024/WWW/resources/csv/load/institutions.csv' INTO TABLE institutions
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/s161024/WWW/resources/csv/load/conferences.csv' INTO TABLE conferences
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/s161024/WWW/resources/csv/load/revues.csv' INTO TABLE revues
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/s161024/WWW/resources/csv/load/auteurs.csv' INTO TABLE auteurs
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(`matricule`, `nom`, `prenom`, @DATE_STR, `nom_institution`)
SET `debut_doctorat` = STR_TO_DATE(@DATE_STR, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/s161024/WWW/resources/csv/load/participations_conferences.csv' INTO TABLE participations
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/s161024/WWW/resources/csv/load/articles.csv' INTO TABLE articles
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(`url`, `doi`, `titre`, @DATE_STR, `matricule_auteur`)
SET `date_publication` = STR_TO_DATE(@DATE_STR, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/s161024/WWW/resources/csv/load/seconds_auteurs.csv' INTO TABLE seconds_auteurs
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/s161024/WWW/resources/csv/load/sujets_articles.csv' INTO TABLE sujets_articles
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/s161024/WWW/resources/csv/load/articles_conferences.csv' INTO TABLE articles_conferences
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/s161024/WWW/resources/csv/load/articles_journaux.csv' INTO TABLE articles_journaux
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;