
//로그인 기능 구현

// 실제함수를 사용해서 사용자에게 로그인 결과를 알려주는 페이지는 login action 페이지 jsp
package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {   //dao db 연동매체 

	private Connection conn;  // db 연동
	private PreparedStatement pstmt;
	private ResultSet rs;  // db 입력개체
	
	
	public UserDAO() {  //try 는 자동으로 db연결 가능하게
		try {
			String dbURL ="jdbc;mysql://localhost:3306/BBS"; // 로컬계정안에 해당  db 
			String dbID = " "; //루트계정 접속 "" 안에는 햬당 아이디 입력
			String dbPassword = " "; // 루트계정 비번입력가능하게 ""안에는 해당 비번 입력
		    Class.forName("com.mysql.jdbc.Driver"); // mysql  드라이버를 찾을수 있게함, 드라이버란 mysql 접속가능하게하는 라이브러리
conn = DriverManager.getConnection(dbURL,dbID,dbPassword);// ()안에 있는것을 이용하여 db접속 가능하게
		    
		}catch (Exception e) { //e 라는 오류가 발생하였을경우 예외처리
			 e.printStackTrace();  // 오류가 무엇인지 출력가능하게
		}
	}
	public int login(String userID, String userPassword) { //로그인을 시도하는 함수
	String SQL = "SELECT userPassword FROM user WHERE userID = ?";  //db에 입력할 문장을 sql로 만듬 , 테이블에서 해당사용자의 정보 가져오도록
   try {
	   pstmt = conn.prepareStatement(SQL); //pstmt에 정해진  sql문장을 삽입하는
	   pstmt.setString(1, userID);   // pstmt는  sql인젝션 해킹기법을 방어하기 위해 사용
rs = pstmt.executeQuery(); //실행한 결과
if (rs.next()) {
	if(rs.getString(1).equals(userPassword)) {
		return 1; //로그인 성공  //sql문장을 실행해서 나오는 결과와  접속을 시도했던 정보가 일치한다면  1을 반환함으로써  함수를 종료하고 로그인성공을 알림
	}
	else return 0; //그렇지 않으면 비밀번호 불일치를 알려줌
}

   return -1; //아이디가 없음
   } catch (Exception e) {
	   // 예외처리
	   e.printStackTrace(); //오류내용 출력
   }
   return -2; //데이터베이스 오류를 의미
	
	}
	
	
	
}
