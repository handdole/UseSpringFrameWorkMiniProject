<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style type="text/css">
	#mainDiv{
		height: 780px;
	}
	#rowDiv{
		height: 100%;
	}
	#conDiv{
		height: 100%;
		padding-top: 80px;
		padding-bottom: 80px;
	}
	#logBtn{
		margin-left: 10%;
		margin-right : 10%;
		width: 250px;
	}
	#signBtn{
		margin-left: 10%;
		margin-right : 10%;
		width: 250px;
	}
</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(function() {
	$("#logBtn").click(function() {
		var idValue = $("#id").val();
		var pwValue = $("#pw").val();
		$.ajax({
			url : "login.do",
			data : {
				id : idValue ,
				pw : pwValue
			},
			success : function(result) {
				if (result == 1) {
					alert("로그인 완료!")
					location.href="bbs.do";
				} else {
					alert("로그인 실패!")
				}
			}
		})
	})
})
</script>
</head>
<body>
<div id="mainDiv" class="container">
  <div id="rowDiv" class="row">
    <div class="col-sm-1">
    </div>
    <div id="conDiv" class="col-sm-10">
    	<div style="height: 100%" class="jumbotron">
			  <h1 class="display-3">BIGMEGA708 커뮤니티</h1>
			  <p class="lead">신촌역 8번출구 앞 스파오 건물 7층에 있는 더조은 컴퓨터 아트학원 학생들만 사용가능한 시크릿 커뮤니티입니다.</p>
			  <hr class="my-4">
			  <div  class="form-group">
			      <label for="idview" style="margin-left:100px; float: left; padding-top: 10px; margin-right: 50px;">아이디</label>
			      <input type="text" style="width: 60%;" class="form-control" id="id" placeholder="아이디" >
			  </div>
			  <div style="margin-top: 35px;" class="form-group">
			      <label for="Password" style="margin-left:100px; float: left; padding-top: 10px; margin-right: 40px;">비밀번호</label>
			      <input type="password" style="width: 60%;" class="form-control" id="pw" placeholder="비밀번호">
		   	  </div>
			  <p style="margin-top: 60px;" class="lead">
			  	  <!-- AJAX로 login.do 연결 -->
			      <button class="btn btn-primary btn-lg" id="logBtn">로그인</button>
			      <a class="btn btn-primary btn-lg" id="signBtn" href="signin.jsp" role="button">회원 가입</a>
			  </p>
		</div>
    </div>
    <div class="col-sm-1">
    </div>
  </div>
</div>
</body>
</html>