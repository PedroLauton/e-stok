package br.com.estok.exception;

public class ExecutionUnsuccessfulException extends Exception{

	private static final long serialVersionUID = 1L;

	public ExecutionUnsuccessfulException(String mensagem) {
		super(mensagem);
	}
	
	public ExecutionUnsuccessfulException(String mensagem, Throwable cause) {
		super(mensagem, cause);
	}
}
