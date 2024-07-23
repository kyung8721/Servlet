package com.kyung.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test10")
public class Test10Controller extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String Id = request.getParameter("Id");
		String Pw = request.getParameter("Pw");
		
		
		out.println("<html><head><title>로그인</title></head><body>");
		
		if(!Id.equals(userMap.get("id"))) {
			//아이디가 일치하지 않음
			out.println("<h3>id가 일치하지 않습니다.</h3>");
		} else if(!Pw.equals(userMap.get("password"))) {
			//아이디는 일치했으나 비밀번호가 일치하지 않음
			out.println("<h3>password가 일치하지 않습니다.</h3>");
		} else {
			//아이디와 비밀번호 둘 다 일치
			out.println("<h2>" + userMap.get("name") + "님 환영합니다.</h2>");
		}
		out.println("</body></html>");
		
//		if(userMap.get("id") != Id) {
//			out.println("id가 일치하지 않습니다.");
//		} else if(userMap.get("password") != Pw) {
//			out.println("password가 일치하지 않습니다.");
//		} else {
//			out.println("<h2>" + userMap.get("name") + "님 환영합니다.</h2>");
//		}
//		out.println("</body></html>");
	}
	
	private final Map<String, String> userMap =  new HashMap<String, String>() {
	    {
	        put("id", "hagulu");
	        put("password", "asdf");
	        put("name", "김인규");
	    }
	};

}
