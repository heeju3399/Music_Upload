package exex;

import java.util.Vector;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class youtube {

	static String url = "https://www.youtube.com/watch?v=DSzU613qo8w&list=RDDSzU613qo8w&index=1";
	
	public Vector<String> you(){
		Vector<String>	vlist = new Vector<String>();
		try { 			
			Document doc = Jsoup.connect(url).get();
			Elements link = doc.select("a"); 
			System.out.println(doc);
			for(Element element : link) {
				String str = element.attr("href");
				System.out.println(str);
				System.out.println("===================================");
				vlist.add(str);
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		
	}
		return vlist;
	}
	
	
}
