<%@page import="model.food.BoardCommand"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Fooding</title>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getServletContext().getContextPath()%>/image/fav.ico" />
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified CSS -->
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
      url : "/fooding/login?cmd=deletelogin" ,
      success :         
         alert("로그아웃 되었습니다.")      
   });
};

function WishMain(){   
   $.ajax({
      type : "POST",         
      url : "wishmain?cmd=wishmain" 
      
   });
};


$(function(){
	// 로드될 때 
	var typelist0 = '${typelist[0]}';
	var typelist1 = '${typelist[1]}';
	var typelist2 = '${typelist[2]}';
	var typelist3 = '${typelist[3]}';	
	
	$("input:checkbox[name='foodtype'][value='" + typelist0 + "']").prop("checked", true);
	$("input:checkbox[name='foodtype'][value='" + typelist1 + "']").prop("checked", true);
	$("input:checkbox[name='foodtype'][value='" + typelist2 + "']").prop("checked", true);
	$("input:checkbox[name='foodtype'][value='" + typelist3 + "']").prop("checked", true);
	
	var time0 = '${time[0]}';
	var time1 = '${time[1]}';
	$("input:checkbox[name='foodtime'][value='" + time0 + "']").prop("checked", true);
	$("input:checkbox[name='foodtime'][value='" + time1 + "']").prop("checked", true);
	
	var searchText = '${searchtext}';
	$("#searchtext").val(searchText);
	
	var searchType = '${searchType}';
	var searchTypeKor;
	  if(searchType=="FoodStoreName"){
    	  searchTypeKor = "매장명";
      }else if(searchType=="FoodAddr"){
    	  searchTypeKor = "지역명";            	  
      }
	  
	$("#searchType option:selected").text(searchTypeKor);
	
	
	$("*[name='foodtype']").click(function(){
		$("#searchBtn").click();
	});
	$("*[name='foodtime']").click(function(){
		$("#searchBtn").click();
	});
	
	
	
});

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
          <input type="text" class="form-control" placeholder="매장명이나 지역을 입력해주세요" size="70" name="foodShopName" id="searchtext" value="${param.foodShopName}">
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
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="test"> <font color="white"><strong>${emaillogin.userId}</strong></font><span class="caret"></span></a>
          <ul class="dropdown-menu">
                     <li><a
                        href="<%=request.getServletContext().getContextPath()%>/mypage/mypage_check.jsp">내
                           정보보기</a></li>
                     <li><a
                        href="/fooding/review?cmd=myreview">내
                           리뷰보기</a></li>
                     <li role="separator" class="divider"></li>

         <!-- 아이디 값이 없을 경우, 로그인 요청팝업창 노출 /    -->                     
                     <c:if test="${(emaillogin.userId)!=null}">
                              <li>
                              <a href="/fooding/wishmain?cmd=wishmain">위시리스트</a>
                              </li>
                              <li role="separator" class="divider"></li>   
                               <li><a href="food?cmd=mybookmark&user=${sessionScope.userNumber}">나의 예약 정보</a></li>
                                  <c:if test="${sessionScope.userAuthority == 1}">
                                 <li role="separator" class="divider"></li>
                                 <li><a href="food?cmd=bookmark">예약 정보</a></li></c:if>
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

    
<style>
   .labelFont{
      font-size: 17px;   
   }

</style>
<div class="col-md-8 col-sm-8" style="background-color: #ffffff">
      <form method="post" action="food" id="filter">
         <input type="hidden" id="slider_start" name="slider_start" value="0">
         <input type="hidden" id="slider_end" name="slider_end" value="100000">
          <input type="hidden" id="searchtext_hidden" name="searchtext_hidden">
          <input type="hidden" id="searchType_hidden" name="searchType_hidden">
         
         <input type="hidden" name="cmd" value="searchboard"/>
         <label class="control-label labelFont" style="margin-right: 30px;">시간</label>
         <label class="checkbox-inline labelFont" class="labelFont"><input type="checkbox" name="foodtime" value="1"/>점심</label>
       <label class="checkbox-inline labelFont" class="labelFont"><input type="checkbox" name="foodtime" value="2"/>저녁</label>
         <br>
         <label class="control-label labelFont" style="margin-right: 30px; margin-top: 10px;" class="labelFont">음식</label>
         <label class="checkbox-inline labelFont" ><input type="checkbox" name="foodtype" value="한식"/>한식</label>
         <label class="checkbox-inline labelFont" ><input type="checkbox" name="foodtype" value="양식"/>양식</label>
         <label class="checkbox-inline labelFont" ><input type="checkbox" name="foodtype" value="중식"/>중식</label>
         <label class="checkbox-inline labelFont" ><input type="checkbox" name="foodtype" value="카페"/>카페/베이커리</label>
         
         <br>
         <label class="control-label labelFont" style="margin-right: 30px; margin-top: 10px;">가격</label>
         <div id="slider-range"></div><br/>
         <p>
              <label for="amount" class="labelFont">가격 범위:</label>
              <input type="text" id="amount" readonly style="background-color: #ffffff; border:0; color:#f6931f; font-weight:bold;">
         </p>
        <%--  <div style="padding-top:20px;">
                  ${param.foodShopName}
         
         </div> --%>
         <button type="button" id="searchBtn" name="searchBtn" hidden="hidden">검색하기</button>
         </form>

   
         
         
         
