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
    <title>E-Stok - Editar Produto</title>
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
        <h2 class="mb-4 text-center">Editar Produto</h2>
        <form id="formProduto" method="POST">
            <div class="row mb-3">
                <div class="col-md">
                    <label for="idProduto" class="form-label">ID do Produto</label> <input type="text"
                        class="form-control" id="idProduto" name="idProduto" value="" readonly>
                </div>
                <div class="col-md-6">
                    <label for="nome" class="form-label">Nome do Produto</label> <input type="text" class="form-control"
                        id="nome" name="nome" value="" required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="categoriaProduto" class="form-label">Categoria
                        do Produto</label> <select class="form-select" id="categoriaProduto" name="categoriaProduto">
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
                    <label for="fabricante" class="form-label">Fabricante</label> <input type="text"
                        class="form-control" id="fabricante" name="fabricante" value="" required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="valorEnergetico" class="form-label">Valor
                        Energético (kcal)</label> <input type="number" step="0.01" class="form-control"
                        id="valorEnergetico" name="valorEnergetico" value="">
                </div>
                <div class="col-md-4">
                    <label for="carboidratos" class="form-label">Carboidratos
                        (g)</label> <input type="number" step="0.01" class="form-control" id="carboidratos"
                        name="carboidratos" value="">
                </div>
                <div class="col-md-4">
                    <label for="proteinas" class="form-label">Proteínas (g)</label> <input type="number" step="0.01"
                        class="form-control" id="proteinas" name="proteinas" value="">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="gordurasTotal" class="form-label">Gorduras
                        Totais (g)</label> <input type="number" step="0.01" class="form-control" id="gordurasTotal"
                        name="gordurasTotal" value="">
                </div>
                <div class="col-md-4">
                    <label for="gordurasTrans" class="form-label">Gorduras
                        Trans (g)</label> <input type="number" step="0.01" class="form-control" id="gordurasTrans"
                        name="gordurasTrans" value="">
                </div>
                <div class="col-md-4">
                    <label for="gordurasSaturadas" class="form-label">Gorduras
                        Saturadas (g)</label> <input type="number" step="0.01" class="form-control"
                        id="gordurasSaturadas" name="gordurasSaturadas" value="">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="vitaminas" class="form-label">Vitaminas (mg)</label> <input type="number" step="0.01"
                        class="form-control" id="vitaminas" name="vitaminas" value="">
                </div>
                <div class="col-md-6">
                    <label for="porcao" class="form-label">Porção (g/ml)</label> <input type="number" step="0.01"
                        class="form-control" id="porcao" name="porcao" value="">
                </div>
            </div>
            <div class="d-grid mt-4">
                <button type="submit" class="btn btn-form">Salvar
                    Alterações</button>
            </div>
        </form>
    </main>
    <script>
        //É necessário carregar os dados assim que a página é carregada.
        $(document).ready(function () {
            //Captura os parâmetros após o '?'.
            const urlParams = new URLSearchParams(window.location.search);
            //Captura somente o parâmetro ID.
            const idProduto = urlParams.get('id');

            //Se o ID não for nulo, executa a requisição.
            if (idProduto) {
                $.ajax({
                    url: "../produto/editar?id=" + idProduto,
                    type: 'GET',
                    dataType: 'json',
                    //Caso a requisição funcione, os dados são exibidos nos respectivos 'inputs'.
                    success: function (produto) {
                        console.log(produto);

                        $('#idProduto').val(produto.id);
                        $('#nome').val(produto.nome);
                        $('#fabricante').val(produto.fabricante);
                        $('#categoriaProduto').val(produto.categoriaProduto);
                        $('#valorEnergetico').val(produto.valoresNutricionais.valorEnergetico);
                        $('#carboidratos').val(produto.valoresNutricionais.carboidratos);
                        $('#proteinas').val(produto.valoresNutricionais.proteinas);
                        $('#gordurasTotal').val(produto.valoresNutricionais.gordurasTotal);
                        $('#gordurasTrans').val(produto.valoresNutricionais.gordurasTrans);
                        $('#gordurasSaturadas').val(produto.valoresNutricionais.gordurasSaturadas);
                        $('#vitaminas').val(produto.valoresNutricionais.vitaminas);
                        $('#porcao').val(produto.valoresNutricionais.porcao);
                    },
                    error: function (erro) {
                        console.error(erro);
                        const erroMensagem = erro.responseText || "Ocorreu um erro na requisição. Tente novamente.";
                        const alerta = $("#alerta");
                        alerta.text(erroMensagem);
                        alerta.removeClass("d-none").addClass("show");
                    }
                });

                //Caso o formulário seja enviado, o Ajax inicia a comunicação com o Back-end. 
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
                        url: "../produto/editar?id=" + idProduto,
                        type: "PUT",
                        contentType: "application/json",
                        data: JSON.stringify(jsonData), //Transforma o array em Json.
                        success: function (mensagem) {
                            const alerta = $("#alerta");
                            alerta.text(mensagem);
                            alerta.removeClass("d-none alert-danger").addClass("alert-success");

                            $("html, body").animate({ scrollTop: 0 }, "fast");

                            setTimeout(function () {
                                window.location.href = "consultarProduto.jsp";
                            }, 2000);
                        },
                        error: function (erro) {
                            const alerta = $("#alerta");
                            alerta.removeClass("d-none alert-success").addClass("alert-danger");
                            alerta.text(erro.responseText || "Erro ao editar o produto. Tente novamente.");
                            $("html, body").animate({ scrollTop: 0 }, "fast");
                        },
                    });
                });
            } else {
                //Caso o ID seja nulo, exibe um alerta indicando o erro.
                alert('ID do produto não encontrado. Você redirecionado para consulta de produtos segundo.');
                setTimeout(function () {
                    window.location.href = "consultarProduto.jsp";
                });
            }
        });
    </script>
</body>
</html>