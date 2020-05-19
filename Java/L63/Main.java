public class Main {

    public static void main(String[] args) {
        System.out.println(isLeapYear(-1600));
    }

    public static boolean isLeapYear(int year) {
        if (year<1 || year>9999) {
            return false;
        }
        return (year%4==0 && year%100!=0 || year%400==0);
    }

    public static int getDaysInMonth(int month, int year) {
        if (year<1 || year>9999) {
            return -1;
        }

        int days;

        switch(month) {
            case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                days = 31;
                break;
            case 4: case 6: case 9: case 11:
                days = 30;
                break;
            case 2:
                if (isLeapYear(year)) {
                    days = 29;
                } else {
                    days = 28;
                }
                break;
            default:
                days = -1;

        }
        return days;
    }
}
