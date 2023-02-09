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

/**
 *
 * @author TERRAQUE
 */
public class DetailFacture {
    int idTraitementService;
    int TypeService;
    int idFacture;
    float Montant;
    Date DateCommande;
    String d;

    public String getD() {
        return d;
    }

    public void setD(String d) {
        this.d = d;
    }
    
    
      public List<Object[]> FactureFille(int idfacture)
    {
        List<Object[]> liste = new ArrayList<>();
        try {
            String requete ="select f.idFacture , f.idclient, tds.typeService , df.quantiter, df.prixUnitaire , df.remise , df.prix as prixInit from  TypedeService tds inner join DetailFacture df using(id_type_service)  inner join facture f using(idfacture) where idfacture="+idfacture+"";
            Connex con = new Connex(requete, "hh");
            ResultSet res = con.getResultset();
            while (con.getResultset().next()) {
                int idF = con.getResultset().getInt(1);
                int idClient = con.getResultset().getInt(2);
                String typeService = con.getResultset().getString(3);
                int quantiter = con.getResultset().getInt(4);
                float prixUnitaire = con.getResultset().getFloat(5);
                float remise = con.getResultset().getFloat(6);
                float prix = con.getResultset().getFloat(7);
                liste.add(new Object[] {idF,idClient,typeService,quantiter,prixUnitaire,remise,prix});
            }
            return liste;
        } catch (Exception e) {
            return null;
        }
    }  
      
    
    
      public void insertDetailFacture(int id_type_service,int idClient,int idFacture,int quantiter,float prixUnitaire,float remise,float prix,String dateC) throws Exception {
        try {
            String requete = "insert into DetailFacture(id_type_service,idFacture,quantiter,prixUnitaire,remise,prix,datecommande) values ("+id_type_service+","+idFacture+","+quantiter+","+prixUnitaire+","+remise+","+prix+",'"+dateC+"')";
            Connex con = new Connex(requete,"");
            System.out.println("la requete est" + requete);
        } catch (Exception exc) {
            throw exc;
        } finally {
        }
    }
      
      
    public int CommandeParAnnee(int idclient,int annee) throws SQLException
    {
        String requete = "select count(df.idfacture) from DetailFacture df inner join facture f on df.idFacture = f.idfacture where idclient="+idclient+" and extract(year from df.DateCommande)="+annee+"";
        Connex con = new Connex(requete,"");
        con.getResultset().next();
        int result = con.getResultset().getInt(1);
        return result;
    }        
      

    
}
