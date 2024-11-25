package br.com.estok.entities;

import java.util.List;
import java.util.Objects;

import br.com.estok.entities.enums.CategoriaProduto;

public class Produto {
	
	private Long id;
	private String nome;
	private String foto;
	private CategoriaProduto categoriaProduto;
	private String fabricante;
	
	private ValoresNutricionais valoresNutricionais; 
	private List<Lote> lotes;
	
	public Produto() {
	}
	
	public Produto(String nome, String foto, CategoriaProduto categoriaProduto, String fabricante) {
		this.nome = nome;
		this.foto = foto;
		this.categoriaProduto = categoriaProduto;
		this.fabricante = fabricante;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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
		return categoriaProduto;
	}

	public void setCategoriaProduto(CategoriaProduto categoriaProduto) {
		this.categoriaProduto = categoriaProduto;
	}

	public String getFabricante() {
		return fabricante;
	}

	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public ValoresNutricionais getValoresNutricionais() {
		return valoresNutricionais;
	}

	public void setValoresNutricionais(ValoresNutricionais valoresNutricionais) {
		this.valoresNutricionais = valoresNutricionais;
	}

	public List<Lote> getLotes() {
		return lotes;
	}

	public void addLotes(Lote lote) {
		lotes.add(lote);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Produto other = (Produto) obj;
		return Objects.equals(id, other.id);
	}
}