<%--    <h2>경로 : <%=request.getServletContext().getContextPath()%>/${Boardlist[i].foodImg }</h2>
 --%>      
   <div class="container-fluid" style="padding-top: 2%;padding-left: 1%">
   <div class="row">
<%-- <%--    ${fn:length(Boardlist)-1}
    <c:if test="${fn:length(Boardlist)-1=<0}">
    <h1>해당하는 검색어에 게시물이 없습니다</h1>
    </c:if>   --> --%>
   <c:if test="${fn:length(Boardlist)-1>= 0}">
   <c:forEach begin="0" end="${fn:length(Boardlist)-1}" step="1" var="i">
     
        <div class="col-xs-6 col-md-4">
            <div class="thumbnail" style="height:470px"> <!-- front?cmd=board -->
             <input type="hidden" id="foodAddrX${i}" value="${Boardlist[i].foodAddrX}">
      <input type="hidden" id="foodAddrY${i}" value="${Boardlist[i].foodAddrY}">
            <a href="food?cmd=board_content&foodNumber=${Boardlist[i].foodNumber}">
               <img src="<%=request.getServletContext().getContextPath()%>/upload/${Boardlist[i].foodImg[0].imageSrc}"
                  style="height:230px;">
            </a>
               <div style="margin-left: 3%"><h3 for="displayStarRating${i}">${Boardlist[i].foodStoreName}</h3></div>
               <div class="caption">
                  <div id="star${i}"></div>
             <div style="padding-top:2%;">
               <label for="displayStarRating${i}">평점 : </label><span id="displayStarRating${i}" style="padding-left:20px;">${Boardlist[i].foodStar}</span>
               
               <!-- 아이디 값이 없을 경우, 로그인 요청팝업창 노출 /
      있을 경우 하트색이 바뀌고 커멘드 처리함
    -->
   
                           <c:choose>
                              <c:when test="${(emaillogin.userId)!=null}">
                                 <c:set var="foodNumber">${Boardlist[i].foodNumber}</c:set>
                                 <c:if test="${!empty likeMap[foodNumber]}">                  
                                    <c:set var="heartsrc">${likeMap[foodNumber]}</c:set>
                                 </c:if>
                                 <c:if test="${empty likeMap[foodNumber]}">                                 
                                    <c:set var="heartsrc" value="image/heart.jpg"></c:set>
                                 </c:if>
                                 <input type="image" src="${heartsrc}" id="wishHeart${Boardlist[i].foodNumber}"
                                       style="width: 40px; height: 40px" class="pull-right" onclick="wishWrite('${Boardlist[i].foodNumber}', '${sessionScope.userNumber}')"/>
 
                              </c:when> 
                              <c:otherwise>
                              <div id="photo">
                                 <input type="image" src="image/heart.jpg"
                                    style="width: 40px; height: 40px" class="pull-right"  />
                                    </div>
                              </c:otherwise>
                           </c:choose>
               </div>
                 <b>예산  ${Boardlist[i].foodMenuPrice}원 (2인 기준)<b>
                 
                 <div style="color: #BDBDBD; height:43px;overflow: hidden;margin-bottom: 15px">${Boardlist[i].foodContent}</div>
              <a href="food?cmd=name&foodNumber=${Boardlist[i].foodNumber}&user=${sessionScope.userNumber}" class="btn btn-default" data-toggle="modal" data-target="#booking${i }">예약하기</a> 
                 <div class="modal fade" id="booking${i }">
                  <div class="modal-dialog">
                     <div class="modal-content"></div>
                     <!-- /.modal-content -->
                  </div>
               <!-- /.modal-dialog -->
               </div>      
              <a href="review?cmd=review&foodNumber=${Boardlist[i].foodNumber}" class="btn btn-default pull-right" role="button">리뷰쓰기</a>
               </div>
               
          </div>
        </div>
        
   </c:forEach>
   </c:if>
   <c:if  test="${fn:length(Boardlist) <= 0}">
   		<div align="center"><h2>검색결과가 없습니다</h2></div>
   </c:if>
    
     
   </div>
