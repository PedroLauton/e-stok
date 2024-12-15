<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../styles/estilo.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="../recursos/img/logo-estok.png">
    <title>E-Stok - Login</title>
</head>
<body class="d-flex flex-column min-vh-100">
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="../index.jsp">E-Stok</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item me-3"><a class="nav-link" href="../index.jsp">Home</a>
                    </li>
                    <li class="nav-item me-3"><a class="nav-link" href="../index.jsp#sobre">Sobre</a></li>
                    <li class="nav-item me-3"><a class="nav-link"
                            href="../index.jsp#funcionalidades">Funcionalidades</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="flex-grow-1 d-flex align-items-center justify-content-center position-relative">
        <div id="alerta" class="alert alert-danger position-absolute w-90 text-center d-none"
            style="top: 80px; z-index: 1050;">
        </div>
        <div class="card p-4 login-card">
            <h3 class="text-center mb-4">Login</h3>
            <form id="loginForm">
                <div class="mb-3">
                    <label for="usuario" class="form-label">Login</label>
                    <input type="text" class="form-control" id="login" name="login" placeholder="Digite seu usuário">
                </div>
                <div class="mb-3">
                    <label for="senha" class="form-label">Senha</label>
                    <input type="password" class="form-control" id="senha" name="senha" placeholder="Digite sua senha">
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-success btn-form">Entrar</button>
                </div>
            </form>
        </div>
    </main>
    <footer class="py-3 bg-white text-black text-center mt-auto">
        <p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        //Caso o formulário do login seja enviado, o Ajax inicia a conexão com o Back-end.
        $("#loginForm").on("submit", function (event) {
            //Evita que o formulário seja enviado e a página seja recarregada.
            event.preventDefault();

            //Captura as credenciais.
            const login = $("#login").val();
            const senha = $("#senha").val();

            //Inicia a conexão com o Back-end.
            $.ajax({
                url: "../login",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({ login, senha }),
                //Caso a comunicação não de erro, o usuário é redirecionado para o 'Menu Comercial'.
                success: function () {
                    window.location.href = "menuComercial.jsp";
                },
                //Caso contrário, é exibido a mensagem de erro. 
                error: function (erro) {
                    //Caso ocorra o erro, no console será exibido para visualização.
                    console.error(erro);
                    //Caso alguma exceção seja lançada pelo Back-end, o erro é capturado caso haja, se não, a mensagem padrão é exibida. 
                    const erroMensagem = erro.responseText || "Ocorreu um erro na requisição. Tente novamente.";
                    //Captura a 'div' para exibir a mensagem de erro.
                    const alerta = $("#alerta");
                    //Adiciona o erro a 'div' e exibe para o usuário.
                    alerta.text(erroMensagem);
                    alerta.removeClass("d-none").addClass("show");
                },
            });
        });
    </script>
</body>
</html>