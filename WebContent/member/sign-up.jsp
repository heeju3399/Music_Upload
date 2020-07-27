<%@page contentType="text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Object sid = session.getAttribute("idKey");
%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>회원가입</title>
<script>
	function init() {
		window.navigator.geolocation.getCurrentPosition(current_position);
	}
	function current_position(position) {
		document.regForm.m_latitude.value = position.coords.latitude;
		document.regForm.m_longitude.value = position.coords.longitude;
	}
	window.addEventListener("load", init);
</script>
<link rel="stylesheet" href="../main/assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">

<style>
body {
	font-family: Nanum Myeongjo;
	
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body topmargin="100">
	<header id="header">
		<div class="inner">
			<a href="../main/main.jsp" class="logo">C O M M A </a>
			<nav id="nav">
				<a class="kkk" href="../top100/top100.jsp">차트</a> <a
					href="../board/list.jsp">최신 업로드</a>
				<%
					if (sid != null) {
				%>
				<a href="../studio/studio.jsp">스튜디오</a><a href="../member/member-Update.jsp">&nbsp;&nbsp;회원수정(<%=sid%>)&nbsp;&nbsp;
				</a> <a href="../member/logout.jsp">로그아웃</a>
				<%
					} else {
				%>
				<a href="../member/sign-in.jsp">로그인</a> <a
					href="../member/sign-up.jsp">회원가입</a>
				<%
					}
				%>
			</nav>
		</div>
	</header>

	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a><br>

	<section>
		<div class="inner">
			<div>
				<h1>
					<a href="sign-up.jsp" style="text-decoration: none;">SIGN_UP</a>
				</h1>
				<br>
			</div>
			<form method="post" name="regForm" action="sign-up-proc.jsp">

				<div class="field half">
					<label for="name">ID</label> <input type="text" name="m_id" />
				</div>
				<div class="field half">
					<label>&nbsp;</label>
					<div>
						<input type="button" onClick="idCheck(this.form.m_id.value)"
							value="중복확인" />
					</div>
				</div>
				<div class="field half">
					<div class="half">
						<label for="email">PASS</label> <input type="password"
							name="m_pwd" />
					</div>
				</div>
				<div class="field half">
					<label for="email">REPASS</label> <input type="password"
						name="repwd" />
				</div>
				<div class="field half">
					<label for="m_birth" style="display:block;">Birth</label>
					<input style="width:40%;" type="date" name="m_birth" id="m_birth"/>			
				</div>
				<div class="field half">
					<label for="email">EMAIL</label> <input type="email" name="m_email" />
				</div>
				<div class="field half">
					&nbsp;
				</div>
				<div class="field half">
				<div>
					<br>
					<ul class="actions">
						<li><input type="button" value="가입하기" class="special"
							onclick="inputCheck()"></li>
						<li><input type="reset" value="다시쓰기"></li>
					</ul>
				</div>
				<input type="hidden" name="m_latitude" value=""> <input
					type="hidden" name="m_longitude" value="">
				<%
					//월래는 이거 씀! pageContext.getRequest().getRemoteAddr()
					String ipaddress = request.getHeader("HTTP_X_FORWARDED_FOR");

					if (ipaddress  == null)
						ipaddress = request.getRemoteAddr();
					%>
					<input type="hidden" name="ip" value="<%=ipaddress%>"/>		
				</div>
			</form>
			<div class="copyright">
				&copy; Untitled Design: <a href="">COMMA</a>. 32Lab <a href="">DISIGN</a>
			</div>
		</div>
	</section>
	<script src="../main/assets/js/jquery.min.js"></script>
	<script src="../main/assets/js/skel.min.js"></script>
	<script src="../main/assets/js/util.js"></script>
	<script src="../main/assets/js/main.js"></script>
	<script src="member.js"></script>
</body>
</html>

