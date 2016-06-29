<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getServletContext().getContextPath()%>/bootstrap/js/jquery-2.2.3.min.js"></script>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
function fnError(mag) {
   alert(mag);
}
</script>


<style>	
.div1 {
   width: 100%;
   height: 100%;
   
   background-repeat: no-repeat;
   background-image: url('image/food5.jpg');
}
</style>
<!-- 아래는 로그인 위에 헤더 변환 코드 -->
<c:choose>
	<c:when test="${(emaillogin.userId)==null}">
		<jsp:include page="./include/modal.jsp" />
	</c:when>

	<c:otherwise>
		<jsp:include page="./include/header.jsp" />
	</c:otherwise>
</c:choose>

<!--  -->


<div class="div1">
	<div class="col-md-6" style="margin-left: 25%; margin-top: 25%;">
		<form method="post" action="food" class="form-inline">
			<input type="hidden" name="cmd" value="search">
				<div class="col-md-12 form-group">
					<select class="form-control input-lg" name="searchType">
  						<option>지역명</option>
 						 <option>매장명</option>
  
					</select>
					<input type="text" class="form-control input-lg" role="search" placeholder="지역과 매장명을 입력하세요." name="foodShopName" size="60">
						<button type="submit" class="btn btn-default form-control btn-lg" style="height:45px"><span class="glyphicon glyphicon-search"></span></button>
				</div>
				
				

			
		</form>
	</div>
</div>


 <script src="./bootstrap/js/bootstrap.min.js"></script>
 
 </body>
</html>