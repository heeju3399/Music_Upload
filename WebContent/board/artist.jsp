
<%@page import="bean.CommentBean"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="board.UtilMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="board.BoardMgr"></jsp:useBean>
<jsp:useBean id="bean" class="board.BoardBean"></jsp:useBean>
<jsp:useBean id="cmgr" class="board.BCommentMgr"></jsp:useBean>
<jsp:useBean id="cbean" class="bean.CommentBean"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String sid = (String) session.getAttribute("idKey");
int num = Integer.parseInt(request.getParameter("num"));
bean = mgr.getBoard(num);
int like = bean.getLike();
int bad = bean.getBad();

//   댓글,,,,,,		

String flag = request.getParameter("flag");
if (flag != null) {
	if (flag.equals("insert")) {
		cbean.setC_id(num);
		cbean.setM_id(sid);
		cbean.setC_content(request.getParameter("c_content"));
		cbean.setS_id(num);
		cbean.setC_ip(request.getParameter("c_ip"));
		cmgr.insertComment(cbean);
	} else if (flag.equals("del")) {
		//요청한 댓글 삭제
		cmgr.deleteComment(UtilMgr.parseInt(request, "c_id"));
	}
} else {
	//조회수 증가 : list.jsp 게시물 읽어옴.
	mgr.upCount(num);
}
//읽어온 게시물을 수정 및 삭제를 위해 세션저장
session.setAttribute("bean", bean);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=name%>의 프로필</title>
<link rel="stylesheet" href="../main/assets/css/main.css" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<style>
.inner {
	transform: scale(0.85);
	margin-top: -20%;
}
</style>
</head>

<body>
	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="../main/main.jsp" class="logo">C O M M A</a>
			<nav id="nav">
				<a class="kkk" href="../top100/top100.jsp">차트</a> <a
					href="list.jsp">최신 업로드 </a>

				<%
					if (sid != null) {
				%>
				<a href="../studio/studio.jsp">스튜디오</a><a
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
	<!-- 	===================================== -->
	<!-- 다시... -->



	<!-- 다시... -->
	<!-- ================================================ -->

	<!-- 	요거 반복하기 -->
	<div class="inner">

		<!-- 	요거 반복하기 -->

		<section id="one">
			<div class="inner">
				<article>
					<div class="content">
						<header>
							<h3>
								<a href="artist.jsp?name=<%=name%>&num=<%=num%>"><%=name%>의
									앨범</a>
							</h3>
						</header>
						<div class="image fit">
							<img src="fileupload/<%=bean.getName()%>" alt="사진이 없습니다." />
						</div>
						<p>
						<h5>앨범내용</h5><%=bean.getContent()%></p>
						<figure>
							<h4>
								제목 :
								<%=bean.getSubject()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="javascript:like(<%=num%>)"
									style="font-size: 20px; color: lightblue;"
									class="icon fa-thumbs-up">&nbsp;<%=like%>개
								</a> &nbsp;&nbsp;<a href="javascript:bad(<%=num%>)"
									style="font-size: 20px; color: gray;"
									class="icon fa-thumbs-down">&nbsp;<%=bad%>개
								</a>
							</h4>
							<audio controls src="fileupload/<%=bean.getFilename()%>"></audio>

						</figure>
						<hr>
						<!-- 댓글 입력 칸			 -->

						<section id="footer">
							<div style="margin-left: 10px; margin-right: 10px;">
								<form method="post" action="#" name="cfrm">


									<!-- 										리스트 목록!				 -->
									<%
										Vector<CommentBean> cvlist = cmgr.getComment(num);
									if (!cvlist.isEmpty()) {
										for (int i = 0; i < cvlist.size(); i++) {
											cbean = cvlist.get(i);
											int c_id = cbean.getC_id();
											String comment = cbean.getC_content();
											String cregdate = cbean.getC_created_at();
											String date = cregdate.substring(0, 19);
									%>

									<div class="field">
										<h5 style="color: black;">
											글쓴이&nbsp;:&nbsp;<%=cbean.getM_id()%></h5>
										<h3><%=comment%></h3>
									</div>
									<ul class="actions">
										<li style="font-style: italic; color: black;">작성일시 : <%=date%></li>
										<li><a href="#" onclick="cDel(<%=c_id%>)"
											class="icon fa-trash"> <span lass="label">삭제</span></a></li>

									</ul>
									<hr>
									<%
										} //---for
									%>

									<%
										}
									%>

									<h4>댓글란</h4>
									<div class="field" id="zzzzzzzzzzz">
										<textarea name="c_content" id="message" rows="3"
											placeholder="댓글 입력"></textarea>
									</div>
									<ul class="actions">
										<li><input type="button" value="올리기" class="alt"
											onclick="insert()" /></li>
									</ul>
									<br> <br>

									<%
										//ip설정
									//월래는 이거 씀! pageContext.getRequest().getRemoteAddr()
									String ipaddress = request.getHeader("HTTP_X_FORWARDED_FOR");

									if (ipaddress == null)
										ipaddress = request.getRemoteAddr();
									%>
									<input type="hidden" name="flag" value="insert" /> <input
										type="hidden" name="c_id" value="" /> <input type="hidden"
										name="c_ip" value="<%=ipaddress%>" /> <input type="hidden"
										name="s_id" value="<%=num%>">

									<!-- 				수정할때 쓰기 -->
									<input type="hidden" name="c_updated_at" value="">


								</form>

							</div>
						</section>
						<!-- 댓글 입력 칸			 -->

					</div>
				</article>


			</div>
		</section>
	</div>
	<form name="likeFrm" method="post">
		<input type="hidden" name="reload" value="true"> <input
			type="hidden" name="nowPage" value="1"> <input type='hidden'
			name='num' value=''>
	</form>

	<form name="badFrm" method="post">
		<input type="hidden" name="reload" value="true"> <input
			type="hidden" name="nowPage" value="1"> <input type='hidden'
			name='num' value=''>
	</form>
	<!-- 스클립트문 -->
	<script>
function insert() {
	if (document.cfrm.c_content.value == "") {
		alert("댓글을 입력하세요.");		
		document.cfrm.c_content.focus();
		return;
	}		
	document.cfrm.submit(); 	
}

function cDel(c_id) {	
	document.cfrm.flag.value = "del";
	document.cfrm.c_id.value = c_id;
	document.cfrm.submit();
}
</script>
	<script>
function like(num) {
	//alert(num);
	document.likeFrm.action = "boardLike";
	document.likeFrm.num.value = num;
	document.likeFrm.submit();
}

function bad(num) {
	//alert(num);
	document.badFrm.action = "boardBad";
	document.badFrm.num.value = num;
	document.badFrm.submit();
}
</script>
	<!-- 	===================================== -->
	<script src="../main/assets/js/jquery.min.js"></script>
	<script src="../main/assets/js/skel.min.js"></script>
	<script src="../main/assets/js/util.js"></script>
	<script src="../main/assets/js/main.js"></script>
</body>
</html>