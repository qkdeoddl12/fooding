<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
#content_table th tr td {
 height : 50px; 
 vertical-align:middle
}


</style>

<!--내 정보보기 타이틀 -->
<div class="container">
	<div class="row">
		<div class="col-md-8" style="margin: 40px">

			<h2>회원정보 확인</h2>

		</div>
	</div>


	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<form action="<%=request.getServletContext().getContextPath()%>/login?cmd=check_password" method="post">
				<table class="table" id="content_table">
					<tr>
						<th>아이디</th>
						<td>${sessionScope.userId}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="password" name="password"
							class="form-control" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="form-group">
								<div class="col-sm-3 col-md-offset-3">
									<input type="submit" class="form-control" value="확인">
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

</div>

<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
