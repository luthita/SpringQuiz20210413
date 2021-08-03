<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 가게</title>
<link rel="stylesheet" type="text/css"
	href="/css/store_style.css">
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container" id="wrap">
		<header class="bg-info d-flex align-items-center justify-content-center">
			<h3 class="text-white font-weight-bold">배탈의 민족</h2>
		</header>
		<sector class="contents">
			<h1 class="display-4">우리동네 가게</h1>
			<c:forEach var="store" items="${storeList }">
				<div class="box_border p-3 mt-3 mb-3 " style="cursor: pointer;" onclick="location.href='http://localhost/lesson05/reviews?storeId=${store.id}&storeName=${store.name }'">
					<h5 class="font-weight-bold">${store.name }</h3>
					<span>전화번호 : ${store.phoneNumber }</span><br>
					<span>주소 : ${store.address }</span>
				</div>
			</c:forEach>
		</sector>
		<hr>
		<footer>
			<b>(주)우와한형제</b><br>
			<small class="text-secondary">고객센터 : 1500 - 1500</small>
		</footer>
	</div>
</body>
</html>