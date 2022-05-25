
import java.beans.XMLEncoder;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author admin
 */
public class Serialize {
    public static void main(String[] args)  throws FileNotFoundException, IOException {
        ArrayList<Books> bookinfo = new ArrayList<Books>();
        bookinfo.add(new Books("Enterprise Systems", "\tMr. Alan Dennis", "\t\tJanuary 23, 2015"));
        bookinfo.add(new Books("Don Quixote", "\t\tMiguel de Cervantes", "\tJanuary 16, 1605"));
        bookinfo.add(new Books("A Tale of Two Cities", "\tCharles Dickens", "\t\tNovember 26, 1859"));
        bookinfo.add(new Books("The Lord of the Rings", "\tJ.R.R. Tolkien", "\t\tOctober 20, 1955"));
        bookinfo.add(new Books("The Little Prince", "\tAntoine de Saint-Exupery", "\tApril 6, 1943"));
        
        FileOutputStream fos=new FileOutputStream("d:\\bookinfo.xml");
        XMLEncoder encoder=new XMLEncoder(fos);
        encoder.writeObject(bookinfo);
        encoder.close();
        fos.close();
    }
}

