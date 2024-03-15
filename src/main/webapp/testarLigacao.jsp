<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Testar ligação</title>
</head>
<body>
<%
   ligacaoMySql.criarLigacaoMySql();
   out.println(ligacaoMySql.estadoLigacao());

%>
   

</body>
</html>