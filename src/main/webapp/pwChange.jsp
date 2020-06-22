<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Insert title here</title>

<style type="text/css">
	#mainDiv{
		height: 800px;
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
		padding-left : 30px;
		font-size : 15px;
		width: 30%;
	}
	.rTd{
		padding-left : 30px;
		font-size : 15px;
		width: 70%;
	}
	#changeBtn{
		width: 300px;
	}
</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
var pwflag = 0;
$(function() {
	$("#newPw").keyup(function() {
		var count = $(this).val().length;
		if (count < 4) {
			$(this).attr('class','form-control is-invalid');
			$("#divNewPw").text("비밀번호는 4글자 이상이여야 합니다.")
		} else {
			$(this).attr('class','form-control is-valid');
			$("#divNewPw").attr('class','valid-feedback')
			$("#divNewPw").text("사용가능한 비밀번호 입니다.")
		}
	})
	$("#chPw").keyup(function() {
		var count = $(this).val().length;
		var pwValue = $("#newPw").val();
		var chpwValue = $(this).val();
		if (count >= 4) {
			if (pwValue == chpwValue) {
				$(this).attr('class','form-control is-valid');
				$("#divChPw").attr('class','valid-feedback')
				$("#divChPw").text("비밀번호가 확인되었습니다.")
				pwflag = 1
			} else {
				$(this).attr('class','form-control is-invalid');
				$("#divChPw").attr('class','invalid-feedback')
				$("#divChPw").text("비밀번호가 일치하지 않습니다.")
				pwflag = 0
			}
		}else {
			$(this).attr('class','form-control is-invalid');
			pwflag = 0
		}
	})
	$("#changeBtn").click(function() {
		var changePwValue = $("#newPw").val();
		var nowPwValue = $("#nowPw").val();
		if (pwflag==1) {
			$.ajax({
				url : "pwcheck.do",
				data : {
					id : '<%= session.getAttribute("id")%>' ,
					pw : nowPwValue
				},
				success : function(result) {
					if (result==1) {
						$.ajax({
							url : "pwupdate.do",
							data : {
								id : '<%= session.getAttribute("id")%>' ,
								pw : changePwValue
							},
							success : function(result) {
								if (result==1) {
									alert("비밀번호가 변경되었습니다.")
									window.close();
								} else {
									alert("비밀번호 변경에 문제가 있습니다")
								}
							}
						})
					} else {
						alert("현재 비밀번호가 일치하지 않습니다.")
					}
				}
			})
		} else {
			alert("새 비밀번호가 일치하지 않습니다.")
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
    		<h2 style="margin-left:30%;">비밀번호 변경</h2>
    		<table id="signInTable">
    			<tr>
    				<td class="lTd">현재 비밀번호</td>
    				<td class="rTd">
    					<input type="password" style="width: 80%; height: 50px;" class="form-control" id="nowPw" placeholder="현재 비밀번호" >
    					<div id="divNowPw" class="invalid-feedback"></div>
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">새 비밀번호</td>
    				<td class="rTd">
    					<input type="password" style="width: 80%; height: 50px;" class="form-control" id="newPw" placeholder="새 비밀번호">
    					<div id="divNewPw" class="invalid-feedback"></div>
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">새 비밀번호 확인</td>
    				<td class="rTd">
    					<input type="password" style="width: 80%; height: 50px;" class="form-control" id="chPw" placeholder="새 비밀번호 확인">
    					<div id="divChPw" class="invalid-feedback"></div>
    				</td>
    			</tr>
    			<tr>
    				<td colspan=2 style="padding-left: 20%">
    					<button class="btn btn-primary btn-lg" id="changeBtn">비밀번호 변경</button>
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