<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>


<script>
$(function() {
	var birth = $("#birth").val();
	
	var year = birth.substring(0,4);
	var month = Number(birth.substring(5,7));
	var day = Number(birth.substring(8,10));
	
	$("#year").val(year).attr("selected", "selected");
	$("#month").val(month).attr("selected", "selected");
	$("#day").val(day).attr("selected", "selected");

	var tel = $("#tel").val().substring(0,3);
	$("#tel1").val(tel).attr("selected", "selected");
});
</script>
<!--내 정보보기 타이틀 -->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="navbar navbar-fixed" align="center" style="margin-bottom: 50px">		
					<h2>내정보 보기</h2>
			</div>
		</div>
	</div>
<input type="hidden" id="birth" value="${dto.userBirthDaty}">
<input type="hidden" id="tel" value="${dto.userPhoneNumber}">
	<!-- 아래는 계정관리 -->
	<div class="row">
		<div class="row">
		<div class="col-md-12">
			<form method="post" action="login?cmd=edituser" id="top">
				<table class="table">
					<tr>
						<th>아이디</th>
						<td>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="userid" value="${dto.userId}" readonly="readonly">
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<div class="col-sm-3">
								<input type="password" name="userpassword" class="form-control" >
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<div class="col-sm-3">
								<input type="password" class="form-control" >
							</div>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<div class="form-group">
								<div class="col-sm-5">
									<input type="text" class="form-control" name="username" value="${dto.userName}">
								</div>								
							</div>
						</td>

					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<div class="form-group">
								<div class="col-sm-2">
									<select class="form-control" name="year" id="year">
										<c:forEach begin="1900" end="2016" step="1" var="i">
											<option value="${1900+2016-i}">${1900+2016-i}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-2">
									<select class="form-control" name="month" id="month">
										<c:forEach begin="1" end="12" step="1" var="i">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-2">
									<select class="form-control" name="day" id="day">
										<c:forEach begin="1" end="31" step="1" var="i">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</td>

					</tr>
					<tr>
						<th width="20%">주소</th>
						<td>
							<div>
								<div class="col-md-8">
									<input type="text" id="address" name="useraddr" value="${dto.userAddr}" class="form-control" onfocus="sample5_execDaumPostcode()">
								</div> 
											
							</div> 
						</td>
					</tr>
					
					<tr>
						<th>휴대폰 번호</th>
						<td>
							<div class="form-group">
								<c:set var="tel">${dto.userPhoneNumber}</c:set>
								<div class="col-sm-2">
									<select class="form-control " name="tel1" id="tel1" >
										<option value="010">010</option>
										<option value="070">070</option>
										<option value="080">080</option>
										<option value="060">060</option>
									</select>
								</div>
								<div class="col-sm-2">
									<input type="text" class="form-control " name="tel2" value="${fn:substring(tel, 3, 7)}">
								</div>
								<div class="col-sm-2">
									<input type="text" class="form-control" name="tel3" value="${fn:substring(tel, 7, 11)}">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>이메일 주소</th>
						<td>
							<div class="col-sm-2">
								<input type="email" class="form-control " name="useremail" value="${dto.userEmail}">
							</div>
								

						</td>
					</tr>
					
					
					<tr>
						<td colspan="2">
							<div class="form-group">
								<div class="col-sm-3 col-md-offset-3">
									<input type="submit" class="form-control" value="등록">
								</div>
								<div class="col-sm-3">
									<input type="button" class="form-control" value="취소">
								</div>
							</div>
						</td>
					</tr>
				</table>
			</form>
	</div>

</div>

 <script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
