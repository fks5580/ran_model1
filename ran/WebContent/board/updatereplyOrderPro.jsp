<%@page import="replyboard.replyboardBean"%>
<%@page import="replyboard.replyboardDAO"%>
<%@page import="board.boardDAO"%>
<%@page import="board.boardBean"%>
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
	replyboardDAO replyboardDAO = new replyboardDAO();
	replyboardBean rBean = new replyboardBean();
	int no = Integer.parseInt(request.getParameter("no"));
	int reply_no = Integer.parseInt(request.getParameter("reply_no"));
	String reply_writer = request.getParameter("reply_writer");
	String reply_pw = request.getParameter("reply_pw");
	String pageNum = request.getParameter("pageNum");
	String reply_writerpw = request.getParameter("reply_pw");
	String reply_content = request.getParameter("reply_content");
 
		rBean.setNo(no);
		rBean.setReply_no(reply_no);
		rBean.setReply_pw(reply_pw);
		rBean.setReply_writer(reply_writer);
		rBean.setReply_content(reply_content);
		rBean.setReply_date(new Timestamp(System.currentTimeMillis()));

 		int check = replyboardDAO.updateReply(rBean);

		if(check == 1){
%>		
    	<script type="text/javascript">
    		alert("댓글 수정 성공");
    		location.href="contentOrder.jsp?no=<%=no%>&pageNum=<%=pageNum%>";
    	</script>
<%		 
    	}else{
%>
    	<script type="text/javascript">
    		alert("비밀번호 틀림");
    		history.back();
    	</script>
    <%	
    	}
    %>


	


</body>
</html>




