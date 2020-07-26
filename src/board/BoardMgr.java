package board;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mgr.DBMgr;

public class BoardMgr {

	private DBMgr pool;
	// 저장되는 경로
	public static final String SAVEFOLDER = "C:\\comma111111111\\commaaaa\\WebContent\\board\\fileupload";
	public static final String ENCTYPE = "UTF-8";
	public static int MAXSIZE = 50000 * 1024 * 1024; //

	public BoardMgr() {
		pool = DBMgr.getInstance();
	}

	// Board Insert : 파일업로드, contentType, ref의 상대적인 위치값
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			////////// 파일업로드 폴더 생성//////////////
			File dir = new File(SAVEFOLDER);
			if (!dir.exists()) {// 폴더가 존재하지 않는다면
				// mkdir:상위 폴더가 없으면 생성불가
				// mkdirs:상위 폴더가 없어도 생성가능
				dir.mkdirs();
			}
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE,
					new DefaultFileRenamePolicy());
			String filename = null;
			int filesize = 0;
			String myimgname = null;
			int myimgsize = 0;
			// 모든 게시물이 파일업로드를 하는거 아니다.
			// 사용자가 파일을 업로드 하는 경우
			if (multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				System.out.println(filename);
				filesize = (int) multi.getFile("filename").length();
			}
			if (multi.getFilesystemName("myimg") != null) {
				myimgname = multi.getFilesystemName("myimg");
				myimgsize = (int) multi.getFile("myimg").length();
			} else {
				myimgname = "screct.jpg";
				myimgsize = 404;
			}
//			//게시물 contentType : text, html			
			String content = multi.getParameter("content");// 게시물 내용
//			String contentType = multi.getParameter("contentType");
//			if(contentType.equals("TEXT")) {
//				content = UtilMgr.replace(content, "<", "&lt;");
//			}
			/// 답변을 위한 ref 설정/////
			// int ref = getMaxNum() + 1;
