<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Stok</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="styles/estilo.css">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="icon" href="recursos/img/logo-estok.png">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">E-Stok</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="#sobre">Sobre</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#funcionalidades">Funcionalidades</a></li>
					<li class="nav-item"><a class="btn btn-outline-success"
						href="login">Acessar</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<section class="hero py-5 text-center text-md-start">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6">
					<h1 class="titulo mb-4">
						<span class="destaque-cor">Impulsione</span> o seu negócio<br>com
						o <span class="destaque-cor">E-STOK</span>
					</h1>
					<p class="paragrafo">
						Gerencie seu estoque de forma <span class="destaque-cor">simples</span>
						e <span class="destaque-cor">eficiente</span>, economizando tempo
						e aumentando seus <span>lucros</span>. Com o E-STOK, você tem <span
							class="destaque-cor">controle total</span> e resultados precisos
						na palma da sua mão.
					</p>
					<button class="btn botao">Quero transformar o meu negócio</button>
				</div>
				<div class="col-md-6">
					<img src="recursos/img/imagem-inicial.png" alt="Imagem de negócio"
						class="img-fluid rounded">
				</div>
			</div>
		</div>
	</section>
	<section id="sobre" class="py-5 text-center text-md-start">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6">
					<h2 class="mb-4">
						Sobre o <span class="destaque-cor">E-Stok</span>
					</h2>
					<p class="paragrafo">O E-STOK é um gerenciador de estoque
						moderno, projetado para facilitar a vida dos proprietários de
						mercados e seus clientes. Utilizando a tecnologia QR Code, o
						E-STOK automatiza o processo de gestão de estoque, tornando-o mais
						eficiente e prático, concentrando todas as informações do produto
						em um só lugar.</p>
					<p class="paragrafo">Além de melhorar a gestão interna, o
						E-STOK conecta mercados e consumidores. Com ele, seu mercado pode
						fidelizar clientes, permitindo que eles gerenciem seus próprios
						estoques pessoais. Isso facilita o controle da despensa em casa e
						oferece informações nutricionais valiosas sobre os produtos,
						ajudando na manutenção de uma alimentação equilibrada e na
						organização do dia a dia.</p>
				</div>
				<div class="col-md-6">
					<img src="recursos/img/logo-estok.png" alt="Logo"
						class="img-fluid rounded">
				</div>
			</div>
		</div>
	</section>
	<section id="funcionalidades" class="funcionalidades py-5">
		<div class="container">
			<div class="row align-items-start">
				<div class="col-12 col-lg-6">
					<div class="row gx-4 gy-4">
						<div class="col-12 col-md-6">
							<div class="card funcionalidade p-4 text-center">
								<img src="recursos/img/qr-code.png" class="img-icone mb-3">
								<h5>Leitura e Integração por QRCode</h5>
								<p class="text-muted">Otimize processos com leitura rápida e
									precisa de produtos utilizando QRCode.</p>
							</div>
						</div>
						<div class="col-12 col-md-6">
							<div class="card funcionalidade p-4 text-center">
								<img src="recursos/img/engrenagem.png"
									alt="Ícone Gestão Inteligente" class="img-icone mb-3">
								<h5>Gestão Inteligente e Automatizada</h5>
								<p class="text-muted">Gerencie estoques com inteligência,
									reduzindo desperdícios e melhorando a eficiência.</p>
							</div>
						</div>
						<div class="col-12 col-md-6">
							<div class="card funcionalidade p-4 text-center">
								<img src="recursos/img/conexao.png" alt="Ícone Conexão Cliente"
									class="img-icone mb-3">
								<h5>Integração com Despensa do Cliente</h5>
								<p class="text-muted">Permita que clientes gerenciem suas
									despensas com os produtos adquiridos.</p>
							</div>
						</div>
						<div class="col-12 col-md-6">
							<div class="card funcionalidade p-4 text-center">
								<img src="recursos/img/nutricao.png"
									alt="Ícone Relatórios Automatizados" class="img-icone mb-3">
								<h5>Insights Nutricionais da Despensa</h5>
								<p class="text-muted">Permita que seus clientes tenham
									acesso fácil às informações nutricionais dos produtos
									armazenados em suas despensas.</p>

							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-lg-6 align-self-start">
					<h2 class="titulo-funcionalidades mb-4">
						Funcionalidades do <span class="destaque-cor">E-Stok</span>
					</h2>
					<p class="paragrafo">Impulsione o seu negócio com tecnologias
						que permitam uma gestão eficiente e automatizada do seu estoque.</p>
				</div>
			</div>
		</div>
	</section>
	<section id="acessar" class="py-5">
		<div class="container text-center">
			<h2>
				O <span class="destaque-cor">E-Stok </span>transforma o seu negócio!
			</h2>
			<div id="testimonialCarousel" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="card mx-auto">
							<div class="card-body">
								<blockquote class="blockquote">
									<p>"O E-Stok mudou completamente a forma como gerimos nosso
										estoque. Agora temos controle total, menos desperdícios e
										muito mais eficiência."</p>
									<footer class="blockquote-footer">Larissa Mendes,
										proprietária da Iogurtes CIA</footer>
								</blockquote>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="card mx-auto">
							<div class="card-body">
								<blockquote class="blockquote">
									<p>"Com o E-Stok, economizamos tempo e otimizamos os
										processos do dia a dia. Uma ferramenta indispensável!"</p>
									<footer class="blockquote-footer">Carlos Souza,
										proprietário da Naturais Natureza</footer>
								</blockquote>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="card mx-auto">
							<div class="card-body">
								<blockquote class="blockquote">
									<p>"Agora conseguimos acompanhar nossos estoques em tempo
										real e tomar decisões mais assertivas."</p>
									<footer class="blockquote-footer">Ana Paula,
										proprietária da Cereias Bão</footer>
								</blockquote>
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#testimonialCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Anterior</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#testimonialCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Próximo</span>
					</button>
				</div>
			</div>
	</section>
	<footer class="py-3 bg-white text-black text-center">
		<p>&copy; 2024 E-Stok. Todos os direitos reservados.</p>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
