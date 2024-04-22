<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
// 로그인 필요한 사이트 접속 시 경고창
function loginPermission(){
    var alertMsg = "${alertMsg}";
    if(alertMsg){
    	alert(alertMsg);
    	location.href="${pageContext.request.contextPath }/login";
    	return;
    }
}
// 관리자 접근 가능 사이트 접속 시 경고창
function adminPermission(){
	var alertMsg = "${alertMsg}";
	if(alertMsg){
		alert(alertMsg);
		location.href="${pageContext.request.contextPath}"+"${servletMapping}";
	}
}
// ajax error function
function ajaxErrorHandler (request, status, error){
	alert("code: "+request.status + "\n" + "message: " 
			+ request.responseText + "\n"
			+ "error: "+error);
}
</script>