package br.com.estok.entities.DTO;

public class ValoresNutricionaisDTO {
	
	private Double valorEnergetico;
	private Double carboidratos;
	private Double proteinas;
	private Double gordurasTotal;
	private Double gordurasTrans;
	private Double gordurasSaturadas;
	private Double vitaminas;
	private Double porcao;
	
	public ValoresNutricionaisDTO() {
	}
	
	public ValoresNutricionaisDTO(Double valorEnergetico, Double carboidratos, Double proteinas, Double gordurasTotal,Double gordurasTrans, Double gordurasSaturadas,  Double vitaminas, Double porcao) {
		this.valorEnergetico = valorEnergetico;
		this.carboidratos = carboidratos;
		this.proteinas = proteinas;
		this.gordurasTotal = gordurasTotal;
		this.gordurasTrans = gordurasTrans;
		this.gordurasSaturadas = gordurasSaturadas;
		this.vitaminas = vitaminas;
		this.porcao = porcao;
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
}
