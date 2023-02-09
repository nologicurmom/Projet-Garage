/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package affichage;

import BaseModel.Client;
import BaseModel.DetailFacture;
import BaseModel.Facture;
import BaseModel.Marge;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author TERRAQUE
 */
public class Main {
    
     public static void main(String[] args) throws Exception
      {
         Client c = new Client();   
         LocalDate datefin = LocalDate.now();
            int moisS = datefin.getMonthValue();
            int jourS = datefin.getDayOfMonth();
                     //client
            Date d = c.getDate(1);
            int mois = d.getMonth();
               LocalDate dd = d.toLocalDate();
               
            int jour = d.getDay();
            float remise = 0.0f;
            System.out.println(moisS+""+jourS);
         //   System.out.println("s"+SituationFacture.size());
           //  System.out.println("f"+FactureFille.size());
            
      }
}
