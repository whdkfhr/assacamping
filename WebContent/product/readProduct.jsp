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
<c:set var="userName" value="관리자" />
<!--
	<c:set var="userId" value="${request.getSession(userId)}" />
-->
<c:set var="userId" value="admin" />
<c:set var="productImage1" value="${contextPath}/files/product/${productNo}/${productImageName1}" />
<c:set var="productImage2" value="${contextPath}/files/product/${productNo}/${productImageName2}" />
<c:set var="productImage3" value="${contextPath}/files/product/${productNo}/${productImageName3}" />

<!-- 리뷰 개수 -->
<c:set var="reviewNum" value="${requestScope.reviewNum}" />
<!-- 문의 개수 -->
<c:set var="qnaNum" value="${requestScope.qnaNum}" />

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
					<div class="col-4"><a class="btn btn-primary btn-block" style="margin-left:-1px" href="javascript:scrollTop('#review')">상품후기(<span id="rCount">0</span>)</a></div>
					<div class="col-4"><a class="btn btn-outline-primary btn-block" style="margin-left:-1px" href="javascript:scrollTop('#qna')">상품문의(<span id="qCount">0</span>)</a></div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="reviews">
							<div class="reviews_container">
								<ul>
									<!-- Review list -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row pb-5">
					<div class="col">
						<div class="review_form_container">
							<div class="review_form_content">
								<form name="review_form" id="review_form" class="review_form">
									<c:if test="${userId == null}">
										<p>로그인한 사용자만 리뷰를 작성할 수 있습니다.</p>
									</c:if>
									
									<c:if test="${userId != null}">
										<div>
											<label>
												<input type="radio" name="review_start_raing" value="1"/>1
											</label>
											<label>
												<input type="radio" name="review_start_raing" value="2"/>2
											</label>
											<label>
												<input type="radio" name="review_start_raing"  value="3"/>3
											</label>
											<label>
												<input type="radio" name="review_start_raing"  value="4"/>4
											</label>
											<label>
												<input type="radio" name="review_start_raing" value="5" checked/>5
											</label>
										</div>
										<textarea class="review_form_text" name="review_form_text" id="review_form_text" placeholder="리뷰를 등록하세요.(최대 2048자)"  maxlength="2048"></textarea>
										<div class="d-flex justify-content-end">
											<button type="button" class="review_form_button" onclick="reviewSubmit()">등록하기</button>
										</div>	
									</c:if>
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
					<div class="col-4"><a class="btn btn-outline-primary btn-block" style="margin-left:-1px" href="javascript:scrollTop('#review')">상품후기(<span id="rCount2">0</span>)</a></div>
					<div class="col-4"><a class="btn btn-primary btn-block" style="margin-left:-1px" href="javascript:scrollTop('#qna')">상품문의(<span id="qCount2">0</span>)</a></div>
				</div>
				<div class="row">
					<div class="col">
						<div class="qnas">
							<div class="qnas_container">
								<ul>
									<!--Q&A -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row pb-5">
					<div class="col">
						<div class="qna_form_container">
							<div class="qna_form_content">
								<form name="qna_form" id="qna_form" class="qna_form">
									<c:if test="${userId == null}">
										<p>로그인한 사용자만 문의를 작성할 수 있습니다.</p>
									</c:if>
									
									<c:if test="${userId != null}">
										<textarea class="qna_form_text" name="qna_form_text" id="qna_form_text" placeholder="문의를 등록하세요.(최대 2048자)" maxlength="2048"></textarea>
										<div class="d-flex justify-content-end">
											<button type="button" class="qna_form_button" onclick="qnaSubmit()">등록하기</button>
										</div>
									</c:if>
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

// review ----------------------------------------------------------------------------------------------------------
//페이지 로딩시 리뷰 목록 출력 
$(document).ready(function(){
    reviewList(); 
});

