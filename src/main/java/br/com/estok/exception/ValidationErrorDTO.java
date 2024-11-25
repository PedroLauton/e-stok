package br.com.estok.exception;

public class ValidationErrorDTO extends Exception{

	private static final long serialVersionUID = 1L;

	public ValidationErrorDTO(String mensagem) {
		super(mensagem);
	}
	
	public ValidationErrorDTO(String mensagem, Throwable cause) {
		super(mensagem, cause);
	}
}
