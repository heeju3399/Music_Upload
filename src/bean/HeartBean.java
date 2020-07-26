package bean;

public class HeartBean {

	/**
	 * @Author : @32lab
	 * @Created : @20200531
	 * @Updated : @20200531
	 * @Table : tbl_heart
	 * @PrimaryKey : h_id
	 * @ForeignKey : m_id,s_id
	 */
	private int h_id;
	private String m_id;
	private String s_id;
	private String h_text;
	private String h_time;
	private String h_created_at;
	private String h_updated_at;

	/**
	 * @Getter
	 * @Setter
	 * @Author : @32lab
	 */
	public int getH_id() {
		/**
		 * @Getter
		 * @Author : @32lab
		 **/
		return h_id;
	}

	public String getH_created_at() {
		/**
		 * @Getter
		 * @Author : @32lab
		 **/
		return h_created_at;
	}

	public void setH_created_at(String h_created_at) {
		/**
		 * @Getter
		 * @Author : @32lab
		 **/
		this.h_created_at = h_created_at;
	}

	public String getH_updated_at() {
		/**
		 * @Getter
		 * @Author : @32lab
		 **/
		return h_updated_at;
	}

	public void setH_updated_at(String h_updated_at) {

		/**
		 * @Setter
		 * @Author : @32lab
		 **/
		this.h_updated_at = h_updated_at;
	}

	public void setH_id(int h_id) {

		/**
		 * @Setter
		 * @Author : @32lab
		 **/
		this.h_id = h_id;
	}

	public String getM_id() {
		/**
		 * @Getter
		 * @Author : @32lab
		 **/
		return m_id;
	}

	public void setM_id(String m_id) {

		/**
		 * @Setter
		 * @Author : @32lab
		 **/
		this.m_id = m_id;
	}

	public String getS_id() {
		/**
		 * @Getter
		 * @Author : @32lab
		 **/
		return s_id;
	}

	public void setS_id(String s_id) {

		/**
		 * @Setter
		 * @Author : @32lab
		 **/
		this.s_id = s_id;
	}

	public String getH_text() {
		/**
		 * @Getter
		 * @Author : @32lab
		 **/
		return h_text;
	}

	public void setH_text(String h_text) {

		/**
		 * @Setter
		 * @Author : @32lab
		 **/
		this.h_text = h_text;
	}

	public String getH_time() {
		/**
		 * @Getter
		 * @Author : @32lab
		 **/
		return h_time;
	}

	public void setH_time(String h_time) {

		/**
		 * @Setter
		 * @Author : @32lab
		 **/
		this.h_time = h_time;
	}

	public static String createQuery() {
		/**
		 * @Author : @32lab
		 * @SQL @PrepareStatement @Create
		 **/
		String query = "CREATE TABLE `tbl_heart` ("
				+ "	`h_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'heart (like) id',"
				+ "	`m_id` VARCHAR(30) NULL DEFAULT NULL COMMENT 'member id' COLLATE 'utf16_general_ci',"
				+ "	`s_id` INT(11) NULL DEFAULT NULL COMMENT 'song id',"
				+ "	`h_text` VARCHAR(60) NULL DEFAULT NULL COLLATE 'utf8_general_ci',"
				+ "	`h_time` INT(11) NULL DEFAULT NULL,"
				+ "	`h_created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,"
				+ "	`h_updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,"
				+ "	PRIMARY KEY (`h_id`) USING BTREE," + "	UNIQUE INDEX `m_id_s_id` (`m_id`, `s_id`) USING BTREE" + ")"
				+ "COLLATE='utf8_general_ci'" + "ENGINE=InnoDB";
		return query;
	}

	public static String selectAllQuery() {
		/**
		 * @Author : @32lab
		 * @SQL @PrepareStatement @Select @All
		 **/
		String query = " select h_id, m_id, s_id, h_text, h_time, h_created_at, h_updated_at from tbl_heart";
		return query;
	}

	public static String selectOneQuery() {
		/**
		 * @Author : @32lab
		 * @SQL @PrepareStatement @Select @One
		 **/
		String query = "select h_id, m_id, s_id, h_text, h_time, h_created_at, h_updated_at from tbl_heart where h_id=?";
		return query;
	}

	public static String insertQuery() {
		/**
		 * @Author : @32lab
		 * @SQL @PrepareStatement @Insert
		 **/
		String query = "insert into tbl_heart(h_id,m_id,s_id,h_text,h_time) values(?,?,?,?,?)";
		return query;
	}

	public static String updateQuery() {
		/**
		 * @Author : @32lab
		 * @SQL @PrepareStatement @Update
		 **/
		String query = "update tbl_heart(h_id,m_id,s_id,h_text,h_time) where h_id = ?";
		return query;
	}

	public static String deleteQuery() {
		/**
		 * @Author : @32lab
		 * @SQL @PrepareStatement @Delete
		 **/
		String query = "delete from tbl_heart where h_id=?";
		return query;
	}

}
