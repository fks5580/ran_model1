<%@page import="board.boardDAO"%>
<%@page import="board.boardBean"%>
<%@page import="replyboard.replyboardBean"%>
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
<%
	boardBean b = new boardBean();
	boardDAO boardDAO = new boardDAO();
	request.setCharacterEncoding("UTF-8");
	String writerpw = request.getParameter("writerpw");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int main_seq = Integer.parseInt(request.getParameter("main_seq"));
    String id = (String)session.getAttribute("id");
 	if(id == null){
 		response.sendRedirect("../login.jsp");
 	}else{
 		b.setWriter(id);
 		b.setWriterpw(writerpw);
 		b.setTitle(title);
 		b.setContent(content);
 		b.setMain_seq(main_seq);
 		b.setDate(new Timestamp(System.currentTimeMillis()));
 		boardDAO.reInsertBoard(b);
%>
		<script>
		alert("글 작성 성공");
		location.href = "questionOrder.jsp";
		</script> 
<% 	
 	}
 		
%>

	


</body>
</html>





