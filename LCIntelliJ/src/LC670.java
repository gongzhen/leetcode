import java.util.Arrays;

public class LC670 {

    public int maximumSwap(int num) {
        char[] nums = Integer.toString(num).toCharArray();
        char[] A = Arrays.copyOf(nums, nums.length);
        for(int i = 0; i < nums.length; i++) {
            for(int j = i + 1; j < nums.length; j++) {
                char temp = nums[i];
                nums[i] = nums[j];
                nums[j] = temp;
                for(int k = 0; k < nums.length; k++) {
                    if(nums[k] != A[k]) {
                        if(nums[k] > A[k]) {
                            A = Arrays.copyOf(nums, nums.length);
                        }
                        break;
                    }
                }
                nums[j] = nums[i];
                nums[i] = temp;
            }
        }
        return Integer.parseInt(new String(A));
    }


    public static void main(String[] args) {

    }
}
