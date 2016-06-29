<%@page import="java.security.AlgorithmConstraints"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Fooding</title>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getServletContext().getContextPath()%>/image/fav.ico" />

<!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/fooding/bootstrap/css/bootstrap.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="<%=request.getServletContext().getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" ></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="./bootstrap/js/jquery-2.2.3.min.js"></script>
<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


 <script src="jquery.raty.js"></script>

<script>
function deleteLogin(){	
	$.ajax({
		type : "POST",			
		url : "<%=request.getServletContext().getContextPath()%>/login?cmd=deletelogin" ,
		success :			
			alert("로그아웃 되었습니다.")		
	});
};

function WishMain(){	
	$.ajax({
		type : "POST",			
		url : "<%=request.getServletContext().getContextPath()%>/wishmain?cmd=wishmain" 
		
	});
};
</script>

<style>
	.top1{
		background-color: #f70e2f;
	}
</style>
</head>
<body>

<nav class="navbar navbar-default" style="background-color: #f70e2f">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="nav" href="<%=request.getServletContext().getContextPath()%>/index.jsp"><img src="<%=request.getServletContext().getContextPath()%>/image/logo.jpg" style="padding-top: 7%"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
   
      </ul>
      <form class="navbar-form navbar-left" method="post" action="food">
      <input type="hidden" name="cmd" value="search"/>
        <div class="form-group">
        <select class="form-control" name="searchType" id="searchType">
  			<option>지역명</option>
  			<option>매장명</option>
		</select>
          <input type="text" class="form-control" placeholder="매장명이나 지역을 입력해주세요" size="70" name="foodShopName" id="searchtext">
         <%-- <c:set var="search" value="${foodShopName }" scope="request"/>
         <jsp:forward page="../Board.jsp"/> --%>
						<button type="submit" class="btn btn-default form-control btn-lg"><span class="glyphicon glyphicon-search"></span></button>
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
      	<c:if test="${sessionScope.userAuthority == 2}">
      		<li><a href="<%=request.getServletContext().getContextPath()%>/write.jsp"><font color="white"><strong>글쓰기</strong></font></a></li>
      	</c:if>
        <li><a href="<%=request.getServletContext().getContextPath()%>/review?cmd=review"><font color="white"><strong>리뷰</strong></font></a></li>

					<div class="modal fade" id="login">
						<div class="modal-dialog">
							<div class="modal-content"></div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
	
					<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="test"><strong>${emaillogin.userId}</strong></font> <span class="caret"></span></a>
          <ul class="dropdown-menu">
							<li><a
								href="<%=request.getServletContext().getContextPath()%>/mypage/mypage_check.jsp">내
									정보보기</a></li>
							<li><a
								href="/fooding/review?cmd=myreview">내
									리뷰보기</a></li>
							<li role="separator" class="divider"></li>

			<!-- 아이디 값이 없을 경우, 로그인 요청팝업창 노출 /	 -->							
							<c:if test="${(emaillogin.userId)!=null}">
										<li>
										<a href="/fooding/wishmain?cmd=wishmain">위시리스트</a>
										</li>
										<li role="separator" class="divider"></li>	
										 <li><a href="food?cmd=mybookmark&user=${sessionScope.userNumber}">나의 예약 정보</a></li>
							            
							            <c:if test="${sessionScope.userAuthority == 1}">
							            <li role="separator" class="divider"></li>
							            <li><a href="food?cmd=bookmark">예약 정보</a></li>
							            </c:if>
							            <li role="separator" class="divider"></li>								
									</c:if>

							<!--  -->
			<li><a href="/fooding/wanted?cmd=wanted">요청하기</a></li>
							<li role="separator" class="divider"></li>

							<c:choose>
								<c:when test="${(emaillogin.userId)!=null}">
									<li><a href="<%=request.getServletContext().getContextPath()%>/index.jsp" onclick="deleteLogin()"  >로그아웃</a></li>
									<li role="separator" class="divider"></li>
						
								</c:when>
								<c:otherwise>

									<li><a href="/fooding/login/login.jsp" data-toggle="modal"
										data-target="#login">로그인</a></li>

									<li role="separator" class="divider"></li>
								</c:otherwise>
							</c:choose>

						</ul>
					</li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>



