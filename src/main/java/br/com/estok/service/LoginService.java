package br.com.estok.service;

import br.com.estok.entities.Usuario;
import br.com.estok.factory.ServiceFactory;
import br.com.estok.repositories.UsuarioRepository;

public class LoginService {
	
	private UsuarioRepository usuarioRepository = ServiceFactory.criarLoginRepository();
	
	public Usuario autenticacaoUsuario(String login, String senha) {
		Usuario usuario = new Usuario(login, senha);
		Usuario usuarioAutenticado = usuarioRepository.autenticacao(usuario);
		return usuarioAutenticado;
	}	
}
