/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseModel;

import connexion.Connex;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import objectBdd.Mere;

/**
 *
 * @author TERRAQUE
 */
public class Facture extends Mere{
   int idFacture;
   int idClient;
   String detail;
   Date date;

   
   public int Facturer(int idclient) throws SQLException
   {
         String requete = "insert into Facture(idclient) values ("+idclient+") returning idfacture";
            Connex con = new Connex(requete,"");
            con.getResultset().next();
            int idfacture = con.getResultset().getInt(1);
            return idfacture;
   }        
   
   public List<Object[]> SituationFacture(int idc)
    {
        List<Object[]> liste = new ArrayList<>();
        try {
            String requete ="select*from situation_facture where idclient="+idc+"";
            Connex con = new Connex(requete, "hh");
            ResultSet res = con.getResultset();
            while (con.getResultset().next()) {
                int idF = con.getResultset().getInt(1);
                float total_a_payer = con.getResultset().getFloat(2);
                float reste_a_payer = con.getResultset().getFloat(3);
                int idclient = con.getResultset().getInt(4);
                 String nom = con.getResultset().getString(5);
                String prenom = con.getResultset().getString(6);
                Date dateFacture = con.getResultset().getDate(7);
                liste.add(new Object[] {idF,total_a_payer,reste_a_payer,idclient,nom,prenom,dateFacture});
            }
            return liste;
        } catch (Exception e) {
            return null;
        }
    }     
   
   
   
    public List<Object[]> DetailFacture(int idFacture)
    {
        List<Object[]> liste = new ArrayList<>();
        try {
            String requete ="select*from situation_facture where idFacture="+idFacture+"";
            Connex con = new Connex(requete, "hh");
            ResultSet res = con.getResultset();
            while (con.getResultset().next()) {
                int idF = con.getResultset().getInt(1);
                float total_a_payer = con.getResultset().getFloat(2);
                float reste_a_payer = con.getResultset().getFloat(3);
                int idclient = con.getResultset().getInt(4);
                 String nom = con.getResultset().getString(5);
                String prenom = con.getResultset().getString(6);
                Date dateFacture = con.getResultset().getDate(7);
                liste.add(new Object[] {idF,total_a_payer,reste_a_payer,idclient,nom,prenom,dateFacture});
            }
            return liste;
        } catch (Exception e) {
            return null;
        }
    }      
   
    
}
