package crawlers;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.net.SocketTimeoutException;

import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
	//Monster
	static int c=0;
	private static BufferedWriter bw;
	public static void printstuff(String param, String file1) throws FileNotFoundException
	{		
		bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file1)));
		int c=0;
		try{
			for(char x='A';x<='L';x++)
			{
				try{
					Connection r=Jsoup.connect(param+"?l="+x);
					r.ignoreHttpErrors(true);
					r.timeout(10000000);
					Document doc = Jsoup.connect(param+"?l="+x).get();
					Elements cname=doc.select("a[class=link]");
					//catch(SocketTimeoutException e){continue;}
					//catch(HttpConnection h){continue;}
					for(Element e1:cname)
					{    
						String a=e1.text();
						char ar[]=a.toCharArray();
						if(ar[0]!='0')
						{
							Connection r1=Jsoup.connect(e1.absUrl("href"));
							r1.ignoreHttpErrors(true);
							r1.timeout(10000000);
							Document doc1 = Jsoup.connect(e1.absUrl("href")).get();
							Elements ajob=doc1.select("a[class=ns_joblink]");
							for(Element e2:ajob)
							{   
								try{		   
									Connection r2=Jsoup.connect(e2.absUrl("href"));
									r2.ignoreHttpErrors(true);
									r2.timeout(10000000);
									Document doc2= Jsoup.connect(e2.absUrl("href")).get();
									Elements cname1=doc2.select("div[class=ns_jobsummary hl");
									//Elements head=doc2.select("h2");
									for(Element e3:cname1)
									{
										bw.write(e3.text());
										bw.newLine();
										c++;
										System.out.println("wrote a line"+c+"\n");
									}
								} catch(SocketTimeoutException e){continue;}
							}
						}
						if(c==100) break;
					}
				}
				catch(SocketTimeoutException e){continue;}
			}
		} 
		catch(Exception e){
			e.printStackTrace();}
	}
	public static void main(String[] args) throws FileNotFoundException
	{
		Connection r3=Jsoup.connect("http://my.monsterindia.com/find_companies.html");
		r3.ignoreHttpErrors(true);
		r3.timeout(100000000);
		printstuff("http://my.monsterindia.com/find_companies.html",args[0]);
	}
}
