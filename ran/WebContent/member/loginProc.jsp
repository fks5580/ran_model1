<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="member.memberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="m" class="member.memberBean"/>
<jsp:useBean id="memberDAO" class="member.memberDAO"/>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	int check = memberDAO.userCheck(id, pw);
	
	if(check==1){
		
    	session.setAttribute("id", id);
		session.setAttribute("pw", pw);
%>
		<script>
		alert("로그인 성공");
		location.href="../index.jsp";
		</script>	
<%		
	}else if(check==0){
	
		
%>	
		<script>
		alert("비밀번호가 틀렸습니다.");
		history.back();
		</script>
		
<%			
		
	}else{
		
		%>
		<script>
		alert("아이디가 틀렸습니다.");
		history.back();
		</script>
		
<%		
	
	}
	
	
%>

