package mgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import bean.MemberBean;
import bean.SongBean;

public class SongMgr {
	private DBMgr pool;
	public SongMgr() {
		pool = DBMgr.getInstance();
	}
	public Vector<SongBean> listSong(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<SongBean> vlist = new Vector<SongBean>();
		try {
			con = pool.getConnection();
			sql  = " select s_id, s_title, m_id, s_artist,s_created_at ";
			sql += " from tbl_song order by s_created_at desc ";		
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SongBean bean = new SongBean();
				bean.setS_id(rs.getInt(1));
				bean.setS_title(rs.getString(2));
				bean.setM_id(rs.getString(3));
				bean.setS_artist(rs.getString(4));
				bean.setS_created_at(rs.getString(5));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	

	public int insertSong(MemberBean memberBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int state = -1;
		try {
			con = pool.getConnection();
			sql = " insert comma.tbl_member(m_id,m_pwd,m_email,m_birth,m_visited) " + " values(?,?,?,?,now()) ";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, memberBean.getM_id());
			pstmt.setString(2, memberBean.getM_pwd());
			pstmt.setString(3, memberBean.getM_email());
			pstmt.setString(4, memberBean.getM_birth());
			state = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원가입에러" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return state;
	}

	public int getSong(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int state = 0;
		// 0-id false, 1-id true pass-false, 2-id&pass true
		try {
			con = pool.getConnection();
			sql = " select m_id, m_pwd from tbl_Member where m_id = ? and m_pwd = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next())
				state = 1;// pass
			else
				state = 2;// id true, pass fail
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return state;
	}

	

	public boolean updateSong(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = " update tbl_member set m_pwd=?, m_email=?, m_birth=?, m_auth=? where id=? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getM_pwd());
			pstmt.setString(2, bean.getM_email());
			pstmt.setString(3, bean.getM_birth());
			pstmt.setString(4, bean.getM_auth());
			pstmt.setString(5, bean.getM_id());

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println("업데이트에러" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//=================hee=====================//
	public Vector<SongBean> listSongView(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<SongBean> vlist = new Vector<SongBean>();
		try {
			con = pool.getConnection();
			sql  = " select s_title, s_artist, s_created_at ";
			sql += " from tbl_song order by s_created_at desc limit ?,5; ";		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SongBean bean = new SongBean();
				bean.setS_title(rs.getString(1));
				bean.setS_artist(rs.getString(2));
				bean.setS_created_at(rs.getString(3));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
//=================hee=====================//
}
