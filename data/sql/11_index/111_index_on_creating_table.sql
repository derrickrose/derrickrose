DROP TABLE IF EXISTS Animal;

CREATE TABLE Animal (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    espece VARCHAR(40) NOT NULL,
    sexe CHAR(1),
    date_naissance DATETIME NOT NULL,
    nom VARCHAR(30),
    commentaires TEXT,
    PRIMARY KEY (id),
    INDEX ind_date_naissance (date_naissance),  -- index sur la date de naissance
    INDEX ind_nom (nom(10))                     -- index sur le nom (le chiffre entre parenthèses étant le nombre de caractères pris en compte)
)
ENGINE=INNODB;