<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet"
   href="/fooding/bootstrap/css/bootstrap.min.css">

<script src="/fooding/bootstrap/js/jquery-2.2.3.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/fooding/bootstrap/css/bootstrap.min.css">

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>fooding</title>
</head>

<style>
#content_table tr td {
 width : 50%;
 height : 70px;
 vertical-align:middle
}
#button{
width : 50%;
vertical-align: middle;
}

</style>


<body>


<div class="container" align="center">
   <div class="row">
      <div class="col-md-10">
         <div class="navbar navbar-fixed" align="center"
            style="margin-bottom: 50px">
            <h3>아이디 찾기</h3>
         </div>
      </div>
   </div>

   <div class="row" >
   <form method="post" action="search?cmd=searchid"  >

      <input type="hidden" value="idsearch" name="cmd"  />
      <table class="table" id="content_table">
               <tr>
                  <th>이름</th>
                  <td>
                     <div class="form-group">
                        <div class="col-sm-3">
                           <input type="text" class="form-control" name="username2" id="username2">
                        </div>                        
                     </div>
                  </td>

               </tr>
               <tr>
                  <th>생년월일</th>
                  <td>
                     <div class="form-group">
                        <div class="col-sm-2">
                           <select class="form-control" name="year">
                              <c:forEach begin="1900" end="2016" step="1" var="i">
                                 <option>${1900+2016-i}</option>
                              </c:forEach>
                           </select>
                        </div>
                        <div class="col-sm-2">
                           <select class="form-control" name="month">
                              <c:forEach begin="1" end="12" step="1" var="i">
                                 <option>${i}</option>
                              </c:forEach>
                           </select>
                        </div>
                        <div class="col-sm-2">
                           <select class="form-control" name="day">
                              <c:forEach begin="1" end="31" step="1" var="i">
                                 <option>${i}</option>
                              </c:forEach>
                           </select>
                        </div>
                     </div>
                  </td>

               </tr>
               
                         <tr>
                  <th>휴대폰 번호</th>
                  <td>
                     <div class="form-group">
                        <div class="col-sm-2">
                           <select class="form-control " name="tel1" >
                              <option>010</option>
                              <option>070</option>
                              <option>02</option>
                              <option>080</option>
                              <option>060</option>
                           </select>
                        </div>
                        <div class="col-sm-2">
                           <input type="text" class="form-control " name="tel2">
                        </div>
                        <div class="col-sm-2">
                           <input type="text" class="form-control" name="tel3">
                        </div>
                     </div>
                  </td>
               </tr>

   
               <tr>
                  <td colspan="2">
                     <div class="form-group">
                        <div class="col-sm-3 col-md-offset-3">
                           <input type="submit" class="form-control" value="아이디찾기">
                        </div>
                        <div class="col-sm-3">
                           <input type="button" class="form-control" value="취소" onclick="location.href=history.back()">
                        </div>
                     </div>
                  </td>
               </tr>
      </table>
      
      <c:choose>
         <c:when test="${(idsearch[0].userId)!=null}" >
         <div>아이디는 : ${idsearch[0].userId} 입니다 !</div>
      
   </c:when>
   <c:otherwise>
      <div>아이디를 찾을 수 없습니다.</div>
   </c:otherwise>
   
   </c:choose>
   
   </div>
   </div>
   

   
   <div class="container" align="center">
   <div class="row ">
      <div class="col-md-10">
         <div class="navbar navbar-fixed" align="center"
            style="margin-bottom: 50px">
            <h3>비밀번호찾기</h3>
         </div>
      </div>
   </div>

   <div class="row" >
   <form method="post" action="search?cmd=searchpassword"  >

      <input type="hidden" value="passsearch" name="cmd"  />
      <table class="table" id="content_table">

         <tr>
                  <th>아이디</th>
                  <td>
                     <div class="col-sm-5">
                        <input type="text" class="form-control" name="userid" id="userid">
                     </div>   
         
                     <div class="col-sm-3" id="checkspan">
                        
                     </div>
                  </td>
               </tr>

               <tr>
                  <th>이름</th>
                  <td>
                     <div class="form-group">
                        <div class="col-sm-5">
                           <input type="text" class="form-control" name="username1" id="username1">
                        </div>                        
                     </div>
                  </td>

               </tr>
               <tr>
                  <th>생년월일</th>
                  <td>
                     <div class="form-group">
                        <div class="col-sm-2">
                           <select class="form-control" name="year1">
                              <c:forEach begin="1900" end="2016" step="1" var="i">
                                 <option>${1900+2016-i}</option>
                              </c:forEach>
                           </select>
                        </div>
                        <div class="col-sm-2">
                           <select class="form-control" name="month1">
                              <c:forEach begin="1" end="12" step="1" var="i">
                                 <option>${i}</option>
                              </c:forEach>
                           </select>
                        </div>
                        <div class="col-sm-2">
                           <select class="form-control" name="day1">
                              <c:forEach begin="1" end="31" step="1" var="i">
                                 <option>${i}</option>
                              </c:forEach>
                           </select>
                        </div>
                     </div>
                  </td>

               </tr>
                        

                  
               <tr>
                  <td colspan="2">
                     <div class="form-group">
                        <div class="col-sm-3 col-md-offset-3">
                           <input type="submit" class="form-control" value="비밀번호찾기">
                        </div>
                        <div class="col-sm-3">
                           <input type="button" class="form-control" value="취소" onclick="location.href=history.back()">
                        </div>
                     </div>
                  </td>
               </tr>
      </table>
            <c:choose>
         <c:when test="${(passsearch[0].userPassword)!=null}" >
         <div>비밀번호는 : ${passsearch[0].userPassword} 입니다 !</div>
      
   </c:when>
   <c:otherwise>
      <div>비밀번호를 찾을 수 없습니다.</div>
   </c:otherwise>
   
   </c:choose>
      
      
      
   </div>
   
   

</div>

<script src="/fooding/bootstrap/js/bootstrap.min.js"></script>





</body>
</html>