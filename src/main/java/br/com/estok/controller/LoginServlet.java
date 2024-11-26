package br.com.estok.controller;

import java.io.IOException;
import java.util.stream.Collectors;

import com.google.gson.Gson;

import br.com.estok.entities.Usuario;
import br.com.estok.entities.DTO.LoginDTO;
import br.com.estok.exception.AuthenticationException;
import br.com.estok.exception.DbException;
import br.com.estok.factory.ControllerFactory;
import br.com.estok.service.LoginService;
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
    	HttpSession sessao = request.getSession(false);

		if ((sessao != null && sessao.getAttribute("Usuario") != null)) {
	    	//Redireciona para a páginas de Login.
	    	response.sendRedirect("pages/menuComercial.jsp");		
		} else {
			//Redireciona para a páginas de Login.
	    	response.sendRedirect("pages/login.jsp");		
	    }
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Lê os dados JSON enviados no corpo da requisição
        String json = request.getReader().lines().collect(Collectors.joining());
		Gson gson = new Gson();
        LoginDTO loginDTO = gson.fromJson(json, LoginDTO.class);
        
		try {
	        //Usuário autenticado
	        Usuario usuarioAutenticado = loginService.autenticacaoUsuario(loginDTO);
			//Se autenticado, inicia sessão e retorna sucesso
            HttpSession sessao = request.getSession();
            sessao.setAttribute("Usuario", usuarioAutenticado);
            response.setStatus(HttpServletResponse.SC_OK);
		} catch (DbException e) {
			//Caso ocorra um erro no banco de dado. 
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write(e.getMessage());
		} catch (AuthenticationException e) {
			 //Caso o usuário informado não seja encontrado. 
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			response.getWriter().write(e.getMessage());
		} 	
    }
}
