<%@page contentType="text/html;charset=EUC-KR"%>

<jsp:useBean id="mMgr" class="mgr.MemberMgr" />
<%
   		request.setCharacterEncoding("EUC-KR");
   		String id = request.getParameter("id");
   		boolean check = mMgr.checkId(id);//true�� �ߺ�
   	
%>
<html>
<head>
<title>ID�ߺ�üũ</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script  src="script.js"></script>

</head>
<body>
<br>
<div align="center">
<b><%=id%></b>
<%
	  if(check){
	     out.println("�� �̹� �����Ѵ� ID�Դϴ�.<p/>");
	}else{    
	     out.println("�� ��� ���� �մϴ�.<p/>");
	}
%>
<a href="javascript:this.close();">�ݱ�</a>
</div>
</body>
</html>