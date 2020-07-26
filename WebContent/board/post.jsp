<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sid = (String) session.getAttribute("idKey");
%>
<!doctype html>
<html>
<head>
<title>니도가수다</title>
<link rel="stylesheet" href="../main/assets/css/main.css" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">
<script>
	<%
	if(sid==null){
		%>
			alert("로그인 구다사이.");	
			location.href="../member/sign-in.jsp";
		<%
	}
	%>
</script>
<style>
*{
	margin:0;
	padding:0;
}
html,body{
	width:100%;
	height:100%;
}
body {
	font-family: Nanum Myeongjo;
	///*transform: scale(0.8);*/
}
</style>
</head>
<body> 

	<header id="header">
		<div class="inner">
			<a href="../main/main.jsp" class="logo">C O M M A </a>
			<nav id="nav">
				<a class="kkk" href="../top100/top100.jsp">차트</a> <a
					href="../board/list.jsp">최신 업로드</a>
				<%
					if (sid != null) {
				%>
				<a href="../studio/studio.jsp">스튜디오</a> <a
					href="../member/member-Update.jsp">&nbsp;&nbsp;회원수정(<%=sid%>)&nbsp;&nbsp;
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
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a> 
 		<br>
			<section>
			<div class="inner">
				<h3><a href="post.jsp">업로드</a></h3>
				<form method="post" action="boardPost" 				
				enctype="multipart/form-data" >
					<div class="row uniform 50%">
						<div class="6u 12u$(xsmall)">							
						<input type="text" name="id" value="<%=sid%>" readonly="readonly"/>
						
						</div>
						<div class="6u$ 12u$(xsmall)">
							<input type="text" name="name" value=""
								placeholder="본인이름" />
						</div>
						<div class="12u$">
							<input type="text" name="subject" value=""
								placeholder="제목" />
						</div>
						<div class="12u$">
							<input type="text" name="adress" value=""
								placeholder="사는곳" />
						</div>	
						
						<div class="12u$">
							<textarea name="content" 
								placeholder="앨범 내용" rows="6"></textarea>
						</div><br><br>	
						
						<div class="12u$"> <h3>이미지</h3>
						</div><br>
						<div class="12u$"> 
							<input type="file" name="myimg" id="image" accept="image/*" onchange="setThumbnail(event);"/>
						</div><br>
								 
		<div id="image_container"></div> 
		<script> 
		function setThumbnail(event) { 
			var reader = new FileReader(); 
			reader.onload =	function(event) { 
				var img = document.createElement("img"); 
				img.setAttribute("src", event.target.result); 
				document.querySelector("div#image_container").appendChild(img); 
				}; 
				reader.readAsDataURL(event.target.files[0]); 
				}
		 		</script> 
						
						
						<div class="12u$"> <h3>음악</h3>
						</div><br>
						<div class="12u$">
							<input type="file" name="filename" accept="audio/*" size="50"
									maxlength="50"> 
						</div><br><br>						
						<div class="12u$">
							<ul class="actions">
								<li><input type="submit" value="올리기"
									class="special" /></li>
								<li><button>리스트</button></li> 
							</ul>
						</div>
					</div>
				</form>
				</div>	  
			</section> 
 	<div> 
 		<br /> 
 		<br /> 
 		<table width="600" cellpadding="3"> 
 			<tr> 
 				<td height="25" align="center">글쓰기</td> 
 			</tr> 
 		</table> 
 		<br /> 
 		<%-- <form name="postFrm" method="post" action="boardPost" 
 			enctype="multipart/form-data"> 
 			<table width="600" cellpadding="3" align="center"> 
 				<tr> 
 					<td align=center> 
 						<table align="center"> 
 							<tr> 
 								<td width="10%">I D</td> 
 								<td width="90%"><input name="id" size="10" maxlength="8" 
 									value="<%=sid%>" readonly="readonly" ></td>
 							</tr> 
 							<tr> 
 								<td>제 목</td> 
 								<td><input name="subject" size="50" maxlength="30"></td> 
 							</tr> 
 							<tr> 
 								<td>내 용</td> 
 								<td><textarea name="content" rows="10" cols="50"></textarea></td> 
 							</tr> 
 							<tr> 
 								<td>비밀 번호</td> 
 								<td><input type="password" name="pass" size="15" 
 									maxlength="15" value=""></td> 
 							</tr> 
 							<tr> 
 							<tr> 
 								<td>파일찾기</td> 
 								<td><input type="file" name="filename" size="50" 
 									maxlength="50"></td> 
 							</tr> 

 							<tr> 
 								<td colspan="2"><hr /></td> 
 							</tr> 
 							<tr> 
 								<td colspan="2"><input type="submit" value="등록"> <input 
 									type="reset" value="다시쓰기"> <input type="button" 
 									value="리스트" onClick="javascript:location.href='list.jsp'"> 
 								</td> 
 							</tr> 
 						</table> 
 					</td>  
 				</tr>  
 			</table> 
 		</form>  --%>
 	</div> 
	<div id="view"></div>
	<script src="../main/assets/js/jquery.min.js"></script>
	<script src="../main/assets/js/skel.min.js"></script>
	<script src="../main/assets/js/util.js"></script>
	<script src="../main/assets/js/main.js"></script>
</body>
</html>