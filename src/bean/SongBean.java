package bean;

public class SongBean {

	/**
	 * @Author @32lab
	 * @Table @tbl_song
	 * @Fields @s_id @s_title @m_id @s_artist
	 * @Filed @s_file -> @s_mp3
	 * @Filed @s_url -> @s_mp4
	 * @Fileds @s_lyrics @s_age
	 * @Timestamp @Fields @s_created_at @s_updated_at @s_disabled_at
	 * @Fileds @s_hit @s_tag
	 * @Fields @s_start @s_dj @s_duration @s_img
	 */
	private int s_id;
	private String s_title;
	private String m_id;
	private String s_artist;
	private String s_lyrics;
	private int s_age;
	private String s_created_at;
	private int s_hit;
	private String s_update_at;
	private String s_disabled_at;

	
	
	public String getS_update_at() {
		return s_update_at;
	}

	public void setS_update_at(String s_update_at) {
		this.s_update_at = s_update_at;
	}

	public String getS_disabled_at() {
		return s_disabled_at;
	}

	public void setS_disabled_at(String s_disabled_at) {
		this.s_disabled_at = s_disabled_at;
	}

	/***
	 * @Updated
	 * @Renamed @s_file @s_url -> @s_mp3 @s_mp4
	 * @Add @s_dj @s_start @s_end @s_duration @s_tag @s_img
	 * @Author @32lab
	 */
	private String s_dj;
	private int s_start;
	private int s_end;
	private int s_duration;
	private String s_img;
	private String s_tag;
	private String s_mp3;
	private String s_mp4;

	/**
	 * @Getter
	 * @Setter
	 * @Author @32lab
	 */
	public String getS_dj() {
		/**
		 * @Author @32lab
		 */
		return s_dj;
	}

	public void setS_dj(String s_dj) {
		/**
		 * @Author @32lab
		 */
		this.s_dj = s_dj;
	}

	public int getS_start() {
		/**
		 * @Author @32lab
		 */
		return s_start;
	}

	public void setS_start(int s_start) {
		/**
		 * @Author @32lab
		 */
		this.s_start = s_start;
	}

	public int getS_end() {
		/**
		 * @Author @32lab
		 */
		return s_end;
	}

	public void setS_end(int s_end) {
		/**
		 * @Author @32lab
		 */
		this.s_end = s_end;
	}

	public int getS_duration() {
		/**
		 * @Author @32lab
		 */
		return s_duration;
	}

	public void setS_duration(int s_duration) {
		/**
		 * @Author @32lab
		 */
		this.s_duration = s_duration;
	}

	public String getS_img() {
		/**
		 * @Author @32lab
		 */
		return s_img;
	}

	public void setS_img(String s_img) {
		/**
		 * @Author @32lab
		 */
		this.s_img = s_img;
	}

	public String getS_tag() {
		/**
		 * @Author @32lab
		 */
		return s_tag;
	}

	public void setS_tag(String s_tag) {
		/**
		 * @Author @32lab
		 */
		this.s_tag = s_tag;
	}

	public String getS_mp3() {
		/**
		 * @Author @32lab
		 */
		return s_mp3;
	}

	public void setS_mp3(String s_mp3) {
		/**
		 * @Author @32lab
		 */
		this.s_mp3 = s_mp3;
	}

	public String getS_mp4() {
		/**
		 * @Author @32lab
		 */
		return s_mp4;
	}

	public void setS_mp4(String s_mp4) {
		/**
		 * @Author @32lab
		 */
		this.s_mp4 = s_mp4;
	}

	public int getS_hit() {
		/**
		 * @Author @32lab
		 */
		return s_hit;
	}

	public void setS_hit(int s_hit) {
		/**
		 * @Author @32lab
		 */
		this.s_hit = s_hit;
	}

	public String getS_created_at() {
		/**
		 * @Author @32lab
		 */
		return s_created_at;
	}

	public void setS_created_at(String s_created_at) {
		/**
		 * @Author @32lab
		 */
		this.s_created_at = s_created_at;
	}

	public int getS_id() {
		/**
		 * @Author @32lab
		 */
		return s_id;
	}

	public void setS_id(int s_id) {
		/**
		 * @Author @32lab
		 */
		this.s_id = s_id;
	}

	public String getS_title() {
		/**
		 * @Author @32lab
		 */
		return s_title;
	}

	public void setS_title(String s_title) {
		/**
		 * @Author @32lab
		 */
		this.s_title = s_title;
	}

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

	public String getS_artist() {
		/**
		 * @Author @32lab
		 */
		return s_artist;
	}

	public void setS_artist(String s_artist) {
		/**
		 * @Author @32lab
		 */
		this.s_artist = s_artist;
	}

	public String getS_lyrics() {
		/**
		 * @Author @32lab
		 */
		return s_lyrics;
	}

	public void setS_lyrics(String s_lyrics) {
		/**
		 * @Author @32lab
		 */
		this.s_lyrics = s_lyrics;
	}

