package com.kyung.servlet.database.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kyung.servlet.common.MysqlService;

@WebServlet("/db/ex/ex02")
public class Ex02Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		// static 메소드 부르는 법
		MysqlService mysqlService = MysqlService.getInstance();
		
		//MysqlService mysqlService = new MysqlService();
		
		// 접속
		mysqlService.connect();
		
		// select 쿼리 수행
		List<Map<String, Object>> resultList = mysqlService.select("SELECT * FROM `used_goods`;");
		
		//이전 방식
//		try {
//			while(resultSet.next()) {
//				String title = resultSet.getString("title");
//				int price = resultSet.getInt("price");
//				
//				out.println("제목 : " + title + " 가격 : " + price);
//			}
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//		
		// 새로운 방식
		for(Map<String, Object> resultMap:resultList) {
			String title = (String)resultMap.get("title");
			int price = (Integer)resultMap.get("price");
			
			out.println("제목 : " + title + " 가격 : " + price);
		}
		
		
		// 실행하면 하는만큼 늘어남
		String query = "INSERT INTO `used_goods`\r\n"
				+ "(`sellerId`, `title`, `price`, `description`)\r\n"
				+ "VALUE\r\n"
				+ "(3, '고양이 간식 팝니다', 2000, '안 먹어서 팔아요');"; // ""미리 만들어두고 안에 문자열 넣으면 자바가 알아서 문법에 맞게 넣어줌
		
		int count = mysqlService.update(query);
		
		out.println("삽입 결과 : " + count);
	}
}
