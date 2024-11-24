package br.com.estok.factory;

import br.com.estok.service.LoginService;
import br.com.estok.service.ProdutoService;

public class ControllerFactory {

	public static LoginService criarLoginService() {
		return new LoginService();
	}
	
	public static ProdutoService criarProdutoService() {
		return new ProdutoService();
	}
}
