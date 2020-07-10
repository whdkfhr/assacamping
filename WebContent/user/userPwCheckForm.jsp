<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:choose>
	<c:when test='${msg=="fail"}'>
		<script type="text/javascript">
			window.onload = function(){
				window.alert("비밀번호가 일치하지 않습니다.");
			}
		</script>
	</c:when>
</c:choose>
</head>
<body>
<form action="${contextPath}/userCon/userPwCheckAction.do" method="post" >
	<h2>회원정보수정</h2>
	비밀번호를 다시 입력해 주세요.<br>
	<input type="text" name="userId" value="${userInfo.userId}" hidden>
	<label>Password</label>
		<input type="password" name="userPw" >		
	<button type="submit">입력</button>
</form>
</body>
</html>