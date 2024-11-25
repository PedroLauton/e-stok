package br.com.estok.exception;

public class AuthenticationException extends Exception {

	private static final long serialVersionUID = 1L;
	
	public AuthenticationException(String mensagem) {
		super(mensagem);
	}
	
	public AuthenticationException(String mensagem, Throwable cause) {
		super(mensagem, cause);
	}
}
