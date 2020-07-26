<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ColumnChart1</title>
<style>
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://www.gstatic.com/charts/loader.js"></script>
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
		var arr = [
		[ '년도', '기쁨', '슬픔', '영업이익', '직원수' ],
		[ '2014', 1000, 400, 10, 105 ],
		[ '2015', 1170, 460, 20, 1010 ],
		[ '2016', 660, 1120, 10, 1100 ],
		[ '2017', 1030, 540, 30, 1100 ],
		[ '2018', 1030, 540, 30, 1100 ],
		[ '2019', 50, 540, 100, 1100 ]
		];
		// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
		var dataTable = google.visualization.arrayToDataTable(arr);
		// 옵션객체 준비
		var options = {
			title : '회사 실적',
			hAxis : {
				title : '년도',
				titleTextStyle : {
					color : 'red'
				}
			}
		};
		// 차트를 그릴 영역인 div 객체를 가져옴
		var objDiv = document.getElementById('column_chart_div1');
		// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환
		var chart = new google.visualization.ColumnChart(objDiv);
		// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드
		chart.draw(dataTable, options);
	} // drawColumnChart1()의 끝
	// 버튼 동작
</script>
</head>
<body onload="columnChart1()">
	<div id="column_chart_div1" style="width: 900px; height: 500px;"></div>
</body>
</html>