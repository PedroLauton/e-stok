package br.com.estok.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Captura a sessão do usuário
		HttpSession session = request.getSession(false);

		//Se a sessão for diferente de nulo, destrói e redireciona para o index.
		if(session != null) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}
	}
}
