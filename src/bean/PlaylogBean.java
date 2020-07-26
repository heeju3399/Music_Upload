package bean;

public class PlaylogBean {
	/***
	 * @Author @32lab
	 * @Database @comma
	 * @Table @tbl_playlog
	 * @Primary @Key @p_id
	 * @Foreign @Key @s_id @m_id
	 * @Fields @p_id @m_id @s_id @p_time @p_created_at @p_updated_at @p_latitude @p_longitude
	 */

	private int p_id;
	private String m_id;
	private int s_id;
	private String p_time;
	private String p_created_at;
	private String p_updated_at;
	private String p_latitude;
	private String p_longitude;

	public int getP_id() {
		/**
		 * @getter @32lab
		 */
		return p_id;
	}

	public void setP_id(int p_id) {
		/**
		 * @setter @32lab
		 */
		this.p_id = p_id;
	}

	public String getM_id() {
		/**
		 * @getter @32lab
		 */
		return m_id;
	}

	public void setM_id(String m_id) {
		/**
		 * @setter @32lab
		 */
		this.m_id = m_id;
	}

	public int getS_id() {
		/**
		 * @getter @32lab
		 */
		return s_id;
	}

	public void setS_id(int s_id) {
		/**
		 * @setter @32lab
		 */
		this.s_id = s_id;
	}

	public String getP_time() {
		/**
		 * @getter @32lab
		 */
		return p_time;
	}

	public void setP_time(String p_time) {
		/**
		 * @setter @32lab
		 */
		this.p_time = p_time;
	}

	public String getP_created_at() {
		/**
		 * @getter @32lab
		 */
		return p_created_at;
	}

	public void setP_created_at(String p_created_at) {
		/**
		 * @setter @32lab
		 */
		this.p_created_at = p_created_at;
	}

	public String getP_updated_at() {
		/**
		 * @getter @32lab
		 */
		return p_updated_at;
	}

	public void setP_updated_at(String p_updated_at) {
		/**
		 * @setter @32lab
		 */
		this.p_updated_at = p_updated_at;
	}

	public String getP_latitude() {
		/**
		 * @getter @32lab
		 */
		return p_latitude;
	}

	public void setP_latitude(String p_latitude) {
		/**
		 * @setter @32lab
		 */
		this.p_latitude = p_latitude;
	}

	public String getP_longitude() {
		/**
		 * @getter @32lab
		 */
		return p_longitude;
	}

	public void setP_longitude(String p_longitude) {
		/**
		 * @setter @32lab
		 */
		this.p_longitude = p_longitude;
	}

	public static String createQuery() {
		/**
		 * @Author @32Lab
		 * @PrepareStatement @SQL @Create
		 */
		String query = "CREATE TABLE `tbl_playlog` ("
				+ "  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'playlist id',"
				+ "  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',"
				+ "  `s_id` int(11) DEFAULT NULL COMMENT 'song id',"
				+ "  `p_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'playlist time',"
				+ "  `p_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,"
				+ "  `p_updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,"
				+ "  `p_latitude` double DEFAULT NULL COMMENT '재생 할때 위도',"
				+ "  `p_longitude` double DEFAULT NULL COMMENT '재생 할때 경도'," + "  PRIMARY KEY (`p_id`) USING BTREE"
				+ ") ENGINE=InnoDB DEFAULT CHARSET=utf8";
		return query;
	}

	public static String insertQuery() {
		/**
		 * @Author @32Lab
		 * @PrepareStatement @SQL @Insert
		 */
		String query = "INSERT INTO `comma`.`tbl_playlog`" + "(" + "`m_id`," + "`s_id`," + "`p_time`," + "`p_latitude`,"
				+ "`p_longitude`)" + "VALUES" + "(" + "?," + "?," + "?," + "?," + "?)";
		return query;
	}

	public static String selectAllQuery() {
		/**
		 * @Author @32Lab
		 * @PrepareStatement @SQL @Select @All
		 */

		String query = "SELECT `tbl_playlog`.`p_id`," + "    `tbl_playlog`.`m_id`," + "    `tbl_playlog`.`s_id`,"
				+ "    `tbl_playlog`.`p_time`," + "    `tbl_playlog`.`p_created_at`,"
				+ "    `tbl_playlog`.`p_updated_at`," + "    `tbl_playlog`.`p_latitude`,"
				+ "    `tbl_playlog`.`p_longitude`" + "FROM `comma`.`tbl_playlog`;" + "";
		return query;
	}

	public static String selectOneQuery() {
		/**
		 * @Author @32Lab
		 * @PrepareStatement @SQL @Select @One
		 */

		String query = "SELECT `tbl_playlog`.`p_id`," + "    `tbl_playlog`.`m_id`," + "    `tbl_playlog`.`s_id`,"
				+ "    `tbl_playlog`.`p_time`," + "    `tbl_playlog`.`p_created_at`,"
				+ "    `tbl_playlog`.`p_updated_at`," + "    `tbl_playlog`.`p_latitude`,"
				+ "    `tbl_playlog`.`p_longitude`" + "FROM `comma`.`tbl_playlog`;" + " WHERE p_id=?";
		return query;
	}

	public static String updateQuery() {
		/**
		 * @Author @32Lab
		 * @PrepareStatement @SQL @Update
		 */

		String query = "UPDATE `comma`.`tbl_playlog`" + "SET" + "`p_id` = ?," + "`m_id` = ?," + "`s_id` = ?,"
				+ "`p_time` = ?," + "`p_latitude` = ?," + "`p_longitude` = ?" + "WHERE `p_id` = ?;" + "";
		return query;
	}

	public static String deleteQuery() {
		/**
		 * @Author @32Lab
		 * @PrepareStatement @SQL @Delete
		 */

		String query = "DELETE FROM `comma`.`tbl_playlog`\r\n" + "WHERE p_id = ?";
		return query;
	}
}
