<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<title>受注情報確認画面</title>
<link rel="stylesheet" type="text/css" href="resources/css/Registersuccess.css" />
</head>
<body bgcolor ="#FFD5EC">
	<div id="blook1">
		<div id="blook2">
			<h1>
				<b>この内容で登録しますか？</b>
			</h1>
			<c:forEach items="${list}" var="obj" >
			<form:form modelAttribute="FormModel" action="/system/Registersuccess2">

				<p class="mb1">受注登録日 2016年${hidden1}月${hidden2}日</p>
				<p class="mb1">納品完了予定日 ${hidden6}年${hidden7}月${hidden8}日</p>
				<p class="mb1">品番：${obj.modelnumber} </p>
				<p class="mb1">発注数:${hidden4}</p>
				<p class="mb1">価格：<script type="text/javascript">
				var money = "${obj.modelmoney}" * "${hidden4}"; document.write(money);
				</script>円</p>
				<input type="hidden" value="${obj.modelmoney}" name="hidden17">
				<p class="mb1">氏名：${name}</p>
				<p class="mb1">郵便番号：${post1}-${post2}</p>
				<p class="mb1">住所1：${order1}</p>
				<p class="mb1">住所2：${address1}</p>
				<p class="mb1">住所3：${address2}</p>
				<p class="mb1">電話番号：${tel}</p>

				<p class="mb1">受注登録者名：${hidden5}</p>
				<input type="hidden" value="${hidden1}" name="hidden1">
				<input type="hidden" value="${hidden2}" name="hidden2">
				<input type="hidden" value="${obj.modelnumber}" name="hidden3">
				<input type="hidden" value="${hidden4}" name="hidden4">
				<input type="hidden" value="${hidden5}" name="hidden5">
				<input type="hidden" value="${hidden6}" name="hidden6">
				<input type="hidden" value="${hidden7}" name="hidden7">
				<input type="hidden" value="${hidden8}" name="hidden8">
				<input type="hidden" value="${hidden9}" name="hidden9">
				<input type="hidden" value="${name}" name="hidden10">
				<input type="hidden" value="${post1}" name="hidden11">
				<input type="hidden" value="${post2}" name="hidden12">
				<input type="hidden" value="${order1}" name="hidden13">
				<input type="hidden" value="${address1}" name="hidden14">
				<input type="hidden" value="${address2}" name="hidden15">
				<input type="hidden" value="${tel}" name="hidden16">

				<input type="hidden" value="${hidden3}" name="hidden18">

				<h3>※品番、受注数の変更はできませんがこれでよろしいでしょうか？</h3>

				<p align="center" class="submit1">
					<input type="submit" value="登録完了">
			</form:form>
			</c:forEach>
			<form:form modelAttribute="FormModel" action="/system/Frame">
					<input
			type="button" value="キャンセル"
			onclick="history.go(-3)" />
			</form:form>
		</div>
	</div>
</body>
</html>