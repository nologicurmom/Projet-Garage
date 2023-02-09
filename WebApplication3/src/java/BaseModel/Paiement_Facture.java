/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseModel;

import connexion.Connex;
import objectBdd.Mere;

/**
 *
 * @author TERRAQUE
 */
public class Paiement_Facture extends Mere{
  int idPaiementFacture;
  int idFacture;
  float Montant_a_payer;
  
    public void Paiement_Facture(int idFacture,float Montant_a_payer)
   {
         String requete = "insert into Paiement_Facture(idFacture,Montant_payer) values ("+idFacture+","+Montant_a_payer+")";
            Connex con = new Connex(requete,"");
            System.out.println("la requete est" + requete);
   }   
    
}
