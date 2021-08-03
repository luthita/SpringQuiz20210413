<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		<b>제목</b><br>
		<input type="text" id="name" class="form-control" placeholder="제목을 입력해주세요"><br>
		<b>주소</b><br>
		<input type="text" id="address" class="form-control" placeholder="주소를 입력해주세요"><br>
		<input type="submit" id="addBtn" class="btn btn-success" value="추가" >
	</div>
</body>

<script>
	$(document).ready(function(){
		$('#addBtn').on('click', function(e){
			
			// validation check
			let name = $('#name').val().trim();
			if(name == ''){
				alert("이름을 입력해주세요.");
				return;
			}
			
			let address = $('#address').val().trim();
			if(address == ''){
				alert("주소를 입력해주세요.");
				return;
			}
			$.ajax({
				type: "POST"
				, url: "/lesson06/quiz01/add_favorite"
				, data: {"name":name, "address":address}
				, success: function(data){
					location.href ="/lesson06/quiz01/favorite_list";
				}, complete: function(data){
					alert("완료");
				}, error: function(e){
					alert("error "+e);
				}
			});
		});
	});
</script>
</html>