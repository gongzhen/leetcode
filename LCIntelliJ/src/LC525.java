import java.util.HashMap;
import java.util.Map;

public class LC525 {

    public int findMaxLength(int[] nums) {
        if(nums.length == 0) return 0;
        for(int i = 0; i < nums.length; i++) {
            if(nums[i] == 0) {
                nums[i] = -1;
            }
        }

        Map<Integer, Integer> map = new HashMap<>();
        map.put(0, -1);
        int max = 0;
        int sum = 0;
        for(int i = 0; i < nums.length; i++) {
            sum += nums[i];
            if(map.containsKey(sum)) {
                max = Math.max(max, i - map.get(sum));
            } else {
                map.put(sum, i);
            }
        }
        return max;
    }

    public int findMaxLength_1(int[] nums) {
        if(nums.length == 0) {
            return 0;
        }
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        map.put(0, -1); /// put 0 as -1. [1, 0] the first equal is index 1 - (-1) == 2.
        /// don't forget put (0, -1) as the
        int count = 0, max = 0;
        for(int i = 0; i < nums.length; i++) {
            count = count + (nums[i] == 1 ? 1 : -1);
            if(map.containsKey(count)) {
                max = Math.max(max, i - map.get(count));
            } else {
                map.put(count, i);
            }
        }
        return max;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{0, 1, 0, 1, 0, 1, 0, 1, 0};
        LC525 obj = new LC525();
        PrintUtils.printString("res:" + obj.findMaxLength_1(nums));
    }
}
