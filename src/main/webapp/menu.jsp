<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Menu biblioteca</title>
	<link rel="icon" href="imagens/favicon.png">
	<style>
		.botaomenu{
			background-color: cornflowerblue;
			color: white;
			padding: 15px;
			font-size: 15px;
			border: none;
		    cursor: pointer;
		}
		
		.escolha{
			position: relative;
			display: inline-block;
		}
	
	    .escolha-conteudo{
	    	display: none;
	    	position: absolute;
	    	background-color: cornflowerblue;
	    	min-width: 170px;
	    	boxshadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    	z-index: 1;
	    }
	    
	    .escolha-conteudo a{
	    	color: black;
	    	padding: 12px;
	    	text-decoration: none;
	    	display: block;
	    }	    
	    
	    .escolha-conteudo a:hover{
	    	background-color: #ddd;
	    }
	    
	    .escolha:hover .escolha-conteudo{
	    	display:block;
	    }
	    
	    .escolha:hover .botaomenu{
	    	background-color: cornflowerblue;
	    }
	</style>
</head>
<body>
	<div style="width:100%;background-color: cornflowerblue">
		<!-- temas -->
		<div class="escolha">
			<button class="botaomenu">Temas</button>
			<div class="escolha-conteudo">
				<a href="novo_tema.jsp">Inserir</a>
				<a href="listagem_temas.jsp">Lista Temas</a>
			</div>	
		</div>
					
		<!-- editoras -->
		<div class="escolha">
			<button class="botaomenu">Editoras</button>
			<div class="escolha-conteudo">
				<a href="nova_editora.jsp">Inserir</a>
				<a href="listagem_editoras.jsp">Lista Editoras</a>
			</div>	
		</div>
		
		<!-- nacionalidades -->
		<div class="escolha">
			<button class="botaomenu">Nacionalidades</button>
			<div class="escolha-conteudo">
				<a href="nova_nacionalidade.jsp">Inserir</a>
				<a href="listagem_nacionalidades.jsp">Lista Nacionalidades</a>
			</div>	
		</div>
		
		<!-- escritores -->
		<div class="escolha">
			<button class="botaomenu">Escritores</button>
			<div class="escolha-conteudo">
				<a href="novo_escritor.jsp">Inserir</a>
				<a href="listagem_escritores.jsp">Lista Escritores</a>
			</div>	
		</div>	
		
		<!-- livros -->
		<div class="escolha">
			<button class="botaomenu">Livros</button>
			<div class="escolha-conteudo">
				<a href="novo_livro.jsp">Inserir</a>
				<a href="listagem_livros.jsp">Lista Livros</a>
			</div>	
		</div>						
					
	</div>	
</body>
</html>


    