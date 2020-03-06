<%@page import="replyboard.replyboardDAO"%>
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
	replyboardDAO replyboardDAO = new replyboardDAO();
	request.setCharacterEncoding("UTF-8");
    String id = (String)session.getAttribute("id");
    int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
    int reply_no = Integer.parseInt(request.getParameter("reply_no"));
    String reply_pw1 = request.getParameter("reply_pw1");
 	if(id == null){
 		response.sendRedirect("../member/login.jsp");
 	}else{	
 		int check = replyboardDAO.deletereplyBoard(no,reply_no,reply_pw1);
 		if(check==1){
%>
		<script>
			alert("댓글 삭제 성공");
			location.href="contentOrder.jsp?no=<%=no%>&pageNum=<%=pageNum%>";
		</script> 
<% 	
 		}else{
%>
 			<script>
 				alert("댓글 비밀번호 틀림");
 				history.back();
 			</script> 
 	<% 			
 		}
 	}
 		
%>

	


</body>
</html>





