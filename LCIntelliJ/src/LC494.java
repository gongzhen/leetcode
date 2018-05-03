public class LC494 {

    public int findTargetSumWays(int[] nums, int s) {
        int sum = 0;
        for(int n : nums) {
            sum += n;
        }

        if(s > sum || s < -sum) {
            return 0;
        }

        int n = nums.length;
        int[][] dp = new int[n + 1][sum * 2 + 1];
        dp[0][sum] = 1;
        for(int i = 0; i < n; i++) {
            for(int j = nums[i]; j < 2 * sum + 1 - nums[i]; j++) {
                if(dp[i][j] != 0) {
                    dp[i + 1][j + nums[i]] += dp[i][j];
                    dp[i + 1][j - nums[i]] += dp[i][j];
                }
            }
        }
        return dp[n][s + sum];
    }

    public static void main(String[] args) {
        LC494 obj = new LC494();
        int[] nums = new int[]{1, 1, 1, 1, 1};
        obj.findTargetSumWays(nums, 3);
    }
}
