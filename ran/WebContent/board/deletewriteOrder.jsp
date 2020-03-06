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
    String id = (String)session.getAttribute("id");
    int no = Integer.parseInt(request.getParameter("no"));
    String writerpw1 = request.getParameter("writerpw1");
 	if(id == null){
 		response.sendRedirect("../member/login.jsp");
 	}else{	
 		int check = boardDAO.deleteBoard(no,writerpw1);
 		if(check==1){
%>
		<script>
			alert("글 삭제 성공");
			location.href="questionOrder.jsp";
		</script> 
<% 	
 		}else{
 			%>
 			<script>
 				alert("비밀번호 틀림");
 				history.back();
 			</script> 
 	<% 			
 		}
 	}
 		
%>

	


</body>
</html>





