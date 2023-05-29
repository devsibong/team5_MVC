package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
			pstmt.setLong(5, member.getGender());
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
	
}
