<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Stok - Listar Produtos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../styles/estilo.css">
</head>
<body class="d-flex flex-column min-vh-100">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">   <!-- fixed top para fixar ela -->
        <div class="container">
            <a class="navbar-brand" href="../index.html">E-Stok</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="../index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="../index.html#sobre">Sobre</a></li>
                    <li class="nav-item"><a class="nav-link" href="../index.html#funcionalidades">Funcionalidades</a></li>
                    <li class="nav-item"><a class="nav-link" href="cadastrarProduto.html">Cadastrar Produto</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Lista de Produtos -->
    <main class="container py-5 flex-grow-1">
        <h2 class="mb-4 text-center">Lista de Produtos</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped tabela">
                <thead class="table-light">
                    <tr>
                        <th>Nome do Produto</th>
                        <th>Categoria</th>
                        <th>Fabricante</th>
                        <th>Valor Energético (kcal)</th>
                        <th>Carboidratos (g)</th>
                        <th>Proteínas (g)</th>
                        <th>Gorduras (g)</th>
                        <th>Vitaminas (?)</th>
                        <th>Porção (g/ml)</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Exemplo de Produto 1 -->
                    <tr>
                        <td>Produto A</td>
                        <td>Cereais</td>
                        <td>Fabricante A</td>
                        <td>100</td>
                        <td>20</td>
                        <td>5</td>
                        <td>10</td>
                        <td>15</td>
                        <td>200</td>
                        <td>
                            <div class="d-flex gap-2">
                                <button class="btn btn-sm btn-editar">Editar</button>
                                <button class="btn btn-sm btn-danger">Excluir</button>
                            </div>
                        </td>
                    </tr>
                    <!-- Exemplo de Produto 2 -->
                    <tr>
                        <td>Produto B</td>
                        <td>Laticínios</td>
                        <td>Fabricante B</td>
                        <td>120</td>
                        <td>30</td>
                        <td>8</td>
                        <td>12</td>
                        <td>10</td>
                        <td>300</td>
                        <td>
                            <div class="d-flex gap-2">
                                <button class="btn btn-sm btn-editar">Editar</button>
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
</body>
</html>
