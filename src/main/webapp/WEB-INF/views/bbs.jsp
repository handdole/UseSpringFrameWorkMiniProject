<%@page import="com.mega.bigmega708.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%
	/* Paging p_dto = new Paging();
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));
	int total = (Integer)(request.getAttribute("total"));
	p_dto.setTotalCount(total);
	p_dto.setPage(pageNo);  */
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="bbs.do">게시판</a>  
  <a class="btn btn-primary btn-lg"  href="mypage.do?id=${id}" role="button">회원정보수정</a>
  <a class="btn btn-primary btn-lg"  href="logout.do" role="button">로그아웃</a>
</nav>
<br>
<br>
<h4 style="margin-left: 35%">최신글 보기</h4>
<hr style="color: blue">
<table border="1" style="margin-left: 35%;">
<tr>
	<th></th>
	<th style="text-align: center">제목</th>
	<th style="text-align: center">글쓴이</th>
	<th style="text-align: center">작성일</th>
</tr>
<c:forEach items="${list}" var="dto" varStatus="status">
	<tr>
		<td style="width: 50px;text-align: center">${total-status.index}</td>
		<td style="width: 150px;text-align: center"><a href="content.do?bbsnum=${dto.bbsnum}">${dto.title}</a></td>
		<td style="width: 70px;text-align: center">${dto.writer}</td>
		<td style="width: 150px;text-align: center">${dto.sigan}</td>
	</tr>
</c:forEach>	
</table>
<form action="contentWrite.jsp">
<button class="btn btn-secondary my-2 my-sm-0" style="margin-left: 47%;">글쓰기</button>
<br>
<br>
</form>
<%-- <div style ="text-align: center;">
      <ul class= "pagination"  style="margin-left: 790px;">
      <li><h4><a href="bulletin.do?pageNo=<%=((pageNo/11)-1)*10 + 1%>"><</a></h4></li>
      <%
         for(int iCount = p_dto.getStartPage(); iCount <= p_dto.getEndPage(); iCount++){
            if(iCount == pageNo){
      %>
      
         <li class ="active"><h4><a href="bulletin.do?pageNo=<%=iCount%>" ><%=iCount %></a></h4></li>
      <%
            }else{
      %>      
         <li><h4><a href="bulletin.do?pageNo=<%=iCount%>" style ="color:black;"><%=iCount %></a></h4></li>      
      
      <%
            }
         }
      %>
      <li><h4><a href="bulletin.do?pageNo=<%=((pageNo/11)+1)*10 + 1%>">></a></h4></li>
      </ul>
      </div> --%>
</body>
</html>