<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="./include/header.jsp" />
<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getServletContext().getContextPath()%>/bootstrap/js/jquery-2.2.3.min.js"></script>
<link rel="stylesheet" href="/fooding/bootstrap/css/bootstrap.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="/fooding/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" ></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
   <div class="row">
      <h1 align="center">My Wish List</h1>
   </div>
   <br />
   <br />
   <div class="container" style="height: 730px">
      <table class="table table-hover">
         <tr align="center">
            <th width="50%">번호</th>
            <th width="50%">가게명</th>
 
         </tr>
         <!-- ${fn:length(foodstore)} -->
         <c:if test="${fn:length(foodstore)-1 > 0}">
	         <c:forEach begin="0" end="${fn:length(foodstore)-1}" step="1" var="i" >
	         
				<tr onclick="location.href='food?cmd=board_content&foodNumber=${foodstore[i].foodNumber}'" style="cursor: pointer">					
							<td width="50%">${foodstore[i].wishNumber}</td>
							<td width="50%">${foodstore[i].wishName}</td>
										
				</tr>
	</c:forEach>
</c:if>
		</table>
   </div>



   <div align="center">
      <nav>
         <ul class="pagination">
            <li><a href="#" aria-label="Previous"> <span
                  aria-hidden="true">&laquo;</span>
            </a></li>
            <li><a href="#">1</a></li>

            <li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
            </a></li>
         </ul>
      </nav>


   </div>


</div>

<script src="./bootstrap/js/bootstrap.min.js"></script>
</body></html>