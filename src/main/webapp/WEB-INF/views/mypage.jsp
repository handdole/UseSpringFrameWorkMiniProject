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
	#updateBtn{
		width: 200px;
		margin-right: 30px;
	}
	#pwChangeBtn{
		width: 200px;
		margin-right: 30px;
	}
	#delBtn{
		width: 200px;
		margin-right: 30px;
	}
</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$.ajax({
	url : "mypage.do",
	data : {
		id : '<%=session.getAttribute("id")%>'
	},
	success : function() {
	}
})
function pwChange() {
	var url = "pwChange.jsp?id=${id}";
    var name = "pwChange";
    var option = "width = 800, height = 600, top = 100, left = 200, location = no scrollbars = yes"
    window.open(url, name, option);
}
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
    					${dto.id}
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">이름</td>
    				<td class="rTd">
    					${dto.name}
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">전화번호</td>
    				<td class="rTd">
    					${dto.tel}
    				</td>
    			</tr>
    			<tr>
    				<td class="lTd">주소</td>
    				<td class="rTd">
    					${dto.addr}
    				</td>
    			</tr>
    			<tr>
    				<td colspan=2 >
    					<a class="btn btn-primary btn-lg" id="updateBtn" href="myPfUpdate.jsp?id=${id}" role="button">회원정보수정</a>
    					<a class="btn btn-primary btn-lg" id="pwChangeBtn" href="javascript:pwChange()" role="button">비밀번호 변경</a>
    					<a class="btn btn-primary btn-lg" id="delBtn" href="memberDel.jsp" role="button">회원 탈퇴</a>
    					<a class="btn btn-primary btn-lg" id="backBtn" href="bbs.do" role="button">뒤로가기</a>
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