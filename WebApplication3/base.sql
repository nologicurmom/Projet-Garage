/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  TERRAQUE
 * Created: 29 sept. 2022
 */
drop table Paiement_Ecolage;
drop table EtudiantPromotionSemestre;
drop table Etudiant;
drop table Inscription_Candidat;
drop table  Droit_Inscription;
drop table Montant_a_payer;
drop table Semestre;
drop table Parcours;
drop table Resultat;
drop table Type_Resultat;
drop table Note_matiere_candidat;
drop table Candidat_serie;
drop table Candidat_filiere;
drop table Candidat;
drop table Serie_Bacc;
drop table Type_serie;
drop table Ecole_Region;
drop table Region;
drop table Ecole;
drop table Genre;
drop table Matiere;
drop table Filiere;
drop table Annee_scolaire;

drop sequence sqcandidat;
drop sequence sqtype_serie;
drop sequence sqanneescolaire;
drop sequence sqregion;
drop sequence sqgenre;
drop sequence sqmatiere;
drop sequence sqserie;
drop sequence sqecole;
drop sequence sqfiliere;
drop sequence sqtypeResultat;
drop sequence sqparcours;
drop sequence sqsemestre;
drop sequence sqtypeMontant;
drop sequence sqinscription;
drop sequence sqetudiant;
drop sequence sqpaiement_ecolage;

create sequence sqpaiement_ecolage;
create sequence sqetudiant;
create sequence sqinscription;
create sequence sqtypeMontant;
create sequence sqsemestre;
create sequence sqparcours;
create sequence sqtypeResultat;
create sequence sqfiliere;
create sequence sqecole;
create sequence sqserie;
create sequence sqmatiere;
create sequence sqgenre;
create sequence sqregion;
create sequence sqanneescolaire;
create sequence sqtype_serie;
create sequence sqcandidat;

create table Annee_scolaire(
idannee_scolaire varchar(10) primary key not null default 'annee'||nextval('sqanneescolaire'),
Annee_scolaire varchar(10)
);

create table Filiere(
idfiliere varchar(10) primary key not null default 'fil'||nextval('sqfiliere'),
NomFiliere varchar(20)
);

create table Matiere(
idmatiere varchar(10) primary key not null default 'mat'||nextval('sqmatiere'),
NomMatiere varchar(15)
);

create table Genre(
idgenre varchar(10) primary key not null default 'genre'||nextval('sqgenre'), 
Nom varchar(10)
);

create table Ecole(
idecole varchar(10) primary key not null default 'ecole'||nextval('sqecole'),
NomEcole varchar(15)
);

create table Region(
idregion varchar(10) primary key not null default 'region'||nextval('sqregion'),
NomRegion varchar(10)
);

create table Ecole_Region(
idecole varchar(10) references Ecole(idecole),
idregion varchar(10) references Region(idregion)
);

create table Type_serie(
idtype_serie varchar(10) primary key not null default 'serie'||nextval('sqtype_serie'),
nomtype_serie varchar(20)
);

create table Serie_Bacc(
idserie varchar(10) primary key not null default 's'||nextval('sqserie'),
idtype_serie varchar(10) references Type_serie(idtype_serie),
NomSerie varchar(15)
);

create table Candidat(
idcandidat varchar(10) primary key not null default 'cand'||nextval('sqcandidat'),
Nom varchar(20),
Prenom varchar(20),
idgenre varchar(10) references Genre(idgenre),
idecole varchar(10) references Ecole(idecole),
DateNaissance date,
dateinscription timestamp  default current_timestamp,
Num_inscription varchar(20)
);

create table Candidat_filiere(
idcandidat varchar(10) references Candidat(idcandidat),
idfiliere varchar(10) references Filiere(idfiliere),
idannee_scolaire varchar(10) references Annee_scolaire(idannee_scolaire)
);

create table Candidat_serie(
idcandidat varchar(10) references Candidat(idcandidat),
idserie varchar(10) references Serie_Bacc(idserie), 
annee_obtention int
);


create table Note_matiere_candidat(
idcandidat varchar(10)  references Candidat(idcandidat),
idmatiere varchar(10) references Matiere(idmatiere),
idserie varchar(10) references Serie_Bacc(idserie), 
note float
);

create table Postuler(
idcandidat varchar(10)  references Candidat(idcandidat),
idfiliere varchar(10) references Filiere(idfiliere),
idannee_scolaire varchar(10) references Annee_scolaire(idannee_scolaire)
);

create table Type_resultat(
idtypeResultat varchar(10)  primary key not null default 'Resultat'||nextval('sqtypeResultat'),
typeResultat varchar(10)
);


