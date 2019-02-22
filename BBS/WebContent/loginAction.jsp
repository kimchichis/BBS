
<!--   실제함수를 사용해서 사용자에게 로그인 결과를 알려주는 페이지는 login action 페이지 jsp -->
<!-- 실질적으로 사용자릐 로그인을 처리하는 페이지  -->
<!-- DAO를 사용하여 처리 -->
<!-- login.jsp에 있는것을 복사하여 붙여넣기한후 사용 -->
<!-- 바디테그는 다 삭제  -->
<!--  부트스트랩 다 삭제  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import = "user,UserDAO" %> <!-- 만든  클래스  불러오기 -->
<%@  page import = "java.io.PrintWriter" %> <!--  자바스크립트 문장을 작성하기 위해 사용 -->
<%@ request.setCharactorEncoding("UTF-8"); %> <!--  불러오는 데이터를 utf-8으로 만듬 -->
<!-- user.java를 자바빈스로 사용 -->
<jsp:useBean id = "user" class = "user.User" scope = "page"/> <!--  현재 페이지 안에서만 빈즈사용가능하게 함 -->
<jsp:setProperty name="user" property = "userID"/> <!--로그인페이지에서  받아온 userID를  한명의 사용자의 userID에 넣어줌-->
<jsp:setProperty name="user" property = "userPassword"/> <!-- 페이지 안에 넘어온  ID,PW가 그대로 남도록 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
UserDAO userDAO = new UserDAO();
int result = userDAO.login(user.getUserID(),user.getUserPassword()); //로그인을  시도할수있도록, -2부터 1까지
if (result ==1 ) { //결과가 1일때, 비밀번호가 맞을때
	PrintWriter script = response.getWriter();
	script.println("<script>"); //스크립트 열고
	script.println("location.href = 'main.jsp'"); //로그인이 성공하면 메인으로 이동
    script.println("</script>"); //스크립트 닫기
	
	
} else if(result == -1 ) { //결과가 -1일때, 아이디가 존재하지 않을때 
	PrintWriter script = response.getWriter();
script.println("<script>"); //스크립트 열고
script.println("alert('아이디가 존재하지 않습니다.')"); 
script.println("history.back()"); //이전 페이지로 사용자를 돌려보냄, 여기서는 로그인페이지로 돌려보냄
script.println("</script>"); //스크립트 닫기


} else if(result ==-2 ) { //결과가 -2일때, 데이터베이스 오류
	PrintWriter script = response.getWriter();
script.println("<script>"); //스크립트 열고
script.println("alert('데이터베이스 오류가 발생했습니다.')"); 
script.println("history.back()"); //이전 페이지로 사용자를 돌려보냄, 여기서는 로그인페이지로 돌려보냄
script.println("</script>"); //스크립트 닫기


}
else if(result ==0 ) { //결과가 0일때, 비밀번호가 틀릴때
	PrintWriter script = response.getWriter();
script.println("<script>"); //스크립트 열고
script.println("alert('비밀번호가 틀립니다.')"); 
script.println("history.back()"); //이전 페이지로 사용자를 돌려보냄, 여기서는 로그인페이지로 돌려보냄
script.println("</script>"); //스크립트 닫기


}



%>



</body>
</html>