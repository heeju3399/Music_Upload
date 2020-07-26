package youtube.rank.kor.crawler;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import bean.TopBean;
import mgr.TopMgr;

public class YoutubeMain {
	public static void main(String[] args) {
		JFrame frame = new JFrame();
		frame.setTitle("유튜브 음악 수집");
		frame.setLayout(new BorderLayout());
		/*
		 * JTextArea textArea = new JTextArea(); System.out.printsetEditable(false);
		 */
		/*
		 * JScrollPane scrollPane = new JScrollPane(textArea);
		 * scrollPane.setHorizontalScrollBarPolicy(JScrollPane.
		 * HORIZONTAL_SCROLLBAR_NEVER);
		 * scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
		 */
//		frame.add(textArea, BorderLayout.CENTER);
		JPanel center = new JPanel();
		center.setLayout(new GridLayout(4, 1));
		JLabel playlistTitle = new JLabel(DateUtil.getCurrentDate() + " Youtube Top 15");
		JLabel requestId = new JLabel("https://www.youtube.com/feeds/videos.xml?");
		JLabel playListId = new JLabel("playlist_id=RDCLAK5uy_l7wbVbkC-dG5fyEQQsBfjm_z3dLAhYyvo");
		JButton collectButton = new JButton("수집시작");
		collectButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				Document doc = null;

				try {

					doc = Jsoup.connect(
							"https://www.youtube.com/feeds/videos.xml?playlist_id=RDCLAK5uy_l7wbVbkC-dG5fyEQQsBfjm_z3dLAhYyvo")
							.postDataCharset("UTF-8").get();
				} catch (IOException e2) {
					e2.printStackTrace();
				}

				////////////////////
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
					String title = titles.get(i).text();
					String artist = artists.get(i).text();
					String cntString = cnts.get(i).attr("views");
					Long cnt = Long.parseLong(cntString);
					System.out.print(cntString);
					System.out.print("\n" + entry + ", ");
					System.out.print(title + ", ");
					System.out.print(date + ", ");
					System.out.print(cnt + "\n");
					System.out.print("\n\nDownloadStart\n");
					bean = new TopBean();
					bean.setEntry(entry);
					bean.setTitle(title);
					bean.setArtist(artist);
					bean.setRegdate(date);
					bean.setCnt(cnt);
					File f = new File(entry + ".mp3");
					if (f.exists()) {
						System.out.print("\n skip!");
					} else {
						System.out.print("\ndownload!!!!!");
						ProcessBuilder pb = null;
						BufferedReader br = null;
						try {
							pb = new ProcessBuilder();
							pb.directory(new File("C:\\comma111111111\\commaaaa\\WebContent\\top100\\entries"));
							pb.command("youtube-dl.exe", entry, "dir");
							Process process = pb.start();
							br = new BufferedReader(new InputStreamReader(process.getInputStream()));
							String ln = null;
							while ((ln = br.readLine()) != null) {
								System.out.println(ln);
							}
						} catch (Exception e3) {
							e3.printStackTrace();
						} finally {
							try {
								if (br != null)
									br.close();
							} catch (Exception e4) {
								e4.printStackTrace();
							}
						}

					}
					////////////
					topMgr.insert(bean);

				}
			}

		});
		center.add(requestId);
		center.add(playListId);
		center.add(playlistTitle);

//		JPanel center = new JPanel();
//		center.add(scrollPane, BorderLayout.CENTER);
		center.add(collectButton);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.add(center, BorderLayout.CENTER);
		frame.setSize(600, 400);
		frame.setLocationRelativeTo(null);
		frame.setVisible(true);
	}
}
