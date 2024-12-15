<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Stok - Editar Produto</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../styles/estilo.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="icon" href="../recursos/img/logo-estok.png">

</head>
<body class="d-flex flex-column min-vh-100">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
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
						href="../index.jsp">Página inical</a></li>
					<li class="nav-item me-3 "><a class="btn btn-outline-danger"
						href="../logout">Sair</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<main class="container py-5 flex-grow-1">
		<h2 class="mb-4 text-center">Editar Produto</h2>
		<div class="text-center">
			<div id="alerta" class="alert d-none d-inline-block mx-auto"></div>
		</div>
		<form id="formProduto" method="POST">
			<!-- Nome e Foto -->
			<div class="row mb-3">
				<div class="col-md">
					<label for="idProduto" class="form-label">ID do Produto</label> <input
						type="text" class="form-control" id="idProduto" name="idProduto"
						value="" readonly>
				</div>
				<div class="col-md-6">
					<label for="nome" class="form-label">Nome do Produto</label> <input
						type="text" class="form-control" id="nome" name="nome"
						value="" required>
				</div>
			</div>
			<!-- Categoria e Fabricante -->
			<div class="row mb-3">
				<div class="col-md-6">
					<label for="categoriaProduto" class="form-label">Categoria
						do Produto</label> <select class="form-select" id="categoriaProduto"
						name="categoriaProduto">
						<option selected>Escolha uma categoria...</option>
						<option value="CEREAIS">Cereais</option>
						<option value="FARINHAS">Farinhas</option>
						<option value="MASSAS">Massas</option>
						<option value="LEGUMINOSAS">Leguminosas</option>
						<option value="CARNES">Carnes</option>
						<option value="AVES">Aves</option>
						<option value="PESCADOS">Pescados</option>
						<option value="FRUTAS">Frutas</option>
						<option value="HORTALICAS">Hortaliças</option>
						<option value="LATICINIOS">Laticínios</option>
						<option value="BEBIDAS">Bebidas</option>
						<option value="OVOS">Ovos</option>
						<option value="DOCES">Doces</option>
						<option value="SNACKS">Snacks</option>
						<option value="OLEOS">Óleos</option>
						<option value="TEMPEROS">Temperos</option>
						<option value="ACUCARES">Açucares</option>
						<option value="BEBIDAS">Bebidas</option>
						<option value="CONGELADOS">Congelados</option>
						<option value="NATURAIS">Naturais</option>
					</select>
				</div>
				<div class="col-md-6">
					<label for="fabricante" class="form-label">Fabricante</label> <input
						type="text" class="form-control" id="fabricante" name="fabricante"
						value="" required>
				</div>
			</div>
			<!-- Valores Nutricionais -->
			<div class="row mb-3">
				<div class="col-md-4">
					<label for="valorEnergetico" class="form-label">Valor
						Energético (kcal)</label> <input type="number" step="0.01"
						class="form-control" id="valorEnergetico" name="valorEnergetico"
						value="">
				</div>
				<div class="col-md-4">
					<label for="carboidratos" class="form-label">Carboidratos
						(g)</label> <input type="number" step="0.01" class="form-control"
						id="carboidratos" name="carboidratos" value="">
				</div>
				<div class="col-md-4">
					<label for="proteinas" class="form-label">Proteínas (g)</label> <input
						type="number" step="0.01" class="form-control" id="proteinas"
						name="proteinas" value="">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-md-4">
					<label for="gordurasTotal" class="form-label">Gorduras
						Totais (g)</label> <input type="number" step="0.01" class="form-control"
						id="gordurasTotal" name="gordurasTotal" value="">
				</div>
				<div class="col-md-4">
					<label for="gordurasTrans" class="form-label">Gorduras
						Trans (g)</label> <input type="number" step="0.01" class="form-control"
						id="gordurasTrans" name="gordurasTrans" value="">
				</div>
				<div class="col-md-4">
					<label for="gordurasSaturadas" class="form-label">Gorduras
						Saturadas (g)</label> <input type="number" step="0.01"
						class="form-control" id="gordurasSaturadas"
						name="gordurasSaturadas" value="">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-md-6">
					<label for="vitaminas" class="form-label">Vitaminas (mg)</label> <input
						type="number" step="0.01" class="form-control" id="vitaminas"
						name="vitaminas" value="">
				</div>
				<div class="col-md-6">
					<label for="porcao" class="form-label">Porção (g/ml)</label> <input
						type="number" step="0.01" class="form-control" id="porcao"
						name="porcao" value="">
				</div>
			</div>
			<!-- Botão -->
			<div class="d-grid mt-4">
				<button type"submit" class="btn btn-form">Salvar
					Alterações</button>
			</div>
		</form>
	</main>
	<script>
	 $(document).ready(function() {
	    const urlParams = new URLSearchParams(window.location.search);
	    const idProduto = urlParams.get('id');
	
	    if (idProduto) {
	        $.ajax({
	            url: "../produto/editar?id=" + idProduto,
	            type: 'GET',
	            dataType: 'json',
	            success: function(data) {
	            	console.log(data);
	            	console.log(idProduto);
	                $('#idProduto').val(data.id);
	                $('#nome').val(data.nome);
	                $('#fabricante').val(data.fabricante);
	                $('#categoriaProduto').val(data.categoriaProduto);
	                $('#valorEnergetico').val(data.valoresNutricionais.valorEnergetico);
	                $('#carboidratos').val(data.valoresNutricionais.carboidratos);
	                $('#proteinas').val(data.valoresNutricionais.proteinas);
	                $('#gordurasTotal').val(data.valoresNutricionais.gordurasTotal);
	                $('#gordurasTrans').val(data.valoresNutricionais.gordurasTrans);
	                $('#gordurasSaturadas').val(data.valoresNutricionais.gordurasSaturadas);
	                $('#vitaminas').val(data.valoresNutricionais.vitaminas);
	                $('#porcao').val(data.valoresNutricionais.porcao);
	            },
	            error: function(xhr, status, error) {
	                console.error('Erro ao buscar os dados do produto:', error);
	                
	            }
	        });
	        
	        $("#formProduto").on("submit", function (event) {
		        event.preventDefault(); // Impede o comportamento padrão de envio do formulário

		        const data = $(this).serializeArray(); // Serializa os dados do formulário
		        const jsonData = {};

		        // Converte os dados serializados em um objeto JSON
		        $.each(data, function (i, field) {
		            jsonData[field.name] = field.value;
		        });

		        // Realiza a requisição AJAX para editar o produto
		        $.ajax({
		            url: "../produto/editar?id=" + idProduto, // Endpoint para edição de produto (mantenha ou ajuste conforme necessário)
		            type: "PUT", // Método HTTP para edição
		            contentType: "application/json", // Especifica que o conteúdo enviado será JSON
		            data: JSON.stringify(jsonData), // Converte o objeto JSON em string
		            success: function (message) {
		                const alerta = $("#alerta");

		                alerta.removeClass("d-none alert-danger").addClass("alert-success"); // Exibe alerta de sucesso
		                alerta.text(message);

		                // Rola a página para o topo
		                $("html, body").animate({ scrollTop: 0 }, "fast");

		                // Redireciona após 3 segundos
		                setTimeout(function () {
		                    window.location.href = "consultarProduto.jsp";
		                }, 3000);
		            },
		            error: function (xhr) {
		                const alerta = $("#alerta");

		                alerta.removeClass("d-none alert-success").addClass("alert-danger"); // Exibe alerta de erro
		                alerta.text(xhr.responseText || "Erro ao editar o produto. Tente novamente.");

		                // Rola a página para o topo
		                $("html, body").animate({ scrollTop: 0 }, "fast");
		            },
		        });
		    });
	    } else {
	        alert('ID do produto não encontrado. Você redirecionado para consulta de produtos segundo.');
	        setTimeout(function () {
                window.location.href = "consultarProduto.jsp";
            });
	    }
	});
	</script>
</body>
</html>