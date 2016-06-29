<%@ page contentType="text/html; charset=utf-8"%>
<script type="text/javascript" src="jquery.simple-dtpicker.js"></script>
	<link type="text/css" href="jquery.simple-dtpicker.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>

  $(function(){
		$("#datepicker" ).appendDtpicker();
	});
  
  function Trim() {
		var str1 = $.trim($("#bookingName").val());
		var str2 = $.trim($("#bookingPhone").val());
		var str3 = $.trim($("#bookingGroup").val());
		var str4 = $.trim($("*[name='bookingTime']").val());
		var str5 = $.trim($("#bookingDemand").val());
		
		if(!str1&&!str2&&!str3&&!str5) {
			alert("빈칸이 있습니다 채워주세요");
			return false;
		}
	}
  
  </script>
  

<style>
label{font: 돋움; color: #A6A6A6;}
body{margin: 50px}
</style>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">x</span>
	</button>
	<h4 class="modal-title">예약하기</h4>
</div>

<div class="modal-body">
	<div class="row ">

		<form class="form-horizontal" method="post" action="food" onsubmit="return Trim()">
			<input type="hidden" name="cmd" value="booking">
			<input type="hidden" name="user" value="${param.user}">
			<input type="hidden" name="foodNumber" value="${param.foodNumber}">
			<input type="hidden" name="foodStoreName" value="${name.foodStoreName}">
			<div class="form-group ">
				<label for="inputEmail3" class="col-sm-3 control-label">예약할 매장</label>
				<div class="col-sm-5">
					<span name="foodStoreName">${name.foodStoreName}</span>
				</div>
			</div>
			
			<div class="form-group ">
				<label for="inputEmail3" class="col-sm-3 control-label">예약할 번호</label>
				<div class="col-sm-5">
					<span name="foodNumber">${param.foodNumber}</span>
				</div>
			</div>
			
			
			<div class="form-group ">
				<label for="inputEmail3" class="col-sm-3 control-label">예약자 이름</label>
				<div class="col-sm-5">
					<input type="text" class="form-control " placeholder="예약자 이름" name="bookingName" id="bookingName">
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-3 control-label">예약자 연락처</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="예약자 연락처" name="bookingPhone" id="bookingPhone">
				</div>
			</div>
			
				<div class="form-group">
				<label for="inputPassword3" class="col-sm-3 control-label">예약자 인원수</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="예약자 인원수" name="bookingGroup" id="bookingGroup">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-3 control-label">예약날짜 및 시간</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="예약날짜 및 시간" name="bookingTime" id="datepicker">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-3 control-label">요구사항</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="요구사항" name="bookingDemand" id="bookingDemand"/>
				</div>
			</div>

			<div class="col-sm-offset-3 col-sm-10">
			
				<button type="submit" class="btn btn-danger">예약하기</button>

			</div>
		</form>
	</div>
</div>

<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">예약취소</button>
</div>