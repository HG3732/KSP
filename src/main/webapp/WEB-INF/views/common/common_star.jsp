<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
function loginPermission(){
    var alertMsg = "${alertMsg}";
    if(alertMsg){
    	alert(alertMsg);
    	location.href="${pageContext.request.contextPath }/login";
    	return;
    }
}
function adminPermission(){
	var alertMsg = "${alertMsg}";
	if(alertMsg){
		alert(alertMsg);
		location.href="${pageContext.request.contextPath}"+"${servletMapping}";
	}
}
</script>