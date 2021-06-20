package com.hk.jsp.dao;

import java.sql.*;

import java.util.*;


import com.hk.jsp.vo.*;


public class BoardDao {

	//접속정보를 정의 -> 전역변수성격
		static String driveName = "com.mysql.jdbc.Driver";
		static String url = "jdbc:mysql://gyu0348.freehongs.net:3306/mingyu";
		static String user = "gyu0348";
		static String password = "4EbjcI3cWl3G";
		
		// 데이터베이스를 사용하는 동안에는 계속 생성할 필요가 없음
		// 생성자와 접속정보들 외부에서 사용할 필요가 없음 
		// public 대신  private 형식으로 사용할 수 있다
		private static Connection conn = null;
		private static Statement stmt = null;
		private static PreparedStatement pstmt = null;
		private static ResultSet rs = null;
		private static BoardDao instance = new BoardDao();
		// 생성자 -> 내부적으로 생성함
		// 싱글톤 클래스 라고 부른다 = static 으로 선언됨
		private  BoardDao() { 
			
		}
		
		public static BoardDao getInstance() {
			return instance;
		}
		// 결론: 외부jsp에서 참조변수를 여러개 만들 필요가 없음
		// instance 참조변수만 전달해주면 된다
		private void getConnect() throws Exception {
			
			Class.forName(driveName);
			System.out.println("드라이버로딩성공");
			if(conn==null) { // 접속이 안되었으면
				conn=DriverManager.getConnection(url, user, password);
				stmt = conn.createStatement();
				System.out.println("데이터베이스접속성공");
			}
		}
		// 접속을 종료하는 메소드
		private void closeDB() {
			try {
				if(conn!=null) { conn.close(); conn=null; }
				if(stmt!=null) { stmt.close(); stmt=null; }
				if(rs!=null) { rs.close(); rs=null; }
				System.out.println("데이터베이스접속종료완료");
			}catch(SQLException e) {
				System.out.println("데이터베이스 쿼리오류:"+e.getMessage());
			}catch(Exception e2) {
				System.out.println("데이터베이스 접속오류:"+e2.getMessage());
			}
		}
		// 접속 및 종료 테스트 메소드 - .jsp 
		public void testConnect() throws Exception {
			getConnect();
			//작업코드
			closeDB();
		}
		
	
		//날짜넣기
		public String getDate() {
			String sql = "select now() ";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return ""; //데이터베이스 오류
		}
		
		//게시글 번호 부여 메소드
		public int getNext() {
			//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
			String sql = "select * from board order by no desc";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; //첫 번째 게시물인 경우
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		//게시글 목록 출력
		public List<BoardVo> getBoardList(String sort, String keyword) throws Exception {
			//정렬변수 sort
			//검색어변수 keyword
			List<BoardVo> rst = new ArrayList<BoardVo>();
			getConnect();
			//sql
			String sql = "select no, title, contents, write_name, "
					+ "date_format(regdate,'%Y-%m-%d') as regdate, votes, "
					+ "views from board where title like '%"+keyword+"%' "
					+ "OR contents like '%"+keyword+"%' "
					+ "OR write_name like '%"+keyword+"%' "  
					+ "order by "+sort+ " desc";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BoardVo row = new BoardVo();
				row.setNo(rs.getInt("no"));
				row.setTitle(rs.getString("title"));
				row.setContents(rs.getString("contents"));
				row.setWrite_name(rs.getString("write_name"));
				row.setRegdate(rs.getString("regdate"));
				row.setVotes(rs.getInt("votes"));
				row.setViews(rs.getInt("views"));
				rst.add(row);
			}
			closeDB();
			return rst;
		}
		
		//페이지처리
		public boolean nextPage(int no) {
			String sql = "select * from board where no < ? and attach2 = 1";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNext() - (no - 1) * 10);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return true;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		
		
		
		//게시글 작성 및 첨부파일 저장 noticewrtpro
		// noteicewrtpro.jsp 데이터 vo 저장
		public int saveBoard(BoardVo brdvo) throws Exception {
			int rst=0;
			getConnect();
			StringBuffer sb = new StringBuffer("");
			sb.append("insert into board (no,title,write_name,contents,attach1,write_id,regdate,attach2)");
			sb.append("\n values (?, ?, ?, ?,?,?, ?,?) ");
			String sql = sb.toString();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, brdvo.getTitle());
			pstmt.setString(3, brdvo.getWrite_name());
			pstmt.setString(4, brdvo.getContents());
			pstmt.setString(5, brdvo.getAttach1());
			pstmt.setString(6, brdvo.getWrite_id());
			pstmt.setString(7, getDate());
			pstmt.setInt(8, 1);
			
			rst = pstmt.executeUpdate();
			closeDB();
			return rst;
		}

		
		// noticeshow.jsp 게시물 읽기
		public BoardVo getBoardByNo(String no) throws Exception {
			BoardVo rst = new BoardVo();
			getConnect();
			String sql = String.format("select * from board where no='%s'",no);
			
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
			
				rst.setNo(rs.getInt("no"));
				rst.setTitle(rs.getString("title"));
				rst.setWrite_name(rs.getString("write_name"));
				rst.setRegdate(rs.getString("regdate"));
				rst.setViews(rs.getInt("views"));
				rst.setVotes(rs.getInt("votes"));
				rst.setContents(rs.getString("contents"));
				rst.setAttach1(rs.getString("attach1"));
			}
			closeDB();
			return rst;
			
		}
		
		// noticeshow.jsp 조회 1 증가
		public void increaseBoardNo(String no) throws Exception {
			getConnect();
			String sql = String.format("update board set views = views+1 where no='%s'", no);
			int res = stmt.executeUpdate(sql);
			closeDB();
		}
		
		// noticevote.jsp 추천 증가
		public int increaseBoardVote(String no) throws Exception {
			int rst = 0;
			//String no = "1"; // 1번게시물 추천
			getConnect();
		
			String sql = String.format("update board set votes = votes+1 where no ='%s'",no);
			rst = stmt.executeUpdate(sql);
			closeDB();
			return rst;
		}
		
		//글삭제메소드
		public int deleteBoard(String no) throws Exception {
			int rst = 0;
			
			getConnect();
			
			String sql = String.format("delete from board where no='%s'",no);
			rst = stmt.executeUpdate(sql);
			closeDB();
			return rst;
			
		}
		
		//글 수정
		
		public int editBoard(BoardVo bVo) throws Exception {
			
			getConnect();
			
			StringBuffer sb = new StringBuffer("");
			sb.append("update board set title=? ,contents=? ,attach1=? where no=?");
			String sql = sb.toString();
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, bVo.getTitle());
			pstmt.setString(2, bVo.getContents());
			pstmt.setString(3, bVo.getAttach1());
			pstmt.setInt(4, bVo.getNo());
			
			int res = pstmt.executeUpdate();
			
			closeDB();
			return res;
		}

	
}