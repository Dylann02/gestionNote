DROP DATABASE IF EXISTS tp_gestion_notes;

CREATE DATABASE tp_gestion_notes;
USE tp_gestion_notes;

CREATE TABLE users (
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