package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	// 1,2 단계 디비연결 메서드
	// 예외처리를 메서드 호출한 곳으로 뒤로 미루겠다.
	private Connection getConnection() throws Exception {
		
		// 예외가 발생할 가능성이 높은 명령
		// 1단계 JDBC안에 있는 Driver프로그램 불러오기
//		Class.forName("com.mysql.cj.jdbc.Driver");
//
//		// 2단계 Driver 프로그램 이용해서 디비연결
//		String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
//		String dbUser = "root";
//		String dbPass = "1234";
//		Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		return con;
		
		// 서버에서 1,2단계 ->디비연결 -> 이름을 불러서연결정보를 가져오기 
		// -> 속도향상, 디비연결 정보 수정 최소화.
		// Database Connection Pool(DBCP) -> 디비 연결정보 서버 저장
		// 1. META-INF context.xml(디비연결정보)
		// 2. MemberDAO 디비연결정보 불러서 사용
		Context init = new InitialContext();
		DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection connection = ds.getConnection();
		return connection;
	}

	// insertMember() 메서드 정의해서
	// String id, String pass, String name, Timestamp date
	// 값이 저장된 바구니 주소를 저장할 변수
	public void insertMember(MemberDTO dto) {
		System.out.println("MemberDAO insertMember()");
		System.out.println("MemberDTO바구니 전달받은 주소 : " + dto);
		System.out.println("MemberDTO바구니 가져온 아이디 : " + dto.getId());
		System.out.println("MemberDTO바구니 가져온 아이디 : " + dto.getPass());
		System.out.println("MemberDTO바구니 가져온 아이디 : " + dto.getName());
		System.out.println("MemberDTO바구니 가져온 아이디 : " + dto.getDate());
		
		// 선언을 밖에다 먼저하고 try안에는 변수가져다 사용하기
		Connection con = null;
		PreparedStatement pstmt =null;
		try {
			// 3단계 SQL구문 만들어서 실행할 준비(insert)
			// ? 채워넣기
			String sql = "insert into members(id,pass,name,date,email,address,phone,mobile) values(?,?,?,?,?,?,?,?)";
			con = getConnection();
			// 4단계 SQL구문을 실행(insert,update,delete)
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setTimestamp(4, dto.getDate());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getAddress());
			pstmt.setString(7, dto.getPhone());
			pstmt.setString(8, dto.getMobile());
			
			
			
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// 예외가 발생하면 처리하는 곳
			e.printStackTrace();
		} finally {
			// 예외 상관없이 마무리작업 -> 객체생성한 기억장소 해제
			if(pstmt != null) try { pstmt.close();} catch (Exception e2) {} {}
			if(con != null) try { con.close();} catch (Exception e2) {} {}
		}
		return;
	} // insertMember() 메서드


	// userCheck(String id,String pass) 메서드 정의
	// public 리턴할형(boolean | MemberDTO)
	// id, pass 일치하면 MemberDTO 바구니에 데이터를 담아서 주소 가져오기.
	// id, pass 틀리면 MemberDTO 빈(null) 바구니를 주소 가져오기.
	// = 주소.userCheck(id,pass)메서드 호출

	public MemberDTO userCheck(String id, String pass) {
		// 바구니주소 초기화
		MemberDTO dto = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			// 1,2 단계 디비연결메서드 호출
			con = getConnection();
			// 3단계 SQL구문 만들어서 실행할 준비
			String sql = "select * from members where id=? and pass=?";
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, pass);
			// 4단계 SQL구문을 실행 저장
			rs = pst.executeQuery();

			if (rs.next()) {
				// if next() 다음행 → 리턴값 데이터 있으면 True → 아이디 비밀번호 일치
				// → 세션값 생성 "id",id값 -> main.jsp 이동
				// dto 바구니 객체생성 -> 기억장소 할당
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("sql"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setAddress(rs.getString("address"));
				dto.setMobile(rs.getString("mobile"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
			} else {
				// 데이터 없으면 false → 아이디 비밀번호 틀림 : script 뒤로이동
				// 삭제해도 상관없다.
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 마무리
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pst != null) try {pst.close();} catch (Exception e2) {}
			if(rs != null) try {rs.close();} catch (Exception e2) {}
		}
		return dto;
	} // userCheck

	// MemberDTO리턴할형 getMember(String id) 메서드 정의
	public MemberDTO getMember(String id) {
		MemberDTO dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1,2 디비연결 메서드
			con = getConnection();
			// 3단계 SQL구문 만들어서 실행할 준비(select조건 where id =?)
			String sql = "select * from members where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			// 4단계 SQL구문을 실행(select) ⇒ 결과저장(select)
			rs = pstmt.executeQuery();

			// 5단계 결과를 출력, 데이터 담기(select)
			// next()다음행 -> 리턴값 데이터 있으면 True/ 데이터 없으면 false
			// 조건이 true 실행문 -> 다음데이터 있으면 true -> 디비 열접근 출력

			if (rs.next()) {
				// next()다음행 -> 리턴값 데이터 있으면 True/ 데이터 없으면 false
				// 바구니 객체생성 -> 기억장소 할당
				dto = new MemberDTO();

				// set메서드호출 바구니에 디비에서 가져온 값 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setAddress(rs.getString("address"));
				dto.setMobile(rs.getString("mobile"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 마무리
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if(rs != null) try {rs.close();} catch (Exception e2) {}
		}
		return dto;
		
	} //getMember
	// 리턴값 없음 updateMember(MemberDTO updateDto) 메서드 정의
	public  void updateMember(MemberDTO updateDto) {
			Connection con = null;
			PreparedStatement pstmt2 = null;
		try {
			// 1,2 단계 디비연결메서드 호출
			con = getConnection();
			// 3단계 SQL구문 만들어서 실행할 준비
			String update =  "update members set name =?, email=?, address=?, phone=?, mobile=? where id =?";
			pstmt2 = con.prepareStatement(update);
			pstmt2.setString(1, updateDto.getName());
			pstmt2.setString(2, updateDto.getEmail());
			pstmt2.setString(3, updateDto.getAddress());
			pstmt2.setString(4, updateDto.getPhone());
			pstmt2.setString(5, updateDto.getMobile());
			pstmt2.setString(6, updateDto.getId());
			
			pstmt2.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 마무리
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt2 != null) try {pstmt2.close();} catch (Exception e2) {}
		}
	} //updateMember
	// id,pass 일치. 리턴값없음 deleteMember(String id) 메서드 정의 dao.deleteMember(id)메서드 호출
	
	public void deleteMember(String id) {
		Connection con = null;
		PreparedStatement pstmt2 = null;
		try {
			// 1,2 단계 디비연결메서드 호출
			con = getConnection();
			
			// 3단계 SQL구문 만들어서 실행할 준비-(delete where id =?)
			String delete = "delete from members where id =?";
			pstmt2 = con.prepareStatement(delete);
			pstmt2.setString(1, id);

			// 4단계 SQL구문을 실행(delete)
			pstmt2.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt2 != null) try {pstmt2.close();} catch (Exception e2) {}
		}
	} // deleteMember()
	// MemberDAO 객체생성, 리턴할 형 ArrayList<MemberDTO> getMemberList() 메서드 정의
	
	public ArrayList<MemberDTO> getMemberList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet result = null;
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		try {
			// 1,2 단계 디비연결메서드 호출
			con = getConnection();
			
			// 3단계 SQL구문 만들어서 실행할 준비- (select where id = ? and pass =?)
			String select = "select * from members";
			
			// 4단계 SQL구문 실행(select) => 결과저장
			pstmt = con.prepareStatement(select); 
			result = pstmt.executeQuery();
			
			// 5단계 조건이 true 실행문 -> 다음행 데이터 있으면 true 
			// -> 열접근 -> 한명정보 MemberDTO저장 => 배열한칸 저장
			while (result.next()) {
				// MemberDTO 객체생성
				MemberDTO dto = new MemberDTO();
				System.out.println("회원정보저장 주소 : "+dto);
				// set메서드 호출 <- 열접근
				dto.setId(result.getString("id"));
				dto.setPass(result.getString("pass"));
				dto.setName(result.getString("name"));
				dto.setDate(result.getTimestamp("date"));
				// 배열 한칸에 저장
				memberList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			//마무리
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if(result != null) try {result.close();} catch (Exception e2) {}
		} return memberList;
		
	}// getMemberList()
	
	// ArrayList<MemberDTO> memberList = dao.getMemberList() 메서드 호출
	
} // 클래스
