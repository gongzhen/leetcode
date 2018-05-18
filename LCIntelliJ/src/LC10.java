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


    public static void main(String[] args) {
        LC10 obj = new LC10();
        obj.isMatch("aab", "c*a*b");
    }
}
