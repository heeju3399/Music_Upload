package bean;

public class MemberBean {
	/**
	 * @Author : @32lab
	 * @Created : @20200531
	 * @Updated : @20200531
	 * @Database : @Comma
	 * @Table : @tbl_member
	 * 
	 */ 

	/**
	 * @Author : @32lab
	 * @Fields
	 */
	private String m_id;
	private String m_pwd;
	private String m_email;
	private String m_birth;
	private String m_visited;
	private String m_auth;
	private double m_latitude;
	private double m_longitude;
	private String m_tag;
	private String m_creted_at;
	private String m_updated_at;
	
	public double getM_latitude() {
		return m_latitude;
	}

	public void setM_latitude(double m_latitude) {
		this.m_latitude = m_latitude;
	}

	public double getM_longitude() {
		return m_longitude;
	}

	public void setM_longitude(double m_longitude) {
		this.m_longitude = m_longitude;
	}

	/**
	 * @Author : @32lab
	 * @Getter @Setter
	 */

	public String getM_id() {
		/**
		 * @Author @32lab
		 */
		return m_id;
	}

	public void setM_id(String m_id) {
		/**
		 * @Author @32lab
		 */
		this.m_id = m_id;
	}

	public String getM_pwd() {
		/**
		 * @Author @32lab
		 */
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		/**
		 * @Author @32lab
		 */
		this.m_pwd = m_pwd;
	}

	public String getM_email() {
		/**
		 * @Author @32lab
		 */
		return m_email;
	}

	public void setM_email(String m_email) {
		/**
		 * @Author @32lab
		 */
		this.m_email = m_email;
	}

	public String getM_birth() {
		/**
		 * @Author @32lab
		 */
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		/**
		 * @Author @32lab
		 */
		this.m_birth = m_birth;
	}

	public String getM_visited() {
		/**
		 * @Author @32lab
		 */
		return m_visited;
	}

	public void setM_visited(String m_visited) {
		/**
		 * @Author @32lab
		 */
		this.m_visited = m_visited;
	}

	public String getM_auth() {
		/**
		 * @Author @32lab
		 */
		return m_auth;
	}

	public void setM_auth(String m_auth) {
		/**
		 * @Author @32lab
		 */
		this.m_auth = m_auth;
	}

	

	public String getM_tag() {
		/**
		 * @Author @32lab
		 */
		return m_tag;
	}

	public void setM_tag(String m_tag) {
		/**
		 * @Author @32lab
		 */
		this.m_tag = m_tag;
	}

	public String getM_creted_at() {
		/**
		 * @Author @32lab
		 */
		return m_creted_at;
	}

	public void setM_creted_at(String m_creted_at) {
		/**
		 * @Author @32lab
		 */
		this.m_creted_at = m_creted_at;

	}

	public String getM_updated_at() {
		/**
		 * @Author @32lab
		 */
		return m_updated_at;
	}

	public void setM_updated_at(String m_updated_at) {
		/**
		 * @Author @32lab
		 */
		this.m_updated_at = m_updated_at;
	}

	public static String createQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "CREATE TABLE `tbl_member` (" + "  `m_id` varchar(30) NOT NULL COMMENT 'member id',"
				+ "  `m_pwd` varchar(256) NOT NULL COMMENT 'member password',"
				+ "  `m_email` varchar(30) NOT NULL COMMENT 'member email',"
				+ "  `m_birth` date DEFAULT NULL COMMENT 'member birthday',"
				+ "  `m_visited` date DEFAULT NULL COMMENT 'member last login date, visited',"
				+ "  `m_auth` enum('Y','N') DEFAULT 'N' COMMENT 'member auth(admin, user)',"
				+ "  `m_latitude` double DEFAULT NULL COMMENT 'member gps last latitude 위도',"
				+ "  `m_longitude` double DEFAULT NULL COMMENT 'member gps last_longitude 경도',"
				+ "  `m_tag` text COMMENT 'member favorite tag',"
				+ "  `m_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,"
				+ "  `m_updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,"
				+ "  PRIMARY KEY (`m_id`)," + "  UNIQUE KEY `email_UNIQUE` (`m_email`)"
				+ ") ENGINE=InnoDB DEFAULT CHARSET=utf8";
		return query;
	}

	public static String selectAllQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "SELECT `tbl_member`.`m_id`," + "    `tbl_member`.`m_pwd`," + "    `tbl_member`.`m_email`,"
				+ "    `tbl_member`.`m_birth`," + "    `tbl_member`.`m_visited`," + "    `tbl_member`.`m_auth`,"
				+ "    `tbl_member`.`m_latitude`," + "    `tbl_member`.`m_longitude`," + "    `tbl_member`.`m_tag`,"
				+ "    `tbl_member`.`m_created_at`," + "    `tbl_member`.`m_updated_at`" + "FROM `comma`.`tbl_member`";
		return query;
	}

	public static String selectOneQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "SELECT `tbl_member`.`m_id`," + "    `tbl_member`.`m_pwd`," + "    `tbl_member`.`m_email`,"
				+ "    `tbl_member`.`m_birth`," + "    `tbl_member`.`m_visited`," + "    `tbl_member`.`m_auth`,"
				+ "    `tbl_member`.`m_latitude`," + "    `tbl_member`.`m_longitude`," + "    `tbl_member`.`m_tag`,"
				+ "    `tbl_member`.`m_created_at`," + "    `tbl_member`.`m_updated_at`" + "FROM `comma`.`tbl_member`";
		query += " WHERE m_id=?";
		return query;
	}

	public static String insertQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "INSERT INTO `comma`.`tbl_member`" + "(`m_id`," + "`m_pwd`," + "`m_email`," + "`m_birth`,"
				+ "`m_visited`," + "`m_auth`," + "`m_latitude`," + "`m_longitude`," + "`m_tag`)" + "VALUES" + "(?,"
				+ "?," + "?," + "?," + "?," + "?," + "?," + "?," + "?)" + "";
		return query;
	}

	public static String updateQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "UPDATE `comma`.`tbl_member`" + "SET" + "`m_id` = ?," + "`m_pwd` = ?," + "`m_email` = ?,"
				+ "`m_birth` = ?," + "`m_visited` = ?," + "`m_auth` = ?," + "`m_latitude` = ?," + "`m_longitude` = ?,"
				+ "`m_tag` = ?," + "`m_created_at` = ?," + "`m_updated_at` = ?" + "WHERE `m_id` = ?" + "";
		return query;
	}

	public static String deleteQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "DELETE FROM `comma`.`tbl_member`" + " WHERE m_id=?";
		return query;

	}
}
