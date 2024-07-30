<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>conversion</title>
<!-- bootstrap CDN link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%
		int cm = Integer.parseInt(request.getParameter("cm"));
		
		double in = cm * 0.393701;
		double yd = cm * 0.0109361;
		double ft = cm * 0.0328084;
		double m = cm * 0.01;
		
		String[] unitArray = request.getParameterValues("unit");
		List<String> unitList = new ArrayList<>(Arrays.asList(unitArray));
		
		//초반 내 버전
		/* 리스트 변환 후 사용
		String inHide = "";
		String ydHide = "";
		String ftHide = "";
		String mHide = "";
		
		if(unitList.contains("인치") == false){
			inHide = "d-none";
		}
		
		if(unitList.contains("야드") == false){
			ydHide = "d-none";
		}
		
		if(unitList.contains("피트") == false){
			ftHide = "d-none";
		}
		
		if(unitList.contains("미터") == false){
			mHide = "d-none";
		}
		*/
		
		//2차 내 버전
		//리스트 변환 후 사용
		String result = "";
		if(unitList.contains("인치")){
			result += in + "in<br>";
		}
		if(unitList.contains("야드")){
			result += yd + "yd<br>";
		}
		if(unitList.contains("피트")){
			result += ft + "ft<br>";
		}
		if(unitList.contains("미터")){
			result += m + "m";
		}
		
		//선생님 버전
		//리스트 변환하지 않고 사용
		/*
		for(int i;i<unitArray.length;i++){
			if(unitArray[i].equals("in")){
				double in = cm * 0.393701;
				result += in + "in<br>";
			} else if(unitArray[i].equals("yd")){
				double yd = cm * 0.0109361;
				result += yd + "yd<br>";
			} else if(unitArray[i].equals("ft")){
				double ft = cm * 0.0328084;
				result += ft + "ft<br>";
			} else if(unitArray[i].equals("m")){
				double m = cm * 0.01;
				result += m + "m";
			}
		}
		*/
	%>
	<div class="container">
		<h1>변환 결과</h1>
		<h3><%=cm %> cm</h3>
		<hr>
		<!-- 초반 내 버전 (오류나서 %=는 지움)
		<div class="< inHide %>"><h3><in %> in</h3></div>
		<div class="<ydHide %>"><h3><yd %> yd</h3></div>
		<div class="<ftHide %>"><h3><ft %> ft</h3></div>
		<div class="<mHide %>"><h3><m %> m</h3></div>
		  -->
		<!-- 2차 내 버전 -->
		<h3><%=result %></h3>
		
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>