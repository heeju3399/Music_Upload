<%@page contentType="text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Object sid = session.getAttribute("idKey");
%>
<html>
<head>
<title>ID,PASS_SEARCH</title>
<script src="member.js"></script> 
<link rel="stylesheet" href="../main/assets/css/main.css" /> 
</head>
<body topmargin="100">
	<header id="header">
		<div class="inner">
			<a href="../main/main.jsp" class="logo">C O M M A</a> 
			<nav id="nav"> 
				<a href="">인기차트</a> 
				<a href="">인기차트2</a> 
				<a href="">업로드</a>
				<a href="">업로드</a>
				<% if(sid!=null){ %>
				<a href="">회원관리</a>
				<% }else{%>
				<a href="sign-in.jsp">로그인</a>
				<a href="sign-up.jsp">회원가입</a>
				<%} %>
			</nav>
		</div>
	</header> 
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	<section id="footer">
		<div class="inner">
			<header>
					<h1><a href="sign-in.jsp" style="text-decoration: none;">Search</a></h1><br>
			</header>
			<form method="post" name="logfrm" action="idSearchProc.jsp">
				<div class="field">
					<label for="name">
					회원가입한 본인메일로 <br>아이디와 비밀번호를 보내드립니다.					
					</label> 
				</div>
				<div class="field">
					<label >E_MAIL</label> 
					<input type="email" name="m_email"/>
				</div>
						
				<div class="field"> 					
						<input type="submit" value="메일보내기" >				 	
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