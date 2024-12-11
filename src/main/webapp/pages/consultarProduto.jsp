<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Stok - Consultar Produtos</title>
<link
	href="../assets/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="../styles/css2?family=Rubik:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../styles/estilo.css">
<link rel="icon" href="../recursos/img/logo-estok.png">
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<!-- fixed top para fixar ela -->
		<div class="container">
			<a class="navbar-brand" href="menuComercial.jsp">E-Stok</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item me-3"><a class="nav-link"
						href="menuComercial.jsp">Home</a></li>
					<li class="nav-item me-3"><a class="nav-link"
						href="cadastrarProduto.jsp">Cadastrar Produto</a></li>
					<li class="nav-item me-3 "><a class="btn btn-outline-danger"
						href="../logout">Sair</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Lista de Produtos -->
	<main class="container py-5 flex-grow-1">
		<h2 class="mb-4 text-center">Consulta de Produtos</h2>
		<!-- Barra de Pesquisa -->
		<div class="row mb-4">
			<div class="col-12 col-md-6 mx-auto">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Pesquisar produto" aria-label="Pesquisar lote">
					<button class="btn btn-form" type="button">Pesquisar</button>
				</div>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered table-striped tabela">
				<thead class="table-light">
					<tr>
			            <th>ID</th>
			            <th>Nome</th>
			            <th>Categoria</th>
			            <th>Fabricante</th>
			            <th>Valor Energético</th>
			            <th>Proteínas</th>
			            <th>Gorduras Trans</th>
			            <th>Gorduras Saturadas</th>
			            <th>Gorduras Totais</th>
			            <th>Vitaminas</th>
			            <th>Porção</th>
			            <th>Ações</th>
			        </tr>
				</thead>
				<tbody id="jsonDisplay">
					
				</tbody>
			</table>
		</div>
	</main>

	<!-- Footer -->
	<footer class="footer py-3 bg-white text-black text-center mt-auto">
		<p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
	</footer>

	<script src="../assets/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/js/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function () {
		    $.ajax({
		        url: "../produto",
		        method: "GET",
		        dataType: "json",
		        success: function (produtos) {
		            console.log("Produtos retornados:", produtos);
		            
		            produtos.forEach(function (produto) {
		                $("#jsonDisplay").append(
		                    '<tr>'+		            
		                        '<td>'+ produto.id +'</td>'+
		                        '<td>'+ produto.nome +'</td>'+
		                        '<td>'+ produto.categoriaProduto +'</td>'+
		                        '<td>'+ produto.fabricante +'</td>'+
		                        '<td>'+ produto.valoresNutricionais.valorEnergetico +'</td>'+
		                        '<td>'+ produto.valoresNutricionais.proteinas +'</td>'+
		                        '<td>'+ produto.valoresNutricionais.gordurasTrans +'</td>'+
		                        '<td>'+ produto.valoresNutricionais.gordurasSaturadas +'</td>'+
		                        '<td>'+ produto.valoresNutricionais.gordurasTotal +'</td>'+
		                        '<td>'+ produto.valoresNutricionais.vitaminas +'</td>'+
		                        '<td>'+ produto.valoresNutricionais.porcao +'</td>'+
		                        '<td>'+
		                            '<div class="d-flex gap-2">'+
		                                '<button class="btn btn-sm btn-primary">Editar</button>'+
		                                '<button id="excluir" class="btn btn-sm btn-danger">Excluir</button>'+
		                            '</div>'+
		                        '</td>'+
		                    '</tr>'
		                );
		            });
		        },
		        error: function (error) {
		            console.error("Erro ao carregar os produtos:", error);
		        }
		    });
		    
		});
	</script>
</body>
</html>