</div>


         
</div>


<script type="text/javascript">
    
   
      function wishWrite(foodNumber, userNumber) {
          $.ajax({
             type : "POST",
             url : "wishwrite",
             data : {"foodNumber" : foodNumber, "userNumber" : userNumber},
             success : function(data){
            	 
                if(data == "true"){ // 이제 좋아요 됨
                   $("#wishHeart" + foodNumber).attr("src", "image/heartcheck.jpg");                   
                }else{ // 좋아요 취소 됨
                   $("#wishHeart" + foodNumber).attr("src", "image/heart.jpg");                  
                }
             }             
          });
      };

   
   $(function() {
      $("#photo input").click(function() {
 
         alert("로그인을 해주세요");
      });
   });
      $(function() {
         var info=$(this).find("span#displayStarRating").text();         
         
         var size = '${fn:length(Boardlist)}'; 
         
         for(var i =0; i <size; i++){            
            $('div#star' + i).raty({
               readOnly: true
               , score: $(this).find("span#displayStarRating" + i).text()
               ,path : "images"
               ,width : 200
               ,score : $(this).find("span#displayStarRating" + i).text()            
               });   
         }
         
         
         
      });
      
      
      $(function(){
          $('button#searchBtn').click(function(){
              var text = $("#searchtext").val();    
              $("#searchtext_hidden").val(text);   
              
              var searchType = $("#searchType option:selected").text();
              var searchTypeEng;
              if(searchType=="매장명"){
            	  searchTypeEng = "FoodStoreName";
              }else if(searchType=="지역명"){
            	  searchTypeEng = "FoodAddr";            	  
              }
              $("#searchType_hidden").val(searchTypeEng);              
              document.getElementById("filter").submit();
           });
          });
      
      

          

      
      

   </script>
    
   <script>
  $(function() {
	
		
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 100000,
      values: [ 0, 100000],
      slide: function( event, ui ) {
        $("#amount").val( ui.values[ 0 ] + "원 - " + ui.values[ 1 ]+"원" );
        $("#slider_start").val(ui.values[0]);
        $("#slider_end").val(ui.values[1]);
      },    
      stop: function( event, ui ) {
    	  $("#searchBtn").click();	
	},
    });
    
	
	if('${slider_start}' != ""){
		var start = Number('${slider_start}');
		var end = Number('${slider_end}');
	       $( "#slider-range" ).slider({
        	  values: [ start, end ]
	       
        	});
	       $("#slider_start").val(start);
	        $("#slider_end").val(end);
	      }
	
    $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      "원 - " + $( "#slider-range" ).slider( "values", 1 )+"원" );
  });
  </script>
  
<!-- 지도 -->
<!-- <div class="col-md-4 col-sm-4" id="map"> -->
<!-- <div style="width:32%;height:100%;" id="map"> -->

<div id="map" style="width:500px;height:800px;"></div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=f4cd4ec3bfce2a3f1ad8fd8158a793a9&libraries=services"></script>
<script>


var firstX = Number(127.0258612969144);
var firstY = Number(37.59160964477401);
if($("#foodAddrX0").val()!=null){
	firstX = Number($("#foodAddrX0").val());
	firstY = Number($("#foodAddrY0").val());
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(firstY, firstX), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [];

var size = '${fn:length(Boardlist)}'; 
for(var i=0; i<size; i++){
	var foodAddrX = Number($("#foodAddrX" + i).val());
	var foodAddrY = Number($("#foodAddrY" + i).val());
	var foodStoreName = $("#foodStoreName" + i).val();
	var item = {title : foodStoreName, latlng: new daum.maps.LatLng(foodAddrY, foodAddrX)};
	positions.push(item);
}

	var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new daum.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}

	

	  
	   
	   if('${searchtext}' != "" && size>0){
	   // 장소 검색 객체를 생성합니다
		   var ps = new daum.maps.services.Places(); 
		// 키워드로 장소를 검색합니다
			var searchtext = '${searchtext}';
			
		   ps.keywordSearch(searchtext, placesSearchCB); 
	
		   // 키워드 검색 완료 시 호출되는 콜백함수 입니다
		   function placesSearchCB (status, data, pagination) {
		       if (status === daum.maps.services.Status.OK) {
	
		           // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		           // LatLngBounds 객체에 좌표를 추가합니다
		           var bounds = new daum.maps.LatLngBounds();
	
		           for (var i=0; i<data.places.length; i++) {
		               bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
		           }       
	
		           // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		           map.setBounds(bounds);
		       } 
		   }
	   }
	

  


</script>

   
   
   
    <script src="./bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>