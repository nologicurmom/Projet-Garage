

INSERT INTO Genre VALUES(default,'Feminin');
INSERT INTO Genre VALUES(default,'Masculin');



INSERT INTO Employer VALUES(default,'Rakotobe','Fred','2002-04-17',2);
INSERT INTO Employer VALUES(default,'Rabe','Patty','2003-08-27',1);
INSERT INTO Employer VALUES(default,'Rajaona','Mika','2002-10-06',2);




INSERT INTO Poste VALUES(default,'Mpanao vidange',5000);
INSERT INTO Poste VALUES(default,'reparateur vehicule',6000);
INSERT INTO Poste VALUES(default,'Mpanolo piece',4000);



INSERT INTO EmployerPoste VALUES(2,1,5200,'2021-05-13');
INSERT INTO EmployerPoste VALUES(1,2,6500,'2022-12-18');
INSERT INTO EmployerPoste VALUES(3,3,4100,'2023-02-19');


INSERT INTO NiveauEtude VALUES(default,'L2');
INSERT INTO NiveauEtude VALUES(default,'M1');
INSERT INTO NiveauEtude VALUES(default,'L3');


INSERT INTO NiveauEtudeEmployer VALUES(1,3);
INSERT INTO NiveauEtudeEmployer VALUES(2,2);
INSERT INTO NiveauEtudeEmployer VALUES(3,1);


INSERT INTO Specialite VALUES(default,'vidange');
INSERT INTO Specialite VALUES(default,'mecanicien/ne');
INSERT INTO Specialite VALUES(default,'lavage');



INSERT INTO SpecialiteEmployer VALUES(1,3);
INSERT INTO SpecialiteEmployer VALUES(2,2);
INSERT INTO SpecialiteEmployer VALUES(3,1);


insert into Materiel values (default,'huile','blabla',300);
insert into Materiel values (default,'batterie','blabla',1200);
insert into Materiel values (default,'pneu','blabla',3000000);



insert into TypedeService values (default,'Reparation',10,12000);
insert into TypedeService values (default,'Depannage',20,15000);
insert into TypedeService values (default,'Vidange',15,9000);


insert into Type_service_materiel values (3,2) , (3,3);


insert into Employe_Service values (1,3,45) , (2,3,30);


insert into Marge(prixMin,prixMax,pourcentage) values (1,1000,50) , (1000,5000,30) , (5000,10000,10) , (10000,5000000,2);


insert into Client(Nom,Prenom,Carte,DateNaissance) values ('Hardi','Tojoniaina',1,'2002-02-09') , ('tojo','t',2,'2003-02-10') ,  ('aina','a',2,'2003-02-12');


-- CREATE TABLE Client(
--     id_client serial PRIMARY KEY,
--     nom varchar(20),
--     prenom varchar(20),
--     contact int,
--     email varchar(20),
--     adresse varchar(20),
--     carteBancaire int
-- );

-- CREATE TABLE Piece(
--     id_piece serial PRIMARY KEY,
--     nom_piece varchar(20)
-- );

-- CREATE TABLE Marque(
--     id_marque serial PRIMARY KEY,
--     marque varchar(20)
-- );

-- CREATE TABLE Modele(
--     id_modele serial PRIMARY KEY,
--     modele varchar(20),
--     id_marque int references Marque(id_marque)
-- );

-- CREATE TABLE TypeVehicule(
--     id_type_vehicule serial PRIMARY KEY,
--     type_vehicule varchar(20)
-- );

-- CREATE TABLE Vehicule(
--     id_vehicule serial,
--     id_type_vehicule int references TypeVehicule(id_type_vehicule),
--     matriculation varchar(20) PRIMARY KEY,
--     id_modele int references Modele(id_modele),
--     id_client int references Client(id_client)
-- );

-- CREATE TABLE VentePiece(
--     id_vente_piece serial PRIMARY KEY,
--     id_piece int references Piece(id_piece),
--     id_client int references Client(id_client),
--     prix float,
--     DatePaiement date
-- );



-- INSERT INTO Piece VALUES('Globe');
-- INSERT INTO Piece VALUES('Radiateur');
-- INSERT INTO Piece VALUES('Pare choc');
-- INSERT INTO Piece VALUES('Gente');
-- INSERT INTO Piece VALUES('Tube');

-- INSERT INTO Marque VALUES('GOLF');
-- INSERT INTO Marque VALUES('MERCEDES');
-- INSERT INTO Marque VALUES('RENAULT');

-- INSERT INTO Modele VALUES('Golf type 1',1);
-- INSERT INTO Modele VALUES('Golf type 2',1);
-- INSERT INTO Modele VALUES('AMG S63 E',2);
-- INSERT INTO Modele VALUES('GLE',2);
-- INSERT INTO Modele VALUES('GT Turbo',3);
-- INSERT INTO Modele VALUES('4L',3);

-- INSERT INTO TypeVehicule VALUES('4x4');
-- INSERT INTO TypeVehicule VALUES('Voiture leger');
-- INSERT INTO TypeVehicule VALUES('moto');


-- INSERT INTO Vehicule VALUES('2','5689 TBA',1,3);
-- INSERT INTO Vehicule VALUES('1','9085 TBD',4,2);
-- INSERT INTO Vehicule VALUES('3','8546 TDO',5,1);

-- INSERT INTO VentePiece VALUES(1,3,200000,'2022-12-20');
-- INSERT INTO VentePiece VALUES(4,3,100000,'2022-12-20');
-- INSERT INTO VentePiece VALUES(2,2,4000000,'2023-01-04');
-- INSERT INTO VentePiece VALUES(3,2,5000,'2023-01-15');
-- INSERT INTO VentePiece VALUES(5,1,90000,'2022-10-15');
-- INSERT INTO VentePiece VALUES(2,1,4000000,'2022-11-15');
 
-- INSERT INTO Modele_Piece VALUES(1,'Misy vaky kely',1,10,2,'9085 TBD');
-- INSERT INTO Modele_Piece VALUES(2,'Mandeha tsara',3,13,3,'8546 TDO');
-- INSERT INTO Modele_Piece VALUES(3,'Misy kika',0.5,1,1,'5689 TBA');
-- INSERT INTO Modele_Piece VALUES(4,'Mety tsara',1,3,2,'9085 TBD');
-- INSERT INTO Modele_Piece VALUES(5,'bouchée',2,3,1,'5689 TBA');

-- INSERT INTO Stock_Piece VALUES(12,'2022-10-19',1);
-- INSERT INTO Stock_Piece VALUES(8,'2022-12-30',2);
-- INSERT INTO Stock_Piece VALUES(6,'2022-12-31',3);



-- INSERT INTO TypeDepense VALUES('Loyer','5000');
-- INSERT INTO TypeDepense VALUES('Materiels','50000');
-- INSERT INTO TypeDepense VALUES('Electricite','4000');

-- INSERT INTO Depense VALUES(1,'2022-12-31',1);
-- INSERT INTO Depense VALUES(2,'2023-01-01',2);
-- INSERT INTO Depense VALUES(3,'2022-12-31',3);


-- INSERT INTO Stock_Piece VALUES(2,'2022-12-18',4);
-- INSERT INTO Stock_Piece VALUES(4,'2022-10-04',5);