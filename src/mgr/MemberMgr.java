package mgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.MemberBean;

public class MemberMgr {

	private DBMgr pool;

	public MemberMgr() {
		pool = DBMgr.getInstance();
	}

	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select m_id from tbl_Member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();//
			flag = rs.next();//
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	//
	public int signUp(MemberBean memberBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int state = 0;
		try {
			con = pool.getConnection();
			sql = " insert tbl_member(m_id,m_pwd,m_email,m_birth,m_visited,m_latitude,m_longitude,m_created_at) ";
			sql += " values(?,?,?,?,now(),?,?,now()) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getM_id());
			pstmt.setString(2, memberBean.getM_pwd());
			pstmt.setString(3, memberBean.getM_email());
			pstmt.setString(4, memberBean.getM_birth());
			pstmt.setDouble(5, memberBean.getM_latitude());
			pstmt.setDouble(6, memberBean.getM_longitude());
			state = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("���ξ�����" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return state;
	}

	public int signIn(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int state = 0;

		try {
			if (!checkId(bean.getM_id()))
				return state;

			con = pool.getConnection();
			sql = "select m_id, m_pwd from tbl_Member where m_id = ? and m_pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getM_id());
			pstmt.setString(2, bean.getM_pwd());
			rs = pstmt.executeQuery();
			int test = AddLongitudeLatitude(bean);
			if (rs.next()) {
				if(bean.getM_id().equals("admin")) {
				 state = 4;//admin ����
				 System.out.println("������ 4�� ���");
				}else {
				 state = 1;//id,pass  okok
				}
			
				
			} else if (test != 3) {
				System.out.println("??����");
			} else
				state = -1;// id true, pass fail
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�����ο���" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return state;
	}

	public int AddLongitudeLatitude(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int flag = 0;

		try {
			con = pool.getConnection();
			sql = " update tbl_member set m_latitude=?, m_longitude=? where m_id=? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, bean.getM_latitude());
			pstmt.setDouble(2, bean.getM_longitude());
			pstmt.setString(3, bean.getM_id());
			if (pstmt.executeUpdate() == 1) {
				flag = 3;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("���浵����" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	public MemberBean getMemberBean(String id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberBean bean = new MemberBean();
		try {
			con = pool.getConnection();
			sql = "select * from tbl_Member where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setM_id(rs.getString("m_id"));
				bean.setM_pwd(rs.getString("m_pwd"));
				bean.setM_email(rs.getString("m_email"));
				bean.setM_birth(rs.getString("m_birth"));
			}
		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println("�ٸ���� ����" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	public boolean updateMemberBean(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		System.out.println("0");
		System.out.println(bean.getM_id());
		System.out.println(bean.getM_pwd());
		System.out.println(bean.getM_email());
		try {
			con = pool.getConnection();
			sql = " update tbl_member set m_pwd=?, m_email=?, m_birth=? where m_id=? ";
			System.out.println("1");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getM_pwd());
			pstmt.setString(2, bean.getM_email());
			pstmt.setString(3, bean.getM_birth());
			System.out.println("2");
			pstmt.setString(4, bean.getM_id());
			if (pstmt.executeUpdate() == 1)
				flag = true;

		} catch (Exception e) {

			System.out.println("������Ʈ�������" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	public int identifyIdAndEmail(String id, String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int state = 0;
		// 0-id false, 1-id true email-false, -1 id&email true
		try {
			if (!checkId(id))//
				return state;
			con = pool.getConnection();
			sql = "select m_id, m_email from tbl_Member where m_id = ? and m_email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if (rs.next())
				state = 1;// pass
			else
				state = -1;// id true, pass fail
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("���̵��̸��̤���ã�⿡��" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return state;
	}

	public boolean reWritePass(String id, String email, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = " update tbl_member set m_pwd=? where m_id=? ";
			System.out.println("1");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			
			if (pstmt.executeUpdate() == 1)
				flag = true;

		} catch (Exception e) {
			System.out.println("비밀번호수정에러" + e);
		} finally { 
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	/// admin mode/////////////
//		public Vector<MemberBean> getMemberBeanList() {
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			String sql = null;
//			Vector<MemberBean> vlist = new Vector<>();
//			try {
//				con = pool.getConnection();
//				sql = "select * from tblMemberBean";
//				pstmt = con.prepareStatement(sql);
//				rs = pstmt.executeQuery();
//				while (rs.next()) {
//					MemberBean bean = new MemberBean();
//					bean.setId(rs.getString("id"));
//					bean.setPwd(rs.getString("pwd"));
//					bean.setName(rs.getString("name"));
//					bean.setGender(rs.getString("gender"));
//					bean.setBirthday(rs.getString("birthday"));
//					bean.setEmail(rs.getString("email"));
//					vlist.addElement(bean);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				pool.freeConnection(con, pstmt, rs);
//			}
//			return vlist;
//		}
	//
//		//Admin Login
//		public boolean adminCheck(String admin_id, String admin_pwd) {
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			String sql = null;
//			boolean flag = false;
//			try {
//				con = pool.getConnection();
//				sql = "select admin_id, admin_pwd from tblAdmin where admin_id = ? and admin_pwd = ?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, admin_id);
//				pstmt.setString(2, admin_pwd);
//				rs = pstmt.executeQuery();
//				flag = rs.next();
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				pool.freeConnection(con);
//			}
//			return flag;
//		}
	//
//		//Send id, pwd
//		public void sendAccount(String id) {
//			MemberBean bean = getMemberBean(id);
//			String pwd = bean.getPwd();
//			String title = "OOO.com
//			String content = "<font color='red'><b>id : " + id; 
//			content+= " / pwd : " + pwd+"</b></font>";
//			String toEmail = bean.getEmail();
//			MailSend.send(title, content, toEmail);
//		}

}