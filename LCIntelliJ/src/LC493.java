public class LC493 {

    public int reversePairs(int[] nums) {
        int count = 0;
        for(int j = 1; j < nums.length; j++) {
            for(int i = 0; i < j; i++) {
                PrintUtils.printString("res:" + 2 * nums[j]);
                if(nums[i] > 2 * nums[j]) {
                    count++;
                }
            }
        }
        return count;
    }

    public static void main(String[] args) {
        LC493 obj = new LC493();
        obj.reversePairs(new int[]{2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647});
    }
}
