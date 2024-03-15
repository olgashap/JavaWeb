<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*"%>   
<%@page import="java.sql.*"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem de temas</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
 <%@include file="menu.jsp" %>
	<h1>Listagem de temas</h1>
	<hr>
	<table id="tabela_rest">
		<tr>
			<th>Código Tema</th>
			<th>Tema</th>
			<th></th>
	
		</tr>
		<%
			Connection cn=ligacaoMySql.criarLigacaoMySql();
			Statement st=cn.createStatement();
			String sql="select * from temas";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				out.println("<tr><td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td></tr>");
				out.println("<td><a href='eliminar_tema.jsp?eliminar="+
			    rs.getString(1)+"'><input type='button' value='Eliminar'></a></td></tr>");
			}
			cn.close();
		%>
		
	</table>
	<br><br>
	<p style="text-align:center">
		<a href="novo_tema.jsp">Voltar</a>
	</p>
</body>
</html>