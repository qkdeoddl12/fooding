<%@page import="model.food.BoardCommand"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Fooding</title>
<link rel="shortcut icon" type="image/x-icon" href="/fooding/image/fav.ico" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/fooding/bootstrap/css/bootstrap.css">
<script src="/fooding/bootstrap/js/bootstrap.min.js"></script>
<script src="/fooding/bootstrap/js/jquery-2.2.3.min.js"></script>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" ></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default" style="background-color: #f70e2f">
  <div class="container-fluid">
      <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="nav" href="<%=request.getServletContext().getContextPath()%>/index.jsp"><img src="<%=request.getServletContext().getContextPath()%>/image/logo.jpg" style="padding-top: 7%"></a>
    </div>

  <ul class="nav navbar-nav navbar-right">
   <li><a href="/fooding/login/register.jsp"><font color="white">
        <strong>회원가입</strong></font></a></li>
  </ul>
      
      <ul class="nav navbar-nav navbar-right">
             <li><a href="./login/login.jsp" data-toggle="modal" data-target="#login"><font color="white">
        <strong>로그인</font></a></li>
        
         <div class="modal fade" id="login">
            <div class="modal-dialog">
               <div class="modal-content"></div>
               <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
         </div>
</ul>
  


  </div><!-- /.container-fluid -->
</nav>

   