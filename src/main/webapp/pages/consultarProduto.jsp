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
    <title>E-Stok - Consultar Produtos</title>
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
    <main class="container py-5 flex-grow-1 text-center">
        <div id="alerta" class="alert alert-danger position-absolute w-90 text-center d-none"
            style="top: 80px; z-index: 1050;">
        </div>
        <h2 class="mb-4 text-center">Consulta de Produtos</h2>
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
    <footer class="footer py-3 bg-white text-black text-center mt-auto">
        <p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
    </footer>
    <script>
        //É necessário carregar os dados assim que a página é carregada.
        $(document).ready(function () {
            //Inicia a comunicação com o b Back-end.
            $.ajax({
                url: "../produto",
                method: "GET",
                dataType: "json",
                //Um Json com todos os produtos é retornado.
                success: function (produtos) {
                    //Verificar no console os produtos retornados.
                    console.log("Produtos retornados:", produtos);

                    //Iterar sobre cada produto para exibir no Front-end.
                    produtos.forEach(function (produto) {
                        $("#jsonDisplay").append(
                            '<tr>' +
                            '<td>' + produto.id + '</td>' +
                            '<td>' + produto.nome + '</td>' +
                            '<td>' + produto.categoriaProduto + '</td>' +
                            '<td>' + produto.fabricante + '</td>' +
                            '<td>' + produto.valoresNutricionais.valorEnergetico + '</td>' +
                            '<td>' + produto.valoresNutricionais.proteinas + '</td>' +
                            '<td>' + produto.valoresNutricionais.gordurasTrans + '</td>' +
                            '<td>' + produto.valoresNutricionais.gordurasSaturadas + '</td>' +
                            '<td>' + produto.valoresNutricionais.gordurasTotal + '</td>' +
                            '<td>' + produto.valoresNutricionais.vitaminas + '</td>' +
                            '<td>' + produto.valoresNutricionais.porcao + '</td>' +
                            '<td>' +
                            '<div class="d-flex gap-2">' +
                            '<a href="editarProduto.jsp?id=' + produto.id + '" class="btn btn-sm btn-primary">Editar</a>' +
                            '<button class="btn btn-sm btn-danger excluir-btn" data-id="' + produto.id + '">Excluir</button>' +
                            '</div>' +
                            '</td>' +
                            '</tr>'
                        );
                    });

                    //Caso o usuário clique no botão excluir, a seguinte rotina é executada.
                    $(".excluir-btn").click(function () {
                        //Captura o ID do produto
                        const id = $(this).data("id");

                        //Uma mensagem de confirmação é exibida, para evitar exclusões sem intenção.
                        if (confirm("Tem certeza que deseja excluir este produto?")) {
                            $.ajax({
                                url: "../produto?id=" + id,
                                method: "DELETE",
                                //Exibe o alerta indicando o sucesso da operação, e recarrega a página.
                                success: function (mensagem) {
                                    alert(mensagem);
                                    location.reload();
                                },
                                //Caso ocorra algum erro, exibe um alerta com o erro.
                                error: function (erro) {
                                    console.error(erro);
                                    alert(erro.responseText);
                                }
                            });
                        }
                    });
                },
                //Caso ocorra algum erro na requisição dos produtos, o erro é exibido na 'div' alerta.
                error: function (erro) {
                    console.error(erro);
                    const erroMensagem = erro.responseText || "Ocorreu um erro na requisição. Tente novamente.";
                    const alerta = $("#alerta");
                    alerta.text(erroMensagem);
                    alerta.removeClass("d-none").addClass("show");
                }
            });
        });
    </script>
</body>
</html>