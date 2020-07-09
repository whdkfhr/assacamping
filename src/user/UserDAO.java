
package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//자원해제
	public void resourceClose() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//resourceClose
	
	public UserDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/assa");
		}catch (Exception e) {
			System.out.println("커넥션풀 얻기 실패: " + e.getMessage());		}
	}//UserDAO
	
	//회원목록
	public List<UserVO> listUsers() {
		
		List<UserVO> usersList = new ArrayList<UserVO>();
		try {
			conn = dataFactory.getConnection();
			String query = "select * from user order by userDate desc";
			
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserVO userVO = new UserVO(rs.getString("userId"),
				 rs.getString("userPw"),
				 rs.getString("userName"),
				 rs.getString("userPhone"),
				 rs.getString("userEmail"),
				 rs.getString("userZipcode"),
				 rs.getString("userAddress1"),
				 rs.getString("userAddress2"),
				 rs.getTimestamp("userDate"),
				 rs.getInt("userUse")); 
				
  				usersList.add(userVO);
			}
			
		}catch (Exception e) {
			System.out.println("usersList메소드 내부에서 SQL실행 예외 발생 :" + e);
		}finally {
			resourceClose();
		}
		return usersList; 
		
	}//listUsers
	
	//회원가입
	public void addUser(UserVO userVO) {
		try {
			conn = dataFactory.getConnection();
			
			String query = "insert into user(userId, userPw, userName, userPhone, userEmail, userZipcode, userAddress1, userAddress2, userDate, userUse)"
					+ " values(?,?,?,?,?,?,?,?,now(),1)";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userVO.getUserId());
			pstmt.setString(2, userVO.getUserPw());
			pstmt.setString(3, userVO.getUserName());
			pstmt.setString(4, userVO.getUserPhone());
			pstmt.setString(5, userVO.getUserEmail());
			pstmt.setString(6, userVO.getUserZipcode());
			pstmt.setString(7, userVO.getUserAddress1());
			pstmt.setString(8, userVO.getUserAddress2());
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("addUser메소드 내부에서 SQL실행 오류 : " + e);
		}finally {
			resourceClose();
		}
	}//addUser메소드
	
	public UserVO findUser(String userId) {
		
		UserVO userInfo = null;
		try {
			conn = dataFactory.getConnection();
			String query = "select * from user where userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			userInfo = new UserVO(rs.getString("userId"),
					 rs.getString("userPw"),
					 rs.getString("userName"),
					 rs.getString("userPhone"),
					 rs.getString("userEmail"),
					 rs.getString("userZipcode"),
					 rs.getString("userAddress1"),
					 rs.getString("userAddress2"),
					 rs.getTimestamp("userDate"),
					 rs.getInt("userUse")); 
			
		} catch (Exception e) {
			System.out.println("findUser메소드 내부에서 SQL실행 오류 : " + e);
		}finally {
			resourceClose();
		}
		
		return userInfo;
	}//findUser 메소드
	

	public void modUser(UserVO userVO) {
		
		try {
			conn = dataFactory.getConnection();
			String query = "update user set userPw=?, userName=?, userPhone=?, userEmail=?, userZipcode=?, userAddress1=?, userAddress2=? where userId=?";
		
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userVO.getUserPw());
			pstmt.setString(2, userVO.getUserName());
			pstmt.setString(3, userVO.getUserPhone());
			pstmt.setString(4, userVO.getUserEmail());
			pstmt.setString(5, userVO.getUserZipcode());
			pstmt.setString(6, userVO.getUserAddress1());
			pstmt.setString(7, userVO.getUserAddress2());	
			pstmt.setString(8, userVO.getUserId());
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("modUser메소드 내부에서 SQL실행 오류 : " + e);
		}finally {
			resourceClose();
		}
	}//modUser메소드 끝
	
	//매개변수로 전달받은 삭제할 회원id를 통해 회원삭제
	public void delUser(String userId) {
		
		try {
			conn = dataFactory.getConnection();
			
			String query = "delete from user where userId=?";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userId);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delUser메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			//자원 해제
			resourceClose();
		}
	}//delUser메소드 

	public int login(String userId, String userPw) {
		
		int check = 0;
		try {
			conn = dataFactory.getConnection();
			String query = "select * from user where userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(userPw.equals(rs.getString("userPw"))) {
					check=2;
				}else {
					check=1;
				}
			}else {
				check=0;
			}
			
		} catch (Exception e) {
			System.out.println("login메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			resourceClose();
		}
		return check;
	
	}//login 메소드

}//UserDAO클래스 




























