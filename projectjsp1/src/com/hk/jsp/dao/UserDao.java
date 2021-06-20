package com.hk.jsp.dao;

import java.sql.*;
import com.hk.jsp.vo.*;
import java.util.*;

public class UserDao {
	static String driveName = "com.mysql.jdbc.Driver";
    static String url = "jdbc:mysql://gyu0348.freehongs.net:3306/mingyu";
    static String user = "gyu0348";
    static String password = "4EbjcI3cWl3G";
		
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	//UserDao 인스턴스 변수
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
		String sql = String.format("select id, pw from user where id='%s'", id);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			dbid = rs.getString("id");
			dbpw = rs.getString("pw");
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
		String sql = String.format("select name, phone, email, " +
					"zip_num, address, address2 from user where id='%s'", id);
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
		sb.append("\n address=?, address2=? where id=?");
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
	
	//회원 탈퇴
	public int withdrawUserById(String id) throws Exception {
		int rst = 0;
		connectDB();
		String sql = String.format("delete from user where id='%s'",id);
		rst = stmt.executeUpdate(sql);
		closeDB();
		return rst;
	}
	
	//회원 주문 조회
	public List<Order_ListVo> getOrderListById(String id) throws Exception {
		List<Order_ListVo> rst = new ArrayList<Order_ListVo>();
		connectDB();
		String sql = String.format("select * from order_list where order_id='%s'", id);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			Order_ListVo row = new Order_ListVo();
			row.setName(rs.getString("name"));
			row.setOrderno(rs.getString("orderno"));
			row.setPhone(rs.getString("phone"));
			row.setZip_num(rs.getString("zip_num"));
			row.setAddress(rs.getString("address"));
			row.setAddress2(rs.getString("address2"));
			row.setAmount(rs.getInt("amount"));
			row.setPrice(rs.getInt("price"));
			row.setBuy_datetime(rs.getString("buy_datetime"));
			rst.add(row);
		}
		closeDB();
		return rst;
	}
	
	//비회원 번호 설정
	public String No_User_no() throws Exception {
		String alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String[] each = alpha.split("");
		for(int i=0; i<1000; i++) {
			int n = (int)Math.floor(Math.random()*36);
			String temp = each[0];
			each[0] = each[n];
			each[n] = temp;
		}
		String no = "";
		for(int i=0; i<7; i++) {
			no += each[i];
		}
		
		connectDB();
		String sql = String.format("select count(*) as cnt from no_user where no='%s'", no);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			String check = rs.getString("cnt");
			if(check.equals("1")) {
				No_User_no();
			}
		}
		closeDB();
		return no;
	}
	//비회원 등록
	public int regNo_User(No_UserVo nouservo) throws Exception {
		int rst = 0;
		connectDB();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into no_user (no, pw, phone, email, zip_num, address, address2)" );
		sb.append("\n values (?, ?, ?, ?, ?, ?, ?)");
		String sql = sb.toString();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nouservo.getNo());
		pstmt.setString(2, nouservo.getPw());
		pstmt.setString(3, nouservo.getPhone());
		
		pstmt.setString(4, nouservo.getEmail());
		pstmt.setString(5, nouservo.getZip_num());
		pstmt.setString(6, nouservo.getAddress());
		pstmt.setString(7, nouservo.getAddress2());
		rst = pstmt.executeUpdate();
		closeDB();
		return rst;
	}
	
	//number 저장
	public class NumberVo {
		int number;
		public int getNumber() {
			return number;
		}
		public void setNumber(int number) {
			this.number = number;
		}
	}
	//주문번호 설정
	public String regOrderNo() throws Exception {
		Calendar cal = Calendar.getInstance();
		String year = Integer.toString(cal.get(Calendar.YEAR));
		int mon = cal.get(Calendar.MONTH)+1;
		String month = "";
		if(mon<10) {
			month = "0"+Integer.toString(cal.get(Calendar.MONTH)+1);
		}else {
			month = Integer.toString(cal.get(Calendar.MONTH)+1);
		}
		
		String date = Integer.toString(cal.get(Calendar.DATE));
		
		NumberVo no = new NumberVo();
		
		connectDB();
		
		String sql = String.format("select count(*) as cnt from order_list where orderno like '%s'", year+month+date+"%");
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			String check = rs.getString("cnt");
			int check_no = Integer.parseInt(check);
			no.setNumber(check_no);
		}
		
		int number = no.getNumber()+1;
		String num = "";
		if(number<10) {
			num = "0000"+Integer.toString(number);
		}else if(number<100) {
			num = "000" + Integer.toString(number);
		}else if(number<1000) {
			num = "00" + Integer.toString(number);
		}else if(number<10000) {
			num = "0" + Integer.toString(number);
		}else {
			num = Integer.toString(number);
		}
		String orderno = year+month+date+num;
		sql = String.format("select count(*) as cnt from order_list where orderno='%s'", orderno);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			String check = rs.getString("cnt");
			if(check.equals("1")) {
				no.setNumber(number);
				regOrderNo();
			}
		}
		
		return orderno;
	}
	
	//order_list 작성
	public int regOrder_List (Order_ListVo orderlistvo) throws Exception {
		int rst = 0;
		connectDB();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into order_list" );
		sb.append("\n values (?, ?, ?, ?, ?, ?, ?, ?, ?, now())");
		String sql = sb.toString();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, orderlistvo.getOrder_id());
		pstmt.setString(2, orderlistvo.getName());
		pstmt.setString(3, orderlistvo.getOrderno());
		
		pstmt.setString(4, orderlistvo.getPhone());
		pstmt.setString(5, orderlistvo.getZip_num());
		pstmt.setString(6, orderlistvo.getAddress());
		pstmt.setString(7, orderlistvo.getAddress2());
		pstmt.setInt(8, orderlistvo.getAmount());
		pstmt.setInt(9, orderlistvo.getPrice());
		rst = pstmt.executeUpdate();
		closeDB();
		return rst;
	}
	
	//비회원 번호, pw 체크
	public int nouser_check(String id, String pw) throws Exception {
		int rst = 0;
		String dbid = "";
		String dbpw = "";
		connectDB();
		String sql = String.format("select no, pw from no_user where no='%s'", id);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			dbid = rs.getString("no");
			dbpw = rs.getString("pw");
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
	
	//장바구니 등록 할 상품 조회
	public ProductVo check_Addcart(String p_no) throws Exception {
		ProductVo rst = new ProductVo();
		connectDB();
		String sql = String.format("select img, name, price from product "+
					"where p_no='%s'", p_no);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			rst.setImg(rs.getString("img"));
			rst.setName(rs.getString("name"));
			rst.setPrice(rs.getInt("price"));
		}
		closeDB();
		return rst;
	}
	
	//장바구니 넘버링 넘버조회
	public int check_CartNo(String id) throws Exception {
		int no = 0;
		connectDB();
		String sql = String.format("select max(no) as no from cart where id='%s'",id);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			no = rs.getInt("no");
			no += 1;
		}
		
		closeDB();
		return no;
	}
	
	//장바구니 등록
	public int addCart(CartVo cartvo) throws Exception {
		int rst = 0;
		connectDB();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into cart" );
		sb.append("\n values (?, ?, ?, ?, ?, ?, ?, ?)");
		String sql = sb.toString();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cartvo.getNo());
		pstmt.setString(2, cartvo.getId());
		pstmt.setString(3, cartvo.getP_no());
		pstmt.setString(4, cartvo.getImg());
		pstmt.setString(5, cartvo.getName());
		
		pstmt.setString(6, cartvo.getSize());
		pstmt.setInt(7, cartvo.getAmount());
		pstmt.setInt(8, cartvo.getPrice());
		rst = pstmt.executeUpdate();
		closeDB();
		return rst;
	}
	
	//장바구니 조회
	public List<CartVo> getCartById(String id) throws Exception {
		List<CartVo> rst = new ArrayList<CartVo>();
		connectDB();
		String sql = String.format("select no, p_no, img, name, "+ 
				"size, amount, price from cart where id='%s'", id);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			CartVo row = new CartVo();
			row.setNo(rs.getInt("no"));
			row.setP_no(rs.getString("p_no"));
			row.setImg(rs.getString("img"));
			row.setName(rs.getString("name"));
			row.setSize(rs.getString("size"));
			row.setAmount(rs.getInt("amount"));
			row.setPrice(rs.getInt("price"));
			rst.add(row);
		}
		closeDB();
		return rst;
	}
	
	//장바구니 삭제
	public int delete_CartByP_no(String[] no) throws Exception{
		int rst = 0;
		connectDB();
		int[] cnt=	null;
		String sql = " delete from cart where no = ?";
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				for(int i=0; i<no.length; i++) {
					pstmt.setString(1, no[i]);
					
					pstmt.addBatch();
				}
				
					cnt = pstmt.executeBatch();
			
				for(int i=0; i<cnt.length; i++) {
					if(cnt[i]==-2) {
						rst++;
					}
				}
				
			}finally {
				closeDB();	
			}
		return rst;
	}
	
	//장바구니->주문하기 상품 금액 설정
	public List<CartVo> CarttoOrder(int no) throws Exception{
		List<CartVo> rst = new ArrayList<CartVo>();
		connectDB();
		String sql = String.format("select p_no from cart where no='%s'", no);
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			CartVo row = new CartVo();
			row.setP_no(rs.getString("p_no"));
			rst.add(row);
		}
		closeDB();
		return rst;
	}
	
	public List<ProductVo> OrderByP_no(String p_no) throws Exception{
		List<ProductVo> rst = new ArrayList<ProductVo>();
		connectDB();
		String sql = String.format("select p_no, name, price from product where p_no='%s'",p_no);
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			ProductVo row = new ProductVo();
			row.setP_no(rs.getString("p_no"));
			row.setName(rs.getString("name"));
			row.setPrice(rs.getInt("price"));
			rst.add(row);
		}
		closeDB();
		return rst;
	}
	
}
