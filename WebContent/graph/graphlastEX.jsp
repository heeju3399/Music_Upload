<%@page import="bean.EmotionBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="mgr.EmotionMgr"></jsp:useBean>
<jsp:useBean id="bean2" class="bean.EmotionBean"></jsp:useBean>
<%
	Vector<EmotionBean> vlist = mgr.GetGraphView();
%> 
 
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8">
<link rel="stylesheet" href="../main/assets/css/main.css" />
<title>FEEL</title>
<style>
</style>
<script src="https://www.gstatic.com/charts/loader.js"></script> 
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<script>
	//구글 시각화 API를 로딩하는 메소드
	google.charts.load('current', {
		packages : [ 'corechart' ]
	});
	// 구글 시각화 API가 로딩이 완료되면,
	// 인자로 전달된 콜백함수를 내부적으로 호출하여 차트를 그리는 메소드
	// 화면이 실행될때 함께 실행된다.
	//google.charts.setOnLoadCallback(columnChart1);
	// 묶은 세로 막대형 차트 1
	function columnChart1() {
		// 버튼 클릭 시 ajax를 사용하여 서버로부터 json 배열 객체를 가져왔다고 가정함
		var arr = [ [ 'Day', '극락', '행복', '소소', '지옥' ],
			
			<%							
				bean2 = vlist.get(0);
			%>			
				[ '그제',<%=bean2.getHappy()%>,<%=bean2.getSad()%>,<%=bean2.getHell()%>,<%=bean2.getFunny()%> ] 
			 ];
		// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
		var dataTable = google.visualization.arrayToDataTable(arr); 
		// 옵션객체 준비
		var options = { 
			title : '접속자들의 기분',	hAxis : {title : '어제 그리고 오늘',	titleTextStyle : {color : 'red'}
			}
		};
		// 차트를 그릴 영역인 div 객체를 가져옴
		var objDiv = document.getElementById('view');
		// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환
		var chart = new google.visualization.ColumnChart(objDiv);
		// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드
		chart.draw(dataTable, options);
	} // drawColumnChart1()의 끝
	// 버튼 동작

</script>
</head>
<body onload="columnChart1()">

	<!-- 그래프임 -->
	<section id="one">
		<div class="inner">
			<header>
				<h2>Magna Etiam Lorem</h2>
			</header>
			<div class="image fit" id="view"></div>
			<div class="row" style="margin: 10px;">			
			<div class="6u 12u$(xsmall)">			
				<ul class="actions fit">
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(73, 73, 207);">극락</a></li>
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(221, 50, 50);">행복</a></li>					
				</ul>   
			</div> 
			<div class="6u 12u$(xsmall)">
				<ul class="actions fit">					
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(214, 99, 54);">소소</a></li> 
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(46, 189, 33);">지옥</a></li>
				</ul>
			</div>		 
		</div> 	
		</div>
	</section>
<!-- 그래프  -->


<section id="two">
		<div class="inner"> 
			<article>
				<div class="content">
					<header>
						<h3>그래프</h3>
					</header>
					<div class="image fit" id="view">
						<img id="view" src="images/pic01.jpg" alt="" />
					</div>
					<p>그래프 설명임!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p> 
				</div>
			</article>
			<article class="alt">
				<div class="content">
					<header>
						<h3>Morbi interdum mol</h3>
					</header>
					<div class="image fit">
						<img src="images/pic02.jpg" alt="" />
					</div>
					<p>Cumsan mollis eros. Pellentesque a diam sit amet mi magna
						ullamcorper vehicula. Integer adipiscin sem. Nullam quis massa sit
						amet lorem ipsum feugiat tempus.</p>
				</div>
			</article>
		</div>
	</section>


	<section>
	<div class="inner">		
		<div>
		
		</div>
		<div id="view" style="width: 600px;"></div>		
		
		<div class="row" style="margin: 10px;">			
			<div class="6u 12u$(xsmall)">			
				<ul class="actions fit">
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(73, 73, 207);">극락</a></li>
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(221, 64, 64);">행복</a></li>					
				</ul>  
			</div> 
			<div class="6u 12u$(xsmall)">
				<ul class="actions fit">					
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(214, 99, 54);">소소</a></li>
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(46, 189, 33);">지옥</a></li>
				</ul>
			</div>		 
		</div> 			 
	</div>
	</section> 

<!-- <div id="view" style="width: 600px; height: 400px;"></div> -->

	<script src="../main/assets/js/jquery.min.js"></script>
	<script src="../main/assets/js/skel.min.js"></script>
	<script src="../main/assets/js/util.js"></script>
	<script src="../main/assets/js/main.js"></script>
</body>
</html>