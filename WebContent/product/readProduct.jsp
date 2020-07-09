<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="productNo" value="${productMap.productVO.productNo}" />
<c:set var="productName" value="${productMap.productVO.productName}" />
<c:set var="productContent" value="${productMap.productVO.productContent}" />
<c:set var="productImageName1" value="${productMap.productVO.productImageName1}" />
<c:set var="productImageName2" value="${productMap.productVO.productImageName2}" />
<c:set var="productImageName3" value="${productMap.productVO.productImageName3}" />
<c:set var="productPrice" value="${productMap.productVO.productPrice}" />
<c:set var="productDate" value="${productMap.productVO.productDate}" />
<c:set var="productQuantity" value="${productMap.productVO.productQuantity}" />
<c:set var="productCategoryNo" value="${productMap.productVO.productCategoryNo}" />
<c:set var="productRating" value="${productMap.productVO.productRating}" />
<c:set var="productCategoryName" value="${productMap.productCategoryName}" />
<c:set var="userName" value="홍길동" />
<c:set var="userId" value="${request.getSession(userId)}" />
<c:set var="productImage1" value="${contextPath}/files/product/${productNo}/${productImageName1}" />
<c:set var="productImage2" value="${contextPath}/files/product/${productNo}/${productImageName2}" />
<c:set var="productImage3" value="${contextPath}/files/product/${productNo}/${productImageName3}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<title>ASSA Product - 나혼자간다</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="ASSA Product - 나혼자간다">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap_custom.css">
<link rel="stylesheet" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/product.css">
<link rel="stylesheet" href="${contextPath}/css/product_responsive.css">
</head>
<body>

