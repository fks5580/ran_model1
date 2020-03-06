<%@page import="replyboard.replyboardDAO"%>
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
	request.setCharacterEncoding("UTF-8");
	replyboardBean rb = new replyboardBean();
	replyboardDAO replyboardDAO = new replyboardDAO();
	int no = Integer.parseInt(request.getParameter("no"));
	int pageNum =Integer.parseInt(request.getParameter("pageNum"));
	String reply_writer = request.getParameter("reply_writer");
	String reply_pw = request.getParameter("reply_pw");
	String reply_content = request.getParameter("reply_content");
    String id = (String)session.getAttribute("id");
 	if(id == null){
 		response.sendRedirect("../member/login.jsp");
 	}else{
 		rb.setReply_writer(reply_writer);
 		rb.setNo(no);
 		rb.setReply_pw(reply_pw);
 		rb.setReply_content(reply_content);
 		rb.setReply_date(new Timestamp(System.currentTimeMillis()));
 		replyboardDAO.insertreplyBoard(rb);
%>
		<script>
			alert("댓글 작성 성공");
			location.href="contentOrder.jsp?no=<%=no%>&pageNum=<%=pageNum%>";
		</script> 
<% 	
 	}
 		
%>

	


</body>
</html>





