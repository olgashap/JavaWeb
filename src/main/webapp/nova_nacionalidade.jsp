<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarBD.*" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Nova Nacionalidade</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>

 <%@include file="menu.jsp" %>
	<h1>Nova nacionalidade</h1>
	<hr>
	<div align="center">
		<form method="POST" action="nova_nacionalidade.jsp">
			<br>
			<div id="mensagem"></div>
			<br>
			<label>Nacionalidade</label><br><br>
			<input type="text" name="txt_nacionalidade" required placeholder="Digite a nova nacionalidade"><br><br>
			<input type="submit" value="Guardar">
			<input type="reset" value="Cancelar">
		</form>
		<%
		
			String nacionalidade=request.getParameter("txt_nacionalidade");
		
			if(nacionalidade!=null){
				Connection cn=ligacaoMySql.criarLigacaoMySql();
				PreparedStatement ps=null;
				ResultSet rs=null;
				ps=cn.prepareStatement("select * from nacionalidades where nome_nacionalidade=?");
				ps.setString(1, nacionalidade);
				rs=ps.executeQuery();
				if(rs.next()){
				%>
					<script>
						document.getElementById('mensagem').innerHTML="<h3 style='color:red'>Nome de nacionalidade já existe.</h3>";
					</script>
				<%		
				}
				else{
					Statement st=cn.createStatement();
					st.executeUpdate("insert into nacionalidades (nome_nacionalidade) values ('"+nacionalidade+"')");
					%>
					
					<script>
						document.getElementById('mensagem').innerHTML="<h3 style='color:green'>Nacionalidade inserida.</h3>";
					</script>	
									
					<%
				}
			}
		
		%>
	</div>
</body>
</html>