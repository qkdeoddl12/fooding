<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>���� �����ϱ�</title>
    
</head>
<body>
<!-- ������ ǥ���� div �Դϴ� -->
<div id="map" style="width:100%;height:350px;"></div>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=7023fcca7867fe0886fa724a14a3ef07"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
var map = new daum.maps.Map(mapContainer, mapOption); 
</script>

</body>
</html>