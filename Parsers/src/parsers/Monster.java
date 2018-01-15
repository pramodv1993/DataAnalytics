package parsers;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Scanner;

import org.jsoup.Jsoup;

@SuppressWarnings("unused")
public class Monster {
	static BufferedWriter bw;
	private static BufferedReader a;

	public static void lineprint (String t) throws IOException
	{
		String w;
		String x;
		String y;
		String z;
		String m,n,o,p,q,pp;
		w=t.replaceAll("Job Summary Company Name ","@Name@");
		m=w.replaceAll(" Nationality ","@Nationality@");
		n=m.replaceAll(" Role ","@Role@");
		o=n.replaceAll(" Posted On ","@Posted On@");
		p=o.replaceAll(" Job Ref code ","@Job Ref code@");
		q=p.replaceAll(" Education ","@Education@");
		y=q.replaceAll(" Locations ","@Locations@");
		z=y.replaceAll(" Experience ","@Experience@");
		pp=z.replaceAll(" Keywords / Skills ","@Keywords / Skills@");
		String g=pp.concat("@");
		bw.write(g);
		bw.newLine();
	}
	public static void main(String args[]) throws IOException
	{
		//Scanner n=new Scanner(System.in);
		//String a=n.nextLine();
		bw=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(args[1])));
		a = new BufferedReader(new InputStreamReader(new FileInputStream(args[0])));
		String t;
		while((t=a.readLine())!=null)
			lineprint(t);
		System.out.println("done");
	}
}
