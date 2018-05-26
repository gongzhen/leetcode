public class LC44 {

    public boolean isMatch(String s, String p) {
        int i = 0;
        int j = 0;
        int star = -1;
        int match = 0;
        while(i < s.length()) {
            if(j < p.length() && s.charAt(i) == p.charAt(j) || p.charAt(j) == '?') {
                i++; j++;
            } else if (j < p.length() && p.charAt(j) == '*') {
                star = j;
                match = i;
                j++;
            } else if (star != -1) {
                j = star + 1;
                match++;
                i = match;
            } else {
                return false;
            }
        }

//        while(j < p.length() && p.charAt(j) != '*') {
//            j++;
//        }
        return j == p.length();
    }

    public static void main(String[] args) {
        LC44 obj = new LC44();
//        obj.isMatch("acdcb", "a*c?b");
        obj.isMatch("", "*");
    }
}
