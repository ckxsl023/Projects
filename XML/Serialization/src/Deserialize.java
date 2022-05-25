
import java.beans.XMLDecoder;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
public class Deserialize {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        ArrayList<Books> clients;
        
        try (FileInputStream fis=new FileInputStream("d:\\bookinfo.xml");
        XMLDecoder decoder= new XMLDecoder(fis)) {
        clients= (ArrayList<Books>) decoder.readObject();
        }
        System.out.println("\t   Book Title \t\t    Author \t\t Publishing Date ");
        for(Books p:clients)
        {
            System.out.println("\t" +p.getBookTitle() + p.getAuthorName() + p.getPubDate());
        }
    }
}