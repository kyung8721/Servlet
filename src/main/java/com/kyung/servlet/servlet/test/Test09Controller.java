package com.kyung.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test09")
public class Test09Controller extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String body = request.getParameter("body");
		
		out.println("<html><header><title>지원</title></header><body>");
		out.println("<h1>"+name+"님 지원이 완료되었습니다.</h1><hr>");
		out.println("<div>지원내용</div>");
		out.println("<div>" + body + "</div>");
		out.println("</body></html>");
	}
}
