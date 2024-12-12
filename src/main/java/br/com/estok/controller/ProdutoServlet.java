package br.com.estok.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.estok.entities.Produto;
import br.com.estok.entities.DTO.ProdutoDTO;
import br.com.estok.entities.DTO.ValoresNutricionaisDTO;
import br.com.estok.exception.DbException;
import br.com.estok.exception.ValidationErrorDTO;
import br.com.estok.factory.ControllerFactory;
import br.com.estok.service.ProdutoService;
import br.com.estok.util.LocalDateAdapter;
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
		String idParametro = request.getParameter("id");
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, 
				new LocalDateAdapter())
				.create();

		if(idParametro != null && !idParametro.isEmpty()) {
			try {
				Long id = Long.decode(idParametro);
				Produto produto = produtoService.listarProdutoId(id);
				String jsonProdutos = gson.toJson(produto);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonProdutos);
			} catch(DbException e) {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				response.getWriter().write(e.getMessage());		
			}
		} else {
			List<Produto> listProdutos = produtoService.listarTodosProdutos();
			String jsonProdutos = gson.toJson(listProdutos);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonProdutos);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json = request.getReader().lines().collect(Collectors.joining());
		Gson gson = new Gson();
        ProdutoDTO produtoDTO = gson.fromJson(json, ProdutoDTO.class);
        ValoresNutricionaisDTO valoresNutricionaisDTO = gson.fromJson(json, ValoresNutricionaisDTO.class);
                
		try {
			produtoService.inserirProduto(produtoDTO, valoresNutricionaisDTO);
		    response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("Produto cadastrado com sucesso!");		
		} catch (DbException e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write(e.getMessage());		
		} catch (ValidationErrorDTO e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write(e.getMessage());	
		} catch(NullPointerException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write("Erro ao enviar os dados. Tente novamente.");	
		}
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long id = Long.decode(request.getParameter("id"));
		
		if(id == null) {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
			response.getWriter().write("Id Nulo.");
		}
		
		try {
			produtoService.deletarProdutoId(id);
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("Produto deletado com sucesso!");
		} catch(DbException e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write(e.getMessage());
		}
	}
}
