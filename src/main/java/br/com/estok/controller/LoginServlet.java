package br.com.estok.controller;

import java.io.IOException;
import java.net.ResponseCache;

import br.com.estok.entities.Usuario;
import br.com.estok.factory.ControllerFactory;
import br.com.estok.service.LoginService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private LoginService loginService = ControllerFactory.criarLoginService();
	
    public LoginServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("pages/login.jsp");		
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");

		Usuario usuarioAutenticado = loginService.autenticacaoUsuario(login, senha);
		
		if(usuarioAutenticado != null) {
			HttpSession sessao = request.getSession();
			sessao.setAttribute("Usuario", usuarioAutenticado);
			request.setAttribute("Usuario", usuarioAutenticado);			
			response.sendRedirect("pages/menuComercial.jsp");
	    } else {
			response.sendRedirect("../index.jsp");
		}

	}

}