<div class="super_container">
	
	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />

	<!-- Home -->
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/product.jpg" data-speed="0.8"></div>
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
									<li>Swimsuits</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Product -->
	<div class="product">
		<div class="container">
		
			<!-- Info -->	
			<section id="info">
				<div class="row">	
					<!-- Product Image -->
					<div class="col-lg-7">
						<div class="product_image">
							<div class="product_image_large"><img src="${productImage1}" alt=""></div>
							<div class="product_image_thumbnails d-flex flex-row align-items-start justify-content-start">
								<c:if test="${productImage1!=null}">
									<div class="product_image_thumbnail" style="background-image:url(${productImage1}" data-image="${productImage1}"></div>
								</c:if>
								<c:if test="${productImage2!=null}">
									<div class="product_image_thumbnail" style="background-image:url(${productImage2}" data-image="${productImage2}"></div>
								</c:if>
								<c:if test="${productImage3!=null}">
									<div class="product_image_thumbnail" style="background-image:url(${productImage3}" data-image="${productImage3}"></div>
								</c:if>
							</div>
						</div>
					</div>
	
					<!-- Product Content -->
					<div class="col-lg-5">
						<div class="product_content">
							<div class="product_name">${productName}</div>
							<div class="product_price"><fmt:formatNumber value="${productPrice}" pattern="#,###" /> <small>원</small></div>
							<div class="rating rating_${productRating}" data-rating="${productRating}">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<div class="product_text">
								<p>${fn:replace(productContent,LF,BR)}</p>
							</div>
							<!-- Product Quantity -->
							<div class="product_quantity_container">
								<span>수량</span>
								<c:choose>
									<c:when test="${productQuantity > 0}">
										<div class="product_quantity clearfix">
											<input id="quantity_input" type="text" pattern="[0-9]*" value="1">
											<div class="quantity_buttons">
												<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fa fa-caret-up" aria-hidden="true"></i></div>
												<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fa fa-caret-down" aria-hidden="true"></i></div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="product_quantity_empty text-danger">품절</div>								
									</c:otherwise>
								</c:choose>
							</div>
							<!-- Product Size -->
							<div class="product_size_container">
								<c:choose>
									<c:when test="${productQuantity > 0}">
										<div class="button cart_button btn-block"><a href="#">장바구니 담기</a></div>
									</c:when>
									<c:otherwise>
										<div class="button cart_button"><a href="javascript:alert('준비중입니다.')">재입고 알림</a></div>							
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- Reviews -->
			<section id="review" class="mt-5">		
				<div class="row no-gutters">
					<div class="col-4"><a class="btn btn-outline-primary btn-block" href="javascript:scrollTop('#info')">상품정보</a></div>
					<div class="col-4"><a class="btn btn-primary btn-block" style="margin-left:-1px" href="javascript:scrollTop('#review')">상품후기</a></div>
					<div class="col-4"><a class="btn btn-outline-primary btn-block" style="margin-left:-1px" href="javascript:scrollTop('#qna')">상품문의</a></div>
				</div>
				<div class="row">
					<div class="col">
						<div class="reviews">
							<div class="reviews_container">
								<ul>
									<!-- Review -->
									<li class=" review clearfix">
										<div class="review_image"><img src="${contextPath}/images/review_1.jpg" alt=""></div>
										<div class="review_content">
											<div class="review_name"><a href="#">Maria Smith</a></div>
											<div class="review_date">Nov 29, 2017</div>
											<div class="rating rating_4 review_rating" data-rating="4">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
											<div class="review_text">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis quam ipsum. Pellentesque consequat tellus non tortor tempus, id egestas elit iaculis. Proin eu dui porta, pretium metus vitae, pharetra odio. Sed ac mi commodo, pellentesque erat eget, accumsan justo. Etiam sed placerat felis. Proin non rutrum ligula. </p>
											</div>
										</div>
									</li>
									<!-- Review -->
									<li class=" review clearfix">
										<div class="review_image"><img src="${contextPath}/images/review_2.jpg" alt=""></div>
										<div class="review_content">
											<div class="review_name"><a href="#">Maria Smith</a></div>
											<div class="review_date">Nov 29, 2017</div>
											<div class="rating rating_4 review_rating" data-rating="4">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
											<div class="review_text">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis quam ipsum. Pellentesque consequat tellus non tortor tempus, id egestas elit iaculis. Proin eu dui porta, pretium metus vitae, pharetra odio. Sed ac mi commodo, pellentesque erat eget, accumsan justo. Etiam sed placerat felis. Proin non rutrum ligula. </p>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row pb-5">
					<div class="col">
						<div class="review_form_container">
							<div class="review_form_content">
								<form action="#" id="review_form" class="review_form">
									<div class="d-flex flex-md-row flex-column align-items-start justify-content-between">
										<input type="text" class="review_form_input" placeholder="Name" required="required">
										<input type="email" class="review_form_input" placeholder="E-mail" required="required">
										<input type="text" class="review_form_input" placeholder="Subject">
									</div>
									<textarea class="review_form_text" name="review_form_text" placeholder="Message"></textarea>
									<div class="d-flex justify-content-end">
										<button type="submit" class="review_form_button">후기등록</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- Q&A -->
			<section id="qna" class="mt-5">
				<div class="row no-gutters">
					<div class="col-4"><a class="btn btn-outline-primary btn-block" href="javascript:scrollTop('#info')">상품정보</a></div>
					<div class="col-4"><a class="btn btn-outline-primary btn-block" style="margin-left:-1px" href="javascript:scrollTop('#review')">상품후기</a></div>
					<div class="col-4"><a class="btn btn-primary btn-block" style="margin-left:-1px" href="javascript:scrollTop('#qna')">상품문의</a></div>
				</div>
				<div class="row">
					<div class="col">
						<div class="qnas">
							<div class="qnas_container">
								<ul>
									<!-- Review -->
									<li class=" qna clearfix">
										<div class="qna_image"><img src="${contextPath}/images/qna_1.jpg" alt=""></div>
										<div class="qna_content">
											<div class="qna_name"><a href="#">Maria Smith</a></div>
											<div class="qna_date">Nov 29, 2017</div>
											<div class="qna_text">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis quam ipsum. Pellentesque consequat tellus non tortor tempus, id egestas elit iaculis. Proin eu dui porta, pretium metus vitae, pharetra odio. Sed ac mi commodo, pellentesque erat eget, accumsan justo. Etiam sed placerat felis. Proin non rutrum ligula. </p>
											</div>
										</div>
									</li>
									<!-- Review -->
									<li class=" qna clearfix">
										<div class="qna_image"><img src="${contextPath}/images/qna_2.jpg" alt=""></div>
										<div class="qna_content">
											<div class="qna_name"><a href="#">Maria Smith</a></div>
											<div class="qna_date">Nov 29, 2017</div>
											<div class="qna_text">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis quam ipsum. Pellentesque consequat tellus non tortor tempus, id egestas elit iaculis. Proin eu dui porta, pretium metus vitae, pharetra odio. Sed ac mi commodo, pellentesque erat eget, accumsan justo. Etiam sed placerat felis. Proin non rutrum ligula. </p>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row pb-5">
					<div class="col">
						<div class="qna_form_container">
							<div class="qna_form_content">
								<form action="#" id="qna_form" class="qna_form">
									<div class="d-flex flex-md-row flex-column align-items-start justify-content-between">
										<input type="text" class="qna_form_input" placeholder="Name" required="required">
										<input type="email" class="qna_form_input" placeholder="E-mail" required="required">
										<input type="text" class="qna_form_input" placeholder="Subject">
									</div>
									<textarea class="qna_form_text" name="qna_form_text" placeholder="Message"></textarea>
									<div class="d-flex justify-content-end">
										<button type="submit" class="qna_form_button">문의등록</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
			
		</div>		
	</div>

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
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/product_custom.js"></script>

<script>
function scrollTop(target){
	var top = $(target).offset().top;
	$("html, boyd").animate({
		scrollTop : top + "px"
	},400);
}

function listProduct(categoryNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/pro/listProduct.do";	
	form.searchCategoryNo.value = categoryNo;
	form.submit();
}

function  checkQuantity(obj){
	var quantity = obj.value;
}

function fn_order_pro(obj, userId){

var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", url);
	var IdInput = document.createElement("input");
	parentNOInput.setAttribute("type","hidden");
	
	parentNOInput.setAttribute("name","userId");
	parentNOInput.setAttribute("value", userId);
	
	form.appendChild(parentNOInput);
	document.body.appendChild(form);
	form.submit();
}

function backToList(obj){
	obj.action="${contextPath}/pro/proList.do";
	obj.submit();
}
</script>
</body>
</html>