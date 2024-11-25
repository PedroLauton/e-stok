package br.com.estok.entities.DTO;

public class LoginDTO {
    private String login;
    private String senha;

    public LoginDTO(String login, String senha) {
        this.login = login;
        this.senha = senha;
    }

    public String getLogin() {
        return login;
    }

    public String getSenha() {
        return senha;
    }
}
