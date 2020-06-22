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
		padding-left : 35px;
		font-size : 20px;
		width: 30%;
	}
	.rTd{
		padding-left : 30px;
		font-size : 20px;
		width: 70%;
	}
	#delBtn{
		width: 200px;
		margin-right: 30px;
	}
	#backBtn{
		width: 200px;
		margin-right: 30px;
	}
</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
var pwflag = 0;
$(function() {
	$("#pw").keyup(function() {
		var count = $(this).val().length;
		if (count < 4) {
			$(this).attr('class','form-control is-invalid');
			$("#divPw").text("비밀번호는 4글자 이상이여야 합니다.")
		} else {
			$(this).attr('class','form-control is-valid');
			$("#divPw").attr('class','valid-feedback')
			$("#divPw").text("비밀번호 입력을 완료하셨습니다.")
		}
	})
	$("#pwCh").keyup(function() {
		var count = $(this).val().length;
		var pwValue = $("#pw").val();
		var chpwValue = $(this).val();
		if (count >= 4) {
			if (pwValue == chpwValue) {
				$(this).attr('class','form-control is-valid');
				$("#divPwCh").attr('class','valid-feedback')
				$("#divPwCh").text("비밀번호가 확인되었습니다.")
				pwflag = 1
			} else {
				$(this).attr('class','form-control is-invalid');
				$("#divPwCh").attr('class','invalid-feedback')
				$("#divPwCh").text("비밀번호가 일치하지 않습니다.")
				pwflag = 0
			}
		}else {
			$(this).attr('class','form-control is-invalid');
			pwflag = 0
		}
	})
	$("#delBtn").click(function() {
		var pwValue = $("#pw").val();
		if (pwflag==1) {
			$.ajax({
				url : "pwcheck.do",
				data : {
					id : '<%=session.getAttribute("id")%>',
					pw : pwValue
				},
				success : function(result) {
					/* 비밀번호가 확인되었을 때 */
					if (result==1) {
						$.ajax({
							url : "delete.do",
							data : {
								id : '<%=session.getAttribute("id")%>'
							},
							success : function(result) {
								if (result==1) {
									alert("회원탈퇴하셨습니다. 그 동안 이용해주셔서 감사합니다.")
									
									location.href="login.jsp";
								}else {
									alert("실패하셨습니다.")
								}
							}
						})
					} 
					/* 비밀번호가 일치하지 않았을 때 */
					else {
						alert("비밀번호가 일치하지 않습니다. 다시 시도하시길 바랍니다.");
					}
				}
			})
		} else {
			alert("비밀번호를 확인해주세요")
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
    					${id}
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">비밀번호</td>
    				<td class="rTd">
    					<input type="password" style="width: 80%; height: 50px;" class="form-control" id="pw" placeholder="비밀번호" >
    					<div id="divPw" class="invalid-feedback"></div>
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">비밀번호 확인</td>
    				<td class="rTd">
    					<input type="password" style="width: 80%; height: 50px;" class="form-control" id="pwCh" placeholder="비밀번호 확인">
    					<div id="divPwCh" class="invalid-feedback"></div>
    				</td>
    			</tr>
    			<tr>
    				<td colspan=2 style="padding-left: 25%">
    					<button class="btn btn-primary btn-lg" id="delBtn">회원탈퇴</button>
    					<a class="btn btn-primary btn-lg" id="backBtn" href="mypage.do?id=${id}" role="button">뒤로가기</a>
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