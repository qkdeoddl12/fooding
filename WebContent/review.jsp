<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./include/header.jsp" />

<link rel="stylesheet"
   href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.min.css">

<script src="./bootstrap/js/jquery-2.2.3.min.js"></script>
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
			
			
			// 파라미터 있으면 셋
			if('${param.foodNumber}'){
				var length = '${fn:length(foodList)}';
				var index = '${param.foodNumber}';
				var real = length - index;
				$("#foodStroeName option:eq(" + real + ")").attr("selected", "selected");
				setStoreName();
				
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

<!-- 가게이름 -->
<script>
	function setStoreName(){
		var foodNumber = $("#foodStroeName option:selected").val();	
		$("#foodNumber").val(foodNumber);
	
	}
</script>

<div class="container">
   <div class="row">
									<br><br><br>
									<h2>리뷰보기</h2>
									<br>
									
									
									<form action="review?cmd=review_write_list" method="post" enctype="multipart/form-data" id="top">
										<input type="hidden" name="foodNumber" id="foodNumber" value="${foodList[0].foodNumber}">	
										
										<div class="col-md-3">
											<img src="image/img.png" />
										</div>
										<div class="col-md-9">
												<div>
													<select class="form-control" id="foodStroeName" onchange="setStoreName()">
															<c:forEach begin="0" end="${fn:length(foodList)-1}" step="1"	var="i">
																<option value="${foodList[i].foodNumber}">${foodList[i].foodStoreName}</option>
															</c:forEach>
													</select>
												</div>
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
															<input type="file" class="form-control" name="file" />
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

	<!-- 있던 리뷰 -->
   <hr>
   <!-- ------------------------------------------------------------ -->
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

 <script src="./bootstrap/js/bootstrap.min.js"></script>
 
 </body>
</html>