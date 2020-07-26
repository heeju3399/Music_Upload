package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import bean.CommentBean;
import mgr.DBMgr;

public class BCommentMgr {
	
	private DBMgr pool;
	
	public BCommentMgr() {
		pool = DBMgr.getInstance();
	}
	
	
	//Comment List
	public Vector<CommentBean> getComment(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		 Vector<CommentBean> vlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from tbl_comment where s_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CommentBean bean = new CommentBean();
				bean.setC_id(rs.getInt("c_id"));
				bean.setM_id(rs.getString("m_id"));
				bean.setC_content(rs.getString("c_content"));
				bean.setS_id(rs.getInt("s_id"));							
				bean.setC_ip(rs.getString("c_ip"));
				bean.setC_created_at(rs.getString("c_created_at"));
				bean.setC_updated_at(rs.getString("c_updated_at"));	
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	//Comment Insert
	public void insertComment(CommentBean bean){
		System.out.println("인설트커멘트 작동");
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String id = null;
		
		try {
			con = pool.getConnection();
			sql = "insert tbl_comment(m_id,c_content,s_id,c_ip) "
					+ "values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			if(bean.getM_id()==null) {
				pstmt.setString(1, "Guest");
			}else {
				pstmt.setString(1, bean.getM_id());
			}				
			pstmt.setString(2, bean.getC_content());
			pstmt.setInt(3, bean.getS_id());
			pstmt.setString(4, bean.getC_ip());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Comment Count
	public int getCommentCount(int num){
		System.out.println("겟트커멘트 작동");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count  = 0;
		try {
			con = pool.getConnection();
			sql = "select count(s_id) from tbl_comment where s_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return count;
	}
	
	//Comment Delete
	public void deleteComment(int cnum){
		System.out.println("딜리트커멘트 작동");
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tbl_comment where c_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Comment All Delete
	public void deleteAllComment(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tbl_comment where s_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
