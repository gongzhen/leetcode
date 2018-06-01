public class LC76 {

    public String minWindow(String s, String t) {
        if(s.length() == 0 || t.length() == 0) {
            return "";
        }

        char[] ss = s.toCharArray();
        char[] tt = t.toCharArray();
        int[] tmap = new int[256];

        for(int i = 0; i < tt.length; i++) {
            tmap[tt[i] - 'A']++;
        }
        int count = tt.length;

        int min = ss.length + 1, i = 0, j = 0, head = 0;
        while(i < ss.length) {
            tmap[ss[i] - 'A']--;
            // >= 0,
            // s: AA t: AA
            // == 0 s: AA t: AA will fail.
            if(tmap[ss[i] - 'A'] >= 0) {
                count--;
            }
            i++;

            while(count == 0) {
                if(min > i - j) {
                    min = i - j;
                    head = j;
                }
                tmap[ss[j] - 'A']++;
                if(tmap[ss[j] - 'A'] == 1) {
                    count++;
                }
                j++;
            }
        }

        return min == ss.length + 1 ? "" : s.substring(head, head + min);
    }

    public static void main(String[] args) {
        LC76 obj = new LC76();
        PrintUtils.printString("res:" + obj.minWindow("aa", "aa"));
    }
}
