<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>통나무 팬션</title>
        <meta charset="utf-8">

        <!-- datepicker 라이브러리 위에 있어야 한다.  -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        

        <!-- datepicker 라이브러리 -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        <!-- bootstrap CDN link -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!-- jquery slim 제거-->
        <!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css"
	href="/css/pension_style.css">
    </head>
    <body>
        <div id="wrap" class="container">
            <header class="bg-light d-flex justify-content-center align-items-center">
                <div class="display-4">통나무 팬션</div>
            </header>
            <nav>
                <ul class="nav nav-fill">
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">예약하기</a></li>
                    <li class="nav-item"><a href="/lesson06/reservation_list" class="nav-link text-white font-weight-bold">예약목록</a></li>
                </ul>
            </nav>
            <section class="contents">
            	<h2 class="font-weight-bold text-center p-4">예약 목록 보기</h3>
            	<table class="table text-center">
            		<thead>
            			<tr>
            				<th>이름</th>
            				<th>예약날짜</th>
            				<th>숙박일수</th>
            				<th>숙박인원</th>
            				<th>전화번호</th>
            				<th>예약상태</th>
            				<th></th>
            			</tr>
            		</thead>
            		<tbody>
            			<c:forEach var="booking" items="${bookingList }">
            			<tr>
            				<td>${booking.name }</td>
            				<td><fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일" /></td>
            				<td>${booking.day }</td>
            				<td>${booking.headcount }</td>
            				<td>${booking.phoneNumber }</td>
            				
           					<c:choose>
           						<c:when test="${booking.state eq '대기중'}">
           							<td class="text-info">${booking.state }</td>
           						</c:when>
           						<c:otherwise>
           							<td class="text-success">${booking.state }</td>
           						</c:otherwise>
           					</c:choose>
           					
            				<td><button type="button" class="reserved-btn btn btn-danger" data-reserved-id="${booking.id }"/>삭제</td>
            			</tr>
            			</c:forEach>
            		</tbody>
            	</table>
            </section>
            <footer>
                <div class="address m-3">
                    제주특별자치도 제주시 애월읍<br>
                    사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
                    Copyright 2025 tongnamu. All right reserved.
                </div>
            </footer>
        </div>
    </body>
    
    <script>
    	$(document).ready(function(){
    		
    		$('.reserved-btn').on('click', function(){
    			let reservedId = $(this).data('reserved-id');
    			
    			$.ajax({
    				type: 'post'
    				, url:'/lesson06/delete_reserved'
    				, data: {'reserved_Id': reservedId}
    				, success: function(data){
    					if(data == 'success'){
    						location.reload();
    					} else{
    						alert("서버에서 삭제처리를 하지 못했습니다.")
    					}
    				}, error: function(e){
    					alert("error : " + e);
    				}
    				
    			});
    		});
    	});
    </script>
</html>