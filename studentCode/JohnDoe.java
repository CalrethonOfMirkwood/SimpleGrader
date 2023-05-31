import java.util.Scanner;

public class JohnDoe {
    public static void main(String[] args) {
    	Scanner in = new Scanner(System.in);

        int a = in.nextInt();
        int b = in.nextInt();
        int c = in.nextInt();

        if (a<=0 || b<=0 || c<=0) {
            System.out.println("false");
            return;
        }

        if (a+b>c && b+c>a && a+c>b) {
            System.out.println("true");
            return;
        }

        System.out.println("false");
    }
}