//			sql = "insert tbl_Board(m_id,content,subject,ref,pos,depth,";
//			sql += "regdate,pass,count,ip,filename,filesize)";
//			sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?)";
			// 댓글 갈기는 sql임
			con = pool.getConnection();
			sql = " insert tbl_Board(m_id,content,subject, ";
			sql += " regdate,pass,ip,filename,filesize,myimgname,myimgsize,name,count)";
			sql += "values(?, ?, ?, now(), ?, ?, ?,?,?,?,?,1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("id"));
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("subject"));
			// pstmt.setInt(4, ref);
			pstmt.setString(4, multi.getParameter("pass"));
			pstmt.setString(5, multi.getParameter("ip"));
			pstmt.setString(6, filename);
			pstmt.setInt(7, filesize);
			pstmt.setString(8, myimgname);
			pstmt.setInt(9, myimgsize);
			pstmt.setString(10, multi.getParameter("name"));
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("인서트 보더에러" + e);
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Board Max Num : ref에 저장에 필요한 기능
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tbl_Board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				maxNum = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("겟 맥스넘에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}

	// Board Total Count : 총 게시물수
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (keyWord.trim().equals("") || keyWord == null) {
				// 검색이 아닌경우
				sql = "select count(*) from tbl_Board";
				pstmt = con.prepareStatement(sql);
			} else {
				// 검색인 경우
				sql = "select count(*) from tbl_Board where " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next())
				totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("겟토탈카운드에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}

	// Board List : 페이지당 보여줄 갯수만 리턴, 검색 포함.
	// keyField : 선택옵션(name, subject, content)
	// keyWord : 검색어
	// start : 시작번호, cnt : 한 페이지당 가져올 게시물 개수
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int cnt) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			if (keyWord.trim().equals("") || keyWord == null) {
				// 검색이 아닌경우
				sql = "select * from tbl_Board order by regdate desc ";
				pstmt = con.prepareStatement(sql);
			} else {
				// 검색인 경우
				sql = "select * from tbl_Board where " + keyField + " like ? order by ref desc, pos limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, cnt);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("m_id"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setName(rs.getString("name"));
				bean.setLike(rs.getInt("like"));
				bean.setBad(rs.getInt("bad"));
				bean.setMyimgname(rs.getString("myimgname"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			System.out.println("리스트 에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	public Vector<BoardBean> getBoardList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			// 검색이 아닌경우
			sql = "select * from tbl_Board order by regdate desc ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("m_id"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setName(rs.getString("name"));
				bean.setLike(rs.getInt("like"));
				bean.setBad(rs.getInt("bad"));
				bean.setMyimgname(rs.getString("myimgname"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			System.out.println("리스트 에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	public Vector<BoardBean> getBoardList2(String keyField, String keyWord, int start, int cnt) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			if (keyWord.trim().equals("") || keyWord == null) {
				// 검색이 아닌경우
				sql = "select * from tbl_Board order by regdate desc ";
				pstmt = con.prepareStatement(sql);
			} else {
				// 검색인 경우
				sql = "select * from tbl_Board where " + keyField + " like ? order by ref desc, pos limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, cnt);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("m_id"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setName(rs.getString("name"));
				bean.setLike(rs.getInt("like"));
				bean.setBad(rs.getInt("bad"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			System.out.println("리스트 에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// Board Get : 한개의 게시물, 13개 컬럼 모두 리턴
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from tbl_Board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				upCount(rs.getInt("num"));
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("m_id"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setIp(rs.getString("ip"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
				bean.setName(rs.getString("myimgname"));
				bean.setLike(rs.getInt("like"));
				bean.setBad(rs.getInt("bad"));

			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// Count Up : 조회수 증가
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tbl_Board set count = count +1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("업카운트에러" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Like up : 좋아요
	public void upLike(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tbl_Board set `like`=`like`+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Bad up : 싫어요
	public void upBad(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tbl_Board set bad = bad+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Board Delete : 업로드 파일 삭제
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			/////// 업로드 파일 삭제////////////////////
			BoardBean bean = getBoard(num);
			String filename = bean.getFilename();
			if (filename != null && !filename.equals("")) {
				File f = new File(SAVEFOLDER + filename);
				if (f.exists()) {
					UtilMgr.delete(SAVEFOLDER + filename);
				}
			}
			////////////////////////////////////
			con = pool.getConnection();
			sql = "delete from tbl_Board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("딜리트 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Board Update : name, subject, content 3개만 수정
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set id=?, subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("업데이트 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Board Update2 : 업로드 파일 수정 포함
	public void updateBoard2(MultipartRequest multi) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			int num = Integer.parseInt(multi.getParameter("num"));
			String id = multi.getParameter("id");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String filename = multi.getFilesystemName("filename");
			if (filename != null && !filename.equals("")) {
				// 업로드 파일까지 수정 : 기존에 파일은 삭제
				BoardBean bean = getBoard(num);
				String tempfile = bean.getFilename();
				if (tempfile != null && !tempfile.equals("")) {
					File f = new File(SAVEFOLDER + tempfile);
					if (f.exists()) {
						UtilMgr.delete(SAVEFOLDER + tempfile);
					}
				}
				int filesize = (int) multi.getFile("filename").length();
				sql = "update tblBoard set name=?, subject=?, content=?, " + "filename=?, filesize=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setString(4, filename);
				pstmt.setInt(5, filesize);
				pstmt.setInt(6, num);
			} else {
				sql = "update tblBoard set id=?, subject=?, content=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setInt(4, num);
			}
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("업데이트보터22 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Board Reply: 답변글 저장
	public void replyBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard(id,content,subject,ref,pos,depth,regdate,"
					+ "pass,count,ip)values(?, ?, ?, ?, ?, ?, now(), ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getSubject());
			///////////////////////////////////
			pstmt.setInt(4, bean.getRef());// 원글과 동일한 Ref
			pstmt.setInt(5, bean.getPos() + 1);// 원글의 pos+1
			pstmt.setInt(6, bean.getDepth() + 1);// 원글의 depth+1
			///////////////////////////////////
			pstmt.setString(7, bean.getPass());
			pstmt.setString(8, bean.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("답글저장 리플라이보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Board Reply Up : 답변글 위치값 조정
	// 답변하고자는 게시물의 pos 값보다 큰 값들을 1씩 증가
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set pos=pos+1 where ref=? and pos>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("replyUpBoard 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Post 1000 : 페이징 및 블럭 처리를 위해 게시물 1000개 삽입.
	public void post1000() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tbl_Board(m_id,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql += "values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// 메인화면에 카운트 수대로 1위 2위 뿌려주는 mgr @KJH count 수대로
	// Board Get : 한개의 게시물, 13개 컬럼 모두 리턴
	public BoardBean getshowmain1() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "SELECT name,num, subject, myimgname, content FROM tbl_board WHERE count=(select MAX(count) from tbl_board)";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setNum(rs.getInt("num"));
				bean.setMyimgname(rs.getString("myimgname"));
			}
		} catch (Exception e) {
			System.out.println("에러링" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

//2위 뿌려주기 @KJH  count 수대로
	public BoardBean getshowmain2() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "SELECT name,num,subject,myimgname, content, MAX(COUNT) FROM tbl_board WHERE count < (SELECT MAX(count) fROM tbl_board)";
			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, count);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setNum(rs.getInt("num"));
				bean.setMyimgname(rs.getString("myimgname"));
			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

//3위 뿌려주기 @KJH count 수대로
	public BoardBean getshowmain3() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "SELECT distinct name,num, subject, myimgname, content FROM tbl_board ORDER BY  tbl_board.`COUNT` DESC LIMIT 2,1";
			pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, count);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setNum(rs.getInt("num"));
				bean.setMyimgname(rs.getString("myimgname"));
			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 3위 뿌려주기 @KJH count 수대로
	public BoardBean getshowmain4() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "SELECT distinct name,num, subject, myimgname, content FROM tbl_board ORDER BY  tbl_board.`COUNT` DESC LIMIT 3,1";
			pstmt = con.prepareStatement(sql);
//					pstmt.setInt(1, count);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setNum(rs.getInt("num"));
				bean.setMyimgname(rs.getString("myimgname"));
			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 3위 뿌려주기 @KJH count 수대로
	public BoardBean getshowmain5() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "SELECT distinct name,num, subject, myimgname, content FROM tbl_board ORDER BY  tbl_board.`COUNT` DESC LIMIT 4,1";
			pstmt = con.prepareStatement(sql);
//						pstmt.setInt(1, count);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setNum(rs.getInt("num"));
				bean.setMyimgname(rs.getString("myimgname"));
			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 좋아요 1위 뿌려주기 @KJH
	public BoardBean getshowmainlike1() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "SELECT distinct name,num, subject, myimgname, content FROM tbl_board ORDER BY  tbl_board.`like` DESC LIMIT 0,1";
			pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, count);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setNum(rs.getInt("num"));
				bean.setMyimgname(rs.getString("myimgname"));
			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 좋아요 2위 뿌려주기 @KJH
	public BoardBean getshowmainlike2() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "SELECT distinct name,num, subject, myimgname, content FROM tbl_board ORDER BY  tbl_board.`like` DESC LIMIT 1,1";
			pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, count);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setNum(rs.getInt("num"));
				bean.setMyimgname(rs.getString("myimgname"));
			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 좋아요 3위 뿌려주기 @KJH
	public BoardBean getshowmainlike3() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "SELECT distinct name,num, subject,myimgname, content FROM tbl_board ORDER BY  tbl_board.`like` DESC LIMIT 2,1";
			pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, count);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setMyimgname(rs.getString("myimgname"));
			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 좋아요 2위 뿌려주기 @KJH
	public BoardBean getshowmainlike4() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "SELECT distinct name,num, subject, myimgname, content FROM tbl_board ORDER BY  tbl_board.`like` DESC LIMIT 3,1";
			pstmt = con.prepareStatement(sql);
//					pstmt.setInt(1, count);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setSubject(rs.getString("subject"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setNum(rs.getInt("num"));
				bean.setMyimgname(rs.getString("myimgname"));
			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 좋아요 2위 뿌려주기 @KJH
	public Vector<BoardBean> getTopLike5() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vector = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM tbl_board ORDER BY  tbl_board.`like` DESC LIMIT 0,5;";
			pstmt = con.prepareStatement(sql);
//					pstmt.setInt(1, count);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("m_id"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setName(rs.getString("name"));
				bean.setLike(rs.getInt("like"));
				bean.setBad(rs.getInt("bad"));
				bean.setMyimgname(rs.getString("myimgname"));
				vector.add(bean);
			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vector;
	}

	// 좋아요 2위 뿌려주기 @KJH
	public Vector<BoardBean> getTopView5() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vector = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM tbl_board ORDER BY  tbl_board.`count` DESC LIMIT 0,5;";
			pstmt = con.prepareStatement(sql);
//						pstmt.setInt(1, count);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("m_id"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setName(rs.getString("name"));
				bean.setLike(rs.getInt("like"));
				bean.setBad(rs.getInt("bad"));
				bean.setMyimgname(rs.getString("myimgname"));
				vector.add(bean);
			}
		} catch (Exception e) {
			System.out.println("갯갯 보더에러" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vector;
	}

	public static void main(String[] args) {
//		BoardMgr mgr = new BoardMgr();
//		mgr.post1000();
//		System.out.println("성공~~");
	}

}
