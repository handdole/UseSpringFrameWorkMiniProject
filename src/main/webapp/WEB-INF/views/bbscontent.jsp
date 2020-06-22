<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		/* $('#b1').click(function() {
			$.ajax({
				url : 'contentUpdate.do',
				data : {
					bbsnum : $('#bbsnum').val(),
				},
				success : function(result) {
					
				}
			})
		}) */
	})
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="bbs.do">게시판</a>
	</nav>
	<br>
	<br>
	<form action="bbs.do">
		<button class="btn btn-secondary my-2 my-sm-0"
			style="margin-left: 35%">목록</button>
	</form>
	<hr style="color: blue">
	<table border="1" style="margin-left: 35%;">
		<tr>
			<th>제목</th>
			<td style="font-size: 20px; border-right: 0"><b>&nbsp&nbsp&nbsp${bbsDTO.title}</b></td>
			<td style="border-left: 0;"  align="right"><c:if test="${bbsDTO.writer eq id}">
					<a href="contentUpdate.jsp?bbsnum=${bbsDTO.bbsnum}&title=${bbsDTO.title}&writer=${bbsDTO.writer}&content=${bbsDTO.content}"><button class="btn btn-secondary my-2 my-sm-0"
						>수정</button></a>
					<form action="content_delete.do" style="width: 60px;float: right">
					<input type="hidden" name="bbsnum" value='${bbsDTO.bbsnum}'>
					<button class="btn btn-secondary my-2 my-sm-0" id="b2">삭제</button>
					</form>
				</c:if></td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td style="border: 0">&nbsp&nbsp&nbsp${bbsDTO.writer}</td>
			<td style="text-align: right; border: 0">${bbsDTO.sigan}&nbsp&nbsp&nbsp</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="2" width="400" height="300">&nbsp&nbsp&nbsp${bbsDTO.content}</td>
		</tr>
	</table>
	<font style="margin-left: 35%">댓글</font>
	<hr>
	<table style="margin-left: 35%;">
	<c:forEach items="${reply_list}" var="dto" varStatus="status">
			<tr>				
				<td style="width: 100px; text-align: left" colspan="3">${dto.writer}</td>
			</tr>
			<tr>
				<td style="width: 255px; text-align: left">${dto.content}</td>
				<td style="width: 150px; text-align: center">${dto.sigan}</td>
				<td>
					<c:if test="${dto.writer eq id}">
					<form action="reply_delete.do">		
					<input type="hidden" name="replynum" value='${dto.replynum}'>		
					<input type="hidden" name="bbsnum" value='${dto.bbsnum}'>		
					<button class="btn btn-secondary my-2 my-sm-0">삭제</button>
					</form>	
				</c:if>
				</td>
			</tr>			
		</c:forEach>
	</table>
	<form action="reply.do">
	<input type="hidden" name="writer" value='${id}'>
	<input type="hidden" name="bbsnum" value='${bbsDTO.bbsnum}'>	
	<table style="margin-left: 35%">
		<tr>
			<td><input type="text" name="content" style="width: 400px"></td>
			<td><button class="btn btn-secondary my-2 my-sm-0">등록</button></td>
		</tr>
	</table>
	</form>
	<table border="1" style="margin-left: 35%;">
		<tr>
			<th></th>
			<th style="text-align: center">제목</th>
			<th style="text-align: center">글쓴이</th>
			<th style="text-align: center">작성일</th>
		</tr>
		<c:forEach items="${list}" var="dto" varStatus="status">
			<tr>
				<td style="width: 50px; text-align: center">${total-status.index}</td>
				<td style="width: 150px; text-align: center"><a
					href="content.do?bbsnum=${dto.bbsnum}">${dto.title}</a></td>
				<td style="width: 70px; text-align: center">${dto.writer}</td>
				<td style="width: 150px; text-align: center">${dto.sigan}</td>
			</tr>
		</c:forEach>
	</table>	
</body>
</html>