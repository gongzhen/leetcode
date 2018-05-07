public class LC7 {

    public int reverse(int x) {
        boolean neg = false;
        if(x < 0) {
            x = -x;
            neg = true;
        }

        int res = 0;
        while( x > 0) {
            int d = x % 10;
            if(res * 10 > Integer.MAX_VALUE) {
                return 0;
            }
            res = res * 10 + d;
            x = x / 10;
            PrintUtils.printString("res:" + res);
            if(res > ~(1<<31) || res < (1<<31)) {
                return 0;
            }
        }
        long ll = 1 << 31;
        PrintUtils.printString("ll:" + ll);
        return neg == true ? -res  : res;
    }

    public int reverse_1(int x) {
        boolean neg = false;
        if(x < 0) {
            x = -x;
            neg = true;
        }

        long res = 0;
        while( x > 0) {
            int d = x % 10;
            if(res * 10 > Integer.MAX_VALUE) {
                return 0;
            }
            res = res * 10 + d;
            x = x / 10;
            PrintUtils.printString("res:" + res);
            if(res > ~(1<<31) || res < (1<<31)) {
                return 0;
            }
        }
        long ll = 1 << 31;
        PrintUtils.printString("ll:" + ll);
        return neg == true ? -(int)res  : (int)res;
    }

    public static void main(String[] args) {
        LC7 obj = new LC7();
//        PrintUtils.printString("res:" + obj.reverse(123));
//        PrintUtils.printString("res:" + obj.reverse(456));
        PrintUtils.printString("res:" + obj.reverse(1534236469));
        PrintUtils.printString("res:" + obj.reverse_1(1534236469));
    }
}
