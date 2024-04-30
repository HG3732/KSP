 	<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/home/memberlist.css" rel="stylesheet">  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<jsp:include page="/WEB-INF/views/common/common_star.jsp"/>
<script>
$(loadedHandler)
var precategory = null;
var prekeyword = null;
var presortby = null;
var prevalue = null;
var currentpage = 1;

	function loadedHandler() {
		
		$(listUpMember);
		$(".btn-search").on("click", btnSearchHandler)
		$(".sort").on("click", sortHandler);
		$(".sortname").on("click", sortNameHandler);
		$(".sortid").on("click", sortIdHandler);
		$(".sortpwd").on("click", sortPwdHandler);
		$(".sortemail").on("click", sortEmailHandler);
		$(".sortaddress").on("click", sortAddressHandler);
		$(".sortgrade").on("click", sortGradeHandler);

	}
	
	function listUpMember(){
		$.ajax({
			url:"${pageContext.request.contextPath}/member/list3"
			, method : "get"
			, dataType : "json"
			, error : ajaxErrorHandler
			, success : function(result){
				if(result.keyword){
					$("[name=search]").val(result.keyword);
				}
				displayMemberList(result);
				displayPageNum(result);
			}
		});
	}
	
	/* 회원 리스트 표시 */
	function displayMemberList(datalist) {
		datalist = datalist.dtoList;
		var htmlVal = '';
		if(!datalist){
			htmlVal+=`<div class="check-main"><p style="padding: 10px; border-bottom: 2px solid white;">일치하는 회원이 없습니다.</p></div>`;
		}else {
			for(var idx in datalist){
				var dto = datalist[idx];
				htmlVal += `
					<div class="check-main">
						<form class="memberlist" method="post" action="${pageContext.request.contextPath}/member/info" target="_blank">
			                <div>\${dto.mem_name}</div>
			                <div><input type="text" name="memberid" value="\${dto.mem_id}" readonly></div>
			                <div>\${dto.mem_pwd}</div>
			                <div>\${dto.mem_email}</div>
			                <div>\${dto.mem_address}</div>
			                <div><input type="text" name="memberadmin" value="\${dto.mem_admin}" readonly></div>
			                <div><button type="submit" name="goinfo" class="goinfo">상세 조회</button></div>
		            	</form>
		    		</div>
				`;
			}
		}
		$(".wrap-checkmember>div:not(.check-head)").remove();
		$(".check-head").after(htmlVal);
	}
	
	/* 페이지 번호 표시 */
	function displayPageNum(datalist) {

			var totalPageCount = datalist.totalPageCount;
			var startPageNum = datalist.startPageNum;
			var endPageNum = datalist.endPageNum;
			var htmlVal = '';
			
			if(startPageNum > 1) {
				htmlVal += `<div class="goprepage" style="line-height: 22px;"><button type="button" class="btn-gopage" data-targetpage="\${startPageNum-1}"> &lt; &lt; </button></div>`;
			}
			for(var i = startPageNum; i <= endPageNum; i++){
				if(i == currentpage){htmlVal += `<div class="gopage" style="color: red; font-weight: bold; line-height:22px;">\${i}</div>`;}
				else{htmlVal += `<div class="gopage"><button type="button" class="btn-gopage" data-targetpage="\${i}">\${i}</button></div>`;}
			}
			if(startPageNum < totalPageCount) {
				htmlVal += `<div class="gonextpage" style="line-height: 22px;"><button type="button" class="btn-gopage" data-targetpage="\${endPageNum+1}"> &gt; &gt; </button></div>`;
			}
			$(".pageNum").empty();
			$(".pageNum").append(htmlVal);
			
			$(".btn-gopage").on("click", goPageHandler);
	}
	
	/* 페이지 이동 함수 */
	function goPageHandler(event) {
			currentpage = $(this).data("targetpage");
			$.ajax({
				url:"${pageContext.request.contextPath}/member/list3"
				, method : "get"
				, data : {category : precategory,
						search : prekeyword,
						sortby : presortby,
						value : prevalue,
						page : currentpage}
				, dataType : "json"
				, error : ajaxErrorHandler
				, success : function(result){
					if(result.keyword){
						$("[name=search]").val(result.keyword);
					}
					displayMemberList(result);
					displayPageNum(result);
				}
			});
		
	}

	/* 검색 */
	function btnSearchHandler() {
		precategory = $(".category option:selected").val();
		prekeyword = $(".search").val();
		presortby = null;
		prevalue = null;
		currentpage = 1;
		
		$.ajax({
			url:"${pageContext.request.contextPath}/member/list3"
			, method : "get"
			, data : {category : precategory,
				search : prekeyword,
				sortby : presortby,
				value : prevalue,
				page : currentpage}
			, dataType : "json"
			, error : ajaxErrorHandler
			, success : function(result){
				precategory = result.category;
				prekeyword = result.keyword;
				
				displayMemberList(result);
				displayPageNum(result);
			}
		})
	}
	
	
	/* 정렬 */
	function sortHandler(){
		presortby = $(this).data("sort");
		prevalue = $(this).data("val");
		
		$.ajax({
			url : "${pageContext.request.contextPath}/member/list3"
			, method : "get"
			, data : {category : precategory,
					search : prekeyword,
					sortby : presortby,
					value : prevalue}
			, dataType : "json"
			, error : ajaxErrorHandler
			, success : function(result){
					presort = result.sort;
					preval = result.val;
					
					displayMemberList(result);
					displayPageNum(result);
				}
		});
	}
		
	/* 정렬 버튼 클릭 토글 */
	function sortNameHandler() {
		$(".sort-name0").toggle();
		$(".sort-name1").toggle();
	}
	function sortIdHandler() {
		$(".sort-id0").toggle();
		$(".sort-id1").toggle();
	}
	function sortPwdHandler() {
		$(".sort-pwd0").toggle();
		$(".sort-pwd1").toggle();
	}
	function sortEmailHandler() {
		$(".sort-email0").toggle();
		$(".sort-email1").toggle();
	}
	function sortAddressHandler() {
		$(".sort-address0").toggle();
		$(".sort-address1").toggle();
	}
	function sortGradeHandler() {
		$(".sort-grade0").toggle();
		$(".sort-grade1").toggle();
	}
	
	

</script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>

 	<c:choose>
		<c:when test="${ssslogin.mem_admin < 2 }">
			<div class="alert">열람 권한이 없습니다.</div>
		</c:when>
		<c:when test="${empty ssslogin}">
			<div class="alert">열람 권한이 없습니다.</div>
		</c:when>
		<c:otherwise>
		    <section class="search-member">
		    <div class="searchbar">
		            <form id="searchmem-keyword" >
		                <select class="category" name="category">
		                    <option value="MEMBER_NAME" selected>이름</option>
		                    <option value="MEMBER_ID">아이디</option>
		                    <option value="MEMBER_PWD">비밀번호</option>
		                    <option value="MEMBER_EMAIL">이메일 주소</option>
		                    <option value="MEMBER_ADDRESS">주소</option>
		                    <option value="MEMBER_ADMIN">등급</option>
		                </select>
		                <input type="text" name="search" class="search">
		                <button type="button" name="btn-search" class="btn-search">검색</button>
		            </form>
		        </div>
		        <div class="check-title">
		            회원 관리
		        </div>
		        <div class="wrap-checkmember">
		            <div class="check-head">
		            	<form id="sort">
			                <button type="button" class="sort sortname sort-name0" data-sort="MEMBER_NAME" data-val="0">이름 ↑</button>
			                <button type="button" class="sort sortname sort-name1" data-sort="MEMBER_NAME" data-val="1" style="display: none;">이름 ↓</button>
			                <button type="button" class="sort sortid sort-id0" data-sort="MEMBER_ID" data-val="0">아이디 ↑</button>
			                <button type="button" class="sort sortid sort-id1" data-sort="MEMBER_ID" data-val="1" style="display: none;">아이디 ↓</button>
			                <button type="button" class="sort sortpwd sort-pwd0" data-sort="MEMBER_PWD" data-val="0">비밀번호 ↑</button>
			                <button type="button" class="sort sortpwd sort-pwd1" data-sort="MEMBER_PWD" data-val="1" style="display: none;">비밀번호 ↓</button>
			                <button type="button" class="sort sortemail sort-email0" data-sort="MEMBER_EMAIL" data-val="0">이메일 주소 ↑</button>
			                <button type="button" class="sort sortemail sort-email1" data-sort="MEMBER_EMAIL" data-val="1" style="display: none;">이메일 주소 ↓</button>
			                <button type="button" class="sort sortaddress sort-address0" data-sort="MEMBER_ADDRESS" data-val="0">주소 ↑</button>
			                <button type="button" class="sort sortaddress sort-address1" data-sort="MEMBER_ADDRESS" data-val="1" style="display: none;">주소 ↓</button>
			                <button type="button" class="sort sortgrade sort-grade0" data-sort="MEMBER_ADMIN" data-val="0">등급 ↑</button>
			                <button type="button" class="sort sortgrade sort-grade1" data-sort="MEMBER_ADMIN" data-val="1" style="display: none;">등급 ↓</button>
		                	<div style="padding-top:3px;">비고</div>
		                </form>
		            </div>
		        </div>
		        <div class="pagenum">
		        </div>
		    </section>
		</c:otherwise>
    </c:choose>
</body>
</html>