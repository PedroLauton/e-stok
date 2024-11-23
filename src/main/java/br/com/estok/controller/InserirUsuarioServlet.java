package br.com.estok.controller;

import java.io.IOException;

import br.com.estok.entities.Usuario;
import br.com.estok.entities.enums.TipoUsuario;
import br.com.estok.repositories.UsuarioRepository;
import br.com.estok.repositories.connection.DbConexao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cadastro")
public class InserirUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InserirUsuarioServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TipoUsuario tipoUsuario = TipoUsuario.valueOf(request.getParameter("tipoUsuario").toUpperCase());
		
		Usuario user = new Usuario(request.getParameter("nome"), 
				request.getParameter("login"), 
				request.getParameter("senha"), 
				tipoUsuario);
		UsuarioRepository inserir = new UsuarioRepository(DbConexao.getConexao());
		
		inserir.inserirUsuario(user);
	}

}
