<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarBD.*" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Nova Editora</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
 <%@include file="menu.jsp" %>
	<h1>Nova editora</h1>
	<hr>
	<div align="center">
		<form method="POST" action="nova_editora.jsp">
			<br>
			<div id="mensagem"></div>
			<br>
			<label>Editora</label><br><br>
			<input type="text" name="txt_editora" required placeholder="Digite a nova editora"><br><br>
			<input type="submit" value="Guardar">
			<input type="reset" value="Cancelar">
		</form>
		<%
		
			String editora=request.getParameter("txt_editora");
		
			if(editora!=null){
				Connection cn=ligacaoMySql.criarLigacaoMySql();
				PreparedStatement ps=null;
				ResultSet rs=null;
				ps=cn.prepareStatement("select * from editoras where nome_editora=?");
				ps.setString(1, editora);
				rs=ps.executeQuery();
				if(rs.next()){
				%>
					<script>
						document.getElementById('mensagem').innerHTML="<h3 style='color:red'>Nome de editora já existe.</h3>";
					</script>
				<%		
				}
				else{
					Statement st=cn.createStatement();
					st.executeUpdate("insert into editoras (nome_editora) values ('"+editora+"')");
					%>
					
					<script>
						document.getElementById('mensagem').innerHTML="<h3 style='color:green'>Editora inserida.</h3>";
					</script>	
									
					<%
				}
			}
		
		%>
	</div>
</body>
</html>