package bean;

public class CommentBean {

	/**
	 * @Author @32lab
	 * @description @tbl_song 의 @s_id 참조하여 댓글로 추가됩니다.
	 * @Database @comma
	 * @Table @tbl_comment
	 * @PrimaryKey @c_id
	 * @ForeignKey @m_id
	 * @Fields
	 **/
	private int c_id;
	private String m_id; // member
	private String c_content; // comment
	private int s_id; // song
	private String c_ip; // comment
	private String c_created_at; // comment
	private String c_updated_at; // comment

	public static String createQuery() {
		/**
		 * @PrepareStatement @SQL @Create
		 * @Author 32lab
		 */
		String query = " CREATE TABLE `tbl_comment` (";
		query += "`c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'comment id',";
		query += "`m_id` varchar(30) DEFAULT NULL COMMENT 'member id',";
		query += "`c_content` text COMMENT 'comment content',";
		query += " `s_id` int(11) DEFAULT NULL,";
		query += " `c_ip` varchar(30) DEFAULT NULL,";
		query += " `c_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,";
		query += " `c_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,";
		query += " PRIMARY KEY (`c_id`)";
		query += ")";
		query += "ENGINE=InnoDB DEFAULT CHARSET=utf8";
		return query;
	}

	public static String insertQuery() {
		/**
		 * @PrepareStatement @SQL @Insert
		 * @Author 32lab
		 */
		String query = "INSERT INTO tbl_comment(m_id,c_content,s_id,c_ip) VALUES(?, ?, ?, ?)";
		return query;
	}

	public static String selectAllQuery() {

		/**
		 * @PrepareStatement @SQL @Select @All
		 * @Author 32lab
		 */
		String query = "SELECT c_id, m_id, c_content, s_id, c_created_at, c_updated_at FROM tbl_comment";
		return query;
	}

	public static String selectOneQuery() {

		/**
		 * @PrepareStatement @SQL @Select @One
		 * @Author 32lab
		 */
		String query = "SELECT c_id,m_id,c_content,s_id,c_created_at,c_updated_at FROM tbl_comment WHERE s_id=?";
		return query;
	}

	public static String updateQuery() {

		/**
		 * @PrepareStatement @SQL @Update
		 * @Author 32lab
		 */
		String query = "UPDATE m_id=?, c_content=?, s_id=? WHERE c_id=?";
		return query;
	}

	public static String deleteQuery() {
		/**
		 * 
		 * @PrepareStatement @SQL @Delete @One
		 * @Author 32lab
		 */
		String query = "DELETE FROM tbl_comment WHERE c_id=?";
		return query;
	}

	public int getC_id() {
		/**
		 * @Getter
		 * @Author @32Lab
		 */
		return c_id;
	}

	public void setC_id(int c_id) {

		/**
		 * @Setter
		 * @Author @32labb
		 */
		this.c_id = c_id;
	}

	public String getM_id() {
		/**
		 * @Getter
		 * @Author @32Lab
		 */
		return m_id;
	}

	public void setM_id(String m_id) {

		/**
		 * @Setter
		 * @Author @32labb
		 */
		this.m_id = m_id;
	}

	public String getC_content() {
		/**
		 * @Getter
		 * @Author @32Lab
		 */
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public int getS_id() {
		/**
		 * @Getter
		 * @Author @32Lab
		 */
		return s_id;
	}

	public void setS_id(int s_id) {

		/**
		 * @Setter
		 * @Author @32labb
		 */
		this.s_id = s_id;
	}

	public String getC_ip() {
		/**
		 * @Getter
		 * @Author @32Lab
		 */
		return c_ip;
	}

	public void setC_ip(String c_ip) {

		/**
		 * @Setter
		 * @Author @32labb
		 */
		this.c_ip = c_ip;
	}

	public String getC_created_at() {
		/**
		 * @Getter
		 * @Author @32Lab
		 */
		return c_created_at;
	}

	public void setC_created_at(String c_created_at) {
		this.c_created_at = c_created_at;
	}

	public String getC_updated_at() {
		/**
		 * @Getter
		 * @Author @32Lab
		 */
		return c_updated_at;
	}

	public void setC_updated_at(String c_updated_at) {

		/**
		 * @Setter
		 * @Author @32lab
		 */
		this.c_updated_at = c_updated_at;
	}

}
