package crawlers;
import java.net.ServerSocket;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class Careesma {
	static int c=0;
	public static void printstuff(String param)
	{
		ServerSocket serverSocket = null;

		try{
			serverSocket = new ServerSocket(3333);
			serverSocket.setSoTimeout(7000);
			Thread.sleep(3000);
			for(int x=2;x<=10;x++)
			{
				Connection c1=Jsoup.connect(param);
				c1.ignoreHttpErrors(true);
				c1.timeout(10000000);
				Document doc1 = Jsoup.connect(param+"="+x).get();
				Elements cname1=doc1.select("h2[class=p-job-title]>a");

				for(Element e1:cname1)
				{    
					/*Connection c2=Jsoup.connect(e1.absUrl("href")).get();
						c2.ignoreHttpErrors(true);
					    c2.timeout(10000000);
					 */
					Document doc2 =Jsoup.connect(e1.absUrl("href")).get(); 
					Elements cname2=doc2.select("div[class=pos-detail content-block clear-both]");	 		
					Elements cname3=doc2.select("div[class=col-3-4 pull-left clear-me]>h2");
					Elements cname4=doc2.select("div[class=col-3-4 pull-left clear-me]>h1");
					Elements cname5=doc2.select("div[class=col-3-4 pull-left clear-me]>h3");
					for(Element e2:cname2)
					{
						for(Element e3:cname3)
						{
							for(Element e4:cname4)
							{
								for(Element e5:cname5)
								{
									System.out.println("@Name@"+e5.text()+"@Location@"+e3.text()+"@"+e1.text()+"@"+e4.text()+"@"+ e2.text());
								}
							}
						}
					}
					System.out.println("\n");
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}		
	}
	public static void main(String[] args)
	{
		printstuff("http://www.careesma.in/jobs?q=&lc=&pg");
	}
}
