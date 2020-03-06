<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<form action="idcheckPro.jsp" method="post">
	아이디 : <input type="text" id="id" name="id" value="">
	<input type="submit" class="btn" value="중복확인">
	<input type="button" class="btn" id="use" value="아이디사용" onclick="sendid()">
	<div id="insertbtn"></div>
</form>

<script>
	document.getElementById("id").value = "<%=request.getParameter("useid")%>";

	if(<%=request.getParameter("useid")%>==null){
		document.getElementById("id").value = "";
		document.getElementById("use").style.visibility = "hidden";
	}
	
	function sendid(){
		opener.document.getElementById("id").value = document.getElementById("id").value;
		window.close();	
	}
</script>