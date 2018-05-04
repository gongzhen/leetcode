import java.util.Random;

class Solution {

    int[] nums;
    Random random;

    public Solution(int[] nums) {
        this.nums = nums;
        this.random = new Random();
    }

    public int pick(int target) {
        int count = 0;
        int res = -1;
        for(int i = 0; i < this.nums.length; i++) {
            if(target != this.nums[i]) {
                continue;
            }
            count++;
            if(this.random.nextInt(count) == 0) {
                res = i;
            }
        }
        PrintUtils.printString("res:" + res);
        return res;
    }

}

public class LC398 {

    public static void main(String[] args) {
        int[] nums = new int[]{1,2,3,3,3};
        Solution solution = new Solution(nums);
        for(int i = 0; i < 10; i++) {
            solution.pick(3);
        }

    }
}
