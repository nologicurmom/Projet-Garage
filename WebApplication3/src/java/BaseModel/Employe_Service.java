/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseModel;

import connexion.Connex;
import java.sql.Connection;
import objectBdd.ManipDb;
import objectBdd.Mere;

/**
 *
 * @author TERRAQUE
 */
public class Employe_Service extends Mere{
     int id_employe;
     int id_type_service;
     int dureeService;

    public int getId_employe() {
        return id_employe;
    }

    public void setId_employe(int id_employe) {
        this.id_employe = id_employe;
    }

    public int getId_type_service() {
        return id_type_service;
    }

    public void setId_type_service(int id_type_service) {
        this.id_type_service = id_type_service;
    }

    public int getDureeService() {
        return dureeService;
    }

    public void setDureeService(int dureeService) {
        this.dureeService = dureeService;
    }

    public Employe_Service(int id_employe, int id_type_service, int dureeService) {
        this.id_employe = id_employe;
        this.id_type_service = id_type_service;
        this.dureeService = dureeService;
    }

    public Employe_Service() {
    }
     
    public void New_Employe_Service() throws Exception
    {
       String requete="insert into Employe_Service values ("+this.getId_employe()+","+this.getId_type_service()+","+this.getDureeService()+")";
       Connex con = new Connex(requete);
    }        
}
