<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*"%>   
<%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem de escritores</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
 <%@include file="menu.jsp" %>
	<h1>Listagem de escritores</h1>
	<hr>
	<table id="tabela_rest">
		<tr>
			<th>Escritor</th>
			<th>Nome</th>
			<th>Nacionalidade</th>
			<th>Foto</th>
		</tr>
		<%
			Connection cn=ligacaoMySql.criarLigacaoMySql();
			Statement st=cn.createStatement();
			String sql="select id_escritor,nome_escritor,nome_nacionalidade, foto from escritores "+
			"inner join nacionalidades on escritores.id_nacionalidade=nacionalidades.id_nacionalidade";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				out.println("<tr><td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td><img id='foto' src=imagens/"+rs.getString(4)+"></td></tr>");
				
			}
			cn.close();
		%>
		
	</table>
	<br><br>
	<p style="text-align:center">
		<a href="novo_escritor.jsp">Voltar</a>
	</p>
</body>
</html>