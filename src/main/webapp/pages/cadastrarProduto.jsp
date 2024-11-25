<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Stok - Gerenciamento de Produtos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../styles/estilo.css">
</head>
<body class="d-flex flex-column min-vh-100">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">   <!-- fixed top para fixar ela -->
        <div class="container">
            <a class="navbar-brand" href="../index.jsp">E-Stok</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="../index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="menuComercial.jsp">Painel</a></li>
                    <li class="nav-item"><a class="nav-link" href="consultarProduto.jsp">Listar Produtos</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Formulário de Produto -->
    <main class="container py-5 flex-grow-1">
        <h2 class="mb-4 text-center">Cadastrar Produtos</h2>
        <form action="../produto" method="POST">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="nome" class="form-label">Nome do Produto</label>
                    <input type="text" class="form-control" id="nome" name="nome" placeholder="Digite o nome do produto" required>
                </div>
                <div class="col-md-6">
                    <label for="foto" class="form-label">Foto do Produto</label>
                    <input type="text" class="form-control" id="foto" name="foto"  required>
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="categoriaProduto" class="form-label">Categoria do Produto</label>
                    <select class="form-select" id="categoriaProduto" name="categoriaProduto">
                        <option selected>Escolha uma categoria...</option>
                        <option value="Cereais">Cereais</option>
                        <option value="Farinhas">Farinhas</option>
                        <option value="Massas">Massas</option>
                        <option value="Leguminosas">Leguminosas</option>
                        <option value="Carnes">Carnes</option>
                        <option value="Aves">Aves</option>
                        <option value="Pescados">Pescados</option>
                        <option value="Frutas">Frutas</option>
                        <option value="Hortaliças">Hortaliças</option>
                        <option value="Laticínios">Laticínios</option>
                        <option value="Bebidas">Bebidas</option>
                        <option value="Ovos">Ovos</option>
                        <option value="Doces">Doces</option>
                        <option value="Snacks">Snacks</option>
                        <option value="Óleos">Óleos</option>
                        <option value="Temperos">Temperos</option>
                        <option value="Açucares">Açucares</option>
                        <option value="Bebidas">Bebidas</option>
                        <option value="Congelados">Congelados</option>
                        <option value="Naturais">Naturais</option>

                    </select>
                </div>
                <div class="col-md-6">
                    <label for="fabricante" class="form-label">Fabricante</label>
                    <input type="text" class="form-control" id="fabricante" name="fabricante" placeholder="Digite o nome do fabricante" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="valorEnergetico" class="form-label">Valor Energético (kcal)</label>
                    <input type="number" step="0.01" class="form-control" id="valorEnergetico" name="valorEnergetico" placeholder="Ex: 100"  required>
                </div>
                <div class="col-md-4">
                    <label for="carboidratos" class="form-label">Carboidratos (g)</label>
                    <input type="number" step="0.01" class="form-control" id="carboidratos" name="carboidratos" placeholder="Ex: 20"  required>
                </div>
                <div class="col-md-4">
                    <label for="proteinas" class="form-label">Proteínas (g)</label>
                    <input type="number" step="0.01" class="form-control" id="proteinas" name="proteinas" placeholder="Ex: 5"  required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="gordurasTotal" class="form-label">Gorduras Totais(g)</label>
                    <input type="number" step="0.01" class="form-control" id="gordurasTotal" name="gordurasTotal"placeholder="Ex: 10"  required>
                </div>
                <div class="col-md-4">
                    <label for="gordurasTrans" class="form-label">Gorduras Trans(g)</label>
                    <input type="number" step="0.01" class="form-control" id="gordurasTrans" name="gordurasTrans"placeholder="Ex: 10"  required>
                </div>
                <div class="col-md-4">
                    <label for="gordurasSaturadas" class="form-label">Gorduras Saturadas(g)</label>
                    <input type="number" step="0.01" class="form-control" id="gordurasSaturadas" name="gordurasSaturadas"placeholder="Ex: 10"  required>
                </div>
                <div class="col-md-4">
                    <label for="vitaminas" class="form-label">Vitaminas (?)</label>
                    <input type="number" step="0.01" class="form-control" id="vitaminas" name="vitaminas"placeholder="Ex: 15"  required>
                </div>
                <div class="col-md-4">
                    <label for="porcao" class="form-label">Porção (g/ml)</label>
                    <input type="number" step="0.01" class="form-control" id="porcao" name="porcao"placeholder="Ex: 200"  required>
                </div>
            </div>

            <div class="d-grid mt-4">
                <button type="submit" class="btn btn-form">Cadastrar Produto</button>
            </div>
        </form>
    </main>

    <!-- Footer -->
    <footer class="footer py-3 bg-white text-black text-center mt-auto">
        <p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
