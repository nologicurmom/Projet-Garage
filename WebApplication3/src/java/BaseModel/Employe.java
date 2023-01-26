/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseModel;

import connexion.Connex;
import java.sql.Date;
import objectBdd.Mere;

/**
 *
 * @author TERRAQUE
 */
public class Employe extends Mere{
    private int id_employer;
    private String nom;
    private String prenom;
    private String date_naissance;
    private int id_genre;

    public int getId_employer() {
        return id_employer;
    }

    public void setId_employer(int id_employer) {
        this.id_employer = id_employer;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getDate_naissance() {
        return date_naissance;
    }

    public void setDate_naissance(String date_naissance) {
        this.date_naissance = date_naissance;
    }

   

    public int getId_genre() {
        return id_genre;
    }

    public void setId_genre(int id_genre) {
        this.id_genre = id_genre;
    }

    public Employe() {
    }

    public Employe(String nom, String prenom,String date_naissance, int id_genre) {
        this.nom = nom;
        this.prenom = prenom;
        this.date_naissance = date_naissance;
        this.id_genre = id_genre;
    }
    
     public int insererEmploye() throws Exception {
        try {
            String requete = "insert into Employer(nom,prenom,date_naissance,id_genre) values ('"+this.getNom()+"','"+this.getPrenom()+"','"+this.getDate_naissance()+"',"+this.getId_genre()+") returning id_employer";
            Connex con = new Connex(requete,"");
            System.out.println("la requete est" + requete);
            con.getResultset().next();
            int id_employer = con.getResultset().getInt(1);
            return id_employer;
        } catch (Exception exc) {
            throw exc;
        } finally {
        }
    }
     
     
     public void insererEmployeNiveauEtude(int id_employe,int id_niveauetude) throws Exception {
        try {
            String requete = "insert into NiveauEtudeEmployer(id_employer,id_niveauetude) values ("+id_employe+","+id_niveauetude+")";
            Connex con = new Connex(requete);
            System.out.println("la requete est" + requete);
          
        } catch (Exception exc) {
            throw exc;
        } finally {
        }
     }   
      public void insererEmployePoste(int id_employer,int id_poste,float salaire) throws Exception {
        try {
            String requete = "insert into EmployerPoste(id_employer,id_poste,salaire) values ("+id_employer+","+id_poste+","+salaire+")";
            Connex con = new Connex(requete);
            System.out.println("la requete est" + requete);
          
        } catch (Exception exc) {
            throw exc;
        } finally {
        }  
          
    } 
      
    
}
