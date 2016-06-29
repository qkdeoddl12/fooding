<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
$(document).ready(function() {
	$.ajax({
		type : "POST",			
		url : "comment?apprNumber=1",
		success : function(data){			
			var jsonData = jQuery.parseJSON(data);			
			
			if(jsonData){				
				var contentStr = "";
				$(jsonData).each(
					function(i){
						contentStr += jsonData[i].commentNumber + ", " + jsonData[i].userNumber + ", " + jsonData[i].commentContent + "\n";}		
				);
				alert(contentStr);
			}
		}
	});
});
</script>
</head>
<body>
<div>
	<input type="button">
</div>
</body>
</html>