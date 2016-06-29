<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="./include/header.jsp"/>


<link rel="stylesheet"
   href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.min.css">


<style>
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#777;}

#carousel{
 width : 100%;
 height : 450px;
}
#content_table tr th{
 width : 20%;
 height : 100px;
 vertical-align:middle
}
#content_table tr td{
 vertical-align:middle
}
</style>


<script
   src="./bootstrap/js/jquery-2.2.3.min.js"></script>
   
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script src="holder.js"></script>
 <script src="jquery.raty.js"></script>
 
 
<link rel="stylesheet" href="jquery.raty.css">

<script>

$(document).ready(function(){
	$("#submitBtn").click(function(){				
		var array = [];
		array.push($( "input[id='displayStarRating']" ).val());
		array.push($( "textarea[name='content']" ).val());
		array.push($( "input[name='file']" ).val());
		
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
    <script type="text/javascript">
		$(function() {
			var info=$(this).find("span#displayStarRating").text();			
			
			$('div#star').raty({
				readOnly: false
				, score: $(this).find("span#displayStarRating").text()
				,path : "images"
				,width : 200
				,mouseout : function(){									
					$("#displayStarRating").val($('div#star').raty('score'));
				},half : true
				});
			
			
			
			var size = '${fn:length(apprList)}'; 
			
			for(var i =0; i <size; i++){				
				$('div#star_fixed' + i).raty({
					readOnly: true
					, score: $(this).find("span#displayStarRating_fixed" + i).text()
					,path : "images"
					,width : 200
					,score : $(this).find("span#displayStarRating_fixed" + i).text()				
					});	
			}
			
			
		});
	</script>

<!-- 댓글 -->
<script>


	

	
	function getComment(apprNumber){	
		$.ajax({
			type : "POST",			
			url : "comment?apprNumber=" + apprNumber,
			success : function(data){			
				var jsonData = jQuery.parseJSON(data);				
				
				$("#commentDiv" + apprNumber).empty();							
				if(jsonData){		
					$(jsonData).each(					
						function(i){			
							if('${sessionScope.userNumber}'== jsonData[i].userNumber) { // 세션 == 글쓴사람
								$("#commentDiv" + apprNumber).append("<div id='commentBox" + apprNumber + i + "'>" + 
											 "<div class='col-md-3' id='commentWriter'>" + jsonData[i].userId +
											 "</div><div class='col-md-7' id='commentContent'>" + jsonData[i].commentContent + "</div>" + 
											 "<div class='col-md-2'><input type='button' class='btn btn-default btn-xs' value='x' " + 
											 "onclick='deleteBtnClick(" + jsonData[i].commentNumber + ", " + apprNumber + ")'>" + 
										 "</div></div>");							
									
							}else{ // 일반 글 쓰기
								$("#commentDiv" + apprNumber).append("<div id='commentBox" + apprNumber + i + "'>" + 
										"<div class='col-md-3' id='commentWriter'>" + jsonData[i].userId +
										 "</div><div class='col-md-7' id='commentContent'>" + jsonData[i].commentContent + "</div></div>");							
									
							}
						}
					);				
				}
			}
		});
	};
	
	function writeComment(apprNumber){	
		$.ajax({
			type : "POST",			
			url : "commentWrite?apprNumber=" + apprNumber,
			data : {"commentContent" : $("#writeCommentContent" + apprNumber).val()},
			success : function(){		
				getComment(apprNumber);			
				$("#writeCommentContent" + apprNumber).val("");
			}			
		});
		
	};
	
	
	function deleteBtnClick(commentNumber, apprNumber){
		$.ajax({
			type : "POST",			
			url : "commentDelete?commentNumber=" + commentNumber,			
			success : function(){											
				getComment(apprNumber);			
			}			
		});
	    
	}
</script>

<!-- 내용 컨테이너 시작-->
<!-- 제목 부분 -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="navbar navbar-fixed">
					<center>
						<h2 id="storename">${foodInfo.foodStoreName}</h2>
						<h5>${foodInfo.foodType}</h5>
					</center>
				</div>	
				</div>
					<!-- 위에 사진 -->
					
				<div class="col-md-12">	
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							
							<c:if test="${fn:length(foodInfo.foodImg)> 1}">
								<c:forEach begin="1" end="${fn:length(foodInfo.foodImg)-1}" step="1" var="i">
										<li data-target="#myCarousel" data-slide-to="${i}"></li>
								</c:forEach>
							</c:if>
							
						</ol>
	
		
	
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
										<img src="<%=request.getServletContext().getContextPath()%>/upload/${foodInfo.foodImg[0].imageSrc}" alt="Chania" id="carousel">
									</div>
							<c:if test="${fn:length(foodInfo.foodImg)> 1}">
								<c:forEach begin="1" end="${fn:length(foodInfo.foodImg)-1}" step="1" var="i">
									<div class="item">
										<img src="<%=request.getServletContext().getContextPath()%>/upload/${foodInfo.foodImg[i].imageSrc}" alt="Chania" id="carousel">
									</div>
								</c:forEach>
							</c:if>
						
						</div>
	
						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel" role="button"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
					
					<br><br><br>
				</div>
			<!-- ------------------------------------------------------ -->
			
				<div>				
						
						
						<div>
							<!-- 정보 div -->
							<div class="container">
								<div class="row">
									<div class="col-md-7">
										<table class="table" id="content_table">
											<tr>
												<th width="20%" height="50px">한 줄 설명</th>
												<td>${foodInfo.foodContent}</td>
											</tr>										
											<tr>
												<th width="20%">음식 종류</th>
												<td>${foodInfo.foodType}</td>
											</tr>
	
											<tr>
												<th width="20%">전화번호</th>
												<td>${foodInfo.foodPhoneNumber}</td>
											</tr>
											<tr>
												<th width="20%">주소</th>
												<td>${foodInfo.foodAddr}</td>
											</tr>										
											<tr>
												<th width="20%">예산</th>
												<td>${foodInfo.foodMenuPrice}원 (2인 기준)</td>
											</tr>
										</table>
									</div>
									<div class="col-md-5">
										<div id="map" style="width:100%;height:700px;"></div> 
									</div>
									
								</div>								
								
								<div class="row">
									<br><br><br>
									<h2>리뷰보기</h2>
									<br>
									
									
									<form action="review?cmd=review_write" method="post" enctype="multipart/form-data" id="top">
									<input type="hidden" name="foodNumber" value="${param.foodNumber}">
										<div class="col-md-3">
											<img src="image/img.png" />
										</div>
										<div class="col-md-9">
											
												<div id="star"></div>
												<div>
													<label for="displayStarRating">평점 : </label><input type="text" style="border:none;"
													id="displayStarRating" name="starrate"  style="padding-left: 20px;" readonly="readonly"/>
			
												</div>
												<div>
													<textarea class="form-control" name="content" style="resize: none;" rows="5"></textarea>
													<br>
													<div class="form-group">
														<div class="col-md-10">
															<input type="file" class="form-control" />
														</div>
														<div class="col-md-2">
															<input type="button" value="등록" id="submitBtn"
																class="btn btn-default btn-lg" />
														</div>
													</div>
												</div>
											
			
										</div>
									</form>
									
									
									
									
								</div>

		<hr>
		
			<c:if test="${fn:length(apprList)-1 >= 0}">
					<c:forEach begin="0" end="${fn:length(apprList)-1}" step="1"	var="i">

						<div class="row">
							<form>								
								<div class="col-md-3">
									<img src="image/img.png" />
								</div>
								
									<div class="col-md-9">
										<div>
											${apprList[i].userId}
											<div id="star_fixed${i}"></div>
											<div>
												<label for="displayStarRating_fixed${i}">평점 : </label><span style="border:none;"
													id="displayStarRating_fixed${i}"  style="padding-left: 20px;">${apprList[i].appraisalStar}</span>

											</div>
										</div>
										<div style="margin-bottom: 8%">
											${apprList[i].appraisalReply}
										</div>
										
										<div> <!-- 사진나올곳 -->
													<c:if test="${apprList[i].appraisalImg != ''}">
											<img src="<%=request.getServletContext().getContextPath()%>/upload_review/${apprList[i].appraisalImg}"
											 		style="height : 230px"/>
											 		</c:if>
										</div>
										
										
										
										<a data-toggle="collapse" href="#collapse${apprList[i].appraisalNumber}" onclick="getComment(${apprList[i].appraisalNumber})"
											aria-expanded="true" aria-controls="collapse${apprList[i].appraisalNumber}">댓글달기(${apprList[i].commentCount})</a>
										
										
										<div class="collapse" id="collapse${apprList[i].appraisalNumber}">
											<div id="reple">
													<div id="commentDiv${apprList[i].appraisalNumber}">
													
													</div>		
												<div>
													<br><br>
														<div class="col-sm-3">${sessionScope.userId}</div>
														<div class="col-sm-7">
															<input type="text" class="form-control" id="writeCommentContent${apprList[i].appraisalNumber}">
														</div>
														<div class="col-sm-2">
															<input type="button" value="댓글달기" onclick="writeComment(${apprList[i].appraisalNumber})">
														</div>
													
												</div>
												
												
											</div>
										</div>
									
								</div>
							</form>
						</div>
						<br>
						<br>
					</c:forEach>
					</c:if>
					<!-- ------------------------------------------------------------ -->




				</div>
						</div>					
					</div>
				
							
			</div>
		</div>

	
<!-- 쇼핑몰 물건row 시작 -->
	





	 <script src="bootstrap/js/bootstrap.min.js"></script>


<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=f4cd4ec3bfce2a3f1ad8fd8158a793a9&libraries=services"></script><script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다

geocoder.addr2coord($('table tr td').eq(3).text(), function(status, result) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });   
   

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('h2:first').text()+'</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});      
</script>

</body>
</html>