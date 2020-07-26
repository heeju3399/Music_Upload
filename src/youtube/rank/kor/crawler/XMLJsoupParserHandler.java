package youtube.rank.kor.crawler;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import bean.TopBean;
import mgr.TopMgr;

public class XMLJsoupParserHandler {
	public static void main(String[] args) {
		Document doc = null;

		try {

			doc = Jsoup.connect(
					"https://www.youtube.com/feeds/videos.xml?playlist_id=RDCLAK5uy_l7wbVbkC-dG5fyEQQsBfjm_z3dLAhYyvo")
					.postDataCharset("UTF-8").get();
			getYoutubeTop100(doc);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void run(){
		Document doc = null;

		try {

			doc = Jsoup.connect(
					"https://www.youtube.com/feeds/videos.xml?playlist_id=RDCLAK5uy_l7wbVbkC-dG5fyEQQsBfjm_z3dLAhYyvo")
					.postDataCharset("UTF-8").get();
			getYoutubeTop100(doc);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static String getYoutubeTop100(Document doc) {
		Elements elements = doc.select("entry>id");
		Elements titles = doc.select("entry>title");
		Elements artists = doc.select("entry>author>name");
		Elements cnts = doc.getElementsByTag("media:statistics");
		// mgr new
		TopMgr topMgr = new TopMgr();
		String date = DateUtil.getDate("yyyy-MM-dd");
		for (int i = 0; i < elements.size() && i < 15; i++) {
			String entry = elements.get(i).text().replace("yt:video:", "");
			TopBean bean = null; 
			if (topMgr.getTopBeanOne(entry) !=null) {
				bean = topMgr.getTopBeanOne(entry);
				System.out.println("값이 있습니다.");
				System.out.println(bean.getCnt());
				
				
			}else {
				System.out.println(entry);
				String title = titles.get(i).text();
				String artist = artists.get(i).text();
				String cntString = cnts.get(i).attr("views");
				System.out.println(cntString);
				Long cnt = Long.parseLong(cntString);

				System.out.printf("%s\t%s\t%s\t%s\n", entry, title, artist, date, cnt);
				System.out.println("DownloadStart");
				bean = new TopBean();
				bean.setEntry(entry);
				bean.setTitle(title);
				bean.setArtist(artist);
				bean.setRegdate(date);
				bean.setCnt(cnt);
				YoutubeDownloader.downloadById(entry);

				topMgr.insert(bean);
	
			}

			
		}
		return elements.html();

	}
}