<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>

<jsp:include page="./include/header.jsp" />

<link rel="stylesheet"
   href="<%=request.getServletContext().getContextPath()%>/bootstrap/css/bootstrap.min.css">

<script src="./bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
$(document).ready(function(){
   var cnt = 0;
    $("#addbtn").click(function(){
        $("#imagediv").append("<div class='col-md-10' style='margin-top:4px'><input type='file' class='form-control' name='image" + cnt +"'></div>");
        cnt++;
    });    


$("#submitBtn").click(function(){
	var array = [];
	array.push($( "input[name='name']" ).val());
	array.push($( "input[name='tel2']" ).val());
	array.push($( "input[name='tel3']" ).val());
	array.push($( "input[name='won']" ).val());
	array.push($( "input[name='image']" ).val());
	array.push($( "input[name='menu']" ).val());
	array.push($( "input[name='memo']" ).val());
	
	for(var i=0; i<array.length; i++){
		if(array[i] == ""){
			alert("모든 항목을 입력해주세요");
			return false;
		}
	}
	
	if($("input:checkbox[name='time']").is(":checked") == false){
		alert("적어도 하나의 시간은 선택해야합니다.");
		return false;
	}
	
	$( "#top" ).submit();
});
});
</script>


<div class="container">
   <h2>매장 등록하기</h2>
   <br> <br>
   <div class="row">
      <div class="col-md-12">
         <form method="post" action="food?cmd=board_write" id="top" enctype="multipart/form-data">            
            <table class="table">
            
               <tr>
                  <th>매장명</th>
                  <td>
                     <div class="col-sm-5">
                        <input type="text" class="form-control" name="name" id="txt1">
                        <input type="hidden" id="x" name="x">
          				  <input type="hidden" id="y" name="y">
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>구분</th>
                  <td>
                     <div class="col-sm-3">
                        <select class="form-control" name="type">
                           <option>양식</option>
                           <option>한식</option>
                           <option>중식</option>
                           <option>일식</option>
                           <option>카페/베이커리</option>
                        </select>
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>시간선택</th>
                  <td>
                     <div class="col-sm-4">
                        <label class="checkbox-inline"><input type="checkbox"
                           value="점심" name="time">점심</label> <label
                           class="checkbox-inline"><input type="checkbox"
                           value="저녁" name="time">저녁</label>
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>전화번호</th>
                  <td>
                     <div class="form-group">
                        <div class="col-sm-2">
                           <select class="form-control " name="tel1">
                              <option>031</option>
                              <option>070</option>
                              <option>02</option>
                              <option>080</option>
                              <option>060</option>
                           </select>
                        </div>
                        <div class="col-sm-2">
                           <input type="text" class="form-control " name="tel2" id="txt2">
                        </div>
                        <div class="col-sm-2">
                           <input type="text" class="form-control" name="tel3" id="txt3">
                        </div>
                     </div>
                  </td>

               </tr>
               <tr>
                  <th width="20%">주소</th>
                  <td>
                     <div>
                        <div class="col-md-8">
                           <input type="text" id="address" name="address" placeholder="주소" onchange="getXY()" class="form-control" onfocus="sample5_execDaumPostcode()">
                        </div> 
                        <div class="col-md-2">
                           <input type="button" onclick="sample5_execDaumPostcode();" value="주소 검색" class="form-control">
                        </div>
                        <br>
                        <div class="col-md-12">
                           <div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
                        </div>
                     </div> 
                  </td>
               </tr>
               
               <tr>
                  <th>2인기준 예산</th>
                  <td>
                     <div class="col-sm-3">
                        <input type="text" class="form-control" name="won" id="won" onfocus="getInfo()">
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>이용정보</th>
                  <td>
                     <!-- 주차, 와이파이, 화장실, 단체석, 예약, 포장, 배달, PWT GBA D -->
                     <div class="col-sm-12">
                        <label class="checkbox-inline">
                           <input type="checkbox" value="주차" name="park">주차                     
                        </label> 
                        <label class="checkbox-inline">
                           <input type="checkbox" value="무선인터넷" name="wifi">무선인터넷
                        </label>
                        <label class="checkbox-inline">
                           <input type="checkbox" value="화장실구분" name="toilet">남/여 화장실구분
                        </label> 
                        <label class="checkbox-inline">
                           <input type="checkbox" value="단체석" name="group">단체석
                        </label> 
                        <label class="checkbox-inline">
                           <input type="checkbox" value="예약" name="book">예약
                        </label> 
                        <label class="checkbox-inline">
                           <input type="checkbox" value="포장" name="athome">포장
                        </label> 
                        <label class="checkbox-inline">
                              <input type="checkbox" value="배달" name="drive">배달
                        </label> 
                     </div>

                  </td>
               </tr>
               <tr>
                  <th>이미지</th>
                  <td>
                     <div id="imagediv">
                        <div class="col-md-10">
                           <input type="file" class="form-control" name="image">
                        </div>
                        <div class="col-md-1 col-md-offset-1">                        
                           <button type="button" class="btn btn-default" aria-label="Left Align" id="addbtn">
                              <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                           </button>
                        </div>
                     </div>
                  </td>
               </tr>
               <tr>               
                  <th>메뉴</th>
                  <td>
                     <div class="col-md-12">
                        <textarea class="form-control" style="resize: none;" name="menu" id="txt4"></textarea>
                     </div>
                  </td>
               </tr>
               <tr>
               
                  <th>짧은 설명</th>
                  <td>
                     <div class="col-md-12">
                        <textarea class="form-control" style="resize: none;" name="memo" id="txt5"></textarea>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <div class="form-group">
                        <div class="col-sm-3 col-md-offset-3">
                           <input type="button" class="form-control" id="submitBtn" value="등록">
                        </div>
                        <div class="col-sm-3">
                           <input type="button" class="form-control" value="취소">
                        </div>
                     </div>
                  </td>
               </tr>
            </table>
         </form>

         
      </div>
   </div>
</div>



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=f4cd4ec3bfce2a3f1ad8fd8158a793a9&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

   
    
	
	 
	      /* var foodAddr = $("#address").val();
	      $.ajax({
	         type : "GET",      
	         dataType: "jsonp",
	         url : "http://apis.daum.net/local/geo/addr2coord?apikey=7023fcca7867fe0886fa724a14a3ef07&q=" + foodAddr + "&output=json",
	         success : function(data){
	            var x = data.channel.item[0].point_x;
	            var y = data.channel.item[0].point_y;
	            $("#x").val(x);
	            $("#y").val(y);
	            }
	         }); */
	        
	     



	     function getInfo() {
	         // 지도의 현재 중심좌표를 얻어옵니다 
	         var center = map.getCenter();       
	         
	         $("#x").val(center.getLng());
	         $("#y").val(center.getLat());
	     }
	    
	    
	    
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = data.address; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("address").value = fullAddr;
	                // 주소로 좌표를 검색
	                geocoder.addr2coord(data.address, function(status, result) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });             
	        }
	        
	        
	        }).open({
	            popupName: 'postcodePopup' //팝업 이름을 설정(영문,한글,숫자 모두 가능, 영문 추천)
	           });
	        document.getElementById("won").focus();
	       
	        
	       
	    }

</script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
