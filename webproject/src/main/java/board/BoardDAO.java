package board;

// 패키지 board 파일이름 BoardDAO
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.cj.exceptions.RSAException;
import com.mysql.cj.jdbc.BlobFromLocator;


public class BoardDAO {
	private Connection getConnection() throws Exception {
		// 서버에서 1,2단계 ->디비연결 -> 이름을 불러서연결정보를 가져오기
		// Database Connection Pool(DBCP) -> 디비 연결정보 서버 저장
		// 1. META-INF context.xml(디비연결정보)
		// 2. MemberDAO 디비연결정보 불러서 사용
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection connection = ds.getConnection();
		return connection;

	}// getConnection()

	// 리턴할형없음 insertBoard(BoardDTO dto) 메서드정의
	// String id, String pass, String name, Timestamp date
	// 값이 저장된 바구니 주소를 저장할 변수
	public void insertBoard(BoardDTO dto) {
		System.out.println("insertBoard");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// num name subject content readcount
			
			con = getConnection();
			// num 구하기
			int num = 1;
			
			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt("max(num)")+1;
			}
			// 4단계 SQL구문을 실행(insert,update,delete)
			// 3단계 SQL구문 만들어서 실행할 준비(insert)
			sql = "insert into board(num,name,subject,content,readcount,date) values (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getReadcount());
			pstmt.setTimestamp(6, dto.getDate());

			pstmt.executeUpdate();

		} catch (Exception e) {
			// 예외가 발생하면 처리하는 곳
			e.printStackTrace();

		} finally {
			// 예외 상관없이 마무리작업 -> 객체생성한 기억장소 해제
			if (pstmt != null)
				try {pstmt.close();} catch (Exception e2) {}{}
			if (con != null)
				try {con.close();} catch (Exception e2) {}{}
				
		}
	}// insertBoard
	
	// 리턴할형 ArrayList<BoardDTO> getBoardList() 메서드 정의
	public ArrayList<BoardDTO> getBoardList(int startRow,int pageSize) {
		System.out.println("BoardDAO getBoardList()");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try {
			// 1~2단계
			con = getConnection();
			
			// 3단계 sql - 기본 : num 기준 오름차순 → 수정 : 최근글 위로 올라오게 정렬
//			String select = "select * from board order by num desc";
//			String select = "select * from board order by num desc limit 시작행-1, 몇개";
			String select = "select * from board order by num desc limit ?,?";
			pstmt = con.prepareStatement(select);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			// 4단계
			rs = pstmt.executeQuery();
		
			// 5단계 
			while (rs.next()) {
				//BoardDTO 객체생성
				BoardDTO dto = new BoardDTO();
				
				// 하나의 글을 바구니에 저장
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setDate(rs.getTimestamp("date"));
				
				// 바구니의 주소값을 배열 한칸에 저장
				boardList.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if(rs != null) try {rs.close();} catch (Exception e2) {}
			
		}
		return boardList;
	}
	
	// 리턴할형 BoardDTO getBoard(int num) 메서드 정의
	// 게시판글 조회 - Board의 기준값은 num 
	public BoardDTO getBoard(int num) {
		System.out.println("getBoard");
		
		BoardDTO dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 1~2단계 디비연결 메서드
			con = getConnection();
			// 3단계 sql 구문 실행준비
			String sql = "select * from board where num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			// 4단계 sql 구문 실행 - 결과저장
			rs = pstmt.executeQuery();
			
			// 5단계 결과를 출력, 데이터 담기(select)
			// next()다음행 -> 리턴값 데이터 있으면 True/ 데이터 없으면 false
			// 조건이 true 실행문 -> 다음데이터 있으면 true -> 디비 열접근 출력
			
			while (rs.next()) {
				
			// 하나의 글의 바구니에 저장
				dto = new BoardDTO();
				
			// set메서드호출 - 디비에서 가져온 값 저장
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setDate(rs.getTimestamp("date"));
			}	
			
		} catch (Exception e) {
			// 예외처리
			e.printStackTrace();
			
		} finally {
			// 마무리
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if(rs != null) try {rs.close();} catch (Exception e2) {}
		}
		return dto;
	} // getBoard
	
	// 리턴할형 없음 updateBoard(BoardDTO dto) 메서드 정의
	public void updateBoard(BoardDTO dto) {
		System.out.println("updateBoard(BoardDTO dto)");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
			try {
				// 1~2단계 디비연결메서드 호출
				con = getConnection();
				
				// 3단계 SQL구문 만들어서 실행할 준비
				String update = "update board set subject=?,content=? where num=?";
				
				pstmt = con.prepareStatement(update);
				
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());
				pstmt.setInt(3, dto.getNum());
				
				// 4단계 실행 - insert,update,delete
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				// 예외처리
				e.printStackTrace();
				
			} finally {
				// 마무리 
				if(con != null) try {con.close();} catch (Exception e2) {}
				if(pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			}
	} // updateBoard

	// 리턴할형 없음 deleteBoard(int num)메서드 정의
	public void deleteBoard(int num) {
		System.out.println("deleteBoard(int num)");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1,2 단계 db연결메서드 호출
			con = getConnection();
			// 3단계 sql구문 만들어서 실행 준비
			String delete = "delete from board where num=?";
			// 4단계 sql 구문 실행
			pstmt = con.prepareStatement(delete);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// 예외처리 
			e.printStackTrace();
			
		} finally {
			// 마무리 
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (Exception e2) {}
		}
		
	} // deleteBoard(int num)
	
	// 전체글개수 (count) - select count(*) from board;
		// int 리턴할 형 getBoardCount()메서드 정의
	public int getBoardCount() {
		
		System.out.println("getBoardCount()");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			//1-2
			con = getConnection();
			
			//3
			String select = "select count(*) from board";
			pstmt = con.prepareStatement(select);
			
			//4
			rs = pstmt.executeQuery();
			
			//5
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if(rs != null) try {rs.close();} catch (Exception e2) {}
		}
		return count;
	} // getBoardCount()
	
	
	

} // BoardDAO
