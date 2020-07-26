<!-- memberUpdate.jsp -->

<%@page import="bean.MemberBean"%>
<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="bean.MemberBean"/>
<jsp:useBean id="mgr" class="mgr.MemberMgr"/>
<%
	String id = (String)session.getAttribute("idKey");
	if(id==null){
	response.sendRedirect("sign-in.jsp");
	return;	}
	
	String sid = (String)session.getAttribute("idKey");
	bean = mgr.getMemberBean(sid);

%>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">

<style>
body {
	font-family: Nanum Myeongjo;
	
}
</style>
<title>Update</title>
<script src="member.js"></script> 
<link rel="stylesheet" href="../main/assets/css/main.css" /> 
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
</head>
<body topmargin="100">
	<header id="header">
		<div class="inner"> 
			<a href="../main/main.jsp" class="logo">C O M M A </a> 
			<nav id="nav"> 
				<a class="kkk" href="../top100/top100.jsp">차트</a>  
				<a href="../board/list.jsp">최신 업로드</a> 
<!-- 				<a href="../upload/fileUpload.jsp">파일업로드</a> -->
				<% if(sid!=null){ %> 
				<a href="../studio/studio.jsp">스튜디오</a><a href="../member/member-Update.jsp">&nbsp;&nbsp;회원수정(<%=sid%>)&nbsp;&nbsp;</a>
				<a href="../member/logout.jsp">로그아웃</a>
				<% }else{%>
				<a href="../member/sign-in.jsp">로그인</a>
				<a href="../member/sign-up.jsp">회원가입</a>
				<%} %>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	<section id="footer">
		<div class="inner">
			<header>
				<h1><a href="" style="text-decoration: none;">Member_Update</a></h1><br>
			</header>
			
			<form method="post" name="regForm" action="member-UpdateProc.jsp">
				<div class="field">
						<label for="name">ID</label>
						<input type="text" name="m_id" value="<%=bean.getM_id() %>" readonly />
				</div>
				<div class="field">
					<label for="email">PASS</label> 
					<input type="password" name="m_pwd"  value="" />
				</div>
				<div class="field">
					<label for="email">REPASS</label> 
					<input type="password" name="repwd"  value="" />
				</div>
				<div class="field">
					<label for="email">BIRTH</label> 
					<input style="color: black;" type="date" name="m_birth" value="<%= bean.getM_birth() %>"/>  
				</div>
				<div class="field">
					<label for="email">EMAIL</label> 
					<input type="email" name="m_email" value="<%=bean.getM_email() %>" />
				</div>

				<div><br>
				<tr>
					<td colspan="3" align="center">
						<input type="button" value="수정완료" onclick="inputCheck()"> 
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
						<input type="reset" value="다시쓰기">
					</td>
				</tr>
				</div>

			</form>
			<div class="copyright">
				&copy; Untitled Design: <a href="">COMMA</a>.
				SNAGHEE <a href="">DISIGN</a>
			</div>
		</div>
	</section>

<script src="../main/assets/js/jquery.min.js"></script>
<script src="../main/assets/js/skel.min.js"></script> 
<script src="../main/assets/js/util.js"></script>
<script src="../main/assets/js/main.js"></script>
</body>
</html>













