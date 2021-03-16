package org.websparrow.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Admin {

	// method for creating connection
	public static Connection myconnection() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/websparrow", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String registerUser(String uname, String uemail, String upass, String udeg) throws SQLException, Exception {
		try {
			String sql = "INSERT INTO STRUTS2CRUD VALUES (?,?,?,?)";
			PreparedStatement ps = myconnection().prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, uemail);
			ps.setString(3, upass);
			ps.setString(4, udeg);
			ps.executeUpdate();
			return "Enregistrement avec succ�s";
		} catch (Exception e) {
			e.printStackTrace();
			//return e.getMessage();
			return "erreur au cours d'enregistrement";
		} finally {
			if (myconnection() != null) {
				myconnection().close();
			}
		}
	}

	public ResultSet report() throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String sql = "SELECT UNAME,UEMAIL,UPASS,UDEG FROM STRUTS2CRUD";
			PreparedStatement ps = myconnection().prepareStatement(sql);
			rs = ps.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (myconnection() != null) {
				myconnection().close();
			}
		}
	}

	public String updateUser(String uname, String uemail, String upass, String udeg, String hiddenuemail)
			throws SQLException, Exception {
		try {
			String sql = "UPDATE STRUTS2CRUD SET UNAME=?,UEMAIL=?,UPASS=?, UDEG=? WHERE UEMAIL=?";
			PreparedStatement ps = myconnection().prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, uemail);
			ps.setString(3, upass);
			ps.setString(4, udeg);
			ps.setString(5, hiddenuemail);
			ps.executeUpdate();
			return "Mise � jour avec succ�s";
		} catch (Exception e) {
			e.printStackTrace();
			//return e.getMessage();
			return "Email deja Existe";
		} finally {
			if (myconnection() != null) {
				myconnection().close();
			}
		}
	}

	public String deleteUser(String uemail) throws SQLException, Exception {
		try {
			String sql = "DELETE FROM STRUTS2CRUD WHERE UEMAIL=?";
			PreparedStatement ps = myconnection().prepareStatement(sql);
			ps.setString(1, uemail);
			ps.executeUpdate();
			return "Suppression avec succ�s";
		} catch (Exception e) {
			e.printStackTrace();
			//return e.getMessage();
			return "Erreur aux Cours de Suppression"; 
		} finally {
			if (myconnection() != null) {
				myconnection().close();
			}
		}
	
}
}
