<%@page import="model.food.BoardCommand"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
 
<script src="holder.js"></script>
 <script src="jquery.raty.js"></script>
<link rel="stylesheet" href="jquery.raty.css">
    <script type="text/javascript">
 
	$(document).ready(function() {
		$("#photos input").click(function() {
 
			$(this).attr("src",$(this).attr("src2"));
		});
	});
	
	$(function() {
		$("#photo input").click(function() {
 
			alert("로그인을 해주세요");
		});
	});
	
		$(function() {
			var info=$(this).find("span#displayStarRating").text();			
			
			$('div#star').raty({
				readOnly: true
				, score: $(this).find("span#displayStarRating").text()
				,path : "images"
				,width : 200
				});
		});
	</script>
    
<style>
	.labelFont{
		font-size: 17px;	
	}
 
</style>
<jsp:include page="include/header.jsp"/>
 
 
<div class="col-md-8 col-sm-8" style="background-color: #ffffff">
		
			<label class="control-label labelFont" style="margin-right: 30px;">시간</label>
			<label class="checkbox-inline labelFont" class="labelFont"><input type="checkbox"/>점심</label>
			<label class="checkbox-inline labelFont" class="labelFont"><input type="checkbox"/>저녁</label>
			<br>
			<label class="control-label labelFont" style="margin-right: 30px; margin-top: 10px;" class="labelFont">음식</label>
			<label class="checkbox-inline labelFont" ><input type="checkbox"/>한식</label>
			<label class="checkbox-inline labelFont" ><input type="checkbox"/>양식</label>
			<label class="checkbox-inline labelFont" ><input type="checkbox"/>중식</label>
			<label class="checkbox-inline labelFont" ><input type="checkbox"/>카페/베이커리</label>
			
			<br>
			<label class="control-label labelFont" style="margin-right: 30px; margin-top: 10px;">가격</label>
			<div id="slider-range"></div><br/>
			<p>
  				<label for="amount" class="labelFont">가격 범위:</label>
  				<input type="text" id="amount" readonly style="background-color: #ffffff; border:0; color:#f6931f; font-weight:bold;">
			</p>
			<div style="padding-top:20px;">
			
			</div>
 
	
			
			
			
	<h2>경로 : <%=request.getServletContext().getContextPath()%>/${Boardlist[i].foodImg }</h2>
		
	<div class="container" style="padding-top: 2%;padding-left: 1%">
	<div class="row">
	
	<!-- -------------------------------------------------------------- -->
	<c:if test="${fn:length(Boardlist)-1>= 0}">
	<c:forEach begin="0" end="${fn:length(Boardlist)-1}" step="1" var="i">
		  <div class="col-xs-6 col-md-4">
		   	<div class="thumbnail" > <!-- front?cmd=board -->
		   	<a href="front?cmd=board_content&foodNumber=${Boardlist[i].foodNumber}"><img src="<%=request.getServletContext().getContextPath()%>/upload/${Boardlist[i].foodImg }"></a>
		   		<div style="margin-left: 3%"><h3 for="displayStarRating">${Boardlist[i].foodStoreName}</h3></div>
	      		<div class="caption">
	      			<div id="star"></div>
	    		<div style="padding-top:2%;">
					<label for="displayStarRating">평점 : </label><span id="displayStarRating" style="padding-left:20px;">${Boardlist[i].foodStar}</span>
 
	<!-- 아이디 값이 없을 경우, 로그인 요청팝업창 노출 /
		있을 경우 하트색이 바뀌고 커멘드 처리함
	 -->
									<c:choose>
										<c:when test="${(emaillogin.userId)!=null}">
											<form id="photos" method="post" action="front?cmd=wish">
												<input type="image" src="image/heart.jpg"
													src2="image/heartcheck.jpg"
													style="width: 40px; height: 40px" class="pull-right" />
											</form>
 
										</c:when>
										<c:otherwise>
										<div id="photo">
											<input type="image" src="image/heart.jpg"
												style="width: 40px; height: 40px" class="pull-right"  />
												</div>
										</c:otherwise>
									</c:choose>
<!--  -->
 
								</div>
	        		<b>예산  ${Boardlist[i].foodMenuPrice}원 (2인 기준)<b>
	        		<p style="color: #BDBDBD">${Boardlist[i].foodContent}</p>
	        	<a href="booking.jsp" class="btn btn-default" data-toggle="modal" data-target="#booking">예약하기</a> 
	        		<div class="modal fade" id="booking">
					<div class="modal-dialog">
						<div class="modal-content"></div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>   	
	        	<a href="#" class="btn btn-default pull-right" role="button">리뷰쓰기</a>
	      		</div>
	      		
	    	</div>
		  </div>
		  
	</c:forEach>
	</c:if>
	<!-- -------------------------------------------------------------- -->
	  
	 
	  
	 
	  
	</div>
</div>
 
 
			
</div>
 
 
 
<!-- 지도 -->
<div class="col-md-4 col-sm-4">
   <script>
  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 100000,
      values: [ 20000, 70000 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.values[ 0 ] + "원 - " + ui.values[ 1 ]+"원" );
      }
    });
    $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      "원 - " + $( "#slider-range" ).slider( "values", 1 )+"원" );
  });
  </script>
  
   <style type="text/css">
      html, body { height: 100%; margin: 0; padding: 0; }
      #map { height: 100%; }
    </style>
 
    <div id="map"></div>
    <script type="text/javascript">
 
	var map;
		function initMap() {
		  map = new google.maps.Map(document.getElementById('map'), {
		    center: {lat: -34.397, lng: 150.644},
		    zoom: 8
		  });
		}
 
    </script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwy2nK2rCPqOk8MtwdVEP3mORY650AbVg&callback=initMap">
    </script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    
</div>
</body>
</html>