public class LC209 {

    public int minSubArrayLen(int s, int[] nums) {

        if(nums.length == 0) {
            return 0;
        }

        int sum = 0;
        int minLen = nums.length + 1;
        int i = 0, j = 0;

        while(i < nums.length) {
            sum += nums[i];
            while (sum >= s) {
                if(minLen > i - j + 1) {
                    minLen = i - j + 1;
                }
                sum -= nums[j++];
            }
            i++;
        }

        return (minLen == (nums.length + 1)) ? 0 : minLen;
    }

    public static void main(String[] args) {
        LC209 obj = new LC209();
        int res = obj.minSubArrayLen(7, new int[]{2,3,1,2,4,3});
        PrintUtils.printString("res:" + res);
    }
}
