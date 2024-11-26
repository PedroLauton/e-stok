package br.com.estok.entities.DTO;

import br.com.estok.entities.enums.CategoriaProduto;

public class ProdutoDTO {
	
	private String nome;
	private String foto;
	private String categoriaProduto;
	private String fabricante;
	
	public ProdutoDTO() {
	}
	
	public ProdutoDTO(String nome, String foto, String categoriaProduto, String fabricante) {
		this.nome = nome;
		this.foto = foto;
		this.categoriaProduto = categoriaProduto;
		this.fabricante = fabricante;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getFoto() {
		return foto;
	}
	
	public void setFoto(String foto) {
		this.foto = foto;
	}
	
	public CategoriaProduto getCategoriaProduto() {
		return CategoriaProduto.valueOf(categoriaProduto.toUpperCase());
	}
	
	public void setCategoriaProduto(String categoriaProduto) {
		this.categoriaProduto = categoriaProduto;
	}
	
	public String getFabricante() {
		return fabricante;
	}
	
	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}
}
