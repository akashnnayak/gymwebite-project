import java.util.*;
public class Array {
    public static void main (String [] args){
        int arr[] = {20,10,35,60,15,25,40,18};
        int Smallest,Largest;
        Smallest = arr [0];
        Largest = arr [0];
        for (int i = 1;i < arr.length;i++){
            if (arr [i] > Largest){
                Largest = arr [i];
            }
            else if (arr [i] < Smallest){
             Smallest = arr [i];   
            }
        }
        System.out.println("largest element in array is="+Largest);
        System.out.println("largest element in array is="+Smallest);
    }
}