-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.21 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- comma 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `comma` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `comma`;

-- 테이블 comma.tbl_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_board` (
  `num` int NOT NULL AUTO_INCREMENT,
  `m_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `subject` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `pos` smallint DEFAULT NULL,
  `ref` smallint DEFAULT NULL,
  `depth` smallint DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `pass` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1234',
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `count` smallint DEFAULT NULL,
  `filename` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `filesize` int DEFAULT NULL,
  `myimgname` mediumtext,
  `myimgsize` int DEFAULT NULL,
  `like` int NOT NULL DEFAULT '0',
  `bad` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- 테이블 데이터 comma.tbl_board:~22 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
REPLACE INTO `tbl_board` (`num`, `m_id`, `name`, `subject`, `content`, `pos`, `ref`, `depth`, `regdate`, `pass`, `ip`, `count`, `filename`, `filesize`, `myimgname`, `myimgsize`, `like`, `bad`) VALUES
	(26, '32v', '32', '돌덩이', 'Hit me harder Make me strong	<br>\r\n그저 정해진 대로 따르라고	<br>\r\n그게 현명하게 사는 거라고	<br>\r\n쥐 죽은 듯이 살라는 말	<br>\r\n같잖은 말 누굴 위한 삶인가	<br>\r\n뜨겁게 지져봐	<br>\r\n절대 꼼짝 않고 나는 버텨낼 테니까	<br>\r\n거세게 때려봐	<br>\r\n네 손만 다칠 테니까	<br>\r\n나를 봐	<br>\r\n끄떡없어	<br>\r\n쓰러지고 떨어져도	<br>\r\n다시 일어나 오를 뿐야	<br>\r\n난 말야	<br>\r\n똑똑히 봐	<br>\r\n깎일수록 깨질수록	<br>\r\n더욱 세지고 강해지는 돌덩이	<br>\r\n감당할 수 없게 벅찬 이 세상	<br>\r\n유독 내게만 더 모진 이 세상	<br>\r\n모두가 나를 돌아섰고	<br>\r\n비웃었고 아픔이 곧 나였지	<br>\r\n시들고 저무는	<br>\r\n그런 세상 이치에 날 가두려 하지 마	<br>\r\n틀려도 괜찮아	<br>\r\n이 삶은 내가 사니까	<br>\r\n나를 봐	<br>\r\n끄떡없어	<br>\r\n쓰러지고 떨어져도	<br>\r\n다시 일어나 오를 뿐야	<br>\r\n난 말야	<br>\r\n똑똑히 봐	<br>\r\n깎일수록 깨질수록	<br>\r\n더욱 세지고 강해지는 돌덩이	<br>\r\n누가 뭐라 해도 나의 길	<br>\r\n오직 하나뿐인 나의 길	<br>\r\n내 전부를 내걸고서 Hey	<br>\r\n걸어가	<br>\r\n계속해서	<br>\r\n부딪히고 넘어져도	<br>\r\n다시 일어나 걷는 거야	<br>\r\n언젠가	<br>\r\n이 길 끝에 서서	<br>\r\n나도 한 번 크게 한 번	<br>\r\n목이 터져라 울 수 있을 때까지	<br>\r\n', NULL, NULL, NULL, '2020-07-24 14:52:51', NULL, NULL, 54, '돌덩이.mp3', 958328, 'sanghee.jpg', 15821, 0, 0),
	(27, 'kimjunteack', '김준택', '죽일놈', '죽일놈이 생겼다.', NULL, NULL, NULL, '2020-07-24 14:54:42', NULL, NULL, 25, '죽일놈.mp3', 5438788, '준택임.png', 570012, 11, 0),
	(30, 'skak0124', '스테판커리다', '이름', 'ㅎㅇ', NULL, NULL, NULL, '2020-07-24 15:02:22', NULL, NULL, 5, '이름.mp3', 4456499, '재홍잉.jpg', 98352, 10, 0),
	(33, 'skak0124', '스테판커리다', 'Lonely night', '적적적적적하다', NULL, NULL, NULL, '2020-07-24 15:05:02', NULL, NULL, 1, 'lonelynight.mp3', 5359421, '재홍11.jpg', 67381, 0, 0),
	(37, 'kwangrok', '김광록', '신촌을 못가', '포스트맨- 신촌을 못가', NULL, NULL, NULL, '2020-07-24 15:18:52', NULL, NULL, 5, '신촌을 못가.mp3', 5409068, '1595571447341.jpg', 78838, 10, 0),
	(38, 'hanjun', '박한준', '입술의 말', 'MC THE MAX- 입술의말', NULL, NULL, NULL, '2020-07-24 15:23:52', NULL, NULL, 3, '입술의말.mp3', 6598240, '한준.png', 78833, 4, 0),
	(39, 'heeju', '이희주', '건배', '건배가 하고싶었다.', NULL, NULL, NULL, '2020-07-24 15:25:29', NULL, NULL, 1, '건배.mp3', 3904861, '20200709_164850_074.jpg', 476330, 7, 0),
	(40, 'heeju', '이희주', '긴기라기니', '?めたしぐさで　熱く見ろ <br>\r\n사메타시구사데아츠쿠미로<br>\r\n??して　笑いなよ<br>\r\n나미다노코시테와라이나요<br>\r\n赤い皮ジャン　引き寄せ<br>\r\n아카이카와쟈응히키요세<br>\r\n?のバンダナ　渡すよ<br>\r\n코이노방다나와타스요<br>\r\n雨の中で抱きしめるぜ　そっと<br>\r\n아메노나카데다키시메루제 솟토<br>', NULL, NULL, NULL, '2020-07-24 15:27:46', NULL, NULL, 5, '긴기라.mp3', 5480197, '20200724_152643.jpg', 572805, 0, 0),
	(42, 'heeju', '이희주', '거꾸로강을거슬러오르는저연어처럼', '거꾸로강을거슬러오르는저연어처럼 살고싶다', NULL, NULL, NULL, '2020-07-24 15:29:49', NULL, NULL, 3, '거꾸로강을거스러.mp3', 6438100, '20200709_164850_0741.jpg', 476330, 1, 0),
	(43, 'kimjunteack', '김준택', '몽환의숲', '몬황의숲을 찾아서', NULL, NULL, NULL, '2020-07-24 15:35:01', NULL, NULL, 9, '몽환의숲.mp3', 5920903, '준택임1.png', 570012, 333, 0),
	(44, 'kimjunteack', '김준택', '어떤가요', '나 어떤가요?', NULL, NULL, NULL, '2020-07-24 15:36:32', NULL, NULL, 5, '어떤가요.mp3', 4636961, '20200723_172020.jpg', 290929, 0, 0),
	(45, 'leesenggu', '이승규', '홍연', '홍연', NULL, NULL, NULL, '2020-07-24 15:43:01', NULL, NULL, 11, '홍연.mp3', 6278728, '20200723_172057.jpg', 234817, 3, 0),
	(46, 'leesenggu', '이승규', '첫눈처럼너에게다가갔다.', '첫눈', NULL, NULL, NULL, '2020-07-24 15:45:01', NULL, NULL, 3, '첫눈처럼너에게가가ㅔㅆ다.mp3', 5321804, '20200724_150526.jpg', 429758, 0, 0),
	(47, 'hanjun', '박한준', '호랑풍류가', '호량풍류를 즐겼다.', NULL, NULL, NULL, '2020-07-24 15:47:09', NULL, NULL, 1, '호랑풍류가.mp3', 3588005, '한준1.png', 78833, 0, 0),
	(51, 'hanjun', '박한준', '야생화', '야생화', NULL, NULL, NULL, '2020-07-24 15:48:32', NULL, NULL, 11, '야생화.mp3', 7479873, '한준3.png', 78833, 0, 0),
	(53, 'power8128', '김원상', '내 생에 봄날은 간다', '사진', NULL, NULL, NULL, '2020-07-24 15:57:02', NULL, NULL, 7, '내생에 봄날은 간다1.mp3', 5886297, '김원상 자기소개서 사진3.jpg', 13738, 7, 1),
	(55, 'power8128', '김원상', '죽을만큼아파서', '사진', NULL, NULL, NULL, '2020-07-24 15:58:43', NULL, NULL, 5, '죽을만큼아파서.mp3', 6497439, '김원상 자기소개서 사진5.jpg', 13738, 222, 1),
	(56, 'skak0124', '스테판커리다', '트로트 에픽하이', '하이하이하이!!! 조아요 구독 ㄳㄳㄳㄳ', NULL, NULL, NULL, '2020-07-24 15:04:29', NULL, NULL, 7, '트로트.mp3', 7004318, '재홍02.jpg', 177254, 111, 1),
	(57, 'heeju', '이희주', '천년바위', '천년바위가 보고싶다', NULL, NULL, NULL, '2020-07-24 15:29:02', NULL, NULL, 10, '천년바위.mp3', 5857476, '20200707_131131.jpg', 201438, 0, 0),
	(58, 'power8128', '김원상', '여인의 향기', '사진', NULL, NULL, NULL, '2020-07-24 15:57:41', NULL, NULL, 15, '여인의 향기.mp3', 5420888, '김원상 자기소개서 사진4.jpg', 13738, 5, 1),
	(59, 'hanjun', '박한준', '포장마차', '포장마차에서 한곡', NULL, NULL, NULL, '2020-07-24 15:47:56', NULL, NULL, 5, '포장마차.mp3', 5572992, '한준2.png', 78833, 1, 0),
	(60, '32v', '32', '양화대교', '행복하자~', NULL, NULL, NULL, '2020-07-24 16:42:52', NULL, NULL, 82, '양화대교.mp3', 2850532, 'sanghee.jpg', 45306, 2, 1);
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;

