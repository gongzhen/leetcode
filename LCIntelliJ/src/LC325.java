import java.util.HashMap;
import java.util.Map;

public class LC325 {

    public int maxSubArrayLen(int[] nums, int k) {
        if(nums == null || nums.length == 0) {
            return 0;
        }

        Map<Integer, Integer> map = new HashMap<>();
        int sum = 0;
        int max = 0;
        for(int i = 0; i < nums.length; i++) {
            sum += nums[i];
            if(sum == k) {
                max = i + 1;
            } else if (map.containsKey(sum - k)){
                max = Math.max(max, i - map.get(sum - k));
            }

            if(map.containsKey(sum) == false) {
                map.put(sum, i);
            }
        }
        return max;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{1, -1, 5, -2, 3};
        LC325 obj = new LC325();
        PrintUtils.printString("res:" + obj.maxSubArrayLen(nums, 3));
    }
}
