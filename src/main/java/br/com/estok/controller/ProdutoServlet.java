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
import br.com.estok.exception.ExecutionUnsuccessfulException;
import br.com.estok.exception.ValidationErrorDTO;
import br.com.estok.factory.ControllerFactory;
import br.com.estok.service.ProdutoService;
import br.com.estok.util.LocalDateAdapter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//Diferentes URLs que o servlet trata
@WebServlet(urlPatterns={"/produto", "/produto/editar"})
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	/*Instanciação do objeto service para manipulação das requisições. 
	 *Serve de comunicação com as outras camadas da aplicação.
	*/
	private ProdutoService produtoService = ControllerFactory.criarProdutoService();
	private Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();

    public ProdutoServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//Captura o contexto da URL.
    	String contexto = request.getContextPath();
    	//Captura apenas a URL sem contexto, ou seja, somente o endpoint.
    	String uri = request.getRequestURI().substring(contexto.length());
		
		//Caso o endpoint chamado seja '/produto/editar', uma rotina é acionada.
		if(uri.equals("/produto/editar")) {
			getEdicao(request, response);
		} else {
			//Caso não seja a URL anterior, retorna todos os produtos do banco para consulta.
			try{
				List<Produto> listProdutos = produtoService.listarTodosProdutos();
				String jsonProdutos = gson.toJson(listProdutos);
				
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonProdutos);
			} catch(DbException e) {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				response.getWriter().write(e.getMessage());		
			}
		}
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Capturando todos os dados recebidos.
		String json = request.getReader().lines().collect(Collectors.joining());
		//Instanciando as classes DTOs para tranferência de dados.
        ProdutoDTO produtoDTO = gson.fromJson(json, ProdutoDTO.class);
        ValoresNutricionaisDTO valoresNutricionaisDTO = gson.fromJson(json, ValoresNutricionaisDTO.class);
        
        //Tenta inserir o produto. Caso algum erro ocorra, é capturado pelo 'catch' e exibido para o usuário.
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
		} catch (ExecutionUnsuccessfulException e) {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
			response.getWriter().write(e.getMessage());	
		} catch(NullPointerException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write("Erro ao enviar os dados. Tente novamente.");	
		}
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Captura o ID do produto a ser editado.
		String idParametro = request.getParameter("id");
    	
		//Caso o ID seja nulo, retorna uma excção.
    	if(idParametro == null) {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
			response.getWriter().write("Id Nulo.");
		}
		
    	//Captura os dados enviados para alteração.
		String json = request.getReader().lines().collect(Collectors.joining());

		//Instancia os DTOs para transferência de dados. 
		ProdutoDTO produtoDTO = gson.fromJson(json, ProdutoDTO.class);
        ValoresNutricionaisDTO valoresNutricionaisDTO = gson.fromJson(json, ValoresNutricionaisDTO.class);
                
		try {
			//Transforma o ID para o tipo Long, o mesmo do banco de dados.
    		Long id = Long.decode(idParametro);

    		produtoService.editarProdutoId(id, produtoDTO, valoresNutricionaisDTO);
		    response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("Produto Editado com sucesso!");		
		} catch (DbException e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write(e.getMessage());		
		} catch (ValidationErrorDTO e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write(e.getMessage());	
		} catch (ExecutionUnsuccessfulException e) {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
			response.getWriter().write(e.getMessage());		
		} catch(NullPointerException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write("Erro ao enviar os dados. Tente novamente.");	
		}
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Captura o ID do produto a ser editado.
		String idParametro = request.getParameter("id");
		    	
		//Caso o ID seja nulo, retorna uma excção.
		if(idParametro == null) {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
			response.getWriter().write("Id Nulo.");
		}
		
		try {
			//Transforma o ID para Long, o mesmo tipo do bando de dados.
			Long id = Long.decode(idParametro);
			produtoService.deletarProdutoId(id);
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("Produto deletado com sucesso!");
		} catch(DbException e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write(e.getMessage());
		} catch(ExecutionUnsuccessfulException e) {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
			response.getWriter().write(e.getMessage());
		}
	}
	
    private void getEdicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//Captura o ID do produto a ser editado.
    	String idParametro = request.getParameter("id");
    			    	
    	//Caso o ID seja nulo, retorna uma excção.
    	if(idParametro == null) {
    		response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    		response.getWriter().write("Id Nulo.");
    	}
    	
    	try {
			//Transforma o ID para Long, o mesmo tipo do bando de dados.
    		Long id = Long.decode(idParametro);
    		Produto produto = produtoService.listarProdutoId(id);
    		//Transforma o produto em Json.
    		String jsonProdutos = gson.toJson(produto);
    		//Encaminha para a página.
    		response.setContentType("application/json");
    		response.setCharacterEncoding("UTF-8");
    		response.getWriter().write(jsonProdutos);	
    	} catch(DbException e) {
    		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write(e.getMessage());
    	} catch(ExecutionUnsuccessfulException e) {
    		response.setStatus(HttpServletResponse.SC_NO_CONTENT);
			response.getWriter().write(e.getMessage());
    	}
    }
}
