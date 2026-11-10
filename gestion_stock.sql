CREATE DATABASE gestion_stock;
USE gestion_stock;
SHOW DATABASES;
SELECT DATABASE();
CREATE TABLE CATEGORIE (
id_categorie INT AUTO_INCREMENT,
nom_categorie VARCHAR(100) NOT NULL,
description_categorie VARCHAR(255),
 
PRIMARY KEY (id_categorie)
);

SHOW TABLES; 

DESCRIBE CATEGORIE;

CREATE TABLE FOURNISSEUR (
    id_fournisseur INT AUTO_INCREMENT,
    nom_fournisseur VARCHAR(100) NOT NULL,
    tel VARCHAR(20),
    email VARCHAR(150),
    adresse VARCHAR(255),

    PRIMARY KEY (id_fournisseur)
);

SHOW TABLES; 

CREATE TABLE PRODUIT (
    id_produit INT AUTO_INCREMENT,
    reference VARCHAR(100) NOT NULL,
    nom_produit VARCHAR(150) NOT NULL,
    description TEXT,
    prix_achat DECIMAL(10,2) NOT NULL,
    prix_vente DECIMAL(10,2) NOT NULL,
    seuil_alerte INT NOT NULL DEFAULT 5,
    id_categorie INT NOT NULL,
    id_fournisseur INT NOT NULL,

    PRIMARY KEY (id_produit),

    UNIQUE (reference),

    FOREIGN KEY (id_categorie)
        REFERENCES CATEGORIE(id_categorie),

    FOREIGN KEY (id_fournisseur)
        REFERENCES FOURNISSEUR(id_fournisseur)
);

SHOW TABLES; 

CREATE TABLE MOUVEMENT_STOCK (
    id_mouvement INT AUTO_INCREMENT,
    date_mouvement DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_mouvement VARCHAR(10) NOT NULL,
    quantite INT NOT NULL,
    motif VARCHAR(255),
    id_produit INT NOT NULL,

    PRIMARY KEY (id_mouvement),

    FOREIGN KEY (id_produit)
        REFERENCES PRODUIT(id_produit),

    CHECK (type_mouvement IN ('ENTREE', 'SORTIE')),
    CHECK (quantite > 0)
);

SHOW TABLES; 

INSERT INTO CATEGORIE (nom_categorie, description_categorie)
VALUES
('Ordinateurs', 'Ordinateurs portables et de bureau'),
('Peripheriques', 'Souris, claviers et imprimantes'),
('Composants', 'Composants internes informatiques'),
('Reseaux', 'Equipements et accessoires reseau');

SELECT * FROM CATEGORIE;

INSERT INTO FOURNISSEUR
(nom_fournisseur, tel, email, adresse)
VALUES
('Tech Distribution', '+212600000001',
 'contact@techdistribution.ma', 'Casablanca, Maroc'),

('Info Plus', '+212600000002',
 'contact@infoplus.ma', 'Rabat, Maroc'),

('Digital Supply', '+212600000003',
 'contact@digitalsupply.ma', 'Meknes, Maroc');
 
 SELECT * FROM FOURNISSEUR;
 
 SHOW TABLES;