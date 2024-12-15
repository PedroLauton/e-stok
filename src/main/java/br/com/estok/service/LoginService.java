package br.com.estok.service;

import br.com.estok.entities.Usuario;
import br.com.estok.entities.DTO.LoginDTO;
import br.com.estok.exception.AuthenticationException;
import br.com.estok.exception.DbException;
import br.com.estok.factory.ServiceFactory;
import br.com.estok.repositories.UsuarioRepository;

public class LoginService {
	
	private UsuarioRepository usuarioRepository = ServiceFactory.criarLoginRepository();
	
	public Usuario autenticacaoUsuario(LoginDTO loginDTO) throws DbException, AuthenticationException {
		//Instancia um usuário para autenticação.
		Usuario usuarioAutenticado = usuarioRepository.autenticacao(new Usuario(loginDTO.getLogin(), loginDTO.getSenha()));
		
		/*Se o usuário retornado for diferente de nulo, não existe correspondêcia 
		 *desse usuário no banco de dados, então a exceção é lançada.
		*/
		if(usuarioAutenticado == null) {
			throw new AuthenticationException("Usuário ou senha incorretos. Tente novamente.");
		} else {
			return usuarioAutenticado;			
		}
	}	
}
