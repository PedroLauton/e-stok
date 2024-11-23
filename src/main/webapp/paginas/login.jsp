<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>E-Stok - Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../styles/estilo.css">
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">   <!-- fixed top para fixar ela -->
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

  <!-- Formulário com Bootstrap -->
<main class="flex-grow-1 d-flex align-items-center justify-content-center">
    <div class="card p-4 login-card">
      <h3 class="text-center mb-4">Login</h3>
      <form action="../login" method="POST">
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
  

  <!-- Footer -->
  <footer class="py-3 bg-white text-black text-center mt-auto">
    <p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
