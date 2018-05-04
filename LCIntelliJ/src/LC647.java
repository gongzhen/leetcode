import java.util.ArrayList;
import java.util.List;

public class LC647 {

    public int countSubstrings(String s) {
        if(s.length() == 0) return 0;
        List<String> list = new ArrayList<>();
        int len = s.length();
        int res = 0;
        boolean[][] dp = new boolean[len][len];
        for(int i = len - 1; i >= 0; i--) {
            for(int j = i; j < len; j++) {
                if(s.charAt(i) == s.charAt(j) && (j - i < 3 || dp[i + 1][j - 1] == true)) {
                    dp[i][j] = true;
                }
                if(dp[i][j] == true) {
                    String subString = s.substring(i, j + 1);
                    PrintUtils.printString("i:" + i + ", j:" + j);
                    list.add(subString);
                    res++;
                }
            }
        }
        PrintUtils.printListString(list);
        return res;
    }

    public static void main(String[] args) {
        LC647 obj = new LC647();
        PrintUtils.printString("res:" + obj.countSubstrings("aaa"));
    }
}
