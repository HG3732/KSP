	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/home/home.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
    <div class="wrap-main">
    <div style="padding: 10px 0;">*세부 시간대에 따라 위치가 조금 다를 수 있습니다.</div>
        <div class="portrait">
        	<div class="wrap-universe">
        	<img src="${pageContext.request.contextPath}/resource/image/star_map_cover.png" class="star-cover">
	            <div class="universe">
					<img src="${pageContext.request.contextPath}/resource/image/star_map.png">
				</div>
            </div>
        </div>
    	<div class="buttonsection">
	        <div class="direction left"><button type="button" class="go goleft">좌측</button></div>
	        <div class="direction right"><button type="button" class="go goright">우측</button></div>
        </div>
    </div>
    <img src="${pageContext.request.contextPath}/resource/image/constellation_map.png" class="compass">
    <div class="season">겨울(1월)</div>
<script>
$(loadedHandler)

	function loadedHandler() {
		$(".go").on("click", changeSeasonHandler);
	
		let leftButton = document.querySelector('.goleft');
		let rightButton = document.querySelector('.goright');
		let rotationAngle = 0;
		var seasonDirection = 0;
		
		leftButton.addEventListener('click', function(){
		    rotationAngle += 90;
		    rotateRevolve(rotationAngle);
		    seasonDirection++;
		    if(seasonDirection > 3) {
		    	seasonDirection = 0;
		    }
		});
		
		rightButton.addEventListener('click', function(){
		    rotationAngle -= 90;
		    rotateRevolve(rotationAngle);
		    seasonDirection--;
		    if(seasonDirection < 0) {
		    	seasonDirection = 3;
		    }
		});
		
		function rotateRevolve(angle) {
		    document.querySelector('.universe').style.transform = 'rotate(' + angle + 'deg)';
		}
		
		function changeSeasonHandler() {
			switch (seasonDirection) {
			case 0:
				$(".season").text("봄(4월)");
				break;
			case 1:
				$(".season").text("겨울(1월)");
				break;
			case 2:
				$(".season").text("가을(10월)");
				break;
			case 3:
				$(".season").text("여름(7월)");
				break;
			default:
				break;
			}
		}
	}
</script>
</body>