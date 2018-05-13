public class LC69 {

    public int mySqrt(int x) {
        int i = 1, j = x, res = 0;

        while( i <= j) {
            int m = i + (j - i) / 2;
            PrintUtils.printString("m:" + m + ", x / m: " + x / m);
            if(m > x / m) {
                j = m - 1;
            } else {
                res = m;
                i = m + 1;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        LC69 obj = new LC69();
        PrintUtils.printString("res:" + obj.mySqrt(1600));

        PrintUtils.printString("str res:" + "30".compareTo("3"));
    }
}
