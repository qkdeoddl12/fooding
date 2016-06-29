<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="model.food.BoardCommand"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<jsp:include page="./include/header.jsp"/>
<style>
body{
	background-color: white
}
</style>
<script>
function deleteBookmark(num){	
	$.ajax({
		type : "POST",			
		url : "food?cmd=deletebookmark&delnum=" + num,
		data : {"deletenum" : $("#delnum" + num).val()},
		success : function(){
			alert("예약취소 하시겠습니다?")
			$("#tr"+num).remove();
	
		}			
	});
	
};

function approveBookmark(num){	
	$.ajax({
		type : "POST",			
		url : "food?cmd=approve&delnum=" + num,
		data : {"deletenum" : $("#delnum" + num).val()},
		success : function(){			
			alert("예약승인을 하셧습니다");
			$("#success"+num).html("예약완료")
		}			
	});
	
};
</script>
<br><br>
	<div class="tabbable tabs-below">
		<div class="col-md-2">
		<br><br><br><br><br>
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a href="#tab1" data-toggle="tab"> 예약확인</a></li>
			</ul>
		</div>
		<div class="col-md-9">
			<div class="tabbable tabs-below">
				<div class="tab-content">
					<div class="tab-pane active" id="tab1">
						<h2 align="center" style="color: black">예약확인</h2>
						
						<table class="table">
							<tr>
								<th>예약된 매장명</th>
								<th>예약자 번호</th>
								<th>예약자명</th>
								<th>예약자 연락처</th>
								<th>예약 날짜 및 시간</th>
								<th>예약자 요청사항</th>
								<th>예약승인</th>
								<th>예약취소</th>
							</tr>
			
		<c:if test="${fn:length(Booklist)-1>=0}">				
		<c:forEach begin="0" end="${fn:length(Booklist)-1}" step="1" var="i">
			<tr id="tr${Booklist[i].bookingNum}">
				
				<td>${Booklist[i].foodStoreName}</td>
				<td id="delnum${i}" name="delnum">${Booklist[i].bookingNum}</td>
				<td>${Booklist[i].bookingName}</td>
				<td>${Booklist[i].bookingPhone}</td>
				<td>${Booklist[i].bookingTime}</td>
				<td>${Booklist[i].bookingDemand}</td>
				<c:if test="${Booklist[i].bookingApprove=='0' }">				
				<td><button id="success${Booklist[i].bookingNum}" onclick="approveBookmark(${Booklist[i].bookingNum})">예약승인</button></td>				
				</c:if>
				<c:if test="${Booklist[i].bookingApprove=='1' }">				
				<td><button id="success">승인완료</button></td>
				</c:if>							
				<td><button id="cancel" onclick="deleteBookmark(${Booklist[i].bookingNum})">예약취소</button></td>
			<th>  	  
		</c:forEach> 
		</c:if>
					</div>
					
				</div>
			</div>
		</div>
	</div>













</body>
</html>