/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 

package control;

*//**
 *
 * @author User6
 *//*
import java.io.*;
import java.util.List;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;

public class ReadDocFile
{
    
    public static void readDocFile(String fileName) {

		try {
			File file = new File(fileName);
			FileInputStream fis = new FileInputStream(file.getAbsolutePath());
			
	root		

			HWPFDocument doc = new HWPFDocument(fis);

			WordExtractor we = new WordExtractor(doc);

			String[] paragraphs = we.getParagraphText();
			
			System.out.println("Total no of paragraph "+paragraphs.length);
			for (String para : paragraphs) {
				System.out.println(para.toString());
			}
			fis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void readDocxFile(String fileName) {

		try {
			File file = new File(fileName);
			FileInputStream fis = new FileInputStream(file.getAbsolutePath());

			XWPFDocument document = new XWPFDocument(fis);

			List<XWPFParagraph> paragraphs = document.getParagraphs();
			
			System.out.println("Total no of paragraph "+paragraphs.size());
			for (XWPFParagraph para : paragraphs) {
				System.out.println(para.getText());
			}
			fis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

    
    
    public static void main(String[] args)
    {
        File file = null;
        WordExtractor extractor = null;
        try
        {

            String as = "D:\\Document1.docx";
            readDocxFile(as);
//            file = new File("D:\\Document1.doc");
//            FileInputStream fis = new FileInputStream(file.getAbsolutePath());
//            HWPFDocument document = new HWPFDocument(fis);
//            extractor = new WordExtractor(document);
//            String[] fileData = extractor.getParagraphText();
//            for (int i = 0; i < fileData.length; i++)
//            {
//                if (fileData[i] != null)
//                    System.out.println(fileData[i]);
//            }
        }
        catch (Exception exep)
        {
            exep.printStackTrace();
        }
    }
}*/