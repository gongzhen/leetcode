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

    public static void main(String[] args) {
        /// bacc
        LC159 obj = new LC159();
//        PrintUtils.printString("res:" + obj.lengthOfLongestSubstringTwoDistinct("bacc"));

        // ccaabbb
        PrintUtils.printString("res:" + obj.lengthOfLongestSubstringTwoDistinct("ccaabbb"));
    }
}
