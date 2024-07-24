<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Arrays" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 점수들의 평균 구하기</h2>
	<%
		int[] scores = {80, 90, 100, 95, 80};
		int sum = 0;
		for(int i:scores){
			sum += i;
		}
		float average = sum / scores.length;
	%>
	점수 평균은 <%= average %>입니다.
	
	<h2>2. 채점결과</h2>
	<%
		List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
		int score = 0;
		for(String s:scoreList){
			if(s == "O"){
				score += 10;
			}
		}
	%>
	채점 결과는 <%= score %>점 입니다.
	
	<h2>3. 1부터 n까지의 합계를 구하는 함수</h2>
	<%!
		public int SumtoN(int n){
			int sum = 0;
			for(int j = 1 ; j <= n ; j++){
				sum += j;
			}
			return sum;
		}
	%>
	
	1에서 50까지의 합은 <%= SumtoN(50) %>
	
	<h2>4. 나이 구하기</h2>
	<%
		String birthDay = "20010820";
		int year = Integer.parseInt(birthDay.substring(0,4));
		int age = 2024 - year + 1;
	%>
	
	20010820의 나이는 <%=age %>살 입니다.
</body>
</html>