

drop view situation_facture;
drop table paiement_facture;
drop table detailfacture;
drop table facture;
drop table client;
drop table Marge;
drop view benefice;
drop view v_materiel;
drop view v_salaire;
drop function SalaireEnDurree;
drop table Employe_Service;
drop table Type_service_materiel;
drop table typedeservice;
drop table Materiel;
drop table SpecialiteEmployer;
drop table Specialite;
drop table NiveauEtudeEmployer;
drop table NiveauEtude;
drop table EmployerPoste;
drop table Poste;
drop table Employer;
drop table Genre;


CREATE TABLE Genre(
    id_genre serial PRIMARY KEY,
    nom varchar(20) 
);

CREATE TABLE Employer(
    id_employer serial PRIMARY KEY,
    nom varchar(20),
    prenom varchar(20),
    date_naissance date, 
    id_genre int references Genre(id_genre)
);

CREATE TABLE Poste(
    id_poste serial PRIMARY KEY,
    nom_poste varchar(20),
    salaireDeBase float
);


CREATE TABLE EmployerPoste(
    id_employer int references Employer(id_employer),
    id_poste int references Poste(id_poste),
    salaire float,
    DatePriseDePoste date DEFAULT CURRENT_DATE
);

CREATE TABLE NiveauEtude(
    id_niveauetude serial PRIMARY KEY,
    NiveauEtude varchar(20)
);

CREATE TABLE NiveauEtudeEmployer(
    id_employer int references Employer(id_employer),
    id_niveauetude int references NiveauEtude(id_niveauetude)
);

CREATE TABLE Specialite(
    id_specialite serial PRIMARY KEY,
    nom_specialite varchar(20)
);

CREATE TABLE SpecialiteEmployer(
    id_employer int references Employer(id_employer),
    id_specialite int references Specialite(id_specialite)
);

CREATE TABLE Materiel(
    id_materiel serial PRIMARY KEY,
    nomMateriel varchar(20),
    fonctionnement text,
    prixAchat float
);



CREATE TABLE TypedeService(
    id_type_service serial PRIMARY KEY,
    typeService varchar(20),
    margeBeneficiaire int,
    prixService float
);



CREATE TABLE Type_service_materiel(
    id_type_service int references TypedeService(id_type_service),
    id_materiel int references Materiel(id_materiel)
);


CREATE TABLE Employe_Service(
    id_employer int references Employer(id_employer),
    id_type_service int references TypedeService(id_type_service),
    dureeService int
);


CREATE OR REPLACE FUNCTION SalaireEnDurree(salaire float,durree int)
    RETURNS float
     LANGUAGE PLPGSQL
    AS
    $BODY$
    declare
	Enjour float;
    EnHeure float;
    result float;
    BEGIN
    Enjour = salaire/30;
    EnHeure = Enjour/8;
    result = (EnHeure * durree)/60;
    return result;
   end;
   $BODY$;



create or replace view v_salaire as 
select sum(SalaireEnDurree(ep.salaire,es.dureeService)) as salaire, es.id_type_service from Employe_Service es join EmployerPoste ep using(id_employer) group by es.id_type_service;




create or replace view v_materiel as
select sum(m.prixAchat) as total_materiel , tsm.id_type_service from type_service_materiel tsm join materiel m using(id_materiel) group by tsm.id_type_service;



create or replace view benefice as 
select  tds.prixservice - (vs.salaire+vm.total_materiel) as benefice , tds.id_type_service , tds.typeservice from typedeservice tds join v_salaire vs using(id_type_service) join v_materiel vm using(id_type_service);



create table Marge(
idMarge serial primary key,
prixMin float,
prixMax float,
pourcentage float
);


create table Client(
idClient serial primary key,
Nom varchar(20),
Prenom varchar(20),
Carte int,
DateNaissance date
);

create table Facture(
idFacture serial primary key,
idClient int REFERENCES Client(idClient),
DateFacture date default CURRENT_DATE
);


create table DetailFacture(
idServiceClient  serial primary key,
id_type_Service int references TypedeService(id_type_service),
idFacture int references Facture(idFacture),
quantiter int,
prixUnitaire float,
remise float,
prix float,
DateCommande date default current_date
);


select count(f.idclient) from DetailFacture df inner join facture f on df.idFacture = f.idfacture where idclient=1 and extract(year from df.DateCommande)=2023;

create table Paiement_Facture(
idPaiementFacture serial primary key,
idFacture int references Facture(idFacture),
Montant_payer float 
);




create or replace view situation_facture as
SELECT
  Facture.idFacture,
  (SELECT SUM(DetailFacture.prixUnitaire * DetailFacture.quantiter) FROM DetailFacture WHERE DetailFacture.idFacture = Facture.idFacture) AS total_a_payer,
  COALESCE((SELECT SUM(DetailFacture.prixUnitaire * DetailFacture.quantiter) FROM DetailFacture WHERE DetailFacture.idFacture = Facture.idFacture) - 
  (SELECT COALESCE(SUM(Paiement_Facture.Montant_payer), 0) FROM Paiement_Facture WHERE Paiement_Facture.idFacture = Facture.idFacture),
  (SELECT SUM(DetailFacture.prixUnitaire * DetailFacture.quantiter) FROM DetailFacture WHERE DetailFacture.idFacture = Facture.idFacture)) AS reste_a_payer,
  Client.idClient,
  Client.Nom,
  Client.Prenom,
  Facture.DateFacture
FROM
  Facture
  JOIN Client ON Facture.idClient = Client.idClient
GROUP BY
  Facture.idFacture,
  Client.idClient,
  Client.Nom,
  Client.Prenom,
  Facture.DateFacture;




-- -- Pour la table Facture 
-- INSERT INTO Facture (idClient) VALUES (1);
-- INSERT INTO Facture (idClient) VALUES (2);

-- -- Pour la table DetailFacture 
-- INSERT INTO DetailFacture (id_type_Service, idFacture, quantiter, prixUnitaire) 
-- VALUES (1, 1, 5, 100.0);
-- INSERT INTO DetailFacture (id_type_Service, idFacture, quantiter, prixUnitaire) 
-- VALUES (2, 2, 2, 50.0);


-- Pour la table Paiement_Facture 
-- INSERT INTO Paiement_Facture (idFacture, Montant_payer) 
-- VALUES (1, 500.0);
-- INSERT INTO Paiement_Facture (idFacture, Montant_payer) 
-- VALUES (2, 100.0);

-- INSERT INTO DetailFacture (id_type_Service, idFacture, quantiter, prixUnitaire) 
-- VALUES (1, 1, 5, 100.0);


-- create or replace view situaton_facture as
-- select ts.idFacture , ts.idClient , f.Detail , f.DateFacture , sum(tds.prixService) as total_a_payer ,  sum(tds.prixService) - sum(pf.Montant_a_payer) as reste_a_payer  from TypeDeService tds inner join Traitement_Service ts using(id_type_service) inner join Paiement_Facture pf using(idFacture) inner join Facture f using(idFacture) group by idfacture,ts.idClient,Detail,DateFacture;