	public int getS_age() {
		/**
		 * @Author @32lab
		 */
		return s_age;
	}

	public void setS_age(int s_age) {
		/**
		 * @Author @32lab
		 */
		this.s_age = s_age;
	}

	public static String createQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "CREATE TABLE `tbl_song` (" + "  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'song id',"
				+ "  `s_title` varchar(200) NOT NULL COMMENT 'song title',"
				+ "  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',"
				+ "  `s_artist` varchar(100) DEFAULT NULL COMMENT 'member_id',"
				+ "  `s_mp3` text COMMENT 'song file path'," + "  `s_mp4` text COMMENT 'song web url link',"
				+ "  `s_lyrics` text COMMENT 'song lyrics',"
				+ "  `s_age` varchar(12) DEFAULT NULL COMMENT 'song min age required',"
				+ "  `s_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'song created at',"
				+ "  `s_updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,"
				+ "  `s_disabled_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,"
				+ "  `s_hit` int(11) NOT NULL DEFAULT '0'," + "  `s_tag` text," + "  `s_start` int(11) DEFAULT '0',"
				+ "  `s_end` int(11) DEFAULT '-1'," + "  `s_dj` text," + "  `s_duration` int(11) DEFAULT '0',"
				+ "  `s_img` text," + "  PRIMARY KEY (`s_id`)" + ") ENGINE=InnoDB DEFAULT CHARSET=utf8" + "";
		return query;
	}

	public static String insertQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "INSERT INTO `comma`.`tbl_song`" + "(`s_id`," + "`s_title`," + "`m_id`," + "`s_artist`,"
				+ "`s_mp3`," + "`s_mp4`," + "`s_lyrics`," + "`s_age`," + "`s_hit`," + "`s_tag`," + "`s_start`,"
				+ "`s_end`," + "`s_dj`," + "`s_duration`," + "`s_img`)" + "VALUES" + "(?," + "?," + "?," + "?," + "?,"
				+ "?," + "?," + "?," + "?," + "?," + "?," + "?," + "?," + "?," + "?)" + "";
		return query;
	}

	public static String selectAllQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "SELECT `tbl_song`.`s_id`," + "    `tbl_song`.`s_title`," + "    `tbl_song`.`m_id`,"
				+ "    `tbl_song`.`s_artist`," + "    `tbl_song`.`s_mp3`," + "    `tbl_song`.`s_mp4`,"
				+ "    `tbl_song`.`s_lyrics`," + "    `tbl_song`.`s_age`," + "    `tbl_song`.`s_created_at`,"
				+ "    `tbl_song`.`s_updated_at`," + "    `tbl_song`.`s_disabled_at`," + "    `tbl_song`.`s_hit`,"
				+ "    `tbl_song`.`s_tag`," + "    `tbl_song`.`s_start`," + "    `tbl_song`.`s_end`,"
				+ "    `tbl_song`.`s_dj`," + "    `tbl_song`.`s_duration`," + "    `tbl_song`.`s_img`"
				+ "FROM `comma`.`tbl_song`" + "";
		return query;
	}

	public static String selectOneQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "SELECT `tbl_song`.`s_id`," + "    `tbl_song`.`s_title`," + "    `tbl_song`.`m_id`,"
				+ "    `tbl_song`.`s_artist`," + "    `tbl_song`.`s_mp3`," + "    `tbl_song`.`s_mp4`,"
				+ "    `tbl_song`.`s_lyrics`," + "    `tbl_song`.`s_age`," + "    `tbl_song`.`s_created_at`,"
				+ "    `tbl_song`.`s_updated_at`," + "    `tbl_song`.`s_disabled_at`," + "    `tbl_song`.`s_hit`,"
				+ "    `tbl_song`.`s_tag`," + "    `tbl_song`.`s_start`," + "    `tbl_song`.`s_end`,"
				+ "    `tbl_song`.`s_dj`," + "    `tbl_song`.`s_duration`," + "    `tbl_song`.`s_img`"
				+ "FROM `comma`.`tbl_song`" + "  WHERE s_id=? ";
		return query;
	}

	public static String updateQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "UPDATE `comma`.`tbl_song`" + "SET" + " `s_title` = ?," + " `m_id` = ?," + " `s_artist` = ?,"
				+ " `s_mp3` = ?," + " `s_mp4` = ?," + " `s_lyrics` = ?," + " `s_age` = ?," + " `s_created_at` = ?,"
				+ " `s_updated_at` = ?," + " `s_disabled_at` = ?," + " `s_hit` = ?," + " `s_tag` = ?,"
				+ " `s_start` = ?," + " `s_end` = ?," + " `s_dj` = ?," + " `s_duration` = ?," + " `s_img` = ?"
				+ " WHERE `s_id` = ?" + "";
		return query;
	}

	public static String deleteQuery() {
		/**
		 * @Author @32lab
		 */
		String query = "DELETE FROM `comma`.`tbl_song` " + "WHERE s_id=?" + "";
		return query;
	}
}
