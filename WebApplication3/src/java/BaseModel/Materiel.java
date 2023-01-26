/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseModel;

import connexion.Connex;
import java.sql.SQLException;
import objectBdd.Mere;

/**
 *
 * @author TERRAQUE
 */
public class Materiel extends Mere{
    
    private int idMateriel;
    private String nomMateriel;
    private String fonctionnement;
    private float prixAchat;
    
    public float getPrixAchat(int idMateriel) throws SQLException
    {
        String requete = "select prixAchat from Materiel where id_materiel="+idMateriel+"";
        Connex con = new Connex(requete,"");
        con.getResultset().next();
        float prixAchat = con.getResultset().getFloat(1);
        return prixAchat;
    }       
}
