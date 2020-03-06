<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<div class="navbar-header">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbar-menu" aria-controls="navbars-rs-food"
		aria-expanded="false" aria-label="Toggle navigation">
		<i class="fa fa-bars"></i>
	</button>
	<a class="navbar-brand" href="../index.jsp"><img src="../images/logo.png"
		class="logo" alt=""></a>
		
	<%

			String id = (String)session.getAttribute("id");
			
				//session내장객체 영역에 아이디값이 존재 하지 않으면
				if(id == null){
			%>
			<div id="login">
			</div>
			<%				
				}else {//session영역에 값이 저장되어 있다면?
			%>
			<div id="login_header">
				<%=id %>님 로그인 중...&nbsp;&nbsp;&nbsp;
				<a href="../member/updateMember.jsp">회원정보 수정 &nbsp;&nbsp;&nbsp;</a>
				<a href="../member/logout.jsp">로그아웃</a>  
			</div>			
			<%		
				}
			%>   	
</div>