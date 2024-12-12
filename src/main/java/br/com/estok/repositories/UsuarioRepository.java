package br.com.estok.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.estok.entities.Usuario;
import br.com.estok.entities.enums.TipoUsuario;
import br.com.estok.exception.DbException;

public class UsuarioRepository {
	
	private Connection conn; 
	
	public UsuarioRepository(Connection conn) {
		this.conn = conn;
	}

	public void inserirUsuario(Usuario user) throws DbException {
		try {
			PreparedStatement pst = conn.prepareStatement("INSERT INTO "
					+ "tb_usuario(nome, login, senha, tipo_usuario) "
					+ "VALUES (?,?,?,?)");
			
			pst.setString(1, user.getNome());
			pst.setString(2, user.getLogin());
			pst.setString(3, user.getSenha());
			pst.setString(4, user.getTipoUsuario().name());
			
			pst.executeUpdate();
		} catch (SQLException e) {
			throw new DbException("Erro ao inserir o usuário. Verifique as credenciais e conexão com o banco.");
		} 
	}

	public Usuario autenticacao(Usuario user) throws DbException {
		try {
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM "
					+ "tb_usuario WHERE login = ? and senha = ?");
			
			pst.setString(1, user.getLogin());
			pst.setString(2, user.getSenha());
			
			ResultSet rs = pst.executeQuery();
			Usuario usuarioAutenticado = null;
			
			if(rs.next()) {
				usuarioAutenticado = new Usuario();
				usuarioAutenticado.setId(rs.getLong("id_usuario"));
				usuarioAutenticado.setNome(rs.getString("nome"));
				usuarioAutenticado.setLogin(rs.getString("login"));
				usuarioAutenticado.setSenha(rs.getString("senha"));
				usuarioAutenticado.setTipoUsuario(cargoUsuario(rs));
			}
			
			return usuarioAutenticado;
		} catch (SQLException e) {
			throw new DbException("Erro ao realizar a autenticação. Contacte o Administrador do E-stok.");
		} 
	}
	
	private TipoUsuario cargoUsuario(ResultSet rs) throws DbException {
		try {
			String dado = rs.getString("tipo_usuario");
			TipoUsuario tipoUsuario = TipoUsuario.valueOf(dado);
			return tipoUsuario;
		} catch (SQLException e) {
			throw new DbException("Erro ao realizar a autenticação (Cargo). Contacte o Administrador do E-stok.");
		}
	}
}
