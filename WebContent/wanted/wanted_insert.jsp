<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>

<link rel="stylesheet" href="/fooding/bootstrap/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js" ></script>

<script src="/fooding/bootstrap/js/jquery-2.2.3.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
   <div class="container">
	<div class="row ">
	<form method="post" action="<%=request.getServletContext().getContextPath()%>/wanted?cmd=wantedinsert">
	
		<input type="hidden" name="re" value="${re}">
		<!-- Form Name -->
		<legend align="center">요청하기</legend>

		<!-- Text input-->
		<div class="col-md-12">
		
			<div class="form-group">
				<label class="col-md-2 control-label" for="textinput" align="right">제목</label>
				<div class="col-md-8"> 
					<input id="title" name="title" type="text"
						placeholder="제목을 입력해주세요" class="form-control input-md">
						
						
				</div>
			</div>		
			<br/>
			<div class="form-group">
				<label class="col-md-2 control-label" for="textinput" align="right">아이디</label>
				<div class="col-md-2">
					<input id="textinput" name="textinput" type="text"
						 class="form-control input-md" value="${emaillogin.userId}" />
					<div class="col-md-2"></div>
				</div>

			</div>
			<br />
			<br />
			
			
			<!-- Textarea -->
			<div class="form-group">
			<label class="col-md-2 control-label" for="textinput" align="right">내용</label>
			<div class="col-md-9">

				<textarea class="form-control" rows="20" id="content"
					name="content" placeholder="내용을 입력해주세요"></textarea>
				<br />
			</div>
			</div>
			
			<br />
			<br />
			<!-- File Button -->
	

			<div class="col-md-12" align="center">
		<button type="submit" id="confirm" class="btn btn-default" onclick="<%=request.getServletContext().getContextPath()%>/wanted?cmd=wantedinsert&wantedinsert=${emaillogin.userId}">요청</button>
		<button type="reset" id="cancel" class="btn btn-default" onclick="location.href='wanted?cmd=wanted'">취소</button>
			</div>

		</div>
		<!-- col-md-12 -->
	</div>
	</form>
	<!-- row -->
</div>
<!-- container -->

   <script src="/fooding/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>