package br.com.estok.service;

import br.com.estok.entities.Produto;
import br.com.estok.entities.ValoresNutricionais;
import br.com.estok.entities.enums.CategoriaProduto;
import br.com.estok.factory.ServiceFactory;
import br.com.estok.repositories.ProdutoRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProdutoService {

private ProdutoRepository produtoRepository = ServiceFactory.criarProdutooRepository();
	
	public void inserirProduto(HttpServletRequest request, HttpServletResponse response) {
		Produto produtoInserir = instanciarProduto(request);
		produtoRepository.inserirProduto(produtoInserir);
		ValoresNutricionais valoresNutricionais = instanciarValoresNutricionais(request);
		produtoRepository.inserirValoresNutricionaisProduto(valoresNutricionais, produtoInserir);
	}

	private Produto instanciarProduto(HttpServletRequest request) {
		String nome = request.getParameter("nome");
		String foto = request.getParameter("foto");
		CategoriaProduto categoria = CategoriaProduto.valueOf(request.getParameter("categoriaProduto").toUpperCase());
		String fabricante = request.getParameter("fabricante");

		Produto produtoInserir = new Produto(nome, foto, categoria, fabricante);
		return produtoInserir;
	}
	
	private ValoresNutricionais instanciarValoresNutricionais(HttpServletRequest request) {
		try{
			Double valorEnergetico = Double.parseDouble(request.getParameter("valorEnergetico"));
			Double carboidratos = Double.parseDouble(request.getParameter("carboidratos"));
			Double proteinas = Double.parseDouble(request.getParameter("proteinas"));
			Double gordurasTotal = Double.parseDouble(request.getParameter("gordurasTotal"));
			Double gordurasTrans = Double.parseDouble(request.getParameter("gordurasTrans"));
			Double gordurasSaturadas = Double.parseDouble(request.getParameter("gordurasSaturadas"));
			Double vitaminas = Double.parseDouble(request.getParameter("vitaminas"));
			Double porcao = Double.parseDouble(request.getParameter("porcao"));
			
			ValoresNutricionais valoresNutricionais = new ValoresNutricionais(valorEnergetico, carboidratos, proteinas, gordurasTotal, gordurasTrans, gordurasSaturadas, vitaminas, porcao);
			return valoresNutricionais;
		} catch (NumberFormatException e) {
		    e.printStackTrace();
		}
		return null;
	}
	
}
