<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
                    <li class="nav-item"><a href="/lesson06/pension_home" class="nav-link text-white font-weight-bold">팬션소개</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">예약하기</a></li>
                    <li class="nav-item"><a href="/lesson06/reservation_list" class="nav-link text-white font-weight-bold">예약목록</a></li>
                </ul>
            </nav>
            <section class="d-flex justify-content-center ">
            	<div class="col-6">
	            	<h2 class="font-weight-bold text-center p-4">예약 하기</h3>
	            	이름<br>
	            	<input type="text" class="form-control" id="name"><br>
	            	예약날짜<br>
	            	<input type="text" id="date" name="date" class="form-control"><br>
	            	
	            	숙박일수<br>
	            	<input type="text" class="form-control" id="day"><br>
	            	숙박인원<br>
	            	<input type="text" class="form-control" id="headcount"><br>
	            	전화번호<br>
	            	<input type="text" class="form-control" id="phoneNumber"><br>
	            	<button class="btn btn-warning btn-block" id="reserveBtn" >예약하기</button>
            	</div>
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
    		
    		$('#date').datepicker({
                dateFormat: "yy년 mm월 dd일" // 2021년 00월 00일
                , minDate: 0   // 오늘 날짜 이후로 선택
            });
    		
    		$('#reserveBtn').on('click', function(){
    			
				let name = $('#name').val().trim();
				if(name==''){
					alert("이름을 적어주세요");
					return;
				}
				
				let date = $('#date').val().trim();
				if(date==''){
					alert("날짜를 입력해주세요");
					return;
				}
				
				let day = $('#day').val().trim();
				if(day==''){
					alert("숙박일수를 적어주세요");
					return;
				}
				
				let headcount = $('#headcount').val().trim();
				if(headcount==''){
					alert("숙박인원을 적어주세요");
					return;
				}
				
				let phoneNumber = $('#phoneNumber').val().trim();
				if(phoneNumber==''){
					alert("전화번호를 적어주세요");
					return;
				}
    			
				var yyyy = date.substr(0,4);
				var mm = date.substr(6,2);
				var dd = date.substr(10,2);
				
				var new_date = new Date(yyyy,mm-1,dd);
				
				$.ajax({
					type: 'post'
					, data: {'name' : name
							,'date' : new_date
							,'day' : day
							,'headcount':headcount
							,'phoneNumber':phoneNumber}
					, url:'/lesson06/insert_booking'
					, success: function(data){
						if(data == 'success'){
							location.href='/lesson06/reservation_list';
						} else{
							alert("서버에서 입력처리를 하지 못했습니다.");
						}
					}, error: function(e){
						alert("error : " + e);
					}
				});
    		});
    	});
    </script>
</html>