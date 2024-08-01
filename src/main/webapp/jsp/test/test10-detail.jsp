<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노래</title>
<!-- bootstrap CDN link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="style-test10.css">
</head>
<body>
	<%
		// 아티스트 정보 
	    Map<String, Object> artistInfo = new HashMap<>();
	    artistInfo.put("name", "아이유");
	    artistInfo.put("debute", 2008);
	    artistInfo.put("agency", "EDAM엔터테인먼트");
	    artistInfo.put("photo", "https://musicmeta-phinf.pstatic.net/artist/000/112/112579.jpg?type=ff300_300");
	
	
		// 아이유 노래 리스트 
	    List<Map<String, Object>> musicList = new ArrayList<>();
	
	    Map<String, Object> musicInfo = new HashMap<>();
	    musicInfo.put("id", 1);
	    musicInfo.put("title", "팔레트");
	    musicInfo.put("album", "Palette");
	    musicInfo.put("singer", "아이유");
	    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/002/000/2000240.jpg?type=r360Fll");
	    musicInfo.put("time", 217);
	    musicInfo.put("composer", "아이유");
	    musicInfo.put("lyricist", "아이유");
	    musicList.add(musicInfo);
	
	    musicInfo = new HashMap<>();
	    musicInfo.put("id", 2);
	    musicInfo.put("title", "좋은날");
	    musicInfo.put("album", "Real");
	    musicInfo.put("singer", "아이유");
	    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/000/184/184117.jpg?type=r360Fll");
	    musicInfo.put("time", 233);
	    musicInfo.put("composer", "이민수");
	    musicInfo.put("lyricist", "김이나");
	    musicList.add(musicInfo);
	
	    musicInfo = new HashMap<>();
	    musicInfo.put("id", 3);
	    musicInfo.put("title", "밤편지");
	    musicInfo.put("album", "palette");
	    musicInfo.put("singer", "아이유");
	    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/002/000/2000240.jpg?type=r360Fll");
	    musicInfo.put("time", 253);
	    musicInfo.put("composer", "제휘,김희원");
	    musicInfo.put("lyricist", "아이유");
	    musicList.add(musicInfo);
	
	    musicInfo = new HashMap<>();
	    musicInfo.put("id", 4);
	    musicInfo.put("title", "삐삐");
	    musicInfo.put("album", "삐삐");
	    musicInfo.put("singer", "아이유");
	    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/002/559/2559408.jpg?type=r360Fll");
	    musicInfo.put("time", 194);
	    musicInfo.put("composer", "이종훈");
	    musicInfo.put("lyricist", "아이유");
	    musicList.add(musicInfo);
	
	    musicInfo = new HashMap<>();
	    musicInfo.put("id", 5);
	    musicInfo.put("title", "스물셋");
	    musicInfo.put("album", "CHAT-SHIRE");
	    musicInfo.put("singer", "아이유");
	    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/000/592/592471.jpg?type=r360Fll");
	    musicInfo.put("time", 194);
	    musicInfo.put("composer", "아이유,이종훈,이채규");
	    musicInfo.put("lyricist", "아이유");
	    musicList.add(musicInfo);
	
	    musicInfo = new HashMap<>();
	    musicInfo.put("id", 6);
	    musicInfo.put("title", "Blueming");
	    musicInfo.put("album", "Love poem");
	    musicInfo.put("singer", "아이유");
	    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/003/399/3399860.jpg?type=r360Fll");
	    musicInfo.put("time", 217);
	    musicInfo.put("composer", "아이유,이종훈,이채규");
	    musicInfo.put("lyricist", "아이유");
	    musicList.add(musicInfo);
	    
	    String musicName = request.getParameter("musicName");
	%>
	
	<div id="wrap" class="mt-5">
		<header class="d-flex align-items-center">
			<h2 class="text-success">Melong</h2>
			<input type="text" class="form-control col-4 ml-4">
			<button type="button" class="btn btn-info">검색</button>
		</header>
		
		<nav class="d-flex align-items-center">
			<ul class="nav">
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">멜롱차트</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">최신음악</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">장르음악</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">멜롱DJ</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">뮤직어워드</a></li>
			</ul>
		</nav>
		
		<div>
			<h2>곡 정보</h2>
		</div>
		
		<section class="section3 border border-success border-2 d-flex">
		<%for(Map<String, Object>music:musicList){
			if(music.get("title").equals(musicName)){
			%>
			<div class="imageSection2 d-flex justify-content-center align-items-center">
				<img src="<%=music.get("thumbnail") %>" class="w-75">
			</div>
			<div class="pl-2 w-100">
				<div class="h-50 pt-4">
					<h1><%=music.get("title") %></h1>
					<p class="text-success font-weight-bold"><%=music.get("singer") %></p>
				</div>
				<div class="h-50 w-25">
					<table class="table table-borderless table-sm">
						<tbody>
							<tr>
								<td>앨범</td>
								<td><%=music.get("album") %></td>
							</tr>
							<tr>
								<td>재생시간</td>
								<% int minute = ((Integer)music.get("time"))/60;
									int second = ((Integer)music.get("time"))%60;
								%>
								<td><%=minute %>:<%=second %></td>
							</tr>
							<tr>
								<td>작곡가</td>
								<td><%=music.get("composer")%></td>
							</tr>
							<tr>
								<td>작사가</td>
								<td><%=music.get("lyricist") %></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<%}} %>
		</section>
		
		<section class="section2">
			<h1 class="mt-2">가사</h1>
			<hr>
			<p>가사 정보 없음
			
		</section>
		
		
		<footer>
			<hr>
			<div class="text-muted">
				Copyright 2021. marongdal All right Reserved
			</div>
		</footer>
	</div>



	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>