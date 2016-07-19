<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顧客情報登録画面</title>
<link rel="stylesheet" type="text/css" href="resources/css/Registerfai2.css" />
</head>
<body bgcolor ="#FFD5EC">
	<div id="blook1">
		<div id="blook2">
			<h1 align="center">
				<b>顧客登録</b>
			</h1>
			<form:form modelAttribute="FormModel" action="/system/Register2">
				<p class="mb1">
					氏名<input type="text" value="${name}" name="name" pattern="[^\x20-\x7E\uFF21-\uFF3A\uFF41-\uFF5A\uFF10-\uFF19]*">
				</p>
				<div id="width">
					<p class="mb1">
						郵便番号<input type="text" value="${post1}" name="post1" size="1"pattern="\d{3}" placeholder="例：000">-
							<input type="text" value="${post2}" name="post2" size="3" pattern="\d{4}" placeholder="例：0000">
					</p>
				</div>
				<div id="width2">
					<p class="mb1">
						住所1<select name="order1">
							<option value="0">都道府県を選択して下さい</option>
							<option value="茨城県">茨城県</option>
							<option value="埼玉県">埼玉県</option>
							<option value="東京都">東京都</option>
							<option value="千葉県">千葉県</option>
							<option value="神奈川県">神奈川県</option>
						</select>
					</p>
				</div>
				<div id="width3">
					<p class="mb1">
						住所2<input type="text" value="${address1}" name="address1" placeholder="市区町村、番地">
					</p>
				</div>
				<div id="width4">
					<p class="mb1">
						住所3<input type="text" value="${address2}" name="address2" placeholder="マンション名、部屋番号">
					</p>
				</div>
				<div id="width5">
					<p class="mb1">
						電話番号<input type="text" value="${tel}" name="tel" placeholder="例：00011112222"
						pattern="\d{2,4}-?\d{3,4}-?\d{3,4}">
					</p>
					<h3>※未入力の値があります！記入してください。</h3>
					<input type="hidden" value="${hidden1}" name="hidden1">
					<input type="hidden" value="${hidden2}" name="hidden2">
					<input type="hidden" value="${hidden3}" name="hidden3">
					<input type="hidden" value="${hidden4}" name="hidden4">
					<input type="hidden" value="${hidden5}" name="hidden5">
					<input type="hidden" value="${hidden6}" name="hidden6">
					<input type="hidden" value="${hidden7}" name="hidden7">
					<input type="hidden" value="${hidden8}" name="hidden8">
					<input type="hidden" value="${hidden9}" name="hidden9">
				</div>
				<p class="submit" align="center">
					<input type="submit" value="受注完了">
				</p>
			</form:form>
		</div>
	</div>
</body>
</html>