-- 테이블 comma.tbl_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `c_id` int NOT NULL AUTO_INCREMENT COMMENT 'comment id',
  `m_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'member id',
  `c_content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'comment content',
  `s_id` int DEFAULT NULL,
  `c_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `c_updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_comment:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
REPLACE INTO `tbl_comment` (`c_id`, `m_id`, `c_content`, `s_id`, `c_ip`, `c_created_at`, `c_updated_at`) VALUES
	(139, 'Guest', '욧', 4, '0:0:0:0:0:0:0:1', '2020-07-23 15:39:33', NULL),
	(156, 'choi', 'comment1', 3, '192.168.0.84', '2020-07-23 16:05:33', '2020-07-23 16:06:39'),
	(157, 'choi', 'comment2', 3, '192.168.0.84', '2020-07-23 16:05:33', '2020-07-23 16:06:40'),
	(158, 'choi', 'comment3', 3, '192.168.0.84', '2020-07-23 16:05:33', '2020-07-23 16:06:41'),
	(175, '66', 'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ', 8, '0:0:0:0:0:0:0:1', '2020-07-23 16:30:17', NULL),
	(176, 'Guest', '오오오오오굿굿', 9, '0:0:0:0:0:0:0:1', '2020-07-24 10:52:41', NULL),
	(177, 'Guest', 'zzzzzzzzzzzzzz', 9, '0:0:0:0:0:0:0:1', '2020-07-24 11:00:44', NULL),
	(178, 'Guest', '11', 10, NULL, '2020-07-24 13:28:47', NULL),
	(180, '66', '좋아요', 17, '0:0:0:0:0:0:0:1', '2020-07-24 14:15:40', NULL),
	(181, 'Guest', '제목데스네', 50, '0:0:0:0:0:0:0:1', '2020-07-24 15:52:53', NULL),
	(182, 'Guest', '천년바위~!', 57, '192.168.0.38', '2020-07-24 17:12:56', NULL);
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;

