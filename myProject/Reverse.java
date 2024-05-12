import java.util.*;
public class Reverse{
    public static void main (String [] args){
        String str = "hello";
        char [] c = str.toCharArray();
        for (int i=c.length-1;i>=0;i--)
        {
            System.out.println(c[i]);
        }
    }
}