<%@ page contentType="text/html; charset=EUC-KR"%>
<!doctype html>

<head>
<meta charset="utf-8">
<title>jQuery UI Slider - Range slider</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$("#slider-range").slider({
			range : true,
			min : 0,
			max : 500,
			values : [ 75, 300 ],
			slide : function(event, ui) {
				$("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
			}
		});
		$("#amount").val(
				"$" + $("#slider-range").slider("values", 0) + " - $"
						+ $("#slider-range").slider("values", 1));
	});
</script>

<script src="jquery.raty.js"></script>
<link rel="stylesheet" href="jquery.raty.css">
<script type="text/javascript">
	$(function() {
		var info = $(this).find("span#displayStarRating").text();

		$('div#star').raty({
			readOnly : false,
			score : $(this).find("span#displayStarRating").text(),
			path : "images",
			width : 200,
			mouseout : function() {
				$("#displayStarRating").val($('div#star').raty('score'));
			},
			half : true
		});


	

	});
</script>

</head>
<body>

	<p>
		<label for="amount">Price range:</label> <input type="text"
			id="amount" readonly
			style="border: 0; color: #f6931f; font-weight: bold;">
	</p>

	<div id="slider-range"></div>
	<div id="star"></div>
	<div>
		<label for="displayStarRating">∆Ú¡° : </label><input type="text"
			style="border: none;" id="displayStarRating" name="starrate"
			style="padding-left: 20px;" readonly="readonly" />

	</div>

</body>
</html>