<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="mm" class="exex.youtube"></jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
    	Vector<String> list = mm.you();
    	for(int i =0; i<list.size(); i++){
    		Object aa = list.get(i);
    		String bb = aa.toString();
    	
    %>
<table>

<tr>
<td>뿌리기 : <%=bb%></td>
</tr>

</table>

<%} %>
</body>
</html>