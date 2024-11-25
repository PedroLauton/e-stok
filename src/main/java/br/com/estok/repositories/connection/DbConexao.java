package br.com.estok.repositories.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import br.com.estok.exception.DbException;

public class DbConexao {
	
	private static String driver = "com.mysql.cj.jdbc.Driver";
	private static String url = "jdbc:mysql://127.0.0.1:3306/db_estok?useTimezone=True&serverTimezone=UTC";
	private static String usuario = "root";
	private static String senha = "db@mysql";
	
	private static Connection conn = null;
	
	public static Connection getConexao() {
		if(conn == null) {
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, usuario, senha);	
			} catch (SQLException e) {
				throw new DbException("Erro ao conectar no banco de dados. Verifique as credenciais e a conexão.");
			} catch (ClassNotFoundException e) {
				throw new DbException("Erro ao encontrar o driver. Verifique as credenciais.");
			} 
		}
		return conn;
	}
	
	public static void fecharConexao(Connection conn) {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				throw new DbException("Erro ao fechar a conexão com o banco.");
			}
		}
	}
	
	public static void fecharResultSet(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				throw new DbException("Erro no fechamento do resultSet."); 
			}
		}
	}
	
	public static void fecharStatement(Statement st) {
		if(st != null) {
			try {
				st.close();
			} catch (SQLException e) {
				throw new DbException("Erro no fechamento do Statement."); 
			}
		}
	}
}
