<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap CDN link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%
		Date now = new Date();
		SimpleDateFormat dateformattor = new SimpleDateFormat("오늘 날짜 yyyy년 MM월 dd일");
		SimpleDateFormat timeformattor = new SimpleDateFormat("현재 시각 hh시 mm분 ss초");
		String Date = dateformattor.format(now);
		String Time = timeformattor.format(now);
		
		/* 내가 함
		String dateNone ="";
		String timeNone ="";
		if(request.getParameterMap().containsKey("time")){
			dateNone = "class = \"d-none\"";
		}
		if(request.getParameterMap().containsKey("date")){
			timeNone = "class = \"d-none\"";
		}
		*/
		
		//선생님이 함
		String what = request.getParameter("what");
		String result = "규격에 맞지 않은 파라미터";
		if(what.equals("date")){
			result = Date;
		} else if(what.equals("time")){
			result = Time;
		}
		
	%>
	
	<h1><%=result %></h1>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>