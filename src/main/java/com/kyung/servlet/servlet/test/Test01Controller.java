package com.kyung.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test01Controller extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		Date today = new Date();
		
		SimpleDateFormat fomatter = new SimpleDateFormat("yyyy년 M월 d일");
		String dateTimeString = fomatter.format(today);
		
		out.println("오늘의 날짜는 " + dateTimeString);
	};
}
