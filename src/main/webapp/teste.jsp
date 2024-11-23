<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Hello Jsp</title>
</head>
<body>
<h1>Heelo</h1>
<%out.println("Pronto"); %>
<%-- Uso do elemento --%>
<p> Data: <%= new Date() %></p>
<%! int contador=0; %>
<p> <%= contador++%></p>
<a href="Login">Aperta aqui!</a>
</body>
</html>