public class Main {

    public static void main(String[] args) {
        int num = 4;
        int fin = 20;
        int cnt = 0;

        while(num<=fin) {
            num++;
            if(!isEvenNumber(num)) {
                continue;
            }
            cnt++;
            System.out.println("Even number " + num);
        }
        System.out.println(cnt);
    }

    public static boolean isEvenNumber(int param) {
        return (param%2 == 0);
    }
}
