<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="b" class="board.boardBean"/>
<jsp:useBean id="boardDAO" class="board.boardDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String writerpw = request.getParameter("writerpw");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
    String id = (String)session.getAttribute("id");
 	if(id == null){
 		response.sendRedirect("../member/login.jsp");
 	}else{
 		b.setWriter(id);
 		b.setWriterpw(writerpw);
 		b.setTitle(title);
 		b.setDate(new Timestamp(System.currentTimeMillis()));
 		b.setContent(content);
 		boardDAO.insertBoard(b);
%>
		<script>
			alert("글 작성 성공");
			location.href="questionOrder.jsp";
		</script> 
<% 	
 	}
 		
%>

	


</body>
</html>





