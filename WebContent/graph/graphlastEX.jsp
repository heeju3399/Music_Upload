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
	//���� �ð�ȭ API�� �ε��ϴ� �޼ҵ�
	google.charts.load('current', {
		packages : [ 'corechart' ]
	});
	// ���� �ð�ȭ API�� �ε��� �Ϸ�Ǹ�,
	// ���ڷ� ���޵� �ݹ��Լ��� ���������� ȣ���Ͽ� ��Ʈ�� �׸��� �޼ҵ�
	// ȭ���� ����ɶ� �Բ� ����ȴ�.
	//google.charts.setOnLoadCallback(columnChart1);
	// ���� ���� ������ ��Ʈ 1
	function columnChart1() {
		// ��ư Ŭ�� �� ajax�� ����Ͽ� �����κ��� json �迭 ��ü�� �����Դٰ� ������
		var arr = [ [ 'Day', '�ض�', '�ູ', '�Ҽ�', '����' ],
			
			<%							
				bean2 = vlist.get(0);
			%>			
				[ '����',<%=bean2.getHappy()%>,<%=bean2.getSad()%>,<%=bean2.getHell()%>,<%=bean2.getFunny()%> ] 
			 ];
		// �� �����͸� ���� ���������̺� ��ü�� ��ȯ�ϴ� �޼ҵ�
		var dataTable = google.visualization.arrayToDataTable(arr); 
		// �ɼǰ�ü �غ�
		var options = { 
			title : '�����ڵ��� ���',	hAxis : {title : '���� �׸��� ����',	titleTextStyle : {color : 'red'}
			}
		};
		// ��Ʈ�� �׸� ������ div ��ü�� ������
		var objDiv = document.getElementById('view');
		// ���ڷ� ������ div ��ü�� ������ �÷���Ʈ�� �׸��� �ִ� ��Ʈ��ü�� ��ȯ
		var chart = new google.visualization.ColumnChart(objDiv);
		// ��Ʈ��ü�� ���������̺�� �ɼ� ��ü�� ���ڷ� �����Ͽ� ��Ʈ �׸��� �޼ҵ�
		chart.draw(dataTable, options);
	} // drawColumnChart1()�� ��
	// ��ư ����

</script>
</head>
<body onload="columnChart1()">

	<!-- �׷����� -->
	<section id="one">
		<div class="inner">
			<header>
				<h2>Magna Etiam Lorem</h2>
			</header>
			<div class="image fit" id="view"></div>
			<div class="row" style="margin: 10px;">			
			<div class="6u 12u$(xsmall)">			
				<ul class="actions fit">
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(73, 73, 207);">�ض�</a></li>
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(221, 50, 50);">�ູ</a></li>					
				</ul>   
			</div> 
			<div class="6u 12u$(xsmall)">
				<ul class="actions fit">					
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(214, 99, 54);">�Ҽ�</a></li> 
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(46, 189, 33);">����</a></li>
				</ul>
			</div>		 
		</div> 	
		</div>
	</section>
<!-- �׷���  -->


<section id="two">
		<div class="inner"> 
			<article>
				<div class="content">
					<header>
						<h3>�׷���</h3>
					</header>
					<div class="image fit" id="view">
						<img id="view" src="images/pic01.jpg" alt="" />
					</div>
					<p>�׷��� ������!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p> 
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
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(73, 73, 207);">�ض�</a></li>
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(221, 64, 64);">�ູ</a></li>					
				</ul>  
			</div> 
			<div class="6u 12u$(xsmall)">
				<ul class="actions fit">					
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(214, 99, 54);">�Ҽ�</a></li>
					<li><a href="#" class="button special icon fa-check" style="background-color: rgb(46, 189, 33);">����</a></li>
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