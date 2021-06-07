package com.hk.jsp.dao;

import java.sql.*;
import com.hk.jsp.vo.*;

public class UserDao {
	static String driveName = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/jspweb";
	static String user = "jsp";
	static String password = "1234";
		
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	//MemberDao 인스턴스 변수
	private static UserDao instance = new UserDao();

	private UserDao() {
		
	}
	
	public static UserDao getInstance() {
		if(instance==null) {
			instance = new UserDao();
		}
		return instance;
	}
	// 초기화 블럭
	{
		try {
			Class.forName(driveName);
			System.out.println("드라이버로딩성공");
		}catch(Exception e) {
			System.out.println("드라이버 로딩 실패");
		}
	}
	
	private void connectDB() throws Exception {
		
		if(conn == null) {	// =접속이 안되었으면.
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			System.out.println("데이터베이스접속성공");
		}
		
	}
	
	private static void closeDB() {
		try {
			if(conn!=null) {conn.close(); conn=null;}
			if(stmt!=null) {stmt.close(); stmt=null;}
			if(pstmt!=null) {pstmt.close(); pstmt=null;}
			if(rs!=null) {rs.close(); rs=null;}
			System.out.println("데이터베이스 접속종료 완료");
		}catch(SQLException e) {
			System.out.println("데이터베이스 쿼리오류: " + e.getMessage());
		}catch(Exception e2) {
			System.out.println("데이터베이스 접속오류" + e2.getMessage());
		}
	}
	
	//아이디 중복확인
	public int checkUserById(String id) throws Exception {
		int rst = 0;
		connectDB();
		String sql = String.format("select count(id) as chk from user where id='%s'", id);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			rst = rs.getInt("chk");
		}
		closeDB();
		return rst;
	}
	
	//로그인 (id,pw 체크)
	public int authUserByIdPw(String id, String pw) throws Exception {
		int rst = 0;
		String dbid = "";
		String dbpw = "";
		connectDB();
		String sql = String.format("select id, pwd from user where id='%s'", id);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			dbid = rs.getString("id");
			dbpw = rs.getString("pwd");
			System.out.println(dbid);
		}
		//비교
		if(dbid.equals(id)) {
			if(dbpw.equals(pw)) {
				rst = 1; //로그인 성공.
			}else {
				rst = -1;	//비밀번호 틀림.
			}
		}else {
			rst = 0; //아이디를 틀림.
		}
		closeDB();
		return rst;
	}
	
	//회원가입
	public int regMember(UserVo uservo) throws Exception {
		int rst = 0;
		connectDB();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into user (id, pw, name, phone, email, zip_num, address, address2, indate)" );
		sb.append("\n values (?, ?, ?, ?, ?, ?, ?, ?, now())");
		String sql = sb.toString();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uservo.getId());
		pstmt.setString(2, uservo.getPw());
		pstmt.setString(3, uservo.getName());
		pstmt.setString(4, uservo.getPhone());
		
		pstmt.setString(5, uservo.getEmail());
		pstmt.setString(6, uservo.getZip_num());
		pstmt.setString(7, uservo.getAddress());
		pstmt.setString(8, uservo.getAddress2());
		rst = pstmt.executeUpdate();
		closeDB();
		return rst;
	}
	
	//mypage 회원정보
	public UserVo getUserById(String id) throws Exception {
		UserVo rst = new UserVo();
		connectDB();
		String sql = String.format("select name, phone, "+ 
				"email, zip_num, address, address2 "+ 
					" from user where id='%s'", id);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			rst.setName(rs.getString("name"));
			rst.setPhone(rs.getString("phone"));
			rst.setEmail(rs.getString("email"));
			rst.setZip_num(rs.getString("zip_num"));
			rst.setAddress(rs.getString("address"));
			rst.setAddress2(rs.getString("address2"));
		}
		closeDB();
		return rst;
	}
	
	//회원정보 수정
	public int modifyUser(UserVo uservo) throws Exception {
		int rst = 0;
		connectDB();
		StringBuffer sb = new StringBuffer("");
		sb.append("update user set name=?, phone=?, email=?, zip_num=?, ");
		sb.append("\n address=?, address2=?, where id=?");
		String sql = sb.toString();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uservo.getName());
		pstmt.setString(2, uservo.getPhone());
		pstmt.setString(3, uservo.getEmail());
		pstmt.setString(4, uservo.getZip_num());
		pstmt.setString(5, uservo.getAddress());
		pstmt.setString(6, uservo.getAddress2());
		pstmt.setString(7, uservo.getId());
		rst = pstmt.executeUpdate();
		
		closeDB();
		return rst;
	}
	
	//계정 삭제
	public int withdrawUserById(String id) throws Exception {
		int rst = 0;
		connectDB();
		String sql = String.format("delete from user where id='%s'",id);
		rst = stmt.executeUpdate(sql);
		closeDB();
		return rst;
	}
	
	//주문번호 지정
	public int saveOrder_No(Order_ListVo orderlistvo) throws Exception {
		int rst = 0;
		connectDB();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into order_list " );
		sb.append("\n values (?, ?, ?, ?, ?, now())");
		String sql = sb.toString();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, orderlistvo.getOrderno());
		pstmt.setString(2, orderlistvo.getDeliveryno());
		pstmt.setString(3, orderlistvo.getP_no());
		pstmt.setInt(4, orderlistvo.getAmount());
		pstmt.setInt(5, orderlistvo.getPrice2());
		pstmt.setString(6, orderlistvo.getBuy_datetime());
		rst = pstmt.executeUpdate();
		closeDB();
		return rst;
	}
}
