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
	String pwCheck = request.getParameter("pwCheck");
	String name = request.getParameter("name");
	String country = request.getParameter("country");
	String city = request.getParameter("city");
	String address = request.getParameter("address");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	
	if(id== "") {
%>		
		<script>
			alert("아이디 중복체크를 하세요");
			history.back();
		</script>
<%		
	}else if(pw=="" || pw.length() < 3 || pw.length() > 15) {
%>		
		<script>
			alert("비밀번호를 3자 이상 15자 이하로 입력하세요 ");
			history.back();
		</script>
<%	
	}else if(pwCheck.equals(pw)!=true){
%>
		<script>
			alert("비밀번호가 다릅니다. 다시 입력해주세요 ");
			history.back();
		</script>
<%	
	}else if(name=="") {
%>
		<script>
			alert("이름을 입력해주세요");
			history.back();
		</script>
<%
	}else{

		m.setId(id);
		m.setPw(pw);
		m.setPwCheck(pwCheck);
		m.setName(name);
		m.setCountry(country);
		m.setCity(city);
		m.setAddress(address);
		m.setAddress1(address1);
		m.setAddress2(address2);
		
		memberDAO.insertMember(m);
	}
%>
<script>
	alert("회원가입성공");
	location.href="../member/login.jsp";
</script>