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
	boardDAO boardDAO = new boardDAO();
	boardBean b = new boardBean();
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String writerpw = request.getParameter("writerpw");
	String content = request.getParameter("content");
    int main_seq = Integer.parseInt(request.getParameter("main_seq"));
 	int main_tab = Integer.parseInt(request.getParameter("main_tab"));
 	int sub_seq = Integer.parseInt(request.getParameter("sub_seq"));
 	int readcount = Integer.parseInt(request.getParameter("readcount"));
 
		b.setNo(no);
 		b.setTitle(title);
 		b.setWriter(writer);
 		b.setWriterpw(writerpw);
 		b.setContent(content);
 		b.setDate(new Timestamp(System.currentTimeMillis()));
 		b.setMain_seq(main_seq);
 		b.setMain_tab(main_tab);
 		b.setSub_seq(sub_seq);
 		b.setReadcount(readcount);
 		
 		int check = boardDAO.updateBoard(b);

		if(check == 1){
%>		
    	<script type="text/javascript">
    		alert("글 수정 성공");
    		location.href="questionOrder.jsp"; 
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




