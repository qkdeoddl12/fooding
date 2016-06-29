<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet"
   href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.min.css">

<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">

<script>
$(document).ready(function(){
$("#dupliBtn").click(function(){
   $.ajax({
      type : "POST",         
      url : "<%=request.getServletContext().getContextPath()%>/duplicate",
      data : {"id" : $("#userid").val()},
      success : function(data){
         if(data == "가능")
            $("#checkspan").text("사용가능");
         else
            $("#checkspan").text("사용불가능");
      }         
   });
});
});
</script>
<script>
$(document).ready(function(){
   $( "input[name='userpasswordcheck']" ).focusout(function(){
      if($( "input[name='userpassword']" ).val() != $( "input[name='userpasswordcheck']" ).val()){         
         $("#checkpassspan").text("불일치");         
      }else{
         $("#checkpassspan").text("일치");         
      }
   });


   
   
   $("#submitBtn").click(function(){
      alert($("#checkpassspan").text());
      alert($("#checkspan").text());
      
      if($("#checkpassspan").text() == "불일치" || $("#checkspan").text()=="사용불가능" || $("#checkspan").text()=="" ){
         alert("모든 항목을 확인해주세요");
         return false;
      }
         
      var array = [];
      array.push($( "input[name='userid']" ).val());
      array.push($( "input[name='userpassword']" ).val());
      array.push($( "input[name='userpasswordcheck']" ).val());
      array.push($( "input[name='username']" ).val());
      array.push($( "input[name='month']" ).val());
      array.push($( "input[name='day']" ).val());
      array.push($( "input[name='useraddr']" ).val());
      array.push($( "input[name='tel2']" ).val());
      array.push($( "input[name='tel3']" ).val());
      array.push($( "input[name='useremail']" ).val());
      
      for(var i=0; i<array.length; i++){
         if(array[i] == ""){
            alert("모든 항목을 입력해주세요");
            return false;
         }
      }      
      $( "#top" ).submit();
   });
});
</script>
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

<div class="container" align="center">
   <div class="row">
      <div class="col-md-10">
         <div class="navbar navbar-fixed" align="center"
            style="margin-bottom: 50px">
            <h3>회원가입</h3>
         </div>
      </div>
   </div>

   <div class="row" >
   <form method="post" action="<%=request.getServletContext().getContextPath()%>/login"  id="top">

      <input type="hidden" value="register" name="cmd"  />
      <table class="table" id="content_table">

         <tr>
                  <th>아이디</th>
                  <td>
                     <div class="col-sm-5">
                        <input type="text" class="form-control" name="userid" id="userid">
                     </div>   
                     <div class="col-sm-3">
                        <input type="button" id="dupliBtn" value="중복검사"> 
                     </div>
                     <div class="col-sm-3" id="checkspan">
                        
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td>
                     <div class="col-sm-5">
                        <input type="password" name="userpassword" class="form-control" >
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>비밀번호 확인</th>
                  <td>
                     <div class="col-sm-5">
                        <input type="password" name="userpasswordcheck" class="form-control" >
                     </div>
                     <div class="col-sm-3" id="checkpassspan">
                        
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td>
                     <div class="form-group">
                        <div class="col-sm-5">
                           <input type="text" class="form-control" name="username">
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
                  <th width="20%">주소</th>
                  <td>
                     <div>
                        <div class="col-md-8">
                           <input type="text" id="address" name="useraddr" class="form-control">
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
                  <th>이메일 주소</th>
                  <td>
                     <div class="col-sm-5">
                        <input type="email" class="form-control " name="useremail">
                     </div>
                        

                  </td>
               </tr>
               
               
               <tr>
                  <td colspan="2">
                     <div class="form-group">
                        <div class="col-sm-3 col-md-offset-3">
                           <input type="button" class="form-control" value="가입하기" id="submitBtn">
                        </div>
                        <div class="col-sm-3">
                           <input type="button" class="form-control" value="취소" onclick="location.href=history.back()">
                        </div>
                     </div>
                  </td>
               </tr>
      </table>
      </form>
   </div>
</div>

<script src="../bootstrap/js/bootstrap.min.js"></script>
</body></html>

