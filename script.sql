<<<<<<< HEAD
DROP DATABASE IF EXISTS tp_gestion_notes;   
=======
DROP DATABASE IF EXISTS tp_gestion_notes;
>>>>>>> DEV

CREATE DATABASE tp_gestion_notes;
USE tp_gestion_notes;

CREATE TABLE users (
<<<<<<< HEAD
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	mdp VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE etudiants (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(150) NOT NULL,
	etu VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE semestres (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	numero INT UNSIGNED NOT NULL UNIQUE
);

CREATE TABLE matieres (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(150) NOT NULL,
	libelle VARCHAR(255) NOT NULL,
	credit INT UNSIGNED NOT NULL
);

CREATE TABLE parcours (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nom VARCHAR(150) NOT NULL,
	semestre_id INT UNSIGNED NOT NULL,
	CONSTRAINT fk_parcours_semestre
		FOREIGN KEY (semestre_id) REFERENCES semestres(id)
		ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE liens_matieres_parcours (
	matiere_id INT UNSIGNED NOT NULL,
	parcours_id INT UNSIGNED NOT NULL,
    groupe_optionnel INT,
	PRIMARY KEY (matiere_id, parcours_id),
	CONSTRAINT fk_lien_matiere
		FOREIGN KEY (matiere_id) REFERENCES matieres(id)
		ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_lien_parcours
		FOREIGN KEY (parcours_id) REFERENCES parcours(id)
		ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE notes (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	etudiant_id INT UNSIGNED NOT NULL,
	matiere_id INT UNSIGNED NOT NULL,
	valeur DECIMAL(5,2) NOT NULL,
	CONSTRAINT fk_note_etudiant
		FOREIGN KEY (etudiant_id) REFERENCES etudiants(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_note_matiere
		FOREIGN KEY (matiere_id) REFERENCES matieres(id)
		ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT uq_note_etudiant_matiere UNIQUE (etudiant_id, matiere_id)
);
=======
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    mdp VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE etudiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(150),
    etu VARCHAR(50) UNIQUE
);

CREATE TABLE semestres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT UNIQUE
);

CREATE TABLE matieres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(150),
    libelle VARCHAR(255),
    credit INT
);

CREATE TABLE parcours (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(150),
    semestre_id INT,
    FOREIGN KEY (semestre_id) REFERENCES semestres(id)
);

CREATE TABLE liens_matieres_parcours (
    matiere_id INT,
    parcours_id INT,
    PRIMARY KEY (matiere_id, parcours_id),
    FOREIGN KEY (matiere_id) REFERENCES matieres(id),
    FOREIGN KEY (parcours_id) REFERENCES parcours(id)
);

CREATE TABLE notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    etudiant_id INT,
    matiere_id INT,
    valeur DECIMAL(5,2),
    UNIQUE (etudiant_id, matiere_id),
    FOREIGN KEY (etudiant_id) REFERENCES etudiants(id),
    FOREIGN KEY (matiere_id) REFERENCES matieres(id)
);