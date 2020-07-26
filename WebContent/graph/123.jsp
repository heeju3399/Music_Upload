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
		var arr = [
		[ '�⵵', '���', '����', '��������', '������' ],
		[ '2014', 1000, 400, 10, 105 ],
		[ '2015', 1170, 460, 20, 1010 ],
		[ '2016', 660, 1120, 10, 1100 ],
		[ '2017', 1030, 540, 30, 1100 ],
		[ '2018', 1030, 540, 30, 1100 ],
		[ '2019', 50, 540, 100, 1100 ]
		];
		// �� �����͸� ���� ���������̺� ��ü�� ��ȯ�ϴ� �޼ҵ�
		var dataTable = google.visualization.arrayToDataTable(arr);
		// �ɼǰ�ü �غ�
		var options = {
			title : 'ȸ�� ����',
			hAxis : {
				title : '�⵵',
				titleTextStyle : {
					color : 'red'
				}
			}
		};
		// ��Ʈ�� �׸� ������ div ��ü�� ������
		var objDiv = document.getElementById('column_chart_div1');
		// ���ڷ� ������ div ��ü�� ������ �÷���Ʈ�� �׸��� �ִ� ��Ʈ��ü�� ��ȯ
		var chart = new google.visualization.ColumnChart(objDiv);
		// ��Ʈ��ü�� ���������̺�� �ɼ� ��ü�� ���ڷ� �����Ͽ� ��Ʈ �׸��� �޼ҵ�
		chart.draw(dataTable, options);
	} // drawColumnChart1()�� ��
	// ��ư ����
</script>
</head>
<body onload="columnChart1()">
	<div id="column_chart_div1" style="width: 900px; height: 500px;"></div>
</body>
</html>