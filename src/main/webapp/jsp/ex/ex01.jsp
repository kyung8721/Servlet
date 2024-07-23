<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 문법</title>
</head>
<body>
<!-- 링크 형식: webapp 뒤 경로 그대로 -->
	<%--jsp 자체 주석 - 페이지 소스 보기에서는 보이지 않음--%>
	<h2>1. 기본 문법</h2>
	<%--스크립트릿 --%>
	<%
		// 주석 가능
		// 1부터 10까지 합 구하기
		int sum = 0;
		for(int i = 0; i <= 10 ; i++){
			sum += i ;
		}
		
	%>
	<h2>합계 : <%= sum %></h2>
	<input type = "text" value="<%=sum %>"> <!-- 문자열 사이에도 끼워 넣을 수 있다, html과 아무런 관계도 없음 -->
	<div><%=sum*2 %></div>
	
	<h2>2. 리스트 다루기</h2>
	<%
		//동물이름 리스트
		List<String> animalList = new ArrayList<>(); //import해야되는건 수동으로 지시어 형태로 넣어줘야함
		animalList.add("cat");
		animalList.add("dog");
	%>
	
	<ul>
		<li><%=animalList.get(0) %></li>
		<li><%=animalList.get(1) %></li>
	</ul>
	
	<h3>3. 메소드 만들기</h3>
	<%!
	//선언부
	//Hello World를 문자열로 리턴하는 메소드
	public String getHelloWorld(){
		return "Hello World";
	}
	
	%>
	<h4><%= getHelloWorld() %></h4>
	
</body>
</html>