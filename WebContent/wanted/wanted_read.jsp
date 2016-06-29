<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>

<link rel="stylesheet"
   href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.min.css">
   
   <script src="https://code.jquery.com/jquery-2.2.4.min.js" ></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function deletewanted(){	
			alert("삭제되었습니다.")		
};

</script>

   
   <div class="container">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-condensed">
				<thead>
					<tr align="center">
						<th width="10%">제목</th>
						<th width="60%">${dto.wantedTitle}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성일</td>
						<td>${dto.wantedTime}</td>
					</tr>
					<tr>
						<td>글쓴이</td>
						<td>${dto.userId} <span style='float: right'>조회 : ${dto.wantedHit}</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p>내용 </p>
						${dto.wantedContent}
						</td>
					</tr>
	
				</tbody>
			</table>
			<table id="commentTable" class="table table-condensed"></table>
			
			<table class="table table-condensed">
				<thead>
					<tr>
						<td><span style='float: right'>
								<a href="wanted?cmd=wanted" id="list" class="btn btn-default">목록</a>
								<a href="wanted?cmd=wantededitview&wantedNumber=${dto.wantedNumber}"  id="modify" class="btn btn-default">수정</a>
								<a href="wanted?cmd=wanteddel&wantedNumber=${dto.wantedNumber}" id="delete" class="btn btn-default" onclick="deletewanted()">삭제</a>															
								<a href="wanted?cmd=wantedinsertview&re=${dto.wantedNumber}" id="reply" class="btn btn-default">답글</a>
						</span></td>
					</tr>
				</thead>
			</table>
		</div>
		

		
	</div>
</div>

</body>
</html>