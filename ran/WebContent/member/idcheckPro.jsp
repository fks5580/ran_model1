<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	memberDAO mdao = new memberDAO();
	String id = request.getParameter("id");
	
	if(id== "" || id.length() < 3 || id.length() > 15){
%>
		<script>
			alert("아이디를 3자이상 15자 이하로 입력하세요.");
			location.href="idcheck.jsp";
		</script>
<%		
	}else if(mdao.idCheck(id)==1){
%>
		<script>
			alert("아이디가 존재합니다.");
			location.href="idcheck.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("아이디를 사용할 수있습니다.");
			location.href="idcheck.jsp?useid=<%=id%>";
		</script>
<%
	}
%>
