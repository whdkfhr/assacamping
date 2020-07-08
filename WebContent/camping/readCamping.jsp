<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="campingNo" value="${campingMap.campingVO.campingNo}" />
<c:set var="campingTitle" value="${campingMap.campingVO.campingTitle}" />
<c:set var="campingContent" value="${campingMap.campingVO.campingContent}" />
<c:set var="campingFileName" value="${campingMap.campingVO.campingFileName}" />
<c:set var="userId" value="${campingMap.campingVO.userId}" />
<c:set var="userName" value="${campingMap.campingVO.userName}" />
<c:set var="campingDate" value="${campingMap.campingVO.campingDate}" />
<c:set var="campingCount" value="${campingMap.campingVO.campingCount}" />
<c:set var="campingCategoryName" value="${campingMap.campingCategoryName}" />
<c:set var="campingFileType" value="${campingMap.campingFileType}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<title>ASSA Camping - 나혼자간다</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="ASSA Camping - 나혼자간다">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap_custom.css">
<link rel="stylesheet" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/camping.css">
<link rel="stylesheet" href="${contextPath}/css/camping_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/board.css" />
<jsp:include page="../inc/alert.jsp" />
</head>
<body>

<div class="super_container">

	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />
	
	<!-- Home -->	
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/categories.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">Woman</div>
							<div class="breadcrumbs">
								<ul>
									<li><a href="index.html">Home</a></li>
									<li>Woman</li>
									<li>Accessories</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Camping -->
	<article class="camping container">
		<table class="table read-table">
			<colgroup>
				<col style="width: 70px" />
				<col />
				<col style="width: 70px" />
				<col style="width: 210px" />
				<col style="width: 70px" />
				<col style="width: 70px" />
			</colgroup>
			<tr>
				<td colspan="6" class="h4 p-3 readsubject">
					${campingTitle}									
					<c:if test="${campingCategoryName!=null}">
						<small class="text-muted">[${campingCategoryName}]</small>									
					</c:if>									
					<div class="h6 mt-3 mb-0 d-lg-none text-right">
						<small class="text-muted">${userName} | <fmt:formatDate value="${campingDate}" pattern="yy-MM-dd HH:mm"/> | ${campingCount}</small>
					</div>
				</td>
			</tr>
			<tr class="d-none d-lg-table-row">
				<th class="align-middle">작성자</th>
				<td>${userName}</td>
				<th class="align-middle">작성일</th>
				<td><fmt:formatDate value="${campingDate}" pattern="yy-MM-dd HH:mm"/></td>
				<th class="align-middle">조회수</th>
				<td>${campingCount}</td>
			</tr>
			<tr>
				<td colspan="6" class="py-5">${fn:replace(campingContent,LF,BR)}</td>
			</tr>
			<c:if test="${campingFileName != null}">
				<tr>
					<th class="align-middle">첨부파일</th>
					<td colspan="5">
						<div class="d-flex align-items-center">
							<c:if test="${campingFileType.equals('image')}">
								<div class="preview" style="background-image:url(${contextPath}/files/camping/${campingNo}/${campingFileName})"></div>
							</c:if>
							<p class="ml-2 mb-0">${campingFileName}</p>
							<button type="button" class="btn btn-sm btn-info ml-2" onclick="downloadCamping(${campingNo}, '${campingFileName}')">다운로드</button>
						</div>
					</td>
				</tr>				
			</c:if>
		</table>

		<div class="text-center my-5">
			<button type="button" class="btn btn-secondary" onclick="listCamping()">목록</button>							
			<button type="button" class="btn btn-warning" onclick="modifyCamping(${campingNo})">수정</button>
			<button type="button" class="btn btn-danger" onclick="deleteCamping(${campingNo})">삭제</button>
			<button type="button" class="btn btn-primary" onclick="replyCamping(${campingNo})">답글쓰기</button>
		</div>			
	</article>
	
	<!-- Newsletter -->
	<jsp:include page="../inc/newsletter.jsp" />
	
	<!-- Footer -->
	<jsp:include page="../inc/footer.jsp" />
	
</div>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
</form>

<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/js/popper.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/plugins/easing/easing.js"></script>
<script src="${contextPath}/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${contextPath}/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.js"></script>
<script src="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/camping_custom.js"></script>

<script>
function listCamping(){
	var form = document.pagingForm;
	form.action = "${contextPath}/camp/listCamping.do";	
	form.submit();
}
function modifyCamping(campingNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/camp/modifyCamping.do?campingNo=" + campingNo;
	form.submit();
}
function deleteCamping(campingNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/camp/deleteCamping.do?campingNo=" + campingNo;
		form.submit();
	}
}
function replyCamping(campingNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/camp/replyCamping.do?campingNo=" + campingNo;
	form.submit();
}
function downloadCamping(campingNo, campingFileName){
	var form = document.pagingForm;
	form.action = "${contextPath}/camp/download.do?campingNo=" + campingNo + "&fileName=" + campingFileName;
	form.submit();
}
</script>
</body>
</html>