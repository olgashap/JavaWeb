<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*"%>   
<%@page import="java.sql.*"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Eliminar tema</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Eliminar tema</h1>

		<%
			String tema=request.getParameter("eliminar");
			Connection cn=ligacaoMySql.criarLigacaoMySql();
			Statement st=cn.createStatement();
			
			try{
				st.executeUpdate("delete from temas where id_tema="+tema);
				out.println("Tema eliminado.");
			}
			catch(SQLException e){
				out.println("Erro ao eliminar o tema.");
			}
		%>
		
	<br><br>
	<p style="text-align:center">
		<a href="listagem_temas.jsp">Voltar</a>
	</p>
</body>
</html>