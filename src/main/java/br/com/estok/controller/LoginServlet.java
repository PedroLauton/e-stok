package br.com.estok.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.stream.Collectors;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.estok.entities.Usuario;
import br.com.estok.entities.DTO.LoginDTO;
import br.com.estok.exception.AuthenticationException;
import br.com.estok.exception.DbException;
import br.com.estok.factory.ControllerFactory;
import br.com.estok.service.LoginService;
import br.com.estok.util.LocalDateAdapter;
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
	private Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
	
    public LoginServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//Captura a sessão do usuário. 
    	HttpSession sessao = request.getSession(false);

    	//Caso o usuário esteja logado, ele entrará automaticamente na área de gerenciamento, não passando pelo login novamente.
		if ((sessao != null && sessao.getAttribute("Usuario") != null)) {
	    	response.sendRedirect("pages/menuComercial.jsp");		
		} else {
	    	response.sendRedirect("pages/login.jsp");		
	    }
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Lê os dados JSON enviados no corpo da requisição.
        String json = request.getReader().lines().collect(Collectors.joining());
        //Instanciandos o DTO para tranferência de dados.
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
		} catch (IllegalArgumentException e) {
			//Caso algum valor ilegal seja encontrado.
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write(e.getMessage());
	    }	
    }
}
