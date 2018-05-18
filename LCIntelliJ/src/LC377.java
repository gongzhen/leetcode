import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LC377 {

    public int combinationSum4Recursive(int[] nums, int target) {
        if(target == 0) {
            return 1;
        }

        int res = 0;
        for(int i = 0; i < nums.length; i++) {
            if(target >= nums[i]) {
                res += combinationSum4Recursive(nums, target - nums[i]);
            }
        }
        return res;
    }

    public int combinationSum4DPDownTop(int[] nums, int target) {
        int[] dp = new int[target + 1];
        dp[0] = 1;
        for(int i = 1; i < dp.length; i++) {
            for(int j = 0; j < nums.length; j++) {
                if(i - nums[j] >= 0) {
                    dp[i] = dp[i] + dp[i - nums[j]];
                }
            }
        }
        return dp[target];
    }

    public int combinationSum4DPTopDown(int[] nums, int target) {
        int[] dp = new int[target + 1];
        Arrays.fill(dp, -1);
        dp[0] = 1;
        return dfs(nums, target, dp);
    }

    private int dfs(int[] nums, int target, int[] dp) {
        if(dp[target] != -1) {
            return dp[target];
        }

        int res = 0;
        for(int i = 0; i < nums.length; i++) {
            if(target >= nums[i]) {
                res += dfs(nums, target - nums[i], dp);
            }
        }
        dp[target] = res;
        return dp[target];
    }

    public int combinationSum4TLE(int[] nums, int target) {
        List<Integer> list = new ArrayList<>();
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        dfs(res, list, nums, target);
//        PrintUtils.printListOfListInteger(res);
        return res.size();
    }

    private void dfs(List<List<Integer>> res, List<Integer> list, int[] nums, int target) {
        if(sumOfList(list) == target) {
            res.add(new ArrayList<>(list));
            return;
        }
        if(sumOfList(list) > target) return;

        for(int i = 0; i < nums.length; i++) {
            list.add(nums[i]);
            dfs(res, list, nums, target);
            list.remove(list.size() - 1);
        }
    }

    private int sumOfList(List<Integer> list) {
        int sum = 0;
        for(Integer n : list) {
            sum += n;
        }
        return sum;
    }

    public static void main(String[] args) {
        int[] nums = new int[] {4, 2, 1};
        LC377 obj = new LC377();
        PrintUtils.printString("res:" + obj.combinationSum4TLE(nums, 12));
        PrintUtils.printString("res:" + obj.combinationSum4Recursive(nums, 12));
        PrintUtils.printString("res:" + obj.combinationSum4DPTopDown(nums, 12));
        PrintUtils.printString("res:" + obj.combinationSum4DPDownTop(nums, 12));
    }
}
