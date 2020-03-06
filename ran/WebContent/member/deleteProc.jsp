<%@page import="member.memberDAO"%>
<%@page import="member.memberBean"%>
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

	memberBean bean = new memberBean();
	memberDAO memberdao = new memberDAO();
	
	String id = (String)session.getAttribute("id");
	String pw1 = request.getParameter("pw1");
 	
 	int check = memberdao.deleteMember(id,pw1);
 		if(check==1){
 			session.invalidate();
%>
		<script>
			
			alert("회원 삭제 성공");
			location.href="../index.jsp";
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
 	
 		
%>

	
	
</body>
</html>