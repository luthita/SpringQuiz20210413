<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favoriteList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${favorite.name }</td>
					<td>${favorite.address }</td>
					<%-- (1) name속성과 value 속성을 이용하여 동적으로 삭제버튼 감지 --%>
					<%-- <td><button type="button" name="delBtn" class="btn btn-danger" value="${favorite.id}">삭제</button> --%>
					
					<%-- (2) data를 이용해서 태그에 data를 임시 저장해놓기 --%>
					<td><button type="button" class="favorite-btn btn btn-danger" data-favorite-id="${favorite.id}"/>삭제</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function(){
			
			// (1) name 속성과 value 속성을 이요해서 동적으로 삭제
			/* $('td').on('click', 'button[name=delBtn]', function(){
				let id = $(this).attr('value');
				alert(id);
			}); */
			
			// (2) data를 이용해서 태그에 data를 임시 저장해놓기
			// 태그: data-favorite-id		data-		그 뒤부턴 우리가 이름을 정한다
			// 스크립트: $(this).data(favorite)
			$('.favorite-btn').on('click', function(){
				let favoriteId = $(this).data('favorite-id');
				// alert(favoriteId);
				
				$.ajax({
					type: 'post'
					, data: {'favorite_id': favoriteId}
					, url: '/lesson06/quiz02/delete_favorite'
					, success: function(data){
						if(data == 'success'){
							location.reload();
						} else{
							alert("서버에서 삭제 처리를 하지 못했습니다. 관리자에게 문의해주세요")
						}
					}, error: function(e){
						alert("error : " + e);
					}
				});
			});
		});
	</script>
</body>
</html>