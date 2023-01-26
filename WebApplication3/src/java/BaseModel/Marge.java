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
public class Marge extends Mere{
    
    private int idMarge;
    private float prixMin;
    private float prixMax;
    private float pourcentage;
    
    
    public float getPourcentage(float prix) throws SQLException
    {
        String requete = "select pourcentage from Marge where "+prix+">=prixMin and "+prix+"<=prixMax";
        Connex con = new Connex(requete,"");
        con.getResultset().next();
        float result = con.getResultset().getFloat(1);
        return result;
    }        
    
   public float getBenefice(float prix) throws Exception
   {
       float benefice = (prix * this.getPourcentage(prix))/100;
       return benefice;
   }        
   
   public float getPrixAchatConseiller(float prix) throws Exception
   {
       float prixAchatConseiller = prix + this.getBenefice(prix);
       return prixAchatConseiller;
   }
   
}
