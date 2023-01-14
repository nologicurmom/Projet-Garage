/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author KTM
 */
import java.lang.reflect.Constructor;
import java.util.ArrayList;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
public class Intermediaire {
        Employer Emp = new Employer();
	public void insertNew(String query, Connection cn) {
		Connex cnx = new Connex();
		try {
			if (cn.isClosed()) {
				System.out.println("Reouverture de la connection");
				cn = cnx.OracleConnect();
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		Statement stmt = cnx.getStatement(cn);
		try {
			int count = stmt.executeUpdate(query);
			System.out.println("Number of rows in dtbs = " + count);

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {

				System.out.println("Fermeture de la connexion");
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	public void Insert(Connection cn, Object o, String requet) throws SQLException {
		Connex cnx = new Connex();
		try {
			if (cn.isClosed()) {
				System.out.println("Reouverture de la connection");
				cn = cnx.OracleConnect();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		Statement stmt = cnx.getStatement(cn);
		String query = "INSERT INTO "+o.getClass()+"  VALUES (" + requet + ")";
		insertNew(query, cn);
		System.out.println("" + query);

		stmt.close();
		cn.close();
		System.out.println("Fermeture de la connexion");

	}

    
    	public  ArrayList<Employer>  infoEmployer(Connection Con, String nom)
			throws ClassNotFoundException, NoSuchMethodException, SecurityException, SQLException,
			InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
				Connex cnx = new Connex();
				if (Con.isClosed()) {
					System.out.println("Reouverture de la connection");
					Con = cnx.OracleConnect();
				}
				int num = 0;
				Statement st = Con.createStatement();
				ResultSet re = st.executeQuery("select * from Product where niveau=0 start with idProduit='" + nom+ "' connect by prior composant=idProduit order by niveau desc ");
				// ResultSet re = st.executeQuery("Select*from Personn");
			        ArrayList<Employer> Emp= new ArrayList<Employer>();
				while (re.next()) {
		
					//Employer Employer = new Employer(re.getString("id_employer"), re.getString("nom"), re.getString("prenom"),
						//	re.getString("date_naissance"), re.getInt("Genre"));
				}
				st.close();
				return Emp;
		// System.out.println(Oj);
		// c.Closeconnex(c.OracleConnect());
	}
        public  Employer  idEmploye(Connection Con, String nom)
			throws ClassNotFoundException, NoSuchMethodException, SecurityException, SQLException,
			InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
				Connex cnx = new Connex();
				if (Con.isClosed()) {
					System.out.println("Reouverture de la connection");
					Con = cnx.OracleConnect();
				}
				int num = 0;
				Statement st = Con.createStatement();
				ResultSet re = st.executeQuery("select * from Employer where nom="+nom+" ");
				// ResultSet re = st.executeQuery("Select*from Personn");
                                Employer Emp = new Employer();
				while (re.next()) {
	
					// Emp = new Employer(re.getString("id_employer"), re.getString("nom"), re.getString("prenom"),
						//	re.getString("date_naissance"), re.getInt("Genre"));
				}
				st.close();
				return Emp;
		// System.out.println(Oj);
		// c.Closeconnex(c.OracleConnect());
	}
        public void initial_emp(Connection cn,  String nom, String prenom, String date_naissance,String Genre ) throws SQLException {
		Connex cnx = new Connex();
		try {
			if (cn.isClosed()) {
				System.out.println("Reouverture de la connection");
				cn = cnx.OracleConnect();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		Insert(cn, Emp, "'" + cnx.getseq(cn, "getSeqEmployer") + "','" + nom + "','" + prenom + "','"
				+ date_naissance + "','" + Genre + "'");

		cn.close();
		cnx.Closeconnex(cn);
	}
         public void initial_dep(Connection cn,String Caracteristique, int  PrixFinal,String  DateDepense ) throws SQLException {
		Connex cnx = new Connex();
		try {
			if (cn.isClosed()) {
				System.out.println("Reouverture de la connection");
				cn = cnx.OracleConnect();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		Insert(cn, Emp, "'" + cnx.getseq(cn, "getSeqDep") + "','" + Caracteristique + "'," +   PrixFinal  + ",'" + DateDepense + "'" );

		cn.close();
		cnx.Closeconnex(cn);
	}
}