create table Resultat(
idcandidat varchar(10)  references Candidat(idcandidat),
idfiliere varchar(10) references Filiere(idfiliere),
idannee_scolaire varchar(10) references Annee_scolaire(idannee_scolaire),
idtypeResultat varchar(10) references Type_resultat(idtypeResultat)
);

create  table Parcours(
idparcours  varchar(20)  primary key not null default 'L'||nextval('sqparcours'),
nomAnnee varchar(20)
);

insert into Parcours(nomAnnee) values  ('Licence1'),('Licence2'),('Licence3');

create table Semestre(
idsemestre  varchar(20)  primary key not null default 's'||nextval('sqsemestre'),
nomsemestre varchar(20),
idparcours varchar(20) references Parcours(idparcours) 
);

insert into Semestre(nomsemestre,idparcours) values ('Semestre1','L1') , ('Semestre2','L1') , ('Semestre3','L2') , ('Semestre4','L2')
, ('Semestre5','L3') , ('Semestre6','L3');

create table Montant_a_payer(
idtype varchar(20)  primary key not null default 'typemontant'||nextval('sqtypeMontant'), 
idfiliere varchar(10) references Filiere(idfiliere),
idsemestre varchar(20) references Semestre(idsemestre),
droit_inscription double precision,
ecolage double precision
);


insert into Montant_a_payer(idfiliere,idsemestre,droit_inscription,ecolage) values ('fil1','s1',2000,1700000) , ('fil1','s3',0,1400000) , ('fil1','s5',0,1200000) , ('fil2','s1',2000,1700000) , ('fil2','s3',0,1400000) , ('fil2','s5',0,1200000) , ('fil1','s2',0,1700000) , ('fil2','s2',0,1700000) , ('fil1','s4',0,1400000) , ('fil2','s4',0,1400000) , ('fil1','s6',0,1200000) , ('fil2','s6',0,1200000);



create table Inscription_Candidat(
idpaiement varchar(20) primary key not null default 'paiement'||nextval('sqinscription'), 
idcandidat varchar(10) references  Candidat(idcandidat),
idfiliere varchar(10) references Filiere(idfiliere),
idsemestre varchar(20) references Semestre(idsemestre),
droit_insc double precision,
montant_ecolage double precision,
Datepaiement date default current_date,
idannee_scolaire varchar(10) references Annee_scolaire(idannee_scolaire)
);

create table Etudiant(
idEtudiant varchar(20) primary key not null default 'ETU00'||nextval('sqetudiant'),
idcandidat  varchar(10) references  Candidat(idcandidat),
idfiliere  varchar(10) references Filiere(idfiliere),
DateValidation date default current_date
);

create table EtudiantPromotionSemestre(
idEtudiant  varchar(20) references  Etudiant(idEtudiant),
idsemestre varchar(20) references Semestre(idsemestre),
idannee_scolaire varchar(10) references Annee_scolaire(idannee_scolaire)
);


create table Paiement_Ecolage(
idpaiement varchar(20) primary key not null default 'paiement'||nextval('sqpaiement_ecolage'),
idEtudiant varchar(20) references  Etudiant(idEtudiant),
idsemestre varchar(20) references Semestre(idsemestre),
idfiliere  varchar(10) references Filiere(idfiliere),
idannee_scolaire varchar(10) references Annee_scolaire(idannee_scolaire),
montant_ecolage double precision,
Datepaiement date default current_date
);


create or replace view ecoleRegion as
select e.idecole as idecole , e.NomEcole as nomecole , r.idregion as idregion , r.NomRegion as nomregion from Ecole as e inner join Ecole_Region as er on e.idecole=er.idecole  inner join Region as r on r.idregion=er.idregion ;

insert into Genre(Nom) values ('homme') , ('femme');

insert into Ecole(NomEcole) values ('css') , ('memorial') , ('ipb') , ('sacr');

insert into Region(NomRegion) values ('atsimo') , ('avaratra') , ('antsinana'), ('centre') , ('andrefana');

insert into Ecole_Region(idecole,idregion) values ('ecole1','region1') , ('ecole2','region2') , ('ecole3','region1');

insert into Matiere(NomMatiere) values ('Math') , ('Pc') , ('francais') , ('Anglais');

insert into Type_serie(nomtype_serie) values ('scientifique') , ('litteraire');


insert into Serie_Bacc(idtype_serie,NomSerie) values ('serie1','serie S') , ('serie1','serie D') , ('serie1','serie C') , ('serie1','Technique') , ('serie2','serie A2') , ('serie2','serie A1') , ('serie2','serie L');

insert into Annee_scolaire(Annee_scolaire) values ('2019-2020') , ('2020-2021') , ('2021-2022') ,('2023-2024') , ('2024-2025');

