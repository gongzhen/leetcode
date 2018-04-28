public class LC50 {

    //// https://blog.csdn.net/prstaxy/article/details/8740838
    public double myPow(double x, int n) {
        if(n == 0) return 1;
        long p = n;
        if(n < 0) {
            x = 1 / x;
            p = -(n + 1);
            PrintUtils.printString("x:" + x);
            PrintUtils.printString("p:" + p);
            return x * binary(x, p);
        }
        return binary(x, n);
    }

    public double binary(double x, long p) {
        double ans = 1;
        while(p > 0) {
            if((p & 1L) > 0) {
                ans = ans * x;
            }
            x = x * x;
            p >>= 1;
            PrintUtils.printString("p:" + p);
        }
        return ans;
    }

    public double myPow_1(double x, int n) {
        if(n < 0) {
            x = 1 / x;
            n = -n;
        }
        /// (2, 4)
        return dfs(x, n);
    }

    private double dfs(double x, int n) {
        PrintUtils.printString("n:" + n);
        if(n == 0) {
            return 1.0;
        }

        double half = dfs(x , n / 2); /// 4 / 2 => 2 /// 2 => 2 = 1 ///
        if(n % 2 == 0) {
            return half * half;
        } else {
            return half * half * x;
        }
    }

    public static void main(String[] args) {
        LC50 obj = new LC50();
        PrintUtils.printString("res: " + obj.myPow(2.00000, -2147483648));
        PrintUtils.printString("res: " + obj.myPow_1(2.00000, -2147483648));
    }
}
