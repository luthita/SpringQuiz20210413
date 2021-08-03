<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<h1 class="display-4">${storeName} - 리뷰</h1>
			<c:forEach var="newReview" items="${newReviewList }">
				<c:if test="${empty newReview || review == ''}">
					<div>
						<h2>작성된 리뷰가 없습니다.</h2>
					</div>
				</c:if>
				<div class="box_border p-3 mt-3 mb-3">
					<strong class="font-weight-bold">${newReview.userName }</strong>
					<fmt:parseNumber var="intPoint" integerOnly="true" value="${newReview.point }"/>
					<c:choose>
						<c:when test="${intPoint >= 1}">
							<c:forEach var="var1" begin="1" end="${intPoint }" step="1">
								<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.jpg">
							</c:forEach>
							<c:if test="${newReview.point - intPoint > 0 }">
								<img src="http://marondal.com/material/images/dulumary/web/jstl/star_half.jpg">
								<c:set var="intPoint" value="${intPoint + 1 }"/>
							</c:if>
							<c:forEach var="var2" begin="1" end="${5 - intPoint }" step="1">
								<img src="http://marondal.com/material/images/dulumary/web/jstl/star_empty.jpg">
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:if test="${newReview.point > 0 }">
								<img src="http://marondal.com/material/images/dulumary/web/jstl/star_half.jpg">
								<img src="http://marondal.com/material/images/dulumary/web/jstl/star_empty.jpg">
								<img src="http://marondal.com/material/images/dulumary/web/jstl/star_empty.jpg">
								<img src="http://marondal.com/material/images/dulumary/web/jstl/star_empty.jpg">
								<img src="http://marondal.com/material/images/dulumary/web/jstl/star_empty.jpg">
							</c:if>
							<c:if test="${newReview.point == 0 }">
								<c:forEach var="var3" begin="1" end="5" step="1">
									<img src="http://marondal.com/material/images/dulumary/web/jstl/star_empty.jpg">
								</c:forEach>
							</c:if>
						</c:otherwise>
					</c:choose><br>
					<span class="text-secondary"><fmt:formatDate value="${newReview.createdAt }" pattern="yyyy년 m월 d일"/></span><br>
					<h6>${newReview.review }</h6>
					<small class="menu_bg p-1">${newReview.menu}</small>
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