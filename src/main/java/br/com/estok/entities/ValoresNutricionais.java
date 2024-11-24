package br.com.estok.entities;

import java.util.Objects;

public class ValoresNutricionais {
	
	private Long id;
	private Double valorEnergetico;
	private Double carboidratos;
	private Double proteinas;
	private Double gordurasTotal;
	private Double gordurasTrans;
	private Double gordurasSaturadas;
	private Double vitaminas;
	private Double porcao;
	
	public ValoresNutricionais(Double valorEnergetico, Double carboidratos, Double proteinas, Double gordurasTotal,Double gordurasTrans, Double gordurasSaturadas,  Double vitaminas, Double porcao) {
		this.valorEnergetico = valorEnergetico;
		this.carboidratos = carboidratos;
		this.proteinas = proteinas;
		this.gordurasTotal = gordurasTotal;
		this.gordurasTrans = gordurasTrans;
		this.gordurasSaturadas = gordurasSaturadas;
		this.vitaminas = vitaminas;
		this.porcao = porcao;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Double getValorEnergetico() {
		return valorEnergetico;
	}
	
	public void setValorEnergetico(Double valorEnergetico) {
		this.valorEnergetico = valorEnergetico;
	}
	
	public Double getCarboidratos() {
		return carboidratos;
	}
	
	public void setCarboidratos(Double carboidratos) {
		this.carboidratos = carboidratos;
	}
	
	public Double getProteinas() {
		return proteinas;
	}
	
	public void setProteinas(Double proteinas) {
		this.proteinas = proteinas;
	}
	
	public Double getGordurasTotal() {
		return gordurasTotal;
	}

	public void setGordurasTotal(Double gordurasTotal) {
		this.gordurasTotal = gordurasTotal;
	}

	public Double getGordurasTrans() {
		return gordurasTrans;
	}

	public void setGordurasTrans(Double gordurasTrans) {
		this.gordurasTrans = gordurasTrans;
	}

	public Double getGordurasSaturadas() {
		return gordurasSaturadas;
	}

	public void setGordurasSaturadas(Double gordurasSaturadas) {
		this.gordurasSaturadas = gordurasSaturadas;
	}
	
	public Double getVitaminas() {
		return vitaminas;
	}

	public void setVitaminas(Double vitaminas) {
		this.vitaminas = vitaminas;
	}

	public Double getPorcao() {
		return porcao;
	}
	
	public void setPorcao(Double porcao) {
		this.porcao = porcao;
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
		ValoresNutricionais other = (ValoresNutricionais) obj;
		return Objects.equals(id, other.id);
	} 
}
