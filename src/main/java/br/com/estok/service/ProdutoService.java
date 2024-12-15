package br.com.estok.service;

import java.util.List;

import br.com.estok.entities.Produto;
import br.com.estok.entities.ValoresNutricionais;
import br.com.estok.entities.DTO.ProdutoDTO;
import br.com.estok.entities.DTO.ValoresNutricionaisDTO;
import br.com.estok.exception.DbException;
import br.com.estok.exception.ExecutionUnsuccessfulException;
import br.com.estok.exception.ValidationErrorDTO;
import br.com.estok.factory.ServiceFactory;
import br.com.estok.repositories.ProdutoRepository;

public class ProdutoService {

private ProdutoRepository produtoRepository = ServiceFactory.criarProdutooRepository();

	public void inserirProduto(ProdutoDTO produtoDTO, ValoresNutricionaisDTO valoresNutricionaisDTO) throws DbException, ValidationErrorDTO, ExecutionUnsuccessfulException {
		//Verifica se os DTOs estão instanciados.
		if (produtoDTO == null || valoresNutricionaisDTO == null) {
			throw new ValidationErrorDTO("Inconsistência nos dados. Tente reenviar o formulário.");
		}
		
		// Instanciar a entidade produto.
		Produto produtoInserir = instanciarProduto(produtoDTO);
		// Inserir produto no banco de dados, retornando o ID para inserir os valores nutricionais.
		produtoRepository.inserirProduto(produtoInserir);
		// Instanciando e inserindo os valores nutricionais.
		ValoresNutricionais valoresNutricionaisInserir = instanciarValoresNutricionais(valoresNutricionaisDTO);
		produtoRepository.inserirValoresNutricionaisProduto(valoresNutricionaisInserir, produtoInserir);
	}
	
	public List<Produto> listarTodosProdutos() throws DbException{
		return produtoRepository.listarTodosProdutos();
	}
	
	public Produto listarProdutoId(Long id) throws DbException, ExecutionUnsuccessfulException{
		return produtoRepository.listarProdutoId(id);
	}
	
	public void deletarProdutoId(Long id) throws DbException, ExecutionUnsuccessfulException{
		produtoRepository.deletarProdutoId(id);
	}
	
	public void editarProdutoId(Long id, ProdutoDTO produtoDTO, ValoresNutricionaisDTO valoresNutricionaisDTO) throws DbException, ExecutionUnsuccessfulException, ValidationErrorDTO{
		//Verifica se os DTOs estão instanciados.
		if (produtoDTO == null || valoresNutricionaisDTO == null) {
			throw new ValidationErrorDTO("Inconsistência nos dados. Tente reenviar o formulário.");
		}
		
		//Instancia o produto.
		Produto produtoEditar = instanciarProduto(produtoDTO);
		//Instancia os valoresNutricionais.
		ValoresNutricionais valoresNutricionais = instanciarValoresNutricionais(valoresNutricionaisDTO);
		produtoEditar.setValoresNutricionais(valoresNutricionais);
		//Envia os objetos para edição.
		produtoRepository.editarProdutoId(id, produtoEditar);
	}
	
	//Método para instanciar objetos 'Produto'
	private Produto instanciarProduto(ProdutoDTO produtoDTO) {
		Produto produtoInserir = new Produto(produtoDTO.getNome(),
				produtoDTO.getFoto(),
				produtoDTO.getCategoriaProduto(),
				produtoDTO.getFabricante());
		
		return produtoInserir;
	}
	
	//Método para instanciar objetos 'ValoresNutricionais'
	private ValoresNutricionais instanciarValoresNutricionais(ValoresNutricionaisDTO valoresNutricionaisDTO) {
		ValoresNutricionais valoresNutricionais = new ValoresNutricionais(
				valoresNutricionaisDTO.getValorEnergetico(),
				valoresNutricionaisDTO.getCarboidratos(),
				valoresNutricionaisDTO.getProteinas(),
				valoresNutricionaisDTO.getGordurasTotal(),
				valoresNutricionaisDTO.getGordurasTrans(),
				valoresNutricionaisDTO.getGordurasSaturadas(),
				valoresNutricionaisDTO.getVitaminas(),
				valoresNutricionaisDTO.getPorcao());
		
		return valoresNutricionais;
	} 
}
