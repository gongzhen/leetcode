public class LC10 {

    public boolean isMatch(String s, String p) {

        if (p.isEmpty())
            return s.isEmpty();

        if (p.length() >= 2 && '*' == p.charAt(1))
            // x* matches empty string or at least one character: x* -> xx*
            // *s is to ensure s is non-empty
            return (isMatch(s, p.substring(2)) || !s.isEmpty() && (s.charAt(0) == p.charAt(0) || '.' == p.charAt(0)) && isMatch(s.substring(1), p));
        else
            return !s.isEmpty() && (s.charAt(0) == p.charAt(0) || '.' == p.charAt(0)) && isMatch(s.substring(1), p.substring(1));

    }

    public boolean isMatch1(String s, String p) {
        int m = s.length();
        int n = p.length();
        boolean[][] dp = new boolean[m + 1][n + 1];
        for(int i = 0; i <= m; i++){
            for(int j = 0; j <= n; j++){
                dp[i][j] = false;
            }
        }

        dp[0][0] = true;
        for(int i = 1; i <= m; i++) {
            dp[i][0] = false;
        }

        for(int j = 1; j <= n; j++){
            dp[0][j] = j > 1 && '*' == p.charAt(j - 1) && dp[0][j - 2] == true;
        }
        PrintUtils.printMatrixBool(dp);

        for(int i = 1; i <= m; i++) {
            for(int j = 1; j <= n; j++) {
                if(p.charAt(j - 1) != '*') {
                    dp[i][j] = dp[i-1][j-1] == true && (s.charAt(i - 1) == p.charAt(j - 1) || p.charAt(j - 1) == '.');
                } else {
                    dp[i][j] = dp[i][j - 2] == true
                            || (s.charAt(i - 1) == p.charAt(j - 2)
                            || p.charAt(j - 2) == '.') && dp[i - 1][j] == true;
                }
            }
            PrintUtils.printMatrixBool(dp);
        }
        return dp[m][n];
    }


    public static void main(String[] args) {
        LC10 obj = new LC10();
//        obj.isMatch1("aab", "c*a*b");
        PrintUtils.printString("res:" + obj.isMatch1("abcdd", "abcd*"));
    }
}
