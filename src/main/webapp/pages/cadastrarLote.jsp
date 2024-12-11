<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Stok - Cadastro de Lote</title>
<link href="../assets/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../styles/estilo.css">
<link rel="icon" href="../recursos/img/logo-estok.png">
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<!-- fixed top para fixar ela -->
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
					<li class="nav-item"><a class="nav-link" href="../index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="menuComercial.jsp">Painel</a></li>
					<li class="nav-item"><a class="nav-link"
						href="consultarLote.jsp">Listar Lote</a></li>
					<li class="nav-item"><a class="nav-link" href="">Sair</a></li>



				</ul>
			</div>
		</div>
	</nav>

	<!-- Formulário de Lote -->
	<main class="container py-5 flex-grow-1">
		<h2 class="mb-4 text-center cor-fonte">Cadastrar Lote</h2>
		<form action="cadastrarLoteServlet" method="POST"
			class="bg-light p-4 rounded form-custom">
			<!-- Informações do Lote -->
			<h4 class="mb-3">Informações do Lote</h4>
			<div class="mb-3">
				<label for="produto" class="form-label">Produto</label> <select
					class="form-select" id="produto" name="produto" required>
					<option selected disabled value="">Escolha um produto...</option>
					<option value="1">Produto A</option>
					<option value="2">Produto B</option>
					<option value="3">Produto C</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="codigoLote" class="form-label">Código do Lote</label> <input
					type="text" class="form-control cor-input" id="codigoLote"
					name="codigoLote" placeholder="Digite o código do lote" required>
			</div>
			<div class="mb-3">
				<label for="quantidadeProdutos" class="form-label">Quantidade
					de Produtos</label> <input type="number" class="form-control cor-input"
					id="quantidadeProdutos" name="quantidadeProdutos"
					placeholder="Digite a quantidade de produtos" required>
			</div>
			<h4 class="mb-3">Datas</h4>

			<div class="mb-3">
				<label for="dataEntregaLote" class="form-label">Data de
					Entrega do Lote</label> <input type="date" class="form-control cor-input"
					id="dataEntregaLote" name="dataEntregaLote" required>
			</div>
			<div class="mb-3">
				<label for="dataValidadeProdutos" class="form-label">Data de
					Validade dos Produtos</label> <input type="date"
					class="form-control cor-input" id="dataValidadeProdutos"
					name="dataValidadeProdutos" required>
			</div>
			<h4 class="mb-3">Rastreamento e Identificação</h4>

			<div class="mb-3">
				<label for="qrcode" class="form-label">QR Code</label> <input
					type="text" class="form-control cor-input" id="qrcode"
					name="qrcode" placeholder="Insira o QR Code" required>
			</div>

			<!-- Botão -->
			<div class="d-grid mt-4">
				<button type="submit" class="btn btn-primary btn-cadastro">Cadastrar
					Lote</button>
			</div>
		</form>
	</main>

	<!-- Footer -->
	<footer class="footer py-3 bg-white text-black text-center mt-auto">
		<p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
	</footer>
	<script src="../assets/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/js/jquery-3.6.0.min.js"></script>
</body>
</html>