insert into Filiere(NomFiliere) values ('informatique') , ('design');


insert into Candidat(Nom,Prenom,idgenre,idecole,DateNaissance,Num_inscription) values ('tso','hh','genre1','ecole1','2022-04-12','etu001') , ('eloic','andria','genre1','ecole2','2022-04-12','etu002') , ('harr','dix','genre1','ecole2','2022-04-12','etu003') , ('tojo','niaina','genre1','ecole2','2022-04-12','etu004')  ;


insert into Candidat_filiere(idcandidat,idfiliere,idannee_scolaire) values ('cand1','fil1','annee1') , ('cand2','fil2','annee2') , ('cand3','fil2','annee2');


insert into Candidat_serie(idcandidat,idserie,annee_obtention) values ('cand1','s1',2022) , ('cand2','s5',2022) , ('cand3','s5',2022);


insert into Type_resultat(typeResultat) values ('admis') ,('attente') ,('refuser');

create or replace view Admissible as 
select c.idcandidat as candidat , c.nom as nom , c.prenom as prenom , nmd.note as note, p.idfiliere as filiere , p.idannee_scolaire as annee_scolaire , cs.idserie as serie_bacc  , nmd.idmatiere as idmatiere , sb.idtype_serie as type_serie from Annee_scolaire as a inner join Postuler as p on a.idannee_scolaire = p.idannee_scolaire full join candidat as c on p.idcandidat = c.idcandidat inner join note_matiere_candidat as nmd on nmd.idcandidat = c.idcandidat  inner join candidat_serie as cs on cs.idcandidat = nmd.idcandidat inner join serie_bacc as sb on sb.idserie = cs.idserie;


create or replace view CandidatPostule as
select c.idcandidat as candidat , c.nom as nom , c.prenom as prenom , p.idfiliere as idfiliere , p.idannee_scolaire as idannee_scolaire from Candidat as c inner join Postuler as p on  c.idcandidat = p.idcandidat ;


create or replace view ResultatCandidat as 
select c.idcandidat as idcandidat ,  c.nom as nom , c.prenom as prenom , r.idfiliere as idfiliere , r.idannee_scolaire as idannee_scolaire , tr.typeresultat as typeresultat from Candidat as c inner join Resultat as r on c.idcandidat = r.idcandidat inner join Type_resultat as tr on r.idtypeResultat = tr.idtyperesultat;


create or replace view ResultatCandidatFinal as
select rc.idcandidat as idcandidat , rc.nom as nom , rc.prenom as prenom , f.nomfiliere as filiere , a.annee_scolaire as annee_scolaire , rc.typeresultat as typeresultat , rc.idfiliere as idfiliere , rc.idannee_scolaire as idannee_scolaire from filiere as f inner join ResultatCandidat as rc on f.idfiliere=rc.idfiliere inner join annee_scolaire as a on rc.idannee_scolaire=a.idannee_scolaire;


create or replace view etat_paiement as 
select c.idcandidat , c.nom , c.prenom , pe.idfiliere , pe.idsemestre , pe.idannee_scolaire , map.ecolage - sum(pe.montant_ecolage) as resteecolage , etat(map.ecolage - sum(pe.montant_ecolage)) as etat from Candidat c inner join Inscription_Candidat pe using(idcandidat) inner join Montant_a_payer map using(idfiliere,idsemestre) group by c.idcandidat , c.nom , c.prenom , pe.idfiliere , pe.idsemestre , pe.idannee_scolaire , map.ecolage; 


create or replace view EtudiantDetail as 
select e.idetudiant , e.idcandidat, c.nom , c.prenom , f.nomfiliere , e.datevalidation from filiere f inner join  etudiant e using(idfiliere) inner join candidat c using(idcandidat);



create or replace view etat_paiement_ecolage as 
select e.idetudiant , c.nom , c.prenom , e.idfiliere , pe.idsemestre , pe.idannee_scolaire , map.ecolage - sum(pe.montant_ecolage) as resteecolage , etat(map.ecolage - sum(pe.montant_ecolage)) as etat from candidat c inner join etudiant e using(idcandidat) inner join Paiement_ecolage pe using(idetudiant,idfiliere) inner join Montant_a_payer map using(idfiliere,idsemestre) group by e.idetudiant , c.nom , c.prenom , e.idfiliere , pe.idsemestre , pe.idannee_scolaire , map.ecolage; 




CREATE OR REPLACE FUNCTION etat(reste double precision)
    RETURNS varchar
     LANGUAGE PLPGSQL
    AS
    $BODY$
    declare
	resultat varchar;
    BEGIN
    if reste > 0 then 
          resultat = 'non payer';
    else 
          resultat = 'payer';
    end if;
    return resultat;
   end;
   $BODY$;