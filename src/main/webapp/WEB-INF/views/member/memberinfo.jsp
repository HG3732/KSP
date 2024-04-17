	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/common/memberinfo.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
    <div class="wrap-changeinfo">
        <form id="change-info" method="post" action="${pageContext.request.contextPath}/member/info">
            <table>
                <tr>
                    <td>
                        아이디      
                    </td>
                    <td>
                        <input type="text" name="mem_id" class="mem_id" disabled>
                    </td>
                </tr>
                <tr>
                    <td>
                        회원 등급       
                    </td>
                    <td>
                       	<input type="text" name="grade" class="member_admin">
                    </td>
                    <td>
	                    <button type="submit" name="change-mem-Info" class="change-mem-Info">등급 변경</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" name="delete-mem" class="change" style="background-color: red;">회원 삭제</button>
                    </td>
                    <td>   
	                	<button type="button" name="change-mem-Info" class="change">신청 교육 목록</button>
                    </td>
                </tr>
       		</table>
       </form>
    </div>
<script>
		var member_id = new URLSearchParams(window.location.search).get("memberid");
		var member_admin = new URLSearchParams(window.location.search).get("memberadmin");
		$(".mem_id").prop("value", member_id);
		$(".member_admin").prop("value", member_admin);
		
/* $(loadedHandler);
	function loadedHandler(){
		$(".change-mem-Info").on("click", changeAdminHandler)
	}
	
	function changeAdminHandler() {
		var gradeVal = ${".member_admin"}.val();
		
		$.ajax({
		url:"${pageContext.request.contextPath}/member/info"
    		,method:"post"
    		,data : {memberid : member_id,
    				grade : gradeVal}
    		,success : function(result){
    			if(result > 0){
    				//등급 변경 성공했을 때
    				 alert("해당 회원의 등급이 변경되었습니다.");
    			} else {
    				//실패했을 때
    				alert("해당 회원의 등급 변경에 실패하였습니다.");
    			}
    				window.close();
    		}
    		,error : function(request, status, error){
    			alert("code:"  + request.status + "\n" + "message : "
    					+ request.responseText + "\n"
    					+"error : " + error);
    		}
    	});
	} */
</script>
</body>
</html>