<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Stok - Login</title>
<link
	href="../assets/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../styles/estilo.css">
<link rel="icon" href="../recursos/img/logo-estok.png">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
	rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="../index.jsp">E-Stok</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item me-3"><a class="nav-link" href="../index.jsp">Home</a>
					</li>
					<li class="nav-item me-3"><a class="nav-link"
						href="../index.jsp#sobre">Sobre</a></li>
					<li class="nav-item me-3"><a class="nav-link"
						href="../index.jsp#funcionalidades">Funcionalidades</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<main class="flex-grow-1 d-flex align-items-center justify-content-center position-relative">
	    <!-- Alerta -->
	    <div id="alerta" class="alert alert-danger position-absolute w-90 text-center d-none" style="top: 80px; z-index: 1050;">
	    </div>
	
	    <!-- Card de Login -->
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
	<script src="../assets/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/js/jquery-3.6.0.min.js"></script>
	<script>
		$("#loginForm").on("submit", function (event) {
		    event.preventDefault();
	
		    const login = $("#login").val();
		    const senha = $("#senha").val();
	
		    $.ajax({
		        url: "../login",
		        type: "POST",
		        contentType: "application/json",
		        data: JSON.stringify({ login, senha }),
		        success: function () {
		            window.location.href = "menuComercial.jsp";
		        },
		        error: function (xhr) {
		            const errorMessage = xhr.responseText || "Ocorreu um erro na requisição. Tente novamente.";
		            const alerta = $("#alerta");
		            alerta.text(errorMessage); 
		            alerta.removeClass("d-none").addClass("show");
		        },
		    });
		});
	</script>
</body>
</html>