-- 테이블 comma.tbl_emotion 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_emotion` (
  `e_id` int NOT NULL AUTO_INCREMENT,
  `s_id` int DEFAULT NULL,
  `m_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `happy` int DEFAULT NULL,
  `hell` int DEFAULT NULL,
  `sad` int DEFAULT NULL,
  `funny` int DEFAULT NULL,
  `e_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `e_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `e_updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `e_latitude` double DEFAULT NULL,
  `e_longtitude` double DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_emotion:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_emotion` DISABLE KEYS */;
REPLACE INTO `tbl_emotion` (`e_id`, `s_id`, `m_id`, `happy`, `hell`, `sad`, `funny`, `e_state`, `e_created_at`, `e_updated_at`, `e_latitude`, `e_longtitude`) VALUES
	(1, 1, 'guest', 99, 104, 102, 103, NULL, '2020-07-13 15:04:28', '2020-07-24 11:26:48', NULL, NULL);
/*!40000 ALTER TABLE `tbl_emotion` ENABLE KEYS */;

-- 테이블 comma.tbl_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_member` (
  `m_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'member id',
  `m_pwd` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'member password',
  `m_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'member email',
  `m_birth` date DEFAULT NULL COMMENT 'member birthday',
  `m_visited` date DEFAULT NULL COMMENT 'member last login date, visited',
  `m_auth` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'N' COMMENT 'member auth(admin, user)',
  `m_latitude` double DEFAULT NULL COMMENT 'member gps last latitude 위도',
  `m_longitude` double DEFAULT NULL COMMENT 'member gps last_longitude 경도',
  `m_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'member favorite tag',
  `m_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `m_updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_member:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
