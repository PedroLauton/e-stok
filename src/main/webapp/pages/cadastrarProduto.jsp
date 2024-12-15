<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../styles/estilo.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="icon" href="../recursos/img/logo-estok.png">
    <title>E-Stok - Cadastro de Produto</title>
</head>
<body class="d-flex flex-column min-vh-100">
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="menuComercial.jsp">E-Stok</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item me-3"><a class="nav-link" href="menuComercial.jsp">Home</a></li>
                    <li class="nav-item me-3"><a class="nav-link" href="../index.jsp">Página inical</a></li>
                    <li class="nav-item me-3 "><a class="btn btn-outline-danger" href="../logout">Sair</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="container py-5 flex-grow-1">
        <div class="text-center">
            <div id="alerta" class="alert d-none d-inline-block mx-auto"></div>
        </div>
        <h2 class="mb-4 text-center">Cadastrar Produtos</h2>
        <form id="formProduto" class="bg-light p-4 rounded form-custom">
            <h4 class="mb-3">Informações Básicas</h4>
            <div class="mb-3">
                <label for="nome" class="form-label">Nome do Produto</label> <input type="text"
                    class="form-control cor-input" id="nome" name="nome" placeholder="Ex: Arroz Branco Tipo 1" required>
            </div>
            <div class="mb-3">
                <label for="categoriaProduto" class="form-label">Categoria
                    do Produto</label> <select class="form-select" id="categoriaProduto" name="categoriaProduto"
                    required>
                    <option selected disabled value="">Escolha uma
                        categoria...</option>
                    <option value="CEREAIS">Cereais</option>
                    <option value="FARINHA">Farinha</option>
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
            <div class="mb-3">
                <label for="fabricante" class="form-label">Fabricante</label> <input type="text"
                    class="form-control cor-input" id="fabricante" name="fabricante" placeholder="Ex: Marca X" required>
            </div>
            <h4 class="mt-4 mb-3 ">Informações Nutricionais</h4>
            <div class="mb-3">
                <label for="valorEnergetico" class="form-label">Valor
                    Energético (kcal)</label> <input type="number" step="0.01" class="form-control cor-input"
                    id="valorEnergetico" name="valorEnergetico" placeholder="Ex: 100" required>
            </div>
            <div class="mb-3">
                <label for="carboidratos" class="form-label">Carboidratos
                    (g)</label> <input type="number" step="0.01" class="form-control cor-input" id="carboidratos"
                    name="carboidratos" placeholder="Ex: 20" required>
            </div>
            <div class="mb-3">
                <label for="proteinas" class="form-label">Proteínas (g)</label> <input type="number" step="0.01"
                    class="form-control cor-input" id="proteinas" name="proteinas" placeholder="Ex: 5" required>
            </div>
            <div class="mb-3">
                <label for="gordurasTotal" class="form-label">Gorduras
                    Totais (g)</label> <input type="number" step="0.01" class="form-control cor-input"
                    id="gordurasTotal" name="gordurasTotal" placeholder="Ex: 10" required>
            </div>
            <div class="mb-3">
                <label for="gordurasSaturadas" class="form-label">Gorduras
                    Saturadas (g)</label> <input type="number" step="0.01" class="form-control cor-input"
                    id="gordurasSaturadas" name="gordurasSaturadas" placeholder="Ex: 3" required>
            </div>
            <div class="mb-3">
                <label for="gordurasTrans" class="form-label">Gorduras Trans
                    (g)</label> <input type="number" step="0.01" class="form-control cor-input" id="gordurasTrans"
                    name="gordurasTrans" placeholder="Ex: 2" required>
            </div>
            <div class="mb-3">
                <label for="vitaminas" class="form-label">Vitaminas (mg)</label> <input type="number" step="0.01"
                    class="form-control" id="vitaminas" name="vitaminas" placeholder="Ex: 15" required>
            </div>
            <h5 class="mt-3 ">Porção</h5>
            <div class="mb-3">
                <label for="porcao" class="form-label">Porção (g/ml)</label> <input type="number" step="0.01"
                    class="form-control" id="porcao" name="porcao" placeholder="Ex: 200" required>
            </div>
            <div class="d-grid mt-5">
                <button type="submit" class="btn btn-primary btn-cadastro">Cadastrar
                    Produto</button>
            </div>
        </form>
    </main>
    <footer class="footer py-3 bg-white text-black text-center mt-auto">
        <p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
    </footer>
    <script>
        //Caso o formulário de cadastro seja enviado, o Ajax inicia a conexão com o Back-end.
        $("#formProduto").on("submit", function (event) {
            //Evita que o formulário seja enviado e a página seja recarregada.
            event.preventDefault();

            //Serializa os dados enviados na formulário.
            const data = $(this).serializeArray();
            const jsonData = {};
            //Itera sobre o array de campos do formulário.
            $.each(data, function (i, field) {
                jsonData[field.name] = field.value;
            });

            //Inicia a conexão com o Back-end.
            $.ajax({
                url: "../produto",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(jsonData), //Transforma o array em Json.
                //Caso a comunicação não de erro, a mensagem de retornada pelo Back-end é exibida na página.
                success: function (mensagem) {
                    const alerta = $("#alerta");
                    alerta.text(mensagem);
                    alerta.removeClass("d-none alert-danger").addClass("alert-success");
                    //Sobe toda a página, pois o botão de enviar encontra-se no final da página.
                    $("html, body").animate({ scrollTop: 0 }, "fast");

                    //Depois de 2 segundos, redireciona para a consulta dos produtos.
                    setTimeout(function () {
                        window.location.href = "consultarProduto.jsp";
                    }, 2000);
                },
                //Caso aconteça algum erro, esse será exibido na tela.
                error: function (erro) {
                    console.error(erro);

                    const erroMensagem = erro.responseText || "Erro desconhecido.";
                    const alerta = $("#alerta");
                    alerta.text(erroMensagem);
                    alerta.removeClass("d-none alert-success").addClass("alert-danger");

                    //Sobe toda a página, pois o botão de enviar encontra-se no final da página.
                    $("html, body").animate({ scrollTop: 0 }, "fast");
                },
            });
        });
    </script>
</body>
</html>