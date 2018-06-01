import java.util.HashMap;
import java.util.Map;

public class LC3 {

    public int lengthOfLongestSubstring(String s) {
        if(s == null || s.length() == 0) {
            return 0;
        }

        Map<Character, Integer> map = new HashMap<>();
        int max = -1;
        int j = 0;
        char[] array = s.toCharArray();
        for(int i = 0; i < array.length; i++) {
            if(!map.containsKey(array[i])) {
                map.put(array[i], i);
            } else {
                int pre = map.get(array[i]);
                j = Math.max(j, pre + 1);
                map.put(array[i], i);
            }

            if(max < i - j + 1) {
                max = i - j + 1;
            }
        }
        return max;
    }

    public static void main(String[] args) {
        LC3 obj = new LC3();
        PrintUtils.printString("res:" + obj.lengthOfLongestSubstring("abcabcbb"));
    }
}
