import java.util.HashMap;
import java.util.Map;

public class LC159 {

    /*
    * 159. Longest Substring with At Most Two Distinct Characters
    * Given a string s , find the length of the longest substring t  that contains at most 2 distinct characters.
    *
    * Input: "eceba"
    * Output: 3
    * Explanation: t is "ece" which its length is 3.
    *
    * Input: "ccaabbb"
    * Output: 5
    * Explanation: t is "aabbb" which its length is 5.
    *
    */

    public int lengthOfLongestSubstringTwoDistinct(String s) {
        // eceba
        // e 0 c 1 e 2 map is 2
        // b 3 map is 3
        Map<Character, Integer> map = new HashMap<Character, Integer>();
        int res = 0;
        int j = 0;
        int count = 0;
        char[] array = s.toCharArray();
        for(int i = 0; i < array.length; i++) {
            if(!map.containsKey(array[i])) {
                if(count < 2) {
                    count++;
                    map.put(array[i], i);
                } else if (count == 2) {
                    for(int k = i - 2; k >= j; k--) {
                        if(map.containsKey(array[k]) && array[k] != array[i - 1]) {
                            map.remove(array[k]);
                            j = k + 1;
                            break;
                        }
                    }
                    map.put(array[i], i);
                }
            } else {
                // int preIdx = map.get(array[i]);
                // j = Math.max(j, preIdx + 1);
                map.put(array[i], i);
            }
            res = Math.max(res, i - j + 1);
        }
        return res;
    }

    public int lengthOfLongestSubstringTwoDistinct1(String s) {
        if(s.length() == 0) {
            return 0;
        }

        char[] array = s.toCharArray();
        int j = 0;
        int res = 0;
        Map<Character, Integer> map = new HashMap<>();

        for(int i = 0; i < array.length; i++) {
            if(map.containsKey(array[i])) {
                int v = map.get(array[i]);
                map.put(array[i], ++v);
            } else {
                map.put(array[i], 1);
            }

            while(map.size() > 2) {
                if(map.containsKey(array[j])) {
                    int v = map.get(array[j]);
                    v--;
                    map.put(array[j], v);
                    if(v == 0) {
                        map.remove(array[j]);
                    }

                }
                j++;
            }
            res = Math.max(res, i - j + 1);
        }
        return res;
    }

    /// http://www.cnblogs.com/grandyang/p/5185561.html
    public int lengthOfLongestSubstringTwoDistinct2(String s) {
        int left = 0, right = -1, res = 0;
        for (int i = 1; i < s.length(); ++i) {
            if (s.charAt(i) == s.charAt(i - 1)) {
                continue;
            }
            if (right >= 0 && s.charAt(right) != s.charAt(i)) {
                res = Math.max(res, i - left);
                left = right + 1;
            }
            right = i - 1;
        }
        return Math.max(s.length() - left, res);
    }

    public static void main(String[] args) {
        /// bacc
        LC159 obj = new LC159();
//        PrintUtils.printString("res:" + obj.lengthOfLongestSubstringTwoDistinct("bacc"));

        // ccaabbb
//        PrintUtils.printString("res:" + obj.lengthOfLongestSubstringTwoDistinct("ccaabbb"));
        PrintUtils.printString("res:" + obj.lengthOfLongestSubstringTwoDistinct2("ccaabbb"));
    }
}
