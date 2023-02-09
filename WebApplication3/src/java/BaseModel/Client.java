/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseModel;

import connexion.Connex;
import java.sql.Date;
import java.sql.SQLException;

/**
 *
 * @author TERRAQUE
 */
public class Client {
 
    private int idclient;
    private String nom;
    private String prenom;
    private int carte;
    private Date datenaissance;
    
    public Date getDate(int idclient) throws SQLException
    {
         String requete = "select datenaissance from Client where idclient="+idclient+"";
        Connex con = new Connex(requete,"");
        con.getResultset().next();
        Date d = con.getResultset().getDate(1);
        return d;
    }        
    
}
