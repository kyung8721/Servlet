package com.kyung.servlet.database.test;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kyung.servlet.common.MysqlService;


@WebServlet("/db/url/insert")
public class UrlInsertController extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		//추가
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		String query = "INSERT INTO `url`\r\n"
				+ "(`name`, `url`)\r\n"
				+ "VALUE\r\n"
				+ "('"+ name +"', '"+ url +"');";
		
		int count = mysqlService.update(query);
		
		response.sendRedirect("/db/test/test02.jsp");
	}
}
