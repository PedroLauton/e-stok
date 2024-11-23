package br.com.estok.entities;

import java.util.Objects;

public class ValoresNutricionais {
	
	private Long id;
	private Double valorEnergetico;
	private Double carboidratos;
	private Double proteinas;
	private Double gorduras;
	private Double porcao;
	
	public ValoresNutricionais(Double valorEnergetico, Double carboidratos, Double proteinas, Double gorduras, Double porcao) {
		this.valorEnergetico = valorEnergetico;
		this.carboidratos = carboidratos;
		this.proteinas = proteinas;
		this.gorduras = gorduras;
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
	
	public Double getGorduras() {
		return gorduras;
	}
	
	public void setGorduras(Double gorduras) {
		this.gorduras = gorduras;
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
