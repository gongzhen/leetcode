import java.util.Arrays;

public class LC31 {

    public void nextPermutation(int[] nums) {
        int index = nums.length - 1;
        int len = nums.length;
        while(index - 1 >= 0 && nums[index] <= nums[index - 1]) {
            index--;
        }

        if(index == 0) {
            Arrays.sort(nums);
            return;
        }

        int secondLarge = Integer.MAX_VALUE;
        int secondIndex = Integer.MAX_VALUE;

        for(int i = len -1; i >= index; i--) {
            if(nums[index - 1] < nums[i]) {
                if(nums[i] < secondLarge) {
                    secondLarge = nums[i];
                    secondIndex = i;
                }
            }
        }

        int temp = nums[index - 1];
        nums[index - 1] = secondLarge;
        nums[secondIndex] = temp;
        Arrays.sort(nums, index, len);
        PrintUtils.printArray(nums);
    }

    public static void main(String[] args) {
        LC31 obj = new LC31();
        obj.nextPermutation(new int[]{1, 3, 2});
    }
}
