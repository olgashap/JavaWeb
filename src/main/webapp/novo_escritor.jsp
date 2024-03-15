<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarBD.*" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Novo Escritor</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
 <%@include file="menu.jsp" %>
	<h1>Novo escritor</h1>
	<hr>
	<div align="center">
		<form method="POST" action="novo_escritor.jsp">
			<br>
			<div id="mensagem"></div>
			<br>
			
			<label>Nome do escritor</label><br><br>
			<input type="text" name="txt_escritor" required placeholder="Digite o nome do escritor"><br><br>
			
			<label>Nacionalidade</label><br><br>
			<select name="txt_nacionalidade" required>
				<option value=""></option>
				
				<%
				Connection cn1=ligacaoMySql.criarLigacaoMySql();
				Statement st1=cn1.createStatement();
				ResultSet rs1=st1.executeQuery("select * from nacionalidades");
				while(rs1.next()){
					out.println("<option value="+rs1.getString(1)+">"+rs1.getString(2)+"</option>");
				}
				cn1.close();
				%>
			</select>
			<br><br>
			<label>Foto</label><br><br>
			<input type="text" name="txt_foto" required placeholder="Digite o nome da foto do escritor"><br><br>
			
			<input type="submit" value="Guardar">
			<input type="reset" value="Cancelar">
		</form>
		<%
		
			String escritor=request.getParameter("txt_escritor");
			String nacionalidade=request.getParameter("txt_nacionalidade");
			String foto=request.getParameter("txt_foto");
		
			if(escritor!=null){
				Connection cn=ligacaoMySql.criarLigacaoMySql();
				PreparedStatement ps=null;
				ResultSet rs=null;
				ps=cn.prepareStatement("select * from escritores where nome_escritor=?");
				ps.setString(1, escritor);
				rs=ps.executeQuery();
				if(rs.next()){
				%>
					<script>
						document.getElementById('mensagem').innerHTML="<h3 style='color:red'>Nome de escritor já existe.</h3>";
					</script>
				<%		
				}
				else{
					Statement st=cn.createStatement();
					st.executeUpdate("insert into escritores (nome_escritor,id_nacionalidade,foto) values "+
					"('"+escritor+"','"+nacionalidade+"','"+foto+"')");
					%>
					
					<script>
						document.getElementById('mensagem').innerHTML="<h3 style='color:green'>Escritor inserido.</h3>";
					</script>	
									
					<%
				}
			}
		
		%>
	</div>
</body>
</html>