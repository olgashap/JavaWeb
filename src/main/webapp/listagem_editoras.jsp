<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*"%>   
<%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem de editoras</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
      <%@include file="menu.jsp" %>

	<h1>Listagem de editoras</h1>
	<hr>
	<table id="tabela_rest">
		<tr>
			<th>Código Editora</th>
			<th>Editora</th>
			<th></th>
			
	
		</tr>
		<%
			Connection cn=ligacaoMySql.criarLigacaoMySql();
			Statement st=cn.createStatement();
			String sql="select * from editoras";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				out.println("<tr><td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td><a href='eliminar_editora.jsp?eliminar="+
				rs.getString(1)+"'><input type='button' value='Eliminar'></a></td></tr>");
			}
			cn.close();
		%>
		
	</table>
	<br><br>
	<p style="text-align:center">
		<a href="nova_editora.jsp">Voltar</a>
	</p>
</body>
</html>