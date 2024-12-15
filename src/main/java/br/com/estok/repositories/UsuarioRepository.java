package br.com.estok.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.estok.entities.Usuario;
import br.com.estok.entities.enums.TipoUsuario;
import br.com.estok.exception.DbException;
import br.com.estok.exception.ExecutionUnsuccessfulException;
import br.com.estok.repositories.connection.DbConexao;

public class UsuarioRepository {
	
	private Connection conn; 
	
	public UsuarioRepository(Connection conn) {
		this.conn = conn;
	}

	public void inserirUsuario(Usuario user) throws DbException, ExecutionUnsuccessfulException {
		PreparedStatement pst = null;
		
		try {
			//Criação da query de inserção.
			pst = conn.prepareStatement("INSERT INTO "
					+ "tb_usuario(nome, login, senha, tipo_usuario) "
					+ "VALUES (?,?,?,?)");
			
			pst.setString(1, user.getNome());
			pst.setString(2, user.getLogin());
			pst.setString(3, user.getSenha());
			pst.setString(4, user.getTipoUsuario().name());
			
			//Retorno de linhas afetadas no banco de dados.
			int linhasAfetadas = pst.executeUpdate();
			
			//Caso não ocorra alguma atualização no banco de dados, a exceção é lançada.
			if(linhasAfetadas <= 0) {
				throw new ExecutionUnsuccessfulException("Erro ao inserir o usuário. Tente Novamente.");
			}
			
		} catch (SQLException e) {
			throw new DbException("Erro relacionado ao banco de dados. Contacte o Administrador do E-stok.");
		} finally {
			DbConexao.fecharStatement(pst);
		}
	}

	public Usuario autenticacao(Usuario user) throws DbException {
		PreparedStatement pst = null;
		try {
			//Criação da query de autenticação.
			pst = conn.prepareStatement("SELECT * FROM "
					+ "tb_usuario WHERE login = ? and senha = ?");
			
			pst.setString(1, user.getLogin());
			pst.setString(2, user.getSenha());
			
			//Retorna o respectivo usuário.
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
			throw new DbException("Erro relacionado ao banco de dados. Contacte o Administrador do E-stok.");
		} 
	}
	
	//Tranformação da "String" retornada pelo banco em um tipo enumarado, para o instanciar o cargo do usuário.
	private TipoUsuario cargoUsuario(ResultSet rs) throws DbException {
		try {
			String dado = rs.getString("tipo_usuario");
			TipoUsuario tipoUsuario = TipoUsuario.valueOf(dado);
			return tipoUsuario;
		} catch (SQLException e) {
			throw new DbException("Erro relacionado ao banco de dados (Cargo). Contacte o Administrador do E-stok.");
		} catch (IllegalArgumentException e) {
	        // Erro ao transformar o valor em enum
	        throw new IllegalArgumentException("Valor inválido par o cargo do usuário. Verifique as informações no banco de dados.");
	    }
	}
}
