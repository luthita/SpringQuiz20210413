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
                    <li class="nav-item"><a href="/lesson06/reservation" class="nav-link text-white font-weight-bold">예약하기</a></li>
                    <li class="nav-item"><a href="/lesson06/reservation_list" class="nav-link text-white font-weight-bold">예약목록</a></li>
                </ul>
            </nav>
            <section class="banner bg-info">
                <img id="bannerImage" src="/images/test06_banner1.jpg" alt="banner" width="1110px" height="500px">
            </section>
            <section class="reserve bg-primary d-flex">
                <section class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
                    <div class="display-4 text-white">실시간<br>예약하기</div>
                </section>
                <section class="confirm col-4">
                   
                    <!-- 아이디 비밀번호(비회원용)-->
                    <div id="nonMemberInputBox" class="m-2">
                    	<h3 class="text-white p-3">예약 확인</h3>
                        <div class="d-flex justify-content-end mr-3">
                            <span class="text-white">이름:</span>
                            <input type="text" id="name" class="form-control input-form">
                        </div>
                        <div class="d-flex mt-2 justify-content-end mr-3">
                            <span class="text-white">전화번호:</span>
                            <input type="text" id="phoneNumber" class="form-control input-form">
                        </div>
                  

                        <!-- 버튼 -->
                        <div class="text-right mt-3">
                            <button type="button" class="btn btn-success" id="submit-btn">조회 하기</button>
                        </div>
                    </div>
                </section>
                <section class="inquiry col-4 d-flex justify-content-center align-items-center">
                    <div class="text-white">
                        <h4 class="font-weight-bold">예약문의:</h4>
                        <h1>010-<br>0000-1111</h1>
                    </div>
                </section>
            </section>
            <footer>
                <div class="address m-3">
                    제주특별자치도 제주시 애월읍<br>
                    사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
                    Copyright 2025 tongnamu. All right reserved.
                </div>
            </footer>
        </div>

        <script>
            $(document).ready(function() {
                
               
                // 조회하기 버튼 클릭
                $('#submit-btn').on('click', function() {

                    let name = $('#name').val().trim();
                    if (name == '') {
                        alert("이름을 입력하세요");
                        return;
                    }

                    let phoneNumber = $('#phoneNumber').val().trim();
                    if (phoneNumber == '') {
                        alert("전화번호를 입력하세요");
                        return;
                    }

                   
                    // 전화번호가 010으로 시작하는지 확인
                    //-- 첫번째 방법
                    //var frontNumber = $('#phoneNumber').val().slice(0, 3);
                    //alert(frontNumber);
                    // if (frontNumber != '010') {
                    //     alert("010으로 시작하는 번호만 입력 가능합니다.");
                    //     return;
                    // }

                    //-- 두번째 방법
                    if (phoneNumber.startsWith('010') === false) {
                        alert("010으로 시작하는 번호만 입력 가능합니다.");
                        return;
                    }
                    
                   
                    $.ajax({
                    	type: 'post'
                    	, data: {'name' : name
                    			,'phoneNumber' : phoneNumber}
                    	, url: '/lesson06/search_booking'
                    	, success: function(data){
                    		if(data.result == 'success'){
                    			alert("이름 : " + data.data.name + "\n" +
                    					"날짜 : " + data.data.date + "\n" +
                    					"일수 : " + data.data.day + "\n" +
                    					"인원 : " + data.data.headcount + "\n" +
                    					"상태 : " + data.data.state);
                    		} else{
                    			alert("예약 내역이 없습니다.");
                    		}
                    	}, error: function(e){
                    		alert("error : " + e);
                    	}
                    });
                });

                // 이미지 3초 간격으로 변경하기

                var bannerSrcArr = ['/images/test06_banner1.jpg', '/images/test06_banner2.jpg', '/images/test06_banner3.jpg', '/images/test06_banner4.jpg'];
                var currentIndex = 0;
                setInterval(function() {
                    $('#bannerImage').attr('src', bannerSrcArr[currentIndex]);
                    currentIndex++;

                    if (currentIndex > bannerSrcArr.length) { // 인덱스 값이 배열의 크기를 넘으면 0으로(처음 이미지) 세팅
                        currentIndex = 0;
                    }
                }, 3000); // 3초에 한번씩 함수 실행

            });
        </script>
    </body>
</html>