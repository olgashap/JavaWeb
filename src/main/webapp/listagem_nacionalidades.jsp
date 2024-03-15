<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@page import="ligarBD.*"%>   
<%@page import="java.sql.*" %>   
  <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem de nacionalidades</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
 <%@include file="menu.jsp" %>
	<h1>Listagem de nacionalidades</h1>
	<hr>
	<table id="tabela_rest">
		<tr>
			<th>Código Nacionalidade</th>
			<th>Nacionalidade</th>
			<th></th>
	
		</tr>
		<%
			Connection cn=ligacaoMySql.criarLigacaoMySql();
			Statement st=cn.createStatement();
			String sql="select * from nacionalidades";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				out.println("<tr><td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td><a href='eliminar_nacionalidade.jsp?eliminar="+
				rs.getString(1)+"'><input type='button' value='Eliminar'></a></td></tr>");
			}
			cn.close();
		%>
		
	</table>
	<br><br>
	<p style="text-align:center">
		<a href="nova_nacionalidade.jsp">Voltar</a>
	</p>
</body>
</html>