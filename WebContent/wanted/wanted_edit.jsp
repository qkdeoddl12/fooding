<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>

<link rel="stylesheet"
   href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.min.css">
   
   <div class="container">
	<div class="row ">
	<form action="wanted?cmd=wantededit" method="post">
		<input type="hidden" value="${dto.wantedNumber}" name="wantedNumber">
		<!-- Form Name -->
		<legend align="center">요청하기</legend>

		<!-- Text input-->
		<div class="col-md-12">
		
			<div class="form-group">
				<label class="col-md-2 control-label" for="textinput" align="right">제목</label>
				<div class="col-md-8"> 
					<input id="textinput" name="title" type="text"
						value="${dto.wantedTitle}" class="form-control input-md">
						
						
				</div>
			</div>		
			<br />
			
			
			<!-- Textarea -->
			<div class="form-group">
			<label class="col-md-2 control-label" for="textinput" align="right">내용</label>
			<div class="col-md-9">

				<textarea class="form-control" rows="20" id="textarea"
					name="content" >${dto.wantedContent}</textarea>
				<br />
			</div>
			</div>
			
			<br />
			<br />
			<!-- File Button -->
			<div class="form-group">

				<label class="col-md-2 control-label" for="filebutton" align="right">첨부파일</label>
				<div class="col-md-4">
					<input id="filebutton" name="filebutton" class="input-file"
						type="file">
				</div>
			</div>

			<div class="col-md-12" align="center">			
				<button type="submit" id="confirm" class="btn btn-default" >요청</button>		
				<button type="button" id="cancel" class="btn btn-default" onclick="location.href='wanted?cmd=wanted'">취소</button>
			</div>
		</div>
		</form>
		<!-- col-md-12 -->
	</div>
	<!-- row -->
</div>
<!-- container -->

</body>
</html>