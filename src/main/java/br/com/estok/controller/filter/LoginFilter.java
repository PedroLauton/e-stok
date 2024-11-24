package br.com.estok.controller.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class LoginFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;

	public LoginFilter() {
		super();
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		String uri = httpRequest.getRequestURI();

		HttpSession sessao = httpRequest.getSession(false);

		if ((sessao != null && sessao.getAttribute("Usuario") != null) || uri.endsWith("index.jsp")
				|| uri.endsWith("login.jsp") || uri.contains("/login")) {
			chain.doFilter(request, response);
		} else {
			httpResponse.sendRedirect("../index.jsp");
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
