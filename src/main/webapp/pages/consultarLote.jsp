<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Stok - Consultar Lotes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="../styles/estilo.css">
<link rel="icon" href="../recursos/img/logo-estok.png">
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- Navbar -->
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
					<li class="nav-item"><a class="nav-link" href="../index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="menuComercial.jsp">Painel</a></li>
					<li class="nav-item"><a class="nav-link"
						href="cadastrarLote.jsp">Cadastrar Lote</a></li>
					<li class="nav-item"><a class="nav-link" href="">Sair</a></li>



				</ul>
			</div>
		</div>
	</nav>

	<!-- Lista de Lotes -->
	<main class="container py-5 flex-grow-1">
		<h2 class="mb-4 text-center">Listagem de Lotes</h2>

		<!-- Barra de Pesquisa -->
		<div class="row mb-4">
			<div class="col-12 col-md-6 mx-auto">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Pesquisar lote pelo código ou nome do produto"
						aria-label="Pesquisar lote">
					<button class="btn btn-form" type="button">Pesquisar</button>
				</div>
			</div>
		</div>


		<div class="table-responsive">
			<table class="table table-bordered table-striped tabela">
				<thead class="table-light">
					<tr>
						<th>ID do Lote</th>
						<th>Produto</th>
						<th>Código do Lote</th>
						<th>Quantidade</th>
						<th>Data de Entrega</th>
						<th>Data de Validade</th>
						<th>QR Code</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
					<!-- Exemplo de Lote 1 -->
					<tr>
						<td>1</td>
						<!-- Novo Campo para o ID -->
						<td>Produto A</td>
						<td>LOT12345</td>
						<td>100</td>
						<td>2024-01-15</td>
						<td>2025-01-15</td>
						<td>QR123A45</td>
						<td>
							<div class="d-flex gap-2">
								<button class="btn btn-sm btn-primary">Editar</button>
								<button class="btn btn-sm btn-danger">Excluir</button>
							</div>
						</td>
					</tr>
					<!-- Exemplo de Lote 2 -->
					<tr>
						<td>2</td>
						<td>Produto B</td>
						<td>LOT67890</td>
						<td>200</td>
						<td>2024-02-10</td>
						<td>2025-02-10</td>
						<td>QR678B90</td>
						<td>
							<div class="d-flex gap-2">
								<button class="btn btn-sm btn-primary">Editar</button>
								<button class="btn btn-sm btn-danger">Excluir</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</main>

	<!-- Footer -->
	<footer class="footer py-3 bg-white text-black text-center mt-auto">
		<p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
