<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*"%>   
<%@page import="java.sql.*"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Eliminar nacionalidade</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>Eliminar nacionalidade</h1>

		<%
			String nacionalidade=request.getParameter("eliminar");
			Connection cn=ligacaoMySql.criarLigacaoMySql();
			Statement st=cn.createStatement();
			
			try{
				st.executeUpdate("delete from nacionalidades where id_nacionalidade="+nacionalidade);
				out.println("Nacionalidade eliminada.");
			}
			catch(SQLException e){
				out.println("Erro ao eliminar a nacionalidade.");
			}
		%>
		
	<br><br>
	<p style="text-align:center">
		<a href="listagem_temas.jsp">Voltar</a>
	</p>
</body>
</html>