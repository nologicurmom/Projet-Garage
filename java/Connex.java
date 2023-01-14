
import java.sql.*;

public class Connex {
	// Class.forName("oracle.jdbc.driver.OracleDriver");
	// System.out.println("Driver mety");

	public Connection OracleConnect() {
		Connection c = null;
		try {
			Class.forName("postgresql.jdbc.driver.postgresqlDriver");
			String url = "jdbc:postgresql://postgresql.private:5432/java";
			String user = "";
			String pwd = "";
			//c = DriverManager.getConnection(url, user, pwd);
		   c = DriverManager.getConnection(url, user, pwd);

		} catch (Exception e) {
			System.out.println("Erreur de connexion");
			System.out.println(e);
		}
		if (c != null) {
			System.out.println("Connexion etablie");
		}

		return c;
	}

	public void SuiteConnex(Connection c) {
		try {
			Statement stmt = c.createStatement();
			ResultSet res = stmt.executeQuery("select * from rounds");
			while (res.next()) {
				System.out.println(res.getInt(1) + "  " + res.getString(2) + "  " + res.getString(3) + "  "
						+ res.getInt(4) + "  " + res.getString(5) + "  " + res.getDouble(6) + "  " + res.getInt(7)
						+ "  " + res.getInt(8));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static Statement getStatement(Connection c) {
		Statement stmt = null;
		try {
			stmt = c.createStatement();
		} catch (Exception e) {
			System.out.println(e);
		}
		return stmt;
	}

	public void Closeconnex(Connection c) {
		try {
			if (c != null) {
				c.commit();
				System.out.println("Transaction effectuee");

				c.close();
				c = null;
				System.out.println("Connexion fermee");
			} else {
				System.out.println("Connexion deja fermee");
			}
		} catch (Exception e) {
			System.out.println("Erreur de la fermeture (exception)");
			System.out.println(e);
		}

	}

	public static int getseq(Connection Con, String col) throws SQLException {
		Connex cnx = new Connex();
		int i = 0;
		if (Con.isClosed()) {
			System.out.println("Reouverture de la connection");
			Con = cnx.OracleConnect();
		}
		try {
			Statement st = Con.createStatement();
			ResultSet re = st.executeQuery(" SELECT " + col + " FROM Dual ");
			// étape 5: extraire les données
			while (re.next()) {
				// Récupérer par nom de colonne
				i = re.getInt(col);
				// System.out.print("ID:"+i);
			}

			// étape 6: fermez l'objet de connexion
			// Con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;

	}
	
	public void resetsq(Connection cn, Object o, String requet) throws SQLException {
		Connex cnx = new Connex();
		try {
			if (cn.isClosed()) {
				System.out.println("Reouverture de la connection");
				cn = cnx.OracleConnect();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		Statement stmt = Connex.getStatement(cn);
		String query = "Drop SEQUENCE seqNombre";
	
		stmt.executeUpdate(query);
	
		String query3 = "CREATE SEQUENCE seqPoint START WITH 1 INCREMENT BY 1";
		
		stmt.executeUpdate(query3);
		stmt.close();
		cn.close();
		System.out.println("Fermeture de la connexion");

	}

}
/*
 * String url = "jdbc:oracle:thin:@localhost:1521:orcl";
 * String user = "nero";
 * String pass = "1234";
 */