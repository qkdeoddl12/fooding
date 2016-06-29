<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>

<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.min.css">
<script src="/fooding/bootstrap/js/jquery-2.2.3.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="container">
   <div class="row">
      <h1 align="center">요청 게시판</h1>
   </div>
   <br/><br/>
   전체글 수 : ${totalRecord}
   test : ${nowPage}
   <font color=red> ${nowPage} / ${totalPage} Pages </font>
   <div class="row" style="height:730px">
      <table class="table table-hover">
      <tr align="center">
      <th width="10%" >번호</th>
      <th width="50%" style="text-align:center">제목</th>
      <th width="10%" >작성자</th>
      <th width="20%" >등록일</th>  
      </tr>
      
      <c:if test="${totalRecord eq 0}">
        <tr>
         <td>데이터 없음</tr>
   		<tr> 
      </c:if>
      <c:if test="${totalRecord > 0}">
	      <c:forEach begin="${ beginPerPage}" end="10" step="1" var="i" >
	      	<c:if test="${totalRecord eq i}"><c:set var="i" value="${numPerpage+beginPerPage+1}"/></c:if>
	      <tr onclick="location.href='wanted?cmd=wantedread&wantedNumber=${wanted[i].wantedNumber}'" style="cursor:pointer">     
	      
	      <td width="10%">${wanted[i].wantedNumber}</td>
	      <td width="50%">
	      	<c:if test="${wanted[i].wantedGroupDepth eq 1}">
	      		&nbsp;&nbsp;&nbsp;└
	      	</c:if>
	      	${wanted[i].wantedTitle}
	      </td>
	      <td width="20%" >${wanted[i].userId}</td>
	      <td width="20%">${wanted[i].wantedTime}</td>
	           
	      </tr>   
	      </c:forEach>
      </c:if>
      </table>
      
   </div>
   
    <a href="wanted?cmd=wantedinsertview">
   <button type="submit" class="btn btn-default" >글쓰기</button>
   </a>
  <!-- 아래 네비게이터 --> 
    <div align="center">
   <nav>
  <ul class="pagination">
    <li>
    <c:if test="${nowBlock>0 }">
      <a href="/fooding/wanted?cmd=wanted&nowBlock=${nowBlock-1}&nowPage=${(nowBlock-1)*pagePerBlock}" aria-label="Previous"><span aria-hidden="true">&laquo;</span>
      </a>
    </c:if>
    </li>
    <c:forEach begin="0" end="5" step="1" var="i">
    	<c:if test="${i+(noewBlock*pagePerBlock) eq totalPage}"><c:set var="i" value="${numPerpage+beginPerPage+1}"/></c:if>
    <li><a href="/fooding/wanted?cmd=wanted&nowPage=${(nowBlock*pagePerBlock)+i}&nowBlock=${nowBlock}${ i+1+(nowBlock*pagePerBlock)}">${i+1}</a></li>
    </c:forEach>
        
   
    <li>
   <c:if test="${totalBlock>nowBlock+1}">
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
      </c:if>
    </li>
  </ul>
</nav>
   </div>

   
   </div>
   <script src="/fooding/bootstrap/js/bootstrap.min.js"></script>
   
</body>
</html>