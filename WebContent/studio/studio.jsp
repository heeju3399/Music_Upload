<!-- list.jsp -->
<%@page import="board.BoardBean"%>
<%@page import="bean.StudioBean"%>
<%@page import="java.util.Vector"%>
<%@page import="board.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="mgr.StudioMgr" />
<jsp:useBean id="bomgr" class="board.BoardMgr"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
int totalRecord = 0;//총게시물수
int numPerPage = 10;//페이지당 레코드 개수(5,10,15,30)
int pagePerBlock = 10;//블럭당 페이지 개수
int totalPage = 0;//총 페이지 개수
int totalBlock = 0;//총 블럭 개수
int nowPage = 1;//현재 페이지
int nowBlock = 1;//현재 블럭
String sid = (String) session.getAttribute("idKey");
//String sid = "aaa";
//요청된 numPerPage 처리
//요청이 있으면 처리가 되지만 그렇지 않으면 기본 10개 세팅이 된다.
if (request.getParameter("numPerPage") != null) {
	numPerPage = UtilMgr.parseInt(request, "numPerPage");
}

//검색에 필요한 변수
String keyField = "", keyWord = "";
//검색일때
if (request.getParameter("keyWord") != null) {
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
}

//검색 후에 다시 처음화면 요청
if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
	keyField = "";
	keyWord = "";
}

totalRecord = mgr.getTotalCount(keyField, keyWord, sid);
//out.print("totalRecord : " + totalRecord);

//nowPage 요청 처리
if (request.getParameter("nowPage") != null) {
	nowPage = UtilMgr.parseInt(request, "nowPage");
}

//sql문에 들어가는 start, cnt 선언
int start = (nowPage * numPerPage) - numPerPage;
int cnt = numPerPage;

//전체페이지 개수
totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
//전체블럭 개수
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
//현재블럭
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
%>
<html>
<head>
<title>Comma Board</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">

<style>
body {
	font-family: Nanum Myeongjo;
	
}
</style>
<link rel="stylesheet" href="../main/assets/css/main.css" />
<script type="text/javascript">
	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.getElementById('guide').innerHTML = '검색 결과';
		document.searchFrm.submit();
	}
	function pageing(page) {
		document.listFrm.nowPage.value = page;
		document.listFrm.submit();
	}
	function block(block) {
		document.readFrm.nowPage.value =<%=pagePerBlock%>
	* (block - 1) + 1;
		document.readFrm.submit();
	}
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value = numPerPage;
		document.readFrm.submit();
	}
	//list.jsp에서 read.jsp로 요청이 될때 기존에 조건 같이 넘어감.
	//기존 조건 : keyField,keyWord,nowPage,numPerPage
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "../board/read.jsp";
		document.readFrm.submit();
	}

	function del(num) {
		if (confirm('삭제하시겠습니까?')) {
			document.delFrm.num.value = num;
			document.delFrm.action = "deleteProc.jsp";
			document.delFrm.submit();

		}
	}
</script>

<style>
body {
	
	color: black;
	font-size: 14px;
}

.table {
	display: table;
	width: 100%;
}

.row {
	display: table-row;
}

.col {
	display: table-column;
}

a {
	font-color: #dc3545;
}

.hr {
	width: 80%;
	margin: 0px auto;
}

a:visited {
	font-color: #dc3545;
}

a:active {
	font-color: #dc3545;
}

table {
	width: 80%;
	margin: 0px auto;
}

input {
	width: auto;
	height: 40px;
	font-size: 14px;
}

select {
	height: 40px;
	font-size: 14px;
}

button {
	height: 40px;
	font-size: 14px;
}

#searchFrm {
	text-align: right;
}
</style>
</head>

