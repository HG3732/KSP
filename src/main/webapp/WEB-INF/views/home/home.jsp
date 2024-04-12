<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/home/home.css" rel="stylesheet">
</head>
<body>
    <div class="wrap-main">
        <div class="portrait">
            <div class="universe">
                <div class="sky1">
                    <div class="item item1">1</div>
                    <div class="item item3">3</div>
                </div>
                <div class="sky2">
                    <div class="item item2">2</div>
                    <div class="item item4">4</div>
                </div>
            </div>
        </div>
    	<div class="buttonsection">
	        <div class="direction left"><a href="#" class="goleft">좌측</a></div>
	        <div class="direction right"><a href="#" class="goright">우측</a></div>
        </div>
    </div>
    
    
<script>
	let leftButton = document.querySelector('.goleft');
	let rightButton = document.querySelector('.goright');
	let rotationAngle = 0;
	
	leftButton.addEventListener('click', function(){
	    rotationAngle += 90;
	    rotateRevolve(rotationAngle);
	});
	
	rightButton.addEventListener('click', function(){
	    rotationAngle -= 90;
	    rotateRevolve(rotationAngle); 
	});
	
	function rotateRevolve(angle) {
	    document.querySelector('.universe').style.transform = 'rotate(' + angle + 'deg)';
	}
</script>
</body>