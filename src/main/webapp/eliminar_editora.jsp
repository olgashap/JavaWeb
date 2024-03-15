<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*"%>   
<%@page import="java.sql.*"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Eliminar editora</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Eliminar editora</h1>

		<%
			String editora=request.getParameter("eliminar");
			Connection cn=ligacaoMySql.criarLigacaoMySql();
			Statement st=cn.createStatement();
			
			try{
				st.executeUpdate("delete from editoras where id_editora="+editora);
				out.println("Editora eliminada.");
			}
			catch(SQLException e){
				out.println("Erro ao eliminar a editora.");
			}
		%>
		
	<br><br>
	<p style="text-align:center">
		<a href="listagem_temas.jsp">Voltar</a>
	</p>
</body>
</html>