<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="mMgr" class="mgr.MemberMgr"/>
    <jsp:useBean id="mbean4" class="bean.MemberBean"/>
  	<jsp:setProperty property="*" name="mbean4"/> 
<%  
	String url ="sign-up.jsp";
	String msg = "사용중이거나 가입된 이메일입니다.";
	int result = mMgr.signUp(mbean4);
	if(result==1){
		session.setAttribute("idKey", mbean4.getM_id());
		url = "../main/main.jsp";
		msg="ok";
	}else if(result==0){//아이디중복
		msg="사용중이거나 가입된 아이디입니다.";
	}// else = 이메일중복	
%>
<script type="text/javascript">
alert('<%=msg%>');
location.href = "<%=url%>"; 

</script>


