import java.util.ArrayList;
import java.util.List;

public class LC139 {

    public boolean wordBreak(String s, List<String> wordDict) {
        boolean[] dp = new boolean[s.length() + 1];
        dp[0] = true;
        PrintUtils.printString("");
        for(int i = 1; i <= s.length(); i++) {
            for(int j = 0; j < i; j++) {
               ///  PrintUtils.printString("subStr:" + s.substring(j, i));
                if(dp[j] == true && isValid(s.substring(j, i), wordDict)) {
                    /// PrintUtils.printString("d[" + j +  "]:" +  dp[j] + ", dp[" + i + "]:" +  dp[i]);
                    dp[i] = true;
                }
            }
        }
        return dp[s.length()];
    }

    private boolean isValid(String str, List<String> wordDict) {
        for(String word: wordDict) {
            if(word.equals(str)) {
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        LC139 obj = new LC139();
        List<String> list = new ArrayList<>();
        list.add("leet");
        list.add("code");
        boolean res = obj.wordBreak("leetcode", list);
        PrintUtils.printString("res:" + res);

    }
}