<body>
	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="../main/main.jsp" class="logo">C O M M A </a>
			<nav id="nav">
				<a class="kkk" href="../top100/top100.jsp">차트</a> <a
					href="../board/list.jsp">최신 업로드</a> 	
				<%
					if (sid != null) {
					out.println("<a href='../studio/studio.jsp'>스튜디오</a>");
					out.println("<a href='../member/member-Update.jsp'>" + "회원수정(" + sid + ")</a>");
					out.println("<a href='../member/sign-in.jsp'>로그인</a>");
					out.println("<a href='../member/logout.jsp'>로그아웃</a>");
				} else {
					out.println("<a href='../member/sign-in.jsp'>로그인</a>");
					out.println("<a href='../member/sign-up.jsp'>회원가입</a>");
				}
				%>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	<div align="center" style="width: 80%; margin: 0px auto;">
		<br /> <br />

		<h2 style="text-align: left;">
			<a href="#" style='color: black'>My Studio</a>

		</h2>
		<div>
			<div style="font-size: 16px;" style='width:80%;'>
				<span style='display: left' id='guide'>
					<%
						if  (request.getParameter("keyWord") != null){
							String keyword = request.getParameter("keyWord").toString();
							out.println("<span style='color:red;'>"+totalRecord+"글을 찾았습니다.</span><span>&nbsp;&nbsp;&nbsp;&nbsp;목록을 다시 조회하려면 옆에 목록 버튼을 눌러주세요.</span>");
						}else{
							out.println("업로드한 글을 검색하려면 검색어를 입력하고 버튼을 눌러주세요.");
						}						
					%>
				</span>
				<form id='searchFrm' name="searchFrm"
					style='display: inline; float: right;'>
					<div>
						<select name="keyField" size="1"
							style='width: 100px; display: inline;'>
							<option value="subject">제 목</option>
							<option value="content">내 용</option>
						</select> <input size="32" name="keyWord" width='200px'> <input
							type="button" style='background-color: #dc3545;' value="찾기"
							onClick="javascript:check()"> <input type="hidden"
							name="nowPage" value="1"> <br>
						<br>
						<a href="../board/post.jsp"> 나도올리기 </a> &nbsp;&nbsp;&nbsp;&nbsp; <a
							href="../studio/studio.jsp">목록 </a> 
							<input type="hidden" name="id" value="<%=sid%>">

					</div>
				</form>
			</div>
		</div>
	</div>
	<section>
		<table class="table-wrapper">
			<tr>
				<td align="center" colspan="2">
					<%
						Vector<StudioBean> vlist = mgr.getBoardList(keyField, keyWord, start, cnt, sid);
					int listSize = vlist.size();//브라우저 화면에 표시될 게시물 번호
					if (vlist.isEmpty()) {
						out.println("<span>등록된 게시물이 없습니다.</span>");
					} else {
					%>

					<table>
						<thead>
							<tr style='color:white; 'align="center" bgcolor="#dc3545">
								<td width="150">날짜</td>
								<td width="250">노래제목</td>
								<td width="100">삭제</td>
								<td width="100">조회수</td>
								<td width="100">좋아요수</td>
								<td width="100">노력요함수</td> 
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < numPerPage; i++) {
								if (i == listSize)
									break;
								StudioBean bean = vlist.get(i);
								int num = bean.getNum();//게시물 번호
								String subject = bean.getSubject();//제목
								String id = bean.getId();//이름
								String regdate = bean.getRegdate();//날짜
								String regok = regdate.substring(5, 10);
								int depth = bean.getDepth();//답변의 깊이
								int count = bean.getCount();//조회수
								String filename = bean.getFilename();//첨부파일
								String name = bean.getName();
								BoardBean bobean = bomgr.getBoard(num);
								//댓글 count
								//int bcount = cmgr.getBCommentCount(num);
								int bcount = 0;
							%>
							<tr align="center">						
								<td><%=regok%></td>
								<td align="center"> 
										<%=subject%>
								<%
 	if (filename != null && !filename.equals("")) {
 %> <%
 	}
 %> <%
 	if (bcount > 0) {
 %> <font color="red">(<%=bcount%>)
								</font> <%
 	}
 %></td>
								<td>
									<a style="font-size: 30px;" class="icon fa-remove" href="javascript:del(<%=num%>);"></a>
								</td>
								<td><%=count%></td>    
								<td><%=bobean.getLike()%></td>    
								<td><%=bobean.getBad()%></td>    
							</tr>
							<%
								} //---for
							%>
						</tbody>
					</table> <%
 	} //---if-else
 %> <%
 	if (totalPage > 0) {
 %> <!-- 이전 블럭 --> <%
 	if (nowBlock > 1) {
 %> <a href="javascript:block('<%=nowBlock - 1%>')">&nbsp;&nbsp;이전&nbsp;&nbsp;</a>
					<%
						}
					%> <!-- 페이징 --> <%
 int pageStart = (nowBlock - 1) * pagePerBlock + 1;
 int pageEnd = (pageStart + pagePerBlock) < totalPage ? pageStart + pagePerBlock : totalPage + 1;
 for (; pageStart < pageEnd; pageStart++) {
 %> <a href="javascript:pageing('<%=pageStart%>')">&nbsp;<%
 	if (nowPage == pageStart) {
 %><font color="black"> <%
 	}
 %> <%=pageStart%> <%
 	if (nowPage == pageStart) {
 %>
					</font> <%
 	}
 %>
				</a> <%
 	} //---for
 %> <!-- 다음 블럭 --> <%
 	if (totalBlock > nowBlock) {
 %> &nbsp;&nbsp;<a href="javascript:block('<%=nowBlock + 1%>')">&nbsp;&nbsp;다음</a>

					<%
						}
					%> <%
 	} //---if1
 %> <!-- 페이징 및 블럭 End --> <!-- 			<tr>  --> <!-- 				<td align="right"><a href="post.jsp"><button>글쓰기</button></a> <a -->
					<!-- 					href="javascript:list()"><button>처음으로</button></a></td> -->
					<!-- 			</tr> -->
		</table>
	</section>

	<hr class='hr'>

	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> <input
			type="hidden" name="nowPage" value="1">
	</form>
	<form name="delFrm" method="post">
		<input type='hidden' name='num' value=''> <input type="hidden"
			name="reload" value="true"> <input type="hidden"
			name="nowPage" value="1">
	</form>

	<form name="readFrm">
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
			type="hidden" name="numPerPage" value="<%=numPerPage%>"> <input
			type="hidden" name="keyField" value="<%=keyField%>"> <input
			type="hidden" name="keyWord" value="<%=keyWord%>"> <input
			type="hidden" name="num" value="">
	</form>
	<script src="../main/assets/js/jquery.min.js"></script>
	<script src="../main/assets/js/skel.min.js"></script>
	<script src="../main/assets/js/util.js"></script>
	<script src="../main/assets/js/main.js"></script>
</body>
</html>
