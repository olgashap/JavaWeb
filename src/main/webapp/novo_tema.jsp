<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarBD.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Novo tema</title>
    <link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
 <%@include file="menu.jsp" %>
            <h1>Novo tema</h1>
	<hr>
	<div align="center">
		<form method="POST" action="novo_tema.jsp">
			<br>
			<div id="mensagem"></div>
			<br>
			<label>Tema</label><br><br>
			<input type="text" name="txt_tema" required placeholder="Digite o novo tema"><br><br>
			<input type="submit" value="Guardar">
			<input type="reset" value="Cancelar">
		</form>
		<%
		
			String tema=request.getParameter("txt_tema");
		
			if(tema!=null){
				Connection cn=ligacaoMySql.criarLigacaoMySql();
				PreparedStatement ps=null;
				ResultSet rs=null;
				ps=cn.prepareStatement("select * from temas where nome_tema=?");
				ps.setString(1, tema);
				rs=ps.executeQuery();
				if(rs.next()){
				%>
					<script>
						document.getElementById('mensagem').innerHTML="<h3style='color:red'>Nome de tema já existe.</h3>";
					</script>
				<%		
				}
				else{
					Statement st=cn.createStatement();
					st.executeUpdate("insert into temas (nome_tema) values ('"+tema+"')");
					%>
					
					<script>
						document.getElementById('mensagem').innerHTML="<h3 style='color:green'>Tema inserido.</h3>";
					</script>	
									
					<%
				}
			}
		
		%>
	</div>

</body>
</html>