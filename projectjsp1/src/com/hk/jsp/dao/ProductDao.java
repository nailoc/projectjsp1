package com.hk.jsp.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.hk.jsp.vo.ProductVo;

public class ProductDao {
	static String driveName = "com.mysql.jdbc.Driver";
    static String url = "jdbc:mysql://gyu0348.freehongs.net:3306/mingyu";
    static String user = "gyu0348";
    static String password = "4EbjcI3cWl3G";
	
	
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	
	//ProductDao 인스턴스변수
	private static ProductDao instance = new ProductDao();
	
	private ProductDao(){
		
	}
	
	
	public static ProductDao getInstance() {
		if(instance==null) {
			instance = new ProductDao();
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
	public int regProduct(ProductVo provo) throws Exception{
		int rst = 0;
		connectDB();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into product(p_no, kind, name, explanation, "
				+ "price, brand, p_like, img)");
		sb.append("\n values (?, ?, ?, ?, ?, ?, ?, ?)");
		String sql = sb.toString();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, provo.getP_no());
		pstmt.setInt(2, provo.getKind());
		pstmt.setString(3, provo.getName());
		pstmt.setString(4, provo.getExplanation());
		pstmt.setInt(5, provo.getPrice());
		pstmt.setString(6, provo.getBrand());
		pstmt.setInt(7, provo.getP_like());
		pstmt.setString(8, provo.getImg());
		
		rst = pstmt.executeUpdate();
		closeDB();
		
		return rst;
	}
	
	
	//상품목록
	public ArrayList<ProductVo> proList() throws Exception{
		ArrayList<ProductVo> array = new ArrayList<ProductVo>();
		connectDB();
		String sql = "select p_no, name, price, img, brand, p_like, kind from product";
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			ProductVo vo = new ProductVo();
			vo.setP_no(rs.getString("p_no"));
			vo.setName(rs.getString("name"));
			vo.setPrice(rs.getInt("price"));
			vo.setImg(rs.getString("img"));
			vo.setBrand(rs.getString("brand"));
			vo.setP_like(rs.getInt("p_like"));
			vo.setKind(rs.getInt("kind"));
			array.add(vo);
		}
		
		
		closeDB();
		return array;
		
	}
	
	//상품 상세 조회
	public ProductVo proDetail1(String p_no) throws Exception{
		ProductVo rst = new ProductVo();
		connectDB();
		String sql = String.format("select * from product where p_no='%s'",p_no);
			
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			rst.setP_no(rs.getString("p_no"));
			rst.setKind(rs.getInt("kind"));
			rst.setName(rs.getString("name"));
			rst.setExplanation(rs.getString("explanation"));
			rst.setPrice(rs.getInt("price"));
			rst.setBrand(rs.getString("brand"));
			rst.setP_like(rs.getInt("p_like"));
			rst.setImg(rs.getString("img"));
		}
		closeDB();
		return rst;
	}
	
	//상품삭재
	public int proDelect(String[] p_no) throws Exception{
		
		connectDB();
		int rst = 0;
		int[] cnt=	null;
		String sql = " DELETE p, pd" + 
				" FROM product AS p INNER JOIN p_detail AS pd ON p.p_no = pd.p_no" + 
				" WHERE pd.p_no = ? ; ";
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				for(int i=0; i<p_no.length; i++) {
					pstmt.setString(1, p_no[i]);
					
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
	
	//좋아요
	public int like_add(String p_no) throws Exception{
		int rst=0;
		connectDB();
		String sql = "update product set p_like = p_like+1 where p_no ="+"p_no";
		rst = stmt.executeUpdate(sql);
		closeDB();
		return rst;
	}
	
	
}
