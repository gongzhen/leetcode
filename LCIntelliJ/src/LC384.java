import java.util.Arrays;
import java.util.Random;

public class LC384 {

    public static class Solution {

        private int[] nums;
        private Random random;
        public Solution(int[] nums) {
            this.nums = nums;
            this.random = new Random();
        }

        /** Resets the array to its original configuration and return it. */
        public int[] reset() {
            return this.nums;
        }

        /** Returns a random shuffling of the array. */
        public int[] shuffle() {
            if(this.nums == null || this.nums.length == 0) {
                return null;
            }
            int[] copy = Arrays.copyOf(this.nums, this.nums.length);
            for(int i = 1; i < copy.length; i++) {
                int r = random.nextInt(i + 1);
                swap(copy, r, i);
            }
            return copy;
        }

        private void swap(int[] nums, int i, int j) {
            int temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
        }

    }

    public static void main(String[] args) {
        int[] nums = new int[] {1, 2, 3};
        Solution obj = new Solution(nums);
        int[] res = obj.shuffle();
        PrintUtils.printArray(res);
        int[] original = obj.reset();
        PrintUtils.printArray(original);
    }
}
