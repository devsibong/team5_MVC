package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.kosa.dto.MemberDto;
import kr.or.kosa.utils.ConnectionHelper;

public class MemberDao {
	//POOL
		/*
		DataSource ds = null;
		
		public MemoDao() {
			try {
				//JNDI
				Context context = new InitialContext();
				//현재 [프로젝트]에서 특정 이름을 가진 객체를 검색 (사용 : 이름기반 검색)
				ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); //  정해진 약속 : java:comp/env/ + jdbc/oracle
			    //lookup 된 객체의 타입이 DataSource
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		*/
	
	// 회원가입
	public int insertMember(MemberDto member) {
		
		System.out.println(member.toString());
		int resultrow=0;
		
		//Class.forName("oracle.jdbc.OracleDriver");
		PreparedStatement pstmt=null;
		String sql="insert into koreamember(id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";

		//POOL
		Connection conn = null;
		
		try{
			//POOL
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getIp());
			
			resultrow = pstmt.executeUpdate();
			
		}catch(Exception e){
			// pstmt.executeUpdate(); 실행시  PK 위반 예외 발생    if 타지 않고 ....
			System.out.println("dao-insertMember : "+ e);
			resultrow = -1;
		}finally{
			if(pstmt != null){ try{pstmt.close();}catch(Exception e){} }
			if(conn != null){ try{conn.close();}catch(Exception e){} }
		}
		
		return resultrow;
	}
	
	// 로그인확인
	public int selectUserByIdPwd(String id, String pwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select id, pwd from koreamember where id = ?";
		
		Connection conn = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			//System.out.println("rs : " + rs);
			if(rs.next()) {
				String pwd2 = rs.getString("pwd");
				if(pwd.equals(pwd2)) {
					result = 1;
				}else {
					result = -1;
				}
			}
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			try {
				ConnectionHelper.close(conn);
			}catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		return result;
	}
	
	// 회원리스트 전체 조회
	public List<MemberDto> selectAllMember() throws SQLException{
		PreparedStatement pstmt = null;
		String sql = "select id, pwd, name, age, gender, email, ip from koreamember";
	
		Connection conn = ConnectionHelper.getConnection("oracle"); // pool
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		List<MemberDto> memberlist = new ArrayList<>();
		
		while(rs.next()) {
			MemberDto member = new MemberDto();
			member.setId(rs.getString("id"));
			member.setPwd(rs.getString("pwd"));
			member.setName(rs.getString("name"));
			member.setAge(rs.getInt("age"));
			member.setGender(rs.getString("gender"));
			member.setEmail(rs.getString("email"));
			member.setIp(rs.getString("ip"));
			memberlist.add(member);
		}
		ConnectionHelper.close(rs);
		ConnectionHelper.close(pstmt);
		ConnectionHelper.close(conn); // pool 연결객체 반환
		
		return memberlist;
	}
}
