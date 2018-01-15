package parsers;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class FreshersWorld {
	//Isn't included in the final compiled jar - still, have added for reference
	static BufferedWriter bw;
	private static BufferedReader br;
	public static void parseline(String line) throws IOException{

		String a=line.replaceAll("Name : ","@Name@");
		String b=a.replaceAll(" Post : ", "@Role@");
		String c=b.replaceAll(" Location : ", "@Locations@");
		String d=c.replaceAll(" Eligibility : ", "@Education@");
		String e=d.replaceAll(" Job Category : ", "@Job Category@");
		String f=e.replaceAll(" Last Date : ", "@Posted On@");		
		String g=f.replaceAll(" skills: ", "@Keywords / Skills@");
		String h=g.replaceAll(" skills required: ", "@requirements@");
		String i=h.replaceAll("  skills/experience (mandatory) : ","@Keywords / Skills@");
		String j= i.concat("@");
		bw.write(j);
		bw.newLine();
		bw.newLine();	
	}
	public static void main(String args[]) throws IOException
	{  String t;
	br = new BufferedReader(new InputStreamReader(new FileInputStream("C:/Users/lenovo/Desktop/final project/extracted datum/fresher output.txt")));
	bw=new BufferedWriter(new OutputStreamWriter(new FileOutputStream("C:/Users/lenovo/Desktop/fresher.txt")));
	while((t=br.readLine())!=null)
	{
		parseline(t);			
	}
	System.out.println("done");		
	}
}
