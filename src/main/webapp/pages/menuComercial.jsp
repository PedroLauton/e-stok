<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>E-Stok - Menu</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../styles/estilo.css">
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">E-Stok</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="../index.html">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../index.html#sobre">Sobre</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../index.html#funcionalidades">Funcionalidades</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Menu Principal -->
<main class="flex-grow-1 d-flex align-items-center justify-content-center">
    <div class="container text-center">
      <h2 class="mb-4">Menu de Administração</h2> <!-- Título mais para cima, ajustado via CSS -->
      <div class="row d-flex flex-column align-items-center gy-3"> <!-- Alinhamento vertical dos botões -->
        <div class="col-12 col-md-6">
          <a href="cadastrarProduto.jsp" class="btn btn-form w-100">Cadastrar Produto</a>
        </div>
        <div class="col-12 col-md-6">
          <a href="cadastrarLote.jsp" class="btn btn-form w-100">Cadastrar Lote</a>
        </div>
        <div class="col-12 col-md-6">
          <a href="consultarProduto.jsp" class="btn btn-form w-100">Listar Produtos</a>
        </div>
        <div class="col-12 col-md-6">
          <a href="consultarLote.jsp" class="btn btn-form w-100">Listar Lotes</a>
        </div>
      </div>
    </div>
  </main>
  

  <!-- Footer -->
  <footer class="py-3 bg-white text-black text-center mt-auto">
    <p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
