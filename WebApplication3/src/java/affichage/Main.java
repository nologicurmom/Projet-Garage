/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package affichage;

import BaseModel.Marge;

/**
 *
 * @author TERRAQUE
 */
public class Main {
    
     public static void main(String[] args) throws Exception
      {
        Marge m = new Marge();  
        float benefice = m.getBenefice(300);
        System.out.println(benefice);
      }
}
