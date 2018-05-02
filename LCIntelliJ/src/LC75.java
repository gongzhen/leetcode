public class LC75 {

    public void sortColors(int[] nums) {
        int zero = 0;
        for(int i = 0; i < nums.length; i++) {
            while(i > zero && nums[i] == 0) {
                swap(nums, i, zero++);
            }
        }

        int second = nums.length - 1;
        for(int i = 0; i < nums.length; i++) {
            while(i < second && nums[i] == 2) {
                swap(nums, i, second--);
            }
        }
    }

    public void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }

    public static void main(String[] args) {
        LC75 obj = new LC75();
        int[] nums = new int[] {2,0,2,1,1,0};
        obj.sortColors(nums);
        PrintUtils.printArray(nums);
    }
}
