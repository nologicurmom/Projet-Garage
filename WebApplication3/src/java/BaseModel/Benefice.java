/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseModel;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import objectBdd.Mere;

/**
 *
 * @author TERRAQUE
 */
public class Benefice extends Mere{
    
    private float benefice;
    private int id_type_service;
    private String typeservice;

    public float getBenefice() {
        return benefice;
    }

    public void setBenefice(float benefice) {
        this.benefice = benefice;
    }

    public int getId_type_service() {
        return id_type_service;
    }

    public void setId_type_service(int id_type_service) {
        this.id_type_service = id_type_service;
    }

    public String getTypeservice() {
        return typeservice;
    }

    public void setTypeservice(String typeservice) {
        this.typeservice = typeservice;
    }

    public Benefice(float benefice, int id_type_service, String typeservice) {
        this.benefice = benefice;
        this.id_type_service = id_type_service;
        this.typeservice = typeservice;
    }

    public Benefice() {
    }
    
     public List<Benefice> getBenefice(Connection con,int id_type_service) throws Exception {
        List<Benefice> liste = new ArrayList<>();
        Benefice e = new Benefice();
        Object[] result = e.getFromView(con,"benefice","where id_type_service="+id_type_service+"");
        for(Object o:result)
        {
            liste.add((Benefice) o);
        }
        if(liste.size() != 0)
        {
            return liste;
        }
        else {
            return null;
        }
    }
}