REPLACE INTO `tbl_member` (`m_id`, `m_pwd`, `m_email`, `m_birth`, `m_visited`, `m_auth`, `m_latitude`, `m_longitude`, `m_tag`, `m_created_at`, `m_updated_at`) VALUES
	('32v', '1234', 'louis.develog@gmail.com', '1989-02-24', '2020-07-24', 'N', 0, 0, NULL, '2020-07-24 14:36:13', NULL),
	('66', '22', 'heeju3399@naver.com', '2020-07-16', '2020-07-24', 'N', 0, 0, NULL, '2020-07-24 14:57:26', '2020-07-24 15:02:21'),
	('hanjun', '1234', 'heeju3399@naver.com', '2020-07-01', '2020-07-24', 'N', 0, 0, NULL, '2020-07-24 15:04:58', '2020-07-24 15:22:26'),
	('heeju', '11', 'heeju3399@naver.com', '2020-07-15', '2020-07-24', 'N', 35.1535104, 129.0600448, NULL, '2020-07-24 15:24:52', NULL),
	('kimjunteack', '11', 'heeju3399@naver.com', '2020-06-29', '2020-07-24', 'N', 0, 0, NULL, '2020-07-24 14:52:55', '2020-07-24 15:30:33'),
	('kimsang', '11', 'heeju3399@naver.com', '2020-07-02', '2020-07-24', 'N', 35.1535104, 129.0600448, NULL, '2020-07-24 15:38:31', NULL),
	('kwangrok', '1234', 'heeju3399@naver.com', '2020-07-02', '2020-07-24', 'N', 0, 0, NULL, '2020-07-24 15:04:41', '2020-07-24 15:05:36'),
	('leesenggu', '11', 'heeju3399@naver.com', '2020-06-30', '2020-07-24', 'N', 35.1535104, 129.0600448, NULL, '2020-07-24 15:41:55', NULL),
	('power8128', 'k240531321', 'him2772@naver.com', '1993-10-18', '2020-07-24', 'N', 35.16, 129.0631, NULL, '2020-07-24 15:43:06', NULL),
	('seunggyu', '1234', 'heeju3399@naver.com', '2020-07-14', '2020-07-24', 'N', 35.1535104, 129.0600448, NULL, '2020-07-24 15:05:21', NULL),
	('skak0124', '003100', 'woghd9319@naver.com', '1993-06-17', '2020-07-24', 'N', 0, 0, NULL, '2020-07-24 15:01:22', NULL),
	('김준택', '11', 'heeju3399@naver.com', '2020-07-15', '2020-07-24', 'N', 35.1535104, 129.0600448, NULL, '2020-07-24 14:39:11', NULL);
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;

