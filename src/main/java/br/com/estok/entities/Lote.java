package br.com.estok.entities;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

public class Lote {
	
	private Long id;
	private String codigoLote;
	private Integer quantidadeProdutos;
	private LocalDate dataEntrega;
	private LocalDate dataVencimentoProdutos;
	private String qrCode;
	
	private List<Notificacao> notificacoes; 
	
	public Lote(String codigoLote, Integer quantidadeProdutos, LocalDate dataEntrega, LocalDate dataVencimentoProdutos,String qrCode) {
		this.codigoLote = codigoLote;
		this.quantidadeProdutos = quantidadeProdutos;
		this.dataEntrega = dataEntrega;
		this.dataVencimentoProdutos = dataVencimentoProdutos;
		this.qrCode = qrCode;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getCodigoLote() {
		return codigoLote;
	}
	
	public void setCodigoLote(String codigoLote) {
		this.codigoLote = codigoLote;
	}
	
	public Integer getQuantidadeProdutos() {
		return quantidadeProdutos;
	}
	
	public void setQuantidadeProdutos(Integer quantidadeProdutos) {
		this.quantidadeProdutos = quantidadeProdutos;
	}
	
	public LocalDate getDataEntrega() {
		return dataEntrega;
	}
	
	public void setDataEntrega(LocalDate dataEntrega) {
		this.dataEntrega = dataEntrega;
	}
	
	public LocalDate getDataVencimentoProdutos() {
		return dataVencimentoProdutos;
	}
	
	public void setDataVencimentoProdutos(LocalDate dataVencimentoProdutos) {
		this.dataVencimentoProdutos = dataVencimentoProdutos;
	}
	
	public String getQrCode() {
		return qrCode;
	}
	
	public void setQrCode(String qrCode) {
		this.qrCode = qrCode;
	}
	
	public List<Notificacao> getNotificacoes() {
		return notificacoes;
	}
	
	public void addNotificacao(Notificacao notificacao) {
		notificacoes.add(notificacao);
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
		Lote other = (Lote) obj;
		return Objects.equals(id, other.id);
	}
}
