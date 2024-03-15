<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*"%>   
<%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem de livros</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
 <%@include file="menu.jsp" %>
	<h1>Listagem de livros</h1>
	<hr>
	<table id="tabela_rest">
		<tr>
			<th>Código do livro</th>
			<th>Título</th>
			<th>Data de aquisição</th>
			<th>Tema</th>
			<th>Editora</th>
			<th>Escritor</th>
			<th>Ano de publicação</th>
			<th>Preço do livro</th>
		</tr>
		<%
			Connection cn=ligacaoMySql.criarLigacaoMySql();
			Statement st=cn.createStatement();
			String sql="select id_livro,titulo,data_aquisicao,nome_tema,nome_editora,nome_escritor, ano_publicacao,preco from livros "+
			"inner join temas on livros.id_tema=temas.id_tema "+
			"inner join editoras on livros.id_editora=editoras.id_editora "+
			"inner join escritores on livros.id_escritor=escritores.id_escritor";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				out.println("<tr><td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
				out.println("<td>"+rs.getString(8)+"</td></tr>");
				
			}
			cn.close();
		%>
		
	</table>
	<br><br>
	<p style="text-align:center">
		<a href="novo_livro.jsp">Voltar</a>
	</p>
</body>
</html>