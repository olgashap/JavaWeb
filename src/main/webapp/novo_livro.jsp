<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarBD.*" %>    
<!DOCTYPE html>
<html>
<head> 
  <meta charset="UTF-8">
	<title>Novo Livro</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
 <%@include file="menu.jsp" %>
	<h1>Novo livro</h1>
	<hr>
	<div align="center">
		<form method="POST" action="novo_livro.jsp">
			<br>
			<div id="mensagem"></div>
			<br>
			
			<label>Título do livro</label><br>
			<input style="width:300px" type="text" name="txt_titulo" required placeholder="Digite o título do livro"><br><br>
			
			<label>Data de aquisição</label><br>
			<input type="date" name="txt_data" required placeholder="Digite a data de aquisição"><br><br>			
			
			<label>Tema</label><br>
			<select name="txt_tema" required>
				<option value=""></option>
				
				<%
				Connection cn1=ligacaoMySql.criarLigacaoMySql();
				Statement st1=cn1.createStatement();
				ResultSet rs1=st1.executeQuery("select * from temas");
				while(rs1.next()){
					out.println("<option value="+rs1.getString(1)+">"+rs1.getString(2)+"</option>");
				}
				cn1.close();
				%>
			</select>
			<br><br>
			
			<label>Editora</label><br>
			<select name="txt_editora" required>
				<option value=""></option>
				
				<%
				Connection cn2=ligacaoMySql.criarLigacaoMySql();
				Statement st2=cn2.createStatement();
				ResultSet rs2=st2.executeQuery("select * from editoras");
				while(rs2.next()){
					out.println("<option value="+rs2.getString(1)+">"+rs2.getString(2)+"</option>");
				}
				cn2.close();
				%>
			</select>
			<br><br>
			

			<label>Escritor</label><br>
			<select name="txt_escritor" required>
				<option value=""></option>
				
				<%
				Connection cn3=ligacaoMySql.criarLigacaoMySql();
				Statement st3=cn3.createStatement();
				ResultSet rs3=st3.executeQuery("select * from escritores");
				while(rs3.next()){
					out.println("<option value="+rs3.getString(1)+">"+rs3.getString(2)+"</option>");
				}
				cn1.close();
				%>
			</select>
			<br><br>
			
			<label>Ano de publicação</label><br>
			<input style="width:60px" type="number" name="txt_ano" required placeholder="Digite o ano de publicação do livro"><br><br>

			<label>Preço</label><br>
			<input style="width:60px" type="number" name="txt_preco" required placeholder="Digite o preço do livro"><br><br>
			
			<input type="submit" value="Guardar">
			<input type="reset" value="Cancelar">
		</form>
		<%
		
			String titulo=request.getParameter("txt_titulo");
			String data=request.getParameter("txt_data");
			String tema=request.getParameter("txt_tema");
			String editora=request.getParameter("txt_editora");
			String escritor=request.getParameter("txt_escritor");
			String ano=request.getParameter("txt_ano");
			String preco=request.getParameter("txt_preco");
		
			if(titulo!=null){
				Connection cn=ligacaoMySql.criarLigacaoMySql();
				PreparedStatement ps=null;
				ResultSet rs=null;
				ps=cn.prepareStatement("select * from livros where titulo=?");
				ps.setString(1, titulo);
				rs=ps.executeQuery();
				if(rs.next()){
				%>
					<script>
						document.getElementById('mensagem').innerHTML="<h3 style='color:red'>Título do livro já existe.</h3>";
					</script>
				<%		
				}
				else{
					Statement st=cn.createStatement();
					st.executeUpdate("insert into livros (titulo,data_aquisicao,id_tema,id_editora,id_escritor,ano_publicacao,preco) values "+
					"('"+titulo+"','"+data+"','"+tema+"','"+editora+"','"+escritor+"','"+ano+"','"+preco+"')");
					%>
					
					<script>
						document.getElementById('mensagem').innerHTML="<h3 style='color:green'>Livro inserido.</h3>";
					</script>	
									
					<%
				}
			}
		
		%>
	</div>
</body>
</html>  