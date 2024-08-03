package com.kyung.servlet.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MysqlService {
	
	//이 메소드 뿐만 아니라 다른 메소드에도 활용하기 위함
	private Connection connection;
	
	//클래스를 설계하는 입장에서
	//객체를 하나만 만들어서 공용으로 사용하도록 설계
	//Singleton(Design pattern)
	private static MysqlService mysqlService = null;
	
	// singleton 객체를 돌려주는 메소드
	// static : 객체 생성 없이 사용 가능한 메소드, 멤버 변수
	// static 메소드에서는 static 멤버변수만 사용 가능
	public static MysqlService getInstance() {
		
		if(mysqlService == null) {
			// 한번도 생성된 적 없다면 새로 객체 생성
			mysqlService = new MysqlService();
		} // 생성된 적이 없다면 원래 있던 객체 리턴
		return mysqlService;
	}

	
	// 접속
	public void connect() {
		try {
			//데이터 베이스 접속
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			//접속주소, 포트, id, password
			String url = "jdbc:mysql://localhost:3306/dulmary";
			String id = "root";
			String password = "root";
			
			connection = DriverManager.getConnection(url, id, password);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//select 쿼리 수행
	public List<Map<String, Object>> select(String query) {
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet =  statement.executeQuery(query);
			
			//밑에서 받아올 데이터를 저장할 리스트 생성
			List<Map<String, Object>> resultList = new ArrayList<>();
			
			//메타데이터를 불러오기 위한 준비
			ResultSetMetaData rsmd = resultSet.getMetaData();
			// resultSet의 총 개수를 반환해줌
			int columnCount = rsmd.getColumnCount();
			
			// 열 이름을 저장하기 위함
			List<String> columnNames = new ArrayList<>();
			
			for(int i = 1; i <= columnCount; i++) {
				columnNames.add(rsmd.getColumnName(i)); //컬럼이름 가져오기
			}
			
			// 컬럼 이름을 통해 값을 하나씩 얻어와서 
			// 한 행의 정보를 컬럼 단위로 맵에 추가
			while(resultSet.next()) {
				Map<String, Object> resultMap = new HashMap<>();
				
				for(String name:columnNames) {
					Object value = resultSet.getObject(name); // 각 행마다 값을 받아옴
					
					resultMap.put(name,  value); // 키:밸류 형식으로 값을 넣어줌(한 행 완성)
					
				}
				resultList.add(resultMap);
			}
			
			return resultList;
		} catch (SQLException e) {
			// 예외사항 발생시
			return null;
		}
	}
	
	// insert, update, delete 쿼리 수행
	public int update(String query) { // 몇 개의 행이 처리되었는지 리턴해주기 때문에 int 사용
		try {
			Statement statement = connection.createStatement();
			// 실행된 행의 개수 return
			return statement.executeUpdate(query);
		} catch (SQLException e) {

			return -1; // 제대로 실행된 경우 return 값이 양수겠지만, 오류가 나면 음소인 -1로 표현하여 오류가 났다는 걸 표시
		}
	}
	
	// 접속 끊기
	public void disconnect() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
