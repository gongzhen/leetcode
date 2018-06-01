public class LC214 {

    private static class Solution {
        public String shortestPalindrome(String s) {
            int j = 0;
            for (int i = s.length() - 1; i >= 0; i--) {
                if (s.charAt(i) == s.charAt(j)) {
                    j += 1;
                }
            }
            if (j == s.length()) {
                return s;
            }
            String suffix = s.substring(j);
            return new StringBuffer(suffix).reverse().toString() + shortestPalindrome(s.substring(0, j)) + suffix;
        }
    }

    public String shortestPalindrome(String s) {
        if(s == null || s.length() == 0) {
            return "";
        }

        int j = s.length();
        while(j > 0) {
            String subStr = s.substring(0, j);
            if(j == s.length() && isPalindrome(subStr) == true) {
                return subStr;
            }
            if(isPalindrome(subStr) == true) {
                break;
            }
            j--;
        }
        String remaining = s.substring(j);
        String prefix = reverseString(remaining);
        StringBuilder res = new StringBuilder();
        res.append(prefix + s);
        return res.toString();
    }

    public String reverseString(String s) {
        StringBuilder sb = new StringBuilder();
        for(int i = s.length() - 1; i >= 0; i--) {
            sb.append(s.charAt(i));
        }
        return sb.toString();
    }

    public boolean isPalindrome(String s) {
        int i = 0;
        int j = s.length() - 1;
        while(i < j) {
            if(s.charAt(i) == s.charAt(j)) {
                i++;
                j--;
            } else {
                return false;
            }
        }
        return true;
    }


    public static void main(String[] args) {
//        LC214 obj = new LC214();
//        PrintUtils.printString("res:" + obj.shortestPalindrome("aacecaaa"));

        Solution solution = new Solution();
        PrintUtils.printString("res:" + solution.shortestPalindrome("aacecaaa"));
    }
}
