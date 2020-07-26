package mgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import bean.TopBean;

public class TopMgr {

	private DBMgr pool;

	public TopMgr() {
		pool = DBMgr.getInstance();
	}
	public Vector<String> getDays(){
		String sql = "SELECT DISTINCT (regdate) FROM tbl_top100 GROUP BY regdate";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<String> vlist = new Vector<String>();
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vlist.addElement(rs.getString(1));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	public Vector<TopBean> getTopBean() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TopBean> vlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "SELECT distinct * FROM tbl_top100 GROUP BY entry HAVING MAX(cnt) order by cnt DESC, regdate DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TopBean bean = new TopBean();
				bean.setEntry(rs.getString("entry"));
				bean.setArtist(rs.getString("artist"));
				bean.setTitle(rs.getString("title"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCnt(rs.getLong("cnt"));
				

				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	public Vector<TopBean> getTopBeanByRegDate(String regdate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TopBean> vlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from tbl_top100 where regdate like ? order by cnt desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,regdate);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TopBean bean = new TopBean();
				bean.setEntry(rs.getString("entry"));
				bean.setArtist(rs.getString("artist"));
				bean.setTitle(rs.getString("title"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCnt(rs.getLong("cnt"));
				

				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	public TopBean getTopBeanOne(String entry) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		TopBean bean = null;
		try {
			con = pool.getConnection();
			sql = "select * from tbl_top100 where entry=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, entry);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new TopBean();
				bean.setEntry(rs.getString("entry"));
				bean.setArtist(rs.getString("artist"));
				bean.setTitle(rs.getString("title"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCnt(rs.getLong("cnt"));
				System.out.println(bean.getCnt());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	public void insert(TopBean topBean) {
	
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into tbl_top100(entry,artist,title,regdate,cnt) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, topBean.getEntry());
			pstmt.setString(2, topBean.getArtist());
			pstmt.setString(3, topBean.getTitle());
			pstmt.setString(4, topBean.getRegdate());
			pstmt.setLong(5, topBean.getCnt());
			pstmt.executeUpdate();
			return;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	

}
