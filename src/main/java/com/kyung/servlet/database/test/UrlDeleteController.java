package com.kyung.servlet.database.test;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kyung.servlet.common.MysqlService;

@WebServlet("/db/url/delete")
public class UrlDeleteController extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 삭제
		String id = request.getParameter("id");
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		String query = "DELETE FROM `url`\r\n"
				+ "	WHERE `id` = '" + id + "';";
		
		int count = mysqlService.update(query);
		
		response.sendRedirect("/db/test/test02.jsp");
	}
}
