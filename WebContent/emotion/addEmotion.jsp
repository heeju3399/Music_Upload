	<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="mgr" class="mgr.EmotionMgr"></jsp:useBean>
<%
//1 = funny, 2 = happy, 3 = sad, 4 = hell//
	request.setCharacterEncoding("UTF-8");
	String emotion = request.getParameter("name");
	Object sid = session.getAttribute("idKey");
	int e = Integer.parseInt(emotion);
	
	String url="../main/main.jsp#one";
	if(e==1){
		
		mgr.funnyUp(sid); 
		
	}else if(e==2){
		
		mgr.happyUp();
		
	}else if(e==3){
		
		mgr.sadUp();
		
	}else if(e==4){
		
		mgr.hellUp();
		
	}else{
		out.print("who are you?");
	}
%>
<script>
location.href="<%=url%>";
</script>