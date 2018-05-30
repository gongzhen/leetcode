public class LC644 {

    /*
    * Given an array consisting of n integers, find the contiguous subarray whose length is greater than or equal to k that has the maximum average value. And you need to output the maximum average value.

        Example 1:

        Input: [1,12,-5,-6,50,3], k = 4
        Output: 12.75
        Explanation:
        when length is 5, maximum average value is 10.8,
        when length is 6, maximum average value is 9.16667.
        Thus return 12.75.
        Note:

        1 <= k <= n <= 10,000.
        Elements of the given array will be in range [-10,000, 10,000].
        The answer with the calculation error less than 10-5 will be accepted.
    *
    * */

    private static class Solution {
        /// https://blog.csdn.net/MebiuW/article/details/76222743
        public double findMaxAverage(int[] nums, int k) {
            double max = Double.MIN_VALUE;
            double min = Double.MAX_VALUE;

            // 寻找最值
            for (int n: nums) {
                max = Math.max(max, n);
                min = Math.min(min, n);
            }

            while (max-min > 0.00001) {
                double mid = (max + min) / 2.0;
                if (check(nums, mid, k))
                    min = mid;
                else
                    max = mid;
            }
            return min;
        }


        // 判断这个区间里面，是否有一段大于等于K的长度的最长序列，满足要求，就是最大的累计和，减去最小的累积和
        public boolean check(int[] nums, double mid, int k) {
            double sum = 0, prev = 0, min_sum = 0;
            for (int i = 0; i < k; i++) {
                sum += nums[i] - mid; // 0:-21, 1:-31 2:58 3:-86
            }
            if (sum >= 0)
                return true;
            for (int i = k; i < nums.length; i++) {
                sum += nums[i] - mid;
                prev += nums[i - k] - mid; // prev: 0:-21, 1:-31
                min_sum = Math.min(prev, min_sum);
                if (sum - min_sum >= 0) {
                    return true;
                }
            }
            return false;
        }
    }

    private static class Solution1 {
        /// http://www.cnblogs.com/grandyang/p/8021421.html
        public double findMaxAverage(int[] nums, int k) {
            double preSum = sumArray(nums, k);
            double sum = preSum, res = preSum / (double)k;
            for(int i = k; i < nums.length; i++) {
                preSum += nums[i];
                sum = preSum;
                if(sum > res * ( i + 1)) {
                    res = sum / (i + 1);
                }
                for(int j = 0; j <= i - k; j++) {
                    sum -= nums[j];
                    if(sum > res * (i - j)) {
                        res = sum / (double)(i - j);
                    }
                }
            }
            return res;
        }

        public double sumArray(int[] nums, int k) {
            if(k >= nums.length) {
                return 0.0;
            }
            double sum = 0.0;
            for(int i = 0; i < k; i++) {
                sum += nums[i];
            }
            return sum;
        }
    }

    public double findMaxAverage(int[] nums, int k){
        if(nums.length == 0) {
            return 0.0;
        }
        if(k >= nums.length) {
            return sumArray(nums) / (double)k;
        }

        /// Input: [1, 12, -5,-6, 50, 3], k = 4
        ///         1, 13,  8, 2, 52, 55
        double max = 0.0;
        for(int i = 0; i < nums.length; i++) {
            int sum = 0;
            int len = k;
            while(i + len <= nums.length) {
                for(int j = i; j < nums.length && j <  i + len; j++) {
                    sum += nums[j];
                }
                max = Math.max(max, sum / (double)len);
                len++;
                sum = 0;
            }
        }
        return max;
    }

    private int sumArray(int[] nums) {
        int sum = 0;
        for(int n : nums) {
            sum += n;
        }
        return sum;
    }

    public static void main(String[] args) {
        LC644 obj = new LC644();
//        int[] nums = new int[]{1,12,-5,-6, 50, 3};
//        int k = 4;
//        PrintUtils.printString("res:" + obj.findMaxAverage(nums, k));

//        int[] nums1 = new int[]{3, 3, 4, 3, 0};
//        int k = 3;
//        PrintUtils.printString("res:" + obj.findMaxAverage(nums1, k));

//        int[] nums2 = new int[]{0, 1, 1, 3, 3};
//        int k = 4;
//        PrintUtils.printString("res:" + obj.findMaxAverage(nums2, k));

//        Solution solution = new Solution();
//        int[] nums = new int[]{1, 12,-5,-6, 50, 3};
//        int k = 4;
//        PrintUtils.printString("res:" + solution.findMaxAverage(nums, k));

        Solution1 solution1 = new Solution1();
        int[] nums = new int[]{1, 12,-5,-6, 50, 3};
        int k = 4;
        PrintUtils.printString("res:" + solution1.findMaxAverage(nums, k));

    }
}
