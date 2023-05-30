package kr.or.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import kr.or.kosa.dto.Member;
import kr.or.kosa.utils.ConnectionHelper;

public class MemberDao {
	// 전체조회
	public List<Member> getMemberList() throws SQLException {

		PreparedStatement pstmt = null;
		String sql = "select id, ip from koreamember";

		/// POOL///////////////////////
		Connection conn = ConnectionHelper.getConnection("oracle");
		//////////////////////////////

		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List<Member> memberlist = new ArrayList<Member>(); // POINT
		// [new memo()][new memo()][new memo()][new memo()]
		while (rs.next()) {
			Member m = Member.builder().id(rs.getString("id")).ip(rs.getString("ip")).build();
			memberlist.add(m);
		}

		ConnectionHelper.close(rs);
		ConnectionHelper.close(pstmt);

		// POOL 에게 연결객체 반환////////////
		ConnectionHelper.close(conn);
		////////////////////////////////
		return memberlist;
	}

	// 삽입
	public int insertMember(Member m) {
		int resultrow = 0;

		PreparedStatement pstmt = null;
		String sql = "insert into koreamember(id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";

		// POOL
		Connection conn = null;

		try {
			// POOL
			conn = ConnectionHelper.getConnection("oracle");

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getId());     
			pstmt.setString(2, m.getPwd());    
			pstmt.setString(3, m.getName());   
			pstmt.setInt(4, m.getAge());       
			pstmt.setString(5, m.getGender());  
			pstmt.setString(6, m.getEmail());   
			pstmt.setString(7, m.getIp());      


			resultrow = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn); 
		}

		return resultrow;
	}

	// 수정
	public int updateMember(Member m) {
	    int resultrow = 0;
	    
	    PreparedStatement pstmt = null;
	    String sql = "UPDATE koreamember SET pwd=?, name=?, age=?, gender=?, email=?, ip=? WHERE id=?";
	    
	    // POOL
	    Connection conn = null;
	    
	    try {
	        // POOL
	        conn = ConnectionHelper.getConnection("oracle");
	        
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setString(1, m.getPwd());    
	        pstmt.setString(2, m.getName());   
	        pstmt.setInt(3, m.getAge());       
	        pstmt.setString(4, m.getGender());  
	        pstmt.setString(5, m.getEmail());   
	        pstmt.setString(6, m.getIp());      
	        pstmt.setString(7, m.getId());      // 업데이트할 회원의 id 필드
	        
	        resultrow = pstmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } finally {
	        ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
	    }
	    
	    return resultrow;
	}


	// 삭제
	public int deleteMember(String id) {
	    int resultrow = 0;
	    
	    PreparedStatement pstmt = null;
	    String sql = "DELETE FROM koreamember WHERE id=?";
	    
	    // POOL
	    Connection conn = null;
	    
	    try {
	        // POOL
	        conn = ConnectionHelper.getConnection("oracle");
	        
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setString(1, id); // 삭제할 회원의 id 필드
	        
	        resultrow = pstmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } finally {
	        ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
	    }
	    
	    return resultrow;
	}
	
	public List<Member> searchMembersByName(String name) {
	    List<Member> memberList = new ArrayList<>();

	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT id, pwd, name, age, gender, email, ip FROM koreamember WHERE name LIKE ?";

	    // POOL
	    Connection conn = null;

	    try {
	        // POOL
	        conn = ConnectionHelper.getConnection("oracle");

	        pstmt = conn.prepareStatement(sql);

	        pstmt.setString(1, "%" + name + "%");

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Member member = Member.builder()
	                    .id(rs.getString("id"))
	                    .pwd(rs.getString("pwd"))
	                    .name(rs.getString("name"))
	                    .age(rs.getInt("age"))
	                    .gender(rs.getString("gender"))
	                    .email(rs.getString("email"))
	                    .ip(rs.getString("ip"))
	                    .build();

	            memberList.add(member);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        ConnectionHelper.close(rs);
	        ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
	    }

	    return memberList;
	}

	
	public boolean login(String id, String pwd) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    Connection conn = null;
	    boolean result = false;

	    try {
	        String sql = "select id, pwd from koreamember where id=?";
	        conn = ConnectionHelper.getConnection("oracle");
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            String storedPwd = rs.getString("pwd");
	            if (pwd.equals(storedPwd)) {
	                result = true;
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        ConnectionHelper.close(rs);
	        ConnectionHelper.close(pstmt);
	        ConnectionHelper.close(conn);
	    }
	    return result;
	}
	
	public Member getMember(String id) {
	    Member member = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    Connection conn = null;

	    try {
	        conn = ConnectionHelper.getConnection("oracle");
	        String sql = "SELECT id, pwd, name, age, gender, email, ip FROM koreamember WHERE id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            member = Member.builder()
	                    .id(rs.getString("id"))
	                    .pwd(rs.getString("pwd"))
	                    .name(rs.getString("name"))
	                    .age(rs.getInt("age"))
	                    .gender(rs.getString("gender"))
	                    .email(rs.getString("email"))
	                    .ip(rs.getString("ip"))
	                    .build();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        ConnectionHelper.close(rs);
	        ConnectionHelper.close(pstmt);
	        ConnectionHelper.close(conn);
	    }

	    return member;
	}


}