-- 테이블 comma.tbl_top100 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_top100` (
  `entry` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `artist` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `regdate` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cnt` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 comma.tbl_top100:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_top100` DISABLE KEYS */;
REPLACE INTO `tbl_top100` (`entry`, `artist`, `title`, `regdate`, `cnt`) VALUES
	('fE2h3lGlOsk', 'JYP Entertainment', 'ITZY "WANNABE" M/V', '2020-07-21', 170172644),
	('gmgcRWxhmqY', 'SMTOWN', 'BAEKHYUN 백현 \'Candy\' MV', '2020-07-21', 31222727),
	('HdZdxocqzq4', 'Big Hit Labels', 'SEVENTEEN (세븐틴) \'Left & Right\' Official MV', '2020-07-21', 47094873),
	('iDjQSdN_ig8', '1theK (원더케이)', '[MV] OH MY GIRL(오마이걸) _ Nonstop(살짝 설?어)', '2020-07-21', 37760577),
	('ioNng23DkIM', 'BLACKPINK', 'BLACKPINK - \'How You Like That\' M/V', '2020-07-21', 319401695),
	('KjY1QY2wDXY', 'Apink (에이핑크)', 'Jeong Eun Ji(정은지) 4th Mini Album [Simple] \'AWay\' M/V', '2020-07-21', 7333813),
	('mH0_XpSHkZo', 'JYP Entertainment', 'TWICE "MORE & MORE" M/V', '2020-07-21', 146980112),
	('mPVDGOVjRQ0', 'Big Hit Labels', 'BTS (방탄소년단) \'ON\' Official MV', '2020-07-21', 165576489),
	('nnVjsos40qk', 'Stone Music Entertainment', 'IZ*ONE (아이즈원) - 환상동화 (Secret Story of the Swan) MV', '2020-07-21', 35793693),
	('tDukIfFzX18', '1theK (원더케이)', '[MV] Hwa Sa(화사) _ Maria(마리아)', '2020-07-21', 18078548),
	('TgOu00Mf3kI', '1theK (원더케이)', '[MV] IU(아이유) _ eight(에잇) (Prod.&Feat. SUGA of BTS)', '2020-07-21', 72518237),
	('Ujb-gvqsoi0', 'SMTOWN', 'Red Velvet - IRENE & SEULGI \'Monster\' MV', '2020-07-21', 32399753),
	('uR8Mrt1IpXg', 'SMTOWN', 'Red Velvet 레드벨벳 \'Psycho\' MV', '2020-07-21', 150718383),
	('UuV2BmJ1p_I', '1theK (원더케이)', '[MV] ZICO(지코) _ Any song(아무노래)', '2020-07-21', 57212634),
	('XQSse3b2ge4', 'Big Hit Labels', 'GFRIEND (여자친구) \'Apple\' Official M/V', '2020-07-21', 18302161),
	('ioNng23DkIM', 'BLACKPINK', 'BLACKPINK - \'How You Like That\' M/V', '2020-07-26', 345489427),
	('mH0_XpSHkZo', 'JYP Entertainment', 'TWICE "MORE & MORE" M/V', '2020-07-26', 151572640),
	('lBYyAQ99ZFI', 'THEBLACKLABEL', 'SOMI (전소미) - \'What You Waiting For\' M/V', '2020-07-26', 11997206),
	('Ujb-gvqsoi0', 'SMTOWN', 'Red Velvet - IRENE & SEULGI \'Monster\' MV', '2020-07-26', 36351262),
	('XQSse3b2ge4', 'Big Hit Labels', 'GFRIEND (여자친구) \'Apple\' Official M/V', '2020-07-26', 19605704),
	('HdZdxocqzq4', 'Big Hit Labels', 'SEVENTEEN (세븐틴) \'Left & Right\' Official MV', '2020-07-26', 48299292),
	('fE2h3lGlOsk', 'JYP Entertainment', 'ITZY "WANNABE" M/V', '2020-07-26', 173471406),
	('mPVDGOVjRQ0', 'Big Hit Labels', 'BTS (방탄소년단) \'ON\' Official MV', '2020-07-26', 167670848),
	('TgOu00Mf3kI', '1theK (원더케이)', '[MV] IU(아이유) _ eight(에잇) (Prod.&Feat. SUGA of BTS)', '2020-07-26', 74125528),
	('nnVjsos40qk', 'Stone Music Entertainment', 'IZ*ONE (아이즈원) - 환상동화 (Secret Story of the Swan) MV', '2020-07-26', 37011923),
	('tDukIfFzX18', '1theK (원더케이)', '[MV] Hwa Sa(화사) _ Maria(마리아)', '2020-07-26', 24987979),
	('KjY1QY2wDXY', 'Apink (에이핑크)', 'Jeong Eun Ji(정은지) 4th Mini Album [Simple] \'AWay\' M/V', '2020-07-26', 9393894),
	('uR8Mrt1IpXg', 'SMTOWN', 'Red Velvet 레드벨벳 \'Psycho\' MV', '2020-07-26', 153065419),
	('gmgcRWxhmqY', 'SMTOWN', 'BAEKHYUN 백현 \'Candy\' MV', '2020-07-26', 32280110),
	('iDjQSdN_ig8', '1theK (원더케이)', '[MV] OH MY GIRL(오마이걸) _ Nonstop(살짝 설?어)', '2020-07-26', 38597675),
	('ioNng23DkIM', 'BLACKPINK', 'BLACKPINK - \'How You Like That\' M/V', '2020-07-26', 345489427),
	('mH0_XpSHkZo', 'JYP Entertainment', 'TWICE "MORE & MORE" M/V', '2020-07-26', 151572640),
	('lBYyAQ99ZFI', 'THEBLACKLABEL', 'SOMI (전소미) - \'What You Waiting For\' M/V', '2020-07-26', 11997206),
	('Ujb-gvqsoi0', 'SMTOWN', 'Red Velvet - IRENE & SEULGI \'Monster\' MV', '2020-07-26', 36351262),
	('XQSse3b2ge4', 'Big Hit Labels', 'GFRIEND (여자친구) \'Apple\' Official M/V', '2020-07-26', 19605704),
	('HdZdxocqzq4', 'Big Hit Labels', 'SEVENTEEN (세븐틴) \'Left & Right\' Official MV', '2020-07-26', 48299292),
	('fE2h3lGlOsk', 'JYP Entertainment', 'ITZY "WANNABE" M/V', '2020-07-26', 173471406),
	('mPVDGOVjRQ0', 'Big Hit Labels', 'BTS (방탄소년단) \'ON\' Official MV', '2020-07-26', 167670848),
	('TgOu00Mf3kI', '1theK (원더케이)', '[MV] IU(아이유) _ eight(에잇) (Prod.&Feat. SUGA of BTS)', '2020-07-26', 74125528),
	('nnVjsos40qk', 'Stone Music Entertainment', 'IZ*ONE (아이즈원) - 환상동화 (Secret Story of the Swan) MV', '2020-07-26', 37011923),
	('tDukIfFzX18', '1theK (원더케이)', '[MV] Hwa Sa(화사) _ Maria(마리아)', '2020-07-26', 24987979),
	('KjY1QY2wDXY', 'Apink (에이핑크)', 'Jeong Eun Ji(정은지) 4th Mini Album [Simple] \'AWay\' M/V', '2020-07-26', 9393894),
	('uR8Mrt1IpXg', 'SMTOWN', 'Red Velvet 레드벨벳 \'Psycho\' MV', '2020-07-26', 153065419),
	('gmgcRWxhmqY', 'SMTOWN', 'BAEKHYUN 백현 \'Candy\' MV', '2020-07-26', 32280110),
	('iDjQSdN_ig8', '1theK (원더케이)', '[MV] OH MY GIRL(오마이걸) _ Nonstop(살짝 설?어)', '2020-07-26', 38597675);
/*!40000 ALTER TABLE `tbl_top100` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
