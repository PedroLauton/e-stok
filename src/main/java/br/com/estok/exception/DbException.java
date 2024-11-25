package br.com.estok.exception;

public class DbException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	public DbException(String mensagem) {
		super(mensagem);
	}
	
	public DbException(String mensagem, Throwable cause) {
		super(mensagem, cause);
	}
}
