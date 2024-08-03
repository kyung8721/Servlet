package com.kyung.servlet.database.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kyung.servlet.common.MysqlService;

@WebServlet("/db/test/test01")
public class Test01Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		// static 메소드 부르는 법
		MysqlService mysqlService = MysqlService.getInstance();
		
		// 접속
		mysqlService.connect();
		
		//select 쿼리 수행
		List<Map<String, Object>> resultList = mysqlService.select("SELECT `address`, `area`, `type` FROM `real estate`;");
	
		for(Map<String, Object>resultMap:resultList) {
			String address = (String)resultMap.get("address");
			int area = (Integer)resultMap.get("area");
			String type = (String)resultMap.get("type");
			
			out.println("매물 주소 : " + address + ", 면적 : " + area + ", 타입 : " + type);
		}
		
		String query = "INSERT INTO `real estate`\r\n"
				+ "(`realtorId`, `address`, `area`, `type`, `price`)\r\n"
				+ "VALUE\r\n"
				+ "(3, '헤라펠리스 101동 5305호', 350, '매매', 1500000);";
		
		int count = mysqlService.update(query);
		
		
	}
}
