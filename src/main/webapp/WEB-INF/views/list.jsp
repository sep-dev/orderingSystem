<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<title>一覧</title>
<style type="text/css">
<!--
h1 {
	margin-top: 50px;
	text-align: left;
}

-->
div.button {
	text-align: right;
	margin-top: 30px;
}

p.middle {
	margin-top: 50px;
}

div.middle {
	margin-left: 20px;
}
</style>
</head>

<body>
	<h1>登録情報照会</h1>
	<h2>${data}</h2>
	<form:form modelAttribute="Formmodel">
		<c:forEach items="${data}" var="obj">

			<p>
				受注登録日
				<c:out value="${obj.orderday}" />
			</p>
			<p>
				納品完了予定日
				<c:out value="${obj.completion}" />
			</p>
			<p class="middle">
				<br><input type="hidden" name="up" value="${id}">
				<br>品番
				<c:out value="${obj.modelnumber}" />
				<br>発注数
				<c:out value="${obj.ordernumber}" />
				<br>郵便番号
				<c:out value="${obj.postalcode}" />
				<br>住所1
				<c:out value="${obj.address1}" />
				<br>住所2
				<c:out value="${obj.address2}" />
				<br>住所3
				<c:out value="${obj.address3}" />
				<br>電話番号
				<c:out value="${obj.tel}" />
			</p>

					受注登録者  <c:out value="${obj.ordername}" />
			<p class=middle>
				<br>
				<B>現在の進捗率[<c:out value="${obj.progress}" />]%
				</B>
		</c:forEach>
		<div class="button">
			<p>
				<button name="update">更新する</button>
			</p>
			<p>
				<button name="list">一覧画面へ</button>
			</p>
		</div>
	</form:form>
</body>
</html>