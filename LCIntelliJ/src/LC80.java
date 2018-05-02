public class LC80 {

    public int removeDuplicates(int[] nums) {

        int j = 0;
        for(int i = 0; i < nums.length; i++) {
            if(j < 2 || j >= 2 && nums[i] > nums[j - 2]) {
                nums[j++] = nums[i];
            }
        }
        return j;
    }

    public static void main(String[] args) {
        LC80 obj = new LC80();
        int nums[] = {1,1,1,2,2,3};
        int res = obj.removeDuplicates(nums);
        PrintUtils.printString("res:" + res);
    }
}
