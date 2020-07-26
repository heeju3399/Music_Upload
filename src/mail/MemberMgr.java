package mail;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mgr.DBMgr;

public class MemberMgr {
	
	private DBMgr pool;
	
	public MemberMgr() {
		pool = DBMgr.getInstance();
	}
	
	
	//select pwd from tblMember id=? and email=?
	public String findId(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String id = null;
		try {
			con = pool.getConnection();
			sql = "select m_id from tbl_Member where m_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) 
				id = rs.getString(1); 
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println("�̸��� ���ε� ���̵� ��ġ ������"+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return id;
	}
}









