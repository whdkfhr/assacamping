<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="campingList" value="${campingListMap.campingList}" />
<c:set var="totalCount" value="${campingListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<title>ASSA Camping - 나혼자간다</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="ASSA Camping - 나혼자간다">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/css/camping.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/camping_responsive.css">
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

	<div class="camping">
		<div class="container">
			<div class="row">
				<div class="col-12">
				
					<!-- 게시판 -->
					<article class="mt-3">
						<table class="table table-hover text-center">
							<colgroup class="d-none d-lg-table-column-group">
								<col style="width:80px"/>
								<col style="width:100px"/>
								<col />
								<col style="width:100px"/>
								<col style="width:100px"/>
								<col style="width:100px"/>
							</colgroup>
							<thead class="thead-light d-none d-lg-table-header-group">
								<tr>
									<th>번호</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								
						<c:choose>
							<c:when test="${totalCount==0}">			
									<tr>
										<td colspan="6">등록된 게시글이 없습니다.</td>
									</tr>
							</c:when>	
							<c:otherwise>
								<c:forEach var="campingMap" items="${campingList}">
									<c:set var="campingVO" value="${campingMap.campingVO}" />
									<c:set var="campingCategoryName" value="${campingMap.campingCategoryName}" />
									<tr onclick="readCamping(${campingVO.campingNo})" style="cursor:pointer">
										<td class="d-none d-lg-table-cell align-middle">${campingVO.campingNo}</td>
										<td class="d-none d-lg-table-cell align-middle wbka">${campingCategoryName}</td>
										<td class="text-left">
											<c:if test="${campingVO.campingRe_lev > 0}">
												<img src="${contextPath}/images/re.gif" style="margin-left:${campingVO.campingRe_lev*16}px" class="mr-2" />
											</c:if>
											${campingVO.campingTitle}
											<small class="d-lg-none text-muted">[${campingCategoryName}]</small>
											<c:if test="${campingVO.campingFileName!=null}">
												<img class="ml-2" style="width:16px;height:16px" src="${contextPath}/images/download.svg" />
											</c:if>
											<small class="d-block d-lg-none text-right mt-1 text-muted">
												${campingVO.userId} | <fmt:formatDate value="${campingVO.campingWriteDate}" pattern="yy-MM-dd"/> | ${campingVO.campingReadCount}
											</small>
										</td>
										<td class="d-none d-lg-table-cell align-middle">${campingVO.userId}</td>
										<td class="d-none d-lg-table-cell align-middle"><fmt:formatDate value="${campingVO.campingWriteDate}" pattern="yy-MM-dd"/></td>
										<td class="d-none d-lg-table-cell align-middle">${campingVO.campingReadCount}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					
							</tbody>
						</table>
						
						<div class="row my-5">
							<div class="col-12 col-lg-8">
								<form action="${contextPath}/camp/listCamping.do" class="form-inline justify-content-center justify-content-lg-start">
									<div class="input-group mb-2 mb-sm-0 mr-sm-2">
										<select class="form-control" name="searchCategoryNo" onchange="this.form.submit()">
											<option value="0">전체보기</option>
											<c:forEach var="category" items="${campingCategoryList}">	
												<c:choose>
													<c:when test="${category.campingCategoryNo==searchCategoryNo}">
														<option value="${category.campingCategoryNo}" selected>${category.campingCategoryName}</option>
													</c:when>
													<c:otherwise>
														<option value="${category.campingCategoryNo}">${category.campingCategoryName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
									<div class="input-group">
										<input type="search" name="searchKeyword" value="${searchKeyword}" size="24" maxlength="24" class="form-control">
										<div class="input-group-append">
											<button type="submit" class="btn btn-secondary">검색</button>
										</div>
									</div>
								</form>
							</div>
							<div class="col-12 col-lg-4 mt-3 mt-lg-0">
								<div class="form-group text-center text-lg-right">
									<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/camp/writeCamping.do'">글쓰기</button>
								</div>
							</div>
						</div>
					
						<c:if test="${totalCount != null}">
							<div class="row">
								<div class="col-12">
									<ul class="pagination justify-content-center">
									<c:if test="${pageNo > 10}">	
									   	<li class="page-item">
											<button type="button" class="page-link" onclick="listCamping(${beginNo-10})">이전</button>
										</li>
									</c:if>
									<c:forEach var="page" begin="${beginNo}" end="${endNo}" step="1">
										<c:if test="${page <= Math.ceil(totalCount/10)}">
											<c:choose>	
												<c:when test="${page==pageNo}">
													<li class="page-item active">
														<button type="button" class="page-link" onclick="listCamping(${page})">${page}</button>						
													</li>
												</c:when>
												<c:otherwise>
													<li class="page-item">
														<button type="button" class="page-link" onclick="listCamping(${page})">${page}</button>							
													</li>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>								
									<c:if test="${totalCount > endNo*10}">						
									   	<li class="page-item">
											<button type="button" class="page-link" onclick="listCamping(${beginNo+10})">이전</button>
										</li>
									</c:if>
									</ul>
								</div>
							</div>
						</c:if>
					</article>		
					<!-- //게시판 -->
					
				</div>
			</div>
		</div>
	</div>
	
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
<script src="${contextPath}/js/camping_custom.js"></script>

<script>
function listCamping(pageNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/camp/listCamping.do";	
	form.pageNo.value = pageNo;
	form.submit();
}

function readCamping(campingNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/camp/readCamping.do?campingNo=" + campingNo;
	form.submit();
}
</script>
</body>
</html>