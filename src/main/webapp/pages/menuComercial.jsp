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
    <title>E-Stok - Menu</title>
</head>
<body class="d-flex flex-column min-vh-100">
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">E-Stok</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item me-3"><a class="nav-link" href="menuComercial.jsp">Home</a></li>
                    <li class="nav-item me-3"><a class="nav-link" href="../index.jsp">Página inical</a></li>
                    <li class="nav-item me-3 "><a class="btn btn-outline-danger" href="../logout">Sair</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="flex-grow-1 d-flex align-items-center justify-content-center">
        <div class="container text-center">
            <h2 class="mb-4">Menu de Gerenciamento</h2>
            <div class="row d-flex flex-column align-items-center gy-3">
                <div class="col-12 col-md-6">
                    <a href="cadastrarProduto.jsp" class="btn btn-form w-100">Cadastrar
                        Produto</a>
                </div>
                <div class="col-12 col-md-6">
                    <a href="consultarProduto.jsp" class="btn btn-form w-100">Consultar
                        Produtos</a>
                </div>
            </div>
        </div>
    </main>
    <footer class="py-3 bg-white text-black text-center mt-auto">
        <p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
    </footer>
</body>
</html>