import java.util.HashMap;
import java.util.Map;

public class LC560 {

    public int subarraySum(int[] nums, int k) {
        int count = 0;
        int n = nums.length;
        for(int i = 0; i < n; i++) {
            int sum = nums[i];
            for(int j = i + 1; j <= n; j++) {
                if(sum == k) {
                    count++;
                }
                if(j == n) {
                    break;
                }
                sum += nums[j];

            }
        }
        PrintUtils.printString("res:" + count);
        return count;
    }

    public int subarraySum_2(int[] nums, int k) {
        int sum = 0, result = 0;
        Map<Integer, Integer> preSum = new HashMap<>();
        /// put 0 and 1.
        /// 1 is the number of how many sums here.
        /// only 1 sum is === 0

        preSum.put(0, 1);

        for (int i = 0; i < nums.length; i++) {
            sum += nums[i];
            if (preSum.containsKey(sum - k)) {
                result += preSum.get(sum - k);
            }
            preSum.put(sum, preSum.getOrDefault(sum, 0) + 1);
        }

        return result;
    }

    public static void main(String[] args) {
        LC560 obj = new LC560();
        obj.subarraySum_2(new int[]{28,54,7,-70,22,65,-6}, 100);

//        LC560 obj = new LC560();
//        obj.subarraySum_2(new int[]{0,0,0,0,0,0,0,0,0,0}, 0);
    }
}
