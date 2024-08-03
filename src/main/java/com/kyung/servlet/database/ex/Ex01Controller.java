package com.kyung.servlet.database.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/db/ex/ex01")
public class Ex01Controller extends HttpServlet{
	 @Override
	 public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 response.setContentType("text/plain");
		 
		 PrintWriter out = response.getWriter();
		 
		 out.println("Hello World!!");
		 
		 
		 try {
			//데이터 베이스 접속
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			//접속주소, 포트, id, password
			String url = "jdbc:mysql://localhost:3306/dulmary";
			String id = "root";
			String password = "root";
			
			Connection connection = DriverManager.getConnection(url, id, password);
			Statement statement = connection.createStatement();
			
			//쿼리 불러오기
			String query = "SELECT * FROM `used_goods`;";
			ResultSet resultSet = statement.executeQuery(query);
			resultSet.next();
			
			//쿼리 불러온 후 출력
			while(resultSet.next()) {
				String title = resultSet.getString("title"); //원하는 컬럼의 타입대로 가져오면 됨
				int price = resultSet.getInt("price");
				String description = resultSet.getString("description");
				out.println("제목 : " + title + " 가격 : " + price + " 설명 : " + description);
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
}
