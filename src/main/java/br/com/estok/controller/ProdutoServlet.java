package br.com.estok.controller;

import java.io.IOException;
import java.util.List;

import br.com.estok.entities.Produto;
import br.com.estok.factory.ControllerFactory;
import br.com.estok.service.ProdutoService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/produto")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	private ProdutoService produtoService = ControllerFactory.criarProdutoService();
	
    public ProdutoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Produto> produtos = produtoService.listarTodosProdutos();
		request.setAttribute("Produtos", produtos);
		RequestDispatcher rd  = request.getRequestDispatcher("pages/consultarProduto.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		produtoService.inserirProduto(request, response);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
