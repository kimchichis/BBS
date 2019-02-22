<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1"> <!-- 반응형 웹 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 외관 -->
<title>JSP 게시판 웹 사이트</title>
</head>
<body>

<nav class = "navbar navbar-defalut">
<div class = "navbar-header"> <!--  헤더는 웹페이지의 로고같은것을 담당 -->
<button type = "button" class = "navbar-toggle collapsed"
data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
aria-expanded ="false">
<span class ="icon-bar"></span>
<span class ="icon-bar"></span>
<span class ="icon-bar"></span>
</button>
<a class="navbar-brand" href = "main.jsp">JSP 게시판 웹사이트</a> <!--  brand는 로고같은것을 말함 -->
</div>
<div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
<ul class = "nav navbar-nav">
<li><a href = "main.jsp">메인</a></li>
<li><a href = "bbs.jsp">게시판</a></li>

</ul>
<ul class = "nav navbar-nav navbar-right"> 
<li class = "dropdown">
<a href = "#" class = "dropdown - toggle"
data-toggle = "dropdown" role ="button" aria-haspopup="true"
aria-expanded = "false">접속하기<span class = "caret"></span></a>
<ul class = "dropdown-menu">
<li class = "active"><a href = "login.jsp">로그인</a></li><!--  active는 현재 선택이 되었다는 의미 페이지당 하나만 사용가능-->

<li><a href = "join.jsp">회원가입</a></li>
</ul>
</li>
</ul>


</div>

</nav> <!-- nav는 하나의 웹사이트의 전반적인 구성을 보여주는 역할 -->
<div class = "container"></div>
<div class = "col-lg-4"></div>
<div class = "col-lg-4">
<div class = "jumbotron" style="padding-top: 20px;">
<form method = "post" action = "loginaction.jsp">
<h3 style="text-align: center;"> 로그인 화면</h3>  <!--  얼라인 센터는 가운데 정렬 -->
<div class = "form-group">
<input type ="text" class = "form-control" placeholder = "아이디"  name = "userID" maxlength = "20"><!-- 플레이스홀더는 아무것도 입력되지 않았을때 보이는 문구 -->

</div> 
<div class = "form-group">
<input type ="password" class = "form-control" placeholder = "비밀번호"  name = "userPassword" maxlength = "20">
</div>
<input type = "submit" class = "btn  btn-primary form-control" value = "로그인"><!--  로그인 버튼 -->



</form>



</div>


<div class = "col-lg-4"></div>

</div>






<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!--  동작 제이쿼리 -->
<script src="js./bootstrap.js"></script><!--동작 부트스트랩  -->

</body>
</html>