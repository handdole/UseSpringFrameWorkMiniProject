<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="bbs.do">게시판</a>  
</nav>
<br>
<br>
<h4 style="margin-left: 35%">글쓰기</h4>
<hr style="color: blue">
<form action="bbsupdate.do">
<input type="hidden" name="bbsnum" value="${param.bbsnum}">
<input type="hidden" name="writer" value="${param.writer}">
<table style="margin-left: 35%;">
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" id="title" style="width: 420px;" value="${param.title}"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea style="resize: none;" rows="10" cols="57" name="content" id="content">${param.content}</textarea></td>
	</tr>	
</table>
<button type="submit" class="btn btn-secondary my-2 my-sm-0" style="margin-left: 47%">작성 완료</button>
</form>
</body>
</html>