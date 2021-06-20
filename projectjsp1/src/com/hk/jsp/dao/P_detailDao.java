package com.hk.jsp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.*;

import com.hk.jsp.vo.P_detailVo;
import com.hk.jsp.vo.UserVo;


public class P_detailDao {
	static String driveName = "com.mysql.jdbc.Driver";
    static String url = "jdbc:mysql://gyu0348.freehongs.net:3306/mingyu";
    static String user = "gyu0348";
    static String password = "4EbjcI3cWl3G";
	
	
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	
	//ProductDao 인스턴스변수
	private static P_detailDao instance = new P_detailDao();
	
	private P_detailDao(){
		
	}
	
	
	public static P_detailDao getInstance() {
		if(instance==null) {
			instance = new P_detailDao();
		}
		return instance;
	}
	
	private void connectDB() throws Exception {
		
		if(conn == null) {	
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

	//상품등록
	public int regPd(P_detailVo pdvo) throws Exception{
		int rst = 0;
		connectDB();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into p_detail(p_no, l_size, m_size, f_size, img1, img2, img3, img4)");
		sb.append("\n values (?, ?, ?, ?, ?, ?, ?, ?)");
		String sql = sb.toString();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pdvo.getP_no());
		pstmt.setInt(2, pdvo.getL_size());
		pstmt.setInt(3, pdvo.getM_size());
		pstmt.setInt(4, pdvo.getF_size());
		pstmt.setString(5, pdvo.getImg1());
		pstmt.setString(6, pdvo.getImg2());
		pstmt.setString(7, pdvo.getImg3());
		pstmt.setString(8, pdvo.getImg4());
		
		rst = pstmt.executeUpdate();
		closeDB();
		
		return rst;
	}
	
	//상품 재고 조회
	public List<P_detailVo> Stock() throws Exception {
		List<P_detailVo> rst = new ArrayList<P_detailVo>();
		connectDB();
		String sql = "select p_no, l_size, m_size, f_size, "+
						"img1, img2, img3, img4 from p_detail";
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			P_detailVo row = new P_detailVo();
			row.setP_no(rs.getString("p_no"));
			row.setL_size(rs.getInt("l_size"));
			row.setM_size(rs.getInt("m_size"));
			row.setF_size(rs.getInt("f_size"));
			row.setImg1(rs.getString("img1"));
			row.setImg2(rs.getString("img2"));
			row.setImg3(rs.getString("img3"));
			row.setImg4(rs.getString("img4"));
			rst.add(row);
		}
		closeDB();
		return rst;
	}
	public List<P_detailVo> Find_p_no() throws Exception {
		List<P_detailVo> rst = new ArrayList<P_detailVo>();
		connectDB();
		String sql = "select p_no from p_detail";
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			P_detailVo row = new P_detailVo();
			row.setP_no(rs.getString("p_no"));
			rst.add(row);
		}
		closeDB();
		return rst;
	}
	//상품 상세 조회
		public P_detailVo proDetail2(String p_no) throws Exception{
			P_detailVo rst = new P_detailVo();
			connectDB();
			String sql = String.format("select * from p_detail where p_no = '%s'", p_no);
			
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rst.setP_no(rs.getString("p_no"));
				rst.setL_size(rs.getInt("l_size"));
				rst.setM_size(rs.getInt("m_size"));
				rst.setF_size(rs.getInt("f_size"));
				rst.setImg1(rs.getString("img1"));
				rst.setImg2(rs.getString("img2"));
				rst.setImg3(rs.getString("img3"));
				rst.setImg4(rs.getString("img4"));
			}
			closeDB();
			return rst;
		}
	
	//재고 수정
	public int modify_Stock(String p_no) throws Exception {
		int rst = 0;
		P_detailVo pdvo = new P_detailVo();
		connectDB();
		StringBuffer sb = new StringBuffer("");
		sb.append("update p_detail set l_size=?, m_size=?, f_size=?, ");
		sb.append("\n where p_no=?");
		String sql = sb.toString();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pdvo.getL_size());
		pstmt.setInt(2, pdvo.getM_size());
		pstmt.setInt(3, pdvo.getF_size());
		pstmt.setString(4, pdvo.getP_no());
		rst = pstmt.executeUpdate();
		
		closeDB();
		return rst;
	}
}
