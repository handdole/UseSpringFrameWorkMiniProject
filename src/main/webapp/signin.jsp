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
		height: 1400px;
	}
	#rowDiv{
		height: 100%;
	}
	#conDiv{
		height: 100%;
		padding-top: 80px;
		padding-bottom: 80px;
	}
	#logbtn{
		margin-left: 10%;
		margin-right : 10%;
		width: 250px;
	}
	#signbtn{
		margin-left: 10%;
		margin-right : 10%;
		width: 250px;
	}
	#signInTable{
		
		margin-top : 30px;
		width: 100%;
		height: 90%;
	}
	.lTd{
		padding-left : 35px;
		font-size : 20px;
		width: 30%;
	}
	.rTd{
		padding-left : 30px;
		font-size : 20px;
		width: 70%;
	}
	#signInBtn{
		width: 300px;
	}
</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
var idflag = 0;
var pwflag = 0;
var quizflag = 0;


function popup(){
    var url = "juso.jsp";
    var name = "juso";
    var option = "width = 800, height = 800, top = 100, left = 200, location = no scrollbars = yes"
    window.open(url, name, option);
}
$(function() {
	$("#id").keyup(function() {
		/* 4글자 이하일 경우를 체크하기 위해 input값의 문자열 개수 count로 변수화 */
		var count = $(this).val().length;
		/* 글자수가 4개 미만일 때 */
		if (count < 4) {
			$(this).attr('class','form-control is-invalid');
			$("#divId").text("아이디는 4글자 이상이여야 합니다.")
			idflag = 0;
		}
		/* 글자수가 4개 이상일 때 */
		else {
			var idValue = $(this).val();
			$.ajax({
				url : "idcheck.do",
				data : {
					id : idValue
				}
				,
				success : function(result) {
					var resultValue = result;
					console.log(resultValue);
					if (resultValue == 1) {
						$("#id").attr('class','form-control is-valid');
						$("#divId").attr('class','valid-feedback');
						$("#divId").text("멋진 아이디 군요!!");
						idflag = 1;
						resultValue = 0;
					} else {
						$("#id").attr('class','form-control is-invalid');
						$("#divId").attr('class','invalid-feedback');
						$("#divId").text("누군가 사용하고 있는 아이디 입니다.");
						idflag = 0;
					}
				}
			})
			
		}
	})
	$("#pw").keyup(function() {
		var count = $(this).val().length;
		if (count < 4) {
			$(this).attr('class','form-control is-invalid');
			$("#divPw").text("비밀번호는 4글자 이상이여야 합니다.")
		} else {
			$(this).attr('class','form-control is-valid');
			$("#divPw").attr('class','valid-feedback')
			$("#divPw").text("사용가능한 비밀번호 입니다.")
		}
	})
	$("#chPw").keyup(function() {
		var count = $(this).val().length;
		var pwValue = $("#pw").val();
		var chpwValue = $(this).val();
		if (count >= 4) {
			if (pwValue == chpwValue) {
				$(this).attr('class','form-control is-valid');
				$("#divChpw").attr('class','valid-feedback')
				$("#divChpw").text("비밀번호가 확인되었습니다.")
				pwflag = 1;
			} else {
				$(this).attr('class','form-control is-invalid');
				$("#divChpw").attr('class','invalid-feedback')
				$("#divChpw").text("비밀번호가 일치하지 않습니다.")
				pwflag = 0;
			}
		}else {
			$(this).attr('class','form-control is-invalid');
		}
	})
	/* 회원가입 버튼 누르면 정보 누락확인하고 퀴즈 맞는지 확인하고 
		AJAX로 DB처리 */
	$("#signInBtn").click(function() {
		var idValue = $("#id").val();
		var pwValue = $("#pw").val();
		var nameValue = $("#name").val();
		var telValue = $("#tel").val();
		var addrValue = $("#addr").val();
		var quizValue = $("#quiz").val();
		if (quizValue == "임정원") {
			quizflag = 1;
		}
		else{
			quizflag = 0;
		}
		if (idValue == "" || pwValue == "" || nameValue == "" || telValue == "" || addrValue == "") {
			alert("모든 값을 입력해주시길 바랍니다.")
		} else {
			if (idflag == 1 && pwflag == 1 && quizflag == 1) {
				$.ajax({
					url : "insert.do",
					data : {
						id : idValue ,
						pw : pwValue ,
						name : nameValue ,
						tel : telValue , 
						addr : addrValue
					},
					success : function(result) {
						var resultValue = result
						if (resultValue == 1) {
							alert("회원가입 완료!");
							location.href='login.jsp';
						} 
					}
				})
			}else {
				if (idflag == 0) {
					alert("아이디를 다시 입력해주세요.")
				}
				else if(pwflag == 0){
					alert("비밀번호 확인이 필요합니다.")
				}
				else if(quizflag == 0){
					alert("가입질문 정답이 틀렸습니다.")
				}
			}
		}
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
    		<h1 style="margin-left: 35%;" class="display-3">회원가입</h1>
    		<table id="signInTable">
    			<tr>
    				<td class="lTd">아이디</td>
    				<td class="rTd">
    					<input type="text" style="width: 80%; height: 50px;" class="form-control" id="id" placeholder="아이디" >
    					<div id="divId" class="invalid-feedback"></div>
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">비밀번호</td>
    				<td class="rTd">
    					<input type="password" style="width: 80%; height: 50px;" class="form-control" id="pw" placeholder="비밀번호">
    					<div id="divPw" class="invalid-feedback"></div>
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">비밀번호 확인</td>
    				<td class="rTd">
    					<input type="password" style="width: 80%; height: 50px;" class="form-control" id="chPw" placeholder="비밀번호">
    					<div id="divChpw" class="invalid-feedback"></div>
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">이름</td>
    				<td class="rTd">
    					<input type="text" id="name" placeholder="이름" style="width: 80%; height: 50px;" class="form-control"  >
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">전화번호</td>
    				<td class="rTd">
    					 <select style="margin-bottom:30px; width: 30%; height: 50px" class="form-control" id="exampleSelect1">
					        <option>SKT</option>
					        <option>KT</option>
					        <option>LG</option>
					    </select>
    					<input type="text" id="tel" placeholder="전화번호" style="float: left; width: 60%; height: 50px;" class="form-control"  >
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">주소</td>
    				<td class="rTd">
    					<a href="javascript:popup()">주소찾기</a>
    					<input type="text" id="addr" placeholder="상세주소" style="margin-top:30px; width: 80%; height: 40px;" class="form-control"  >
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">[가입 질문]</td>
    				<td class="rTd">
    					<input type="text" id="quiz" placeholder="708호 강사님의 성함은?" style="width: 80%; height: 40px;" class="form-control"  >
    				</td>
    			</tr>
    			<tr>
    				<td colspan=2 style="padding-left: 35%">
    					<button class="btn btn-primary btn-lg" id="signInBtn">회원가입</button>
    				</td>
    			</tr>
    		</table>
		</div>
    </div>
    <div class="col-sm-1">
    </div>
  </div>
</div>
</body>
</html>