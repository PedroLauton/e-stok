package br.com.estok.factory;

import br.com.estok.repositories.ProdutoRepository;
import br.com.estok.repositories.UsuarioRepository;
import br.com.estok.repositories.connection.DbConexao;

public class ServiceFactory {

	public static UsuarioRepository criarLoginRepository() {
		return new UsuarioRepository(DbConexao.getConexao());
	}
	
	public static ProdutoRepository criarProdutooRepository() {
		return new ProdutoRepository(DbConexao.getConexao());
	}

}