// 리뷰 목록 가져와서 보여주기
function reviewList(){
	var _url = '${contextPath}/proreview/listReview.do';
	var _reviewListInfo = '{"productNo":"'+${productNo}+'"}';
	var no = ${productNo};
	
    $.ajax({
        url : _url,
        type : 'post',
        data : {reviewListInfo : _reviewListInfo},
        success : function(data){
        	var a = '';
        	
        	if(data == null || data == '') {
        		a += '<li class=" review clearfix">';
       			a += '<p>등록된 리뷰가 없습니다.</p>';
       			a += '</li>';
       			$(".reviews_container").html(a);	
       			return;
       		}
        	
       		var jsonInfo = JSON.parse(data);
       	
        	$.each(jsonInfo, function(index, entry){
	        	$.each(entry, function(key, value){
	            		
	    	    	var no = value.reviewNo;
		    	    var name = value.userName;
 			       	var content = value.reviewContent;
	        	   	var date = value.reviewDate;	
	           		var id = value.userId;
					var rating = value.starRating;
	           		var num = value.reviewNum;
					
					a += '<li class=" review clearfix" id="review'+no+'">';
					a += '<div class="review_image"><img src="${contextPath}/images/review_1.jpg" alt=""></div>';
					a += '<div class="review_content">';
					a += '<div class="review_name"><b>'+name+'</b></div>';
					a += '<div class="review_date">'+date+'</div>'
					a += '<div class="rating rating_'+rating+' review_rating" data-rating="'+rating+'">';
					a += '<i class="fa fa-star"></i>';
					a += '<i class="fa fa-star"></i>';
					a += '<i class="fa fa-star"></i>';
					a += '<i class="fa fa-star"></i>';
					a += '<i class="fa fa-star"></i>';
					a += '</div>';
					a += '<div class="review_text">';
					a += '<p>'+content+'</p>';
					if('${userId}' == id || '${userId}' == 'admin'){
						a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="reviewDelete('+no+')">삭제</button>';
					}
					a += '</div>';
					a += '</div>';
					a += '</li>';
					
					$(".reviews_container").html(a);	
				
           		});
        		var rCount = entry.length;
        		$("#rCount").html(rCount);
        		$("#rCount2").html(rCount);
          	});
       },
       error: function(err) {
    	   alert("ajax 통신에러");
       }
    });
}

// 리뷰 등록
function reviewSubmit(){
	
	var productNo = ${productNo};
	var userId = '${userId}';
	var userName = '${userName}';
	var reviewContent = document.review_form.review_form_text.value;
	
	// 별점-----------------------------------------------------------
	var radioBtn = document.getElementsByName("review_start_raing");
	var starRating = 0;
	for(var i = 0; i < radioBtn.length; i++) {
		if(radioBtn[i].checked == true)
			starRating = radioBtn[i].value;
	}
	//--------------------------------------------------------------
	
	if(reviewContent.length == 0){
		alert("리뷰 내용을 입력해주세요.");
		document.review_form.review_form_text.focus();
		return;
	}
	
	var _reviewInfo = '{"productNo":"'+productNo+'","userId":"'+userId+'","userName":"'+userName+'","reviewContent":"'+reviewContent+'","starRating":"'+starRating+'"}';
	var _url = '${contextPath}/proreview/insertReview.do';			
	$.ajax({
		type : "post",
		async : "false",
		url : _url,
		data : {reviewInfo : _reviewInfo},
		success : function(data, status){
			
			// 정상적으로 리뷰가 등록되었다면 리뷰목록을 reload
			reviewList();
			
			$("#review_form_text").val("");
				
		},
		error : function(){
			alert("통신에러가 발생했습니다.");	
		}				
	});
}

// 리뷰 삭제
function reviewDelete(reviewNo){
	
	var result = confirm("리뷰를 삭제하시겠습니까?");
	var productNo = ${productNo};
	
	if(result){	

		var userId = '${userId}';
		var _reviewDeleteInfo = '{"userId":"'+userId+'","reviewNo":"'+reviewNo+'","productNo":"'+productNo+'"}';
		var _url = '${contextPath}/proreview/deleteReview.do'; 		
		$.ajax({
			type : "post",
			async : "false",
			url : _url,
			data : {reviewDeleteInfo : _reviewDeleteInfo},
			success : function(data, status){
				if(data == "fail"){
					alert("리뷰가 정상적으로 삭제되지 않았습니다.");
				}else{
					var str = "<td class='alert alert-danger text-center' colspan='3'>리뷰가 삭제되었습니다.</td>";						
					$("#review" + reviewNo).html(str).fadeOut(1000, function(){
						$(this).remove();
						if($(".reviews_container").find("li").length == 0){
							
							var emptyStr = "";
							emptyStr += '<li class=" review clearfix">';
							emptyStr += '<p>등록된 리뷰가 없습니다.</p>';
							emptyStr += '</li>';
							
							$(".reviews_container").append(emptyStr);
						}
					});
					
					var jsonInfo = JSON.parse(data);
					var rCount = jsonInfo.reviewCnt;
					$("#rCount").html(rCount);
	        		$("#rCount2").html(rCount);
				}
			},
			error : function(){
				alert("통신에러가 발생했습니다.");	
			}				
		});
	}
} // review
//--------------------------------------------------------------------------------------------------------------


// Qna ----------------------------------------------------------------------------------------------------------
//페이지 로딩시 상품문의 목록 출력 
$(document).ready(function(){
    qnaList(); 
});

// 상품문의 목록 가져와서 보여주기
function qnaList(){
	var _url = '${contextPath}/proqna/listQna.do';
	var _qnaListInfo = '{"productNo":"'+${productNo}+'"}';
	
    $.ajax({
        url : _url,
        type : 'post',
        data : {qnaListInfo : _qnaListInfo},
        success : function(data){
        	var a = '';
        	
        	if(data == null || data == '') {
        		a += '<li class=" qna clearfix">';
       			a += '<p>등록된 문의가 없습니다.</p>';
       			a += '</li>';
       			$(".qnas_container").html(a);	
       			return;
       		}
        	
       		var jsonInfo = JSON.parse(data);
       	
        	$.each(jsonInfo, function(index, entry){
	        	$.each(entry, function(key, value){
	            		
	    	    	var no = value.qnaNo;
		    	    var name = value.userName;
 			       	var content = value.qnaContent;
	        	   	var date = value.qnaDate;	
	           		var id = value.userId;
	           		var answer = value.qnaAnswer;
					var answerDate = value.qnaAnswerDate;
	           		
					a += '<li class=" qna clearfix" id="qna'+no+'">';
					a += '<div class="qna_image"><img src="${contextPath}/images/review_1.jpg" alt=""></div>';
				
					a += '<div class="qna_content">';
					a += '<div class="qna_name"><b>'+name+'</b></div>';
					a += '<div class="qna_date">'+date+'</div>';
					a += '<div class="qna_text">';
					a += '<p>'+content+'</p>';
					if('${userId}' == id){
						a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="qnaDelete('+no+')">삭제</button></div>';
					}
					if('${userId}' == 'admin'){
						a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="qnaDelete('+no+')">삭제</button>';
						if(answer == null){
							a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="location.href='+'\'${contextPath}/proQnaAdm/answerProductQna.do?qnaNo='+no+'\'">답변</button></div>';
						} else {
							a += '<div class="qna_content">';
							a += '<div class="qna_name"><b>[답변]관리자</b></div>';
							a += '<div class="qna_date">'+answerDate+'</div>';
							a += '<div class="qna_text">';
							a += '<p>'+answer+'</p>';
							a += '</div>';
						}		
					}
					
					a += '</div>';
					a += '</li>';
					
					$(".qnas_container").html(a);
           		});
	        	var qCount = entry.length;
        		$("#qCount").html(qCount);
        		$("#qCount2").html(qCount);
          	});
       },
       error: function(err) {
    	   alert("ajax 통신에러");
       }
    });
}

// 상품문의 등록
function qnaSubmit(){
	
	var productNo = ${productNo};
	var userId = '${userId}';
	var userName = '${userName}';
	var qnaContent = document.qna_form.qna_form_text.value; 
	
	if(qnaContent.length == 0){
		alert("문의 내용을 입력해주세요.");
		document.qna_form.qna_form_text.focus();
		return;
	}

	var _qnaInfo = '{"productNo":"'+productNo+'","userId":"'+userId+'","userName":"'+userName+'","qnaContent":"'+qnaContent+'"}';
	var _url = '${contextPath}/proqna/insertQna.do';			
	$.ajax({
		type : "post",
		async : "false",
		url : _url,
		data : {qnaInfo : _qnaInfo},
		success : function(data, status){
			
			// 정상적으로 문의가 등록되었다면 문의목록을 reload
			qnaList();
			
			$("#qna_form_text").val("");
				
		},
		error : function(){
			alert("통신에러가 발생했습니다.");	
		}				
	});
}

// 상품문의 삭제
function qnaDelete(qnaNo){
	
	var result = confirm("문의를 삭제하시겠습니까?");
	var productNo = ${productNo};
	
	if(result){	

		var userId = '${userId}';
		var _qnaDeleteInfo = '{"userId":"'+userId+'","qnaNo":"'+qnaNo+'","productNo":"'+productNo+'"}';
		var _url = '${contextPath}/proqna/deleteQna.do'; 		
		$.ajax({
			type : "post",
			async : "false",
			url : _url,
			data : {qnaDeleteInfo : _qnaDeleteInfo},
			success : function(data, status){
				if(data == "fail"){
					alert("문의가 정상적으로 삭제되지 않았습니다.");
				}else{
					var str = "<td class='alert alert-danger text-center' colspan='3'>문의가 삭제되었습니다.</td>";						
					$("#qna" + qnaNo).html(str).fadeOut(1000, function(){
						$(this).remove();
						if($(".qnas_container").find("li").length == 0){
							
							var emptyStr = "";
							
							emptyStr += '<li class=" qna clearfix">';
							emptyStr += '<p>등록된 문의가 없습니다.</p>';
							emptyStr += '</li>';
							
							$(".qnas_container").append(emptyStr);
						}
					});
					
					var jsonInfo = JSON.parse(data);
					var qCount = jsonInfo.qnaCnt;
					$("#qCount").html(qCount);
	        		$("#qCount2").html(qCount);
				}
			},
			error : function(){
				alert("통신에러가 발생했습니다.");	
			}				
		});
	}
} // qna
//--------------------------------------------------------------------------------------------------------------

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