package mgr;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import bean.EmotionBean;
import mgr.DBMgr;


public class EmotionMgr {
	private DBMgr pool;
		
	public EmotionMgr() {
		pool = DBMgr.getInstance();
		
	}

	// ����Ʈ ������
	/* select `tblemotion`.`regdate` AS `regdate`,sum(`tblemotion`.`happy`) AS `happy`,
	sum(`tblemotion`.`sad`) AS `sad`,sum(`tblemotion`.`hell`) AS `hell`,
	sum(`tblemotion`.`funny`) AS `funny` from `tblemotion` group by `tblemotion`.`
	regdate` having (`tblemotion`.`regdate` >= (curdate() - 3)) 
	order by `tblemotion`.`regdate` desc
	*/
		
	// ����Ʈ ������
	/*
	 * SELECT sum(happy)\"happy\",sum(sad)\"sad\",SUM(hell)\"hell\",SUM(funny)\"funny\"  ";
//			sql+= " from tblemotion WHERE regdate = CURDATE() - INTERVAL 2 DAY  ";
	 */
	
	
	public Vector<EmotionBean> GetGraphView(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<EmotionBean> vlist = new Vector<EmotionBean>();
		try {
			con = pool.getConnection();
			sql = " SELECT * FROM tbl_emotion order by e_created_at asc ";
			pstmt = con.prepareStatement(sql);			
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) {		 
				
				EmotionBean bean = new EmotionBean();
				bean.setHappy(rs.getInt(4));
				bean.setSad(rs.getInt(6));
				bean.setHell(rs.getInt(5));
				bean.setFunny(rs.getInt(7));			
				vlist.addElement(bean);				
			}			
			///////////////////////
			System.out.println(pstmt.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public void insertEmotion(int emotion, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;		
		try {
			con = pool.getConnection();
			sql =  " insert tblemotion(num,name,emotion,regdate) ";
			sql += " values(?,?,?,now()) ";
			pstmt = con.prepareStatement(sql);					
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
	}	
	
	///////////////////////happy	///////////////////////
	public void happyUp() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;		
		try {
			con = pool.getConnection();
			sql =  " UPDATE tbl_emotion set happy = happy +1 WHERE happy";			
			pstmt = con.prepareStatement(sql);				
			pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("해피업 에러"+e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
///////////////////////happy	///////////////////////
	public void funnyUp(Object sid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;		
		try {
			con = pool.getConnection();
			sql =  " UPDATE tbl_emotion set funny = funny +1 WHERE funny";			
			pstmt = con.prepareStatement(sql);					
			pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("퍼니업 에러"+e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
///////////////////////happy	///////////////////////
	public void sadUp() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;		
		try {
			con = pool.getConnection();
			sql =  " UPDATE tbl_emotion set sad = sad +1 WHERE sad";			
			pstmt = con.prepareStatement(sql);				
			pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("세드 에러"+e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
///////////////////////happy	///////////////////////
	public void hellUp() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;		
		try {
			con = pool.getConnection();
			sql =  " UPDATE tbl_emotion set hell = hell +1 WHERE hell";			
			pstmt = con.prepareStatement(sql);				
			pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("헬 에러"+e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
///////////////////////happy	///////////////////////
}
