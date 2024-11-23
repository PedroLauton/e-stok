package br.com.estok.controller;

import java.io.IOException;

import br.com.estok.entities.Usuario;
import br.com.estok.repositories.UsuarioRepository;
import br.com.estok.repositories.connection.DbConexao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public LoginServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    		
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");

		Usuario usuario = new Usuario();
		usuario.setLogin(login);
		usuario.setSenha(senha);
		
		UsuarioRepository usuarioRepository = new UsuarioRepository(DbConexao.getConexao());
		Usuario usuarioAutenticado = usuarioRepository.autenticacao(usuario);
		
		if(usuarioAutenticado != null) {
			request.getRequestDispatcher("paginas/menuADM.html").forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}

	}

}
