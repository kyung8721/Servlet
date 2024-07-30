<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		int number1 = Integer.parseInt(request.getParameter("number1"));
		String operator = request.getParameter("operator");
		int number2 = Integer.parseInt(request.getParameter("number2"));
		
		double result = 0.0;
		
		//선생님 버전 - add, minus, multi, div로 받아서 사용
		/*
		String sign = null;
		if(operator.equals("add")){
			result = number1 + number2;
			sign = "+";
		} else if(operator.equals("minus")){
			result = number1 - number2;
			sign = "-";
		} else if(operator.equals("multi")){
			result = number1 * number2;
			sign = "X";
		} else if(operator.equals("div")){
			result = number1 / (double)number2;
			sign = "/";
		}
		*/
		
		//내 버전
		switch(operator){
			case "+":
				result = number1 + number2;
				break;
			case "-":
				result = number1 - number2;
				break;
			case "X":
				result = number1 * number2;
				break;
			case "/":
				result = number1 / number2;
				break;
		}
		
	%>
	<div class="container">
		<h3>계산 결과</h3>
		<h1 class="d-flex"><%=number1 %> <%= operator %> <%= number2 %> = <div class="text-primary"><%=result %></div></h1>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>