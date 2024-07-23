package com.kyung.servlet.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex01Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// response header : 응답 데이터에 대한 정보
		// character set : utf-8
		response.setCharacterEncoding("utf-8");
		// 데이터 타입
		// MIME
		// text/plain : 그냥 문자열
		// 이거에 따라서 화면을 보여주므로 오타 없이. 이상한거 주면 다운로드하게 해버림
		response.setContentType("text/plain");
		
		// 응답에 대한 결과물 : response body
		// PrintWriter : println 쓸 수 있게 해줌
		PrintWriter out = response.getWriter();
		out.println("URL Mapping 예제");
		
		// 현재 날짜 시간 response에 담기
		Date now = new Date();
		out.println(now);
		
		// 날짜 형태 바꾸기
		// 2024년 07월 17일 21:28:30
		//24시간 기준: HH 12시간 기준 : hh
		// month와 minute 구변 위해 MM, mm 사용
		SimpleDateFormat fomatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		
		String dateTimeString = fomatter.format(now);
		
		out.println(dateTimeString);
		// http status code보고 에러가 어디서 났는지 찾을 수 있음
	};
	
	
}
