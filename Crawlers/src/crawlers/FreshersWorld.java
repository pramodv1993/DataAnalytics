package crawlers;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class FreshersWorld {
	static BufferedWriter bw;
	public static void dispjobdesc(String param)
	{
		try
		{
			Connection c1=Jsoup.connect(param);
			c1.ignoreHttpErrors(true);
			c1.timeout(10000000);int i = 1;
			Document doc1 =Jsoup.connect(param).get();//page with letter A
			Elements e1=doc1.select("select#paginationDropdownPage > option:last-of-type");
			int numofpages=Integer.parseInt(e1.text());int x=0;
			while(i<=numofpages) //to navigate between pages
			{    
				Connection c11=Jsoup.connect(param+"?&offset="+x+"&limit=50");
				c11.ignoreHttpErrors(true);
				c11.timeout(10000000);
				Document doc11 =Jsoup.connect(param+"?&offset="+x+"&limit=50").get();  
				Elements e2=doc11.select("span[class=company_name] > a ");//company name
				try
				{ 
					for(Element e3:e2)

					{  
						bw.write("Name : ");
						String comp=e3.text();//company name
						bw.write(e3.text()+" ");
						bw.write("Post : ");
						try{
							Connection c2=Jsoup.connect(e3.absUrl("href"));
							c2.ignoreHttpErrors(true);
							c2.timeout(10000000);
							Document doc2 =Jsoup.connect(e3.absUrl("href")).get(); 
							Elements e4=doc2.select("div#job-specification");//general description
							Elements e5=doc2.select("div[class=breadcrumbs] > span");//post
							Elements e6=doc2.select("div#job-description > p");
							for(Element e7:e5)
							{
								String e=e7.text().toString();
								if(e.contains(comp)){e=e.replaceAll(comp, " ");}//eliminating the company name that is present along with the post name
								bw.write(e);
							}
							for(Element e8:e4)
							{
								bw.write(" "+e8.text());
							}
							for(Element e9:e6)
							{   String skill=e9.text().toString().toLowerCase();
							if(skill.contains("skills")){ bw.write(" "+skill);}
							else if(skill.contains("skills set")){ bw.write(" "+skill);}
							else if(skill.contains("skills required")){ bw.write(" "+skill);}
							}
							bw.newLine();
						}catch(Exception e){continue;}    
					}
				}catch(Exception e)
				{continue;}
				x=x+50;		
				i++;
				System.out.println("wrote a line");
				bw.newLine();
			}
			//Elements cname1=doc1.select("span[class=company_name]");
			//for(Element g:cname1)System.out.println(g.text());
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void main(String[] args) throws Exception 
	{
		bw=new BufferedWriter(new OutputStreamWriter(new FileOutputStream("C:/Users/lenovo/Desktop/final project/fresher.txt")));
		Connection r1=Jsoup.connect("http://www.freshersworld.com/jobs/category/it-software-job-vacancies");
		r1.ignoreHttpErrors(true);
		r1.timeout(100000000);
		dispjobdesc("http://www.freshersworld.com/jobs/category/it-software-job-vacancies");

	}
}



