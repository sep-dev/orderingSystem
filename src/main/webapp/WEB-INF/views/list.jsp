<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<html>

	<head>

    <link rel="stylesheet" type="text/css" href="resources/css/style.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>list</title>
<style type="text/css">
		p{
	text-align: right;
	margin-top: 50px;
}



</style>
  </head>

	<body>
		<h1>登録一覧</h1>

		<form:form modelAttribute="Formmodel">
			<c:forEach items="${db}"  var="obj">
				<c:if test="${obj.progress!=100}">
			  		<br><input type ="radio" name = "up" value="${obj.orderid}" checked>
			  		<c:out value="${obj.name}"/>
			  		<c:out value="${obj.modelnumber}"/>
			  		<c:out value="${obj.tel}"/>
					[<c:out value="${obj.progress}"/>]%
				</c:if>
				</c:forEach>
			<div>
				<p><button name="inquiry" >詳細画面へ</button></p>
				<p><button name="update" >更新する</button></p>
			</div>
		</form:form>
	</body>
</html>