<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="br.com.estok.entities.Produto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%
	List<Produto> listaProdutos = (ArrayList<Produto>) request.getAttribute("Produtos");
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Stok - Listar Produtos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../styles/estilo.css">
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
					<li class="nav-item"><a class="nav-link"
						href="consultarProduto.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="menuComercial.jsp">Painel</a></li>
					<li class="nav-item"><a class="nav-link"
						href="cadastrarProduto.jsp">Cadastrar Produto</a></li>
						<li class="nav-item"><a class="nav-link"
						href="">Sair</a></li>


				</ul>
			</div>
		</div>
	</nav>

	<!-- Lista de Produtos -->
	<main class="container py-5 flex-grow-1">
		<h2 class="mb-4 text-center">Listagem de Produtos</h2>
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
						<th>ID do Produto</th>
						<th>Nome do Produto</th>
						<th>Categoria</th>
						<th>Fabricante</th>
						<th>Valor Energético (kcal)</th>
						<th>Carboidratos (g)</th>
						<th>Proteínas (g)</th>
						<th>Gorduras Trans (g)</th>
						<th>Gorduras Saturadas (g)</th>
						<th>Gorduras Totais (g)</th>
						<th>Porção (g/ml)</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
					<% if (listaProdutos != null) { %>
					    <% for (int i = 0; i < listaProdutos.size(); i++) { %>
					        <tr>
					            <td><%out.print(listaProdutos.get(i).getId());%></td>
					         	<td><%out.print(listaProdutos.get(i).getNome());%></td>
					            <td><%out.print(listaProdutos.get(i).getCategoriaProduto().name());%></td>
					            <td><%out.print(listaProdutos.get(i).getFabricante());%></td>
					            <td><%out.print(listaProdutos.get(i).getValoresNutricionais().getValorEnergetico());%></td>
					            <td><%out.print(listaProdutos.get(i).getValoresNutricionais().getProteinas());%></td>
					            <td><%out.print(listaProdutos.get(i).getValoresNutricionais().getGordurasTrans());%></td>
					            <td><%out.print(listaProdutos.get(i).getValoresNutricionais().getGordurasSaturadas());%></td>
					            <td><%out.print(listaProdutos.get(i).getValoresNutricionais().getGordurasTotal());%></td>
					            <td><%out.print(listaProdutos.get(i).getValoresNutricionais().getVitaminas());%></td>
					            <td><%out.print(listaProdutos.get(i).getValoresNutricionais().getPorcao());%></td>
					            <td>
					                <div class="d-flex gap-2">
					                    <button class="btn btn-sm btn-primary">Editar</button>
					                    <button class="btn btn-sm btn-danger">Excluir</button>
					                </div>
					            </td>
					        </tr>
					    <% } %>
					<% } else { %>
					    <p>Nenhum produto disponível.</p>
					<% } %>
					<tr>
						<td>1</td>
						<td>Aveia em Flocos</td>
						<td>Cereais</td>
						<td>Quaker</td>
						<td>393</td>
						<td>66.0</td>
						<td>13.9</td>
						<td>0</td>
						<td>1.3</td>
						<td>7.1</td>
						<td>30</td>
						<td>
							<div class="d-flex gap-2">
								<button class="btn btn-sm btn-primary">Editar</button>
								<button class="btn btn-sm btn-danger">Excluir</button>
							</div>
						</td>
					</tr>
					<!-- Exemplo de Produto 2 -->
					<tr>
						<td>3</td>
						<td>Leite Integral</td>
						<td>Laticínios</td>
						<td>Itambé</td>
						<td>62</td>
						<td>4.7</td>
						<td>3.0</td>
						<td>0</td>
						<td>2.1</td>
						<td>3.3</td>
						<td>200</td>
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

