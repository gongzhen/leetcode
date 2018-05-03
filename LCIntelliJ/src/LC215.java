import java.util.Arrays;
import java.util.Random;

public class LC215 {

    public int findKthLargest_1(int[] nums, int k) {
        if(nums.length == 0) {
            return 0;
        }
        shuffle_1(nums);
        k = nums.length - k;
        int i = 0;
        int j = nums.length - 1;
        int index = -1;
        while (i <= j) {
            index = partition_1(nums, i, j);
            if(index == k) {
                break;
            } else if (index < k) {
                i = index + 1;
            } else {
                j = index - 1;
            }
        }

        if(i > j) {
            return nums[j];
        }
        return nums[index];
    }

    public int partition_1(int[] nums, int start, int end) {
        int i = start;
        int j = end;
        int pivot = nums[start];
        while (i < j) {
            while(i < end && nums[i] <= pivot) {
                i++;
            }
            while(start < j && nums[j] >= pivot) {
                j--;
            }

            if(i < j) {
                swap_1(nums, i, j);
                i++;
                j--;
            }
        }
        swap_1(nums, start, j);
        return j;
    }

    private void swap_1(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }

    public void shuffle_1(int[] a) {
        final Random random = new Random();
        for(int ind = 1; ind < a.length; ind++) {
            final int r = random.nextInt(ind + 1);
            swap_1(a, ind, r);
        }
    }

    public int findKthLargest(int[] nums, int k) {
        k = nums.length - k;
        shuffle(nums);
        int i = 0;
        int j = nums.length - 1;
        int index = -1;
        while(i <= j) {
            index = partition(nums, i, j);
            if(index == k) {
                break;
            } else if (index > k) {
                j = index - 1;
            } else {
                i = index + 1;
            }
        }
        if(i > j) {
            return nums[j];
        }
        return nums[index];
    }

    private int partition(int[] nums, int low, int high) {
        int i = low;
        int j = high;
        int pivot = nums[low];
        while(i < j) {
            while(i < high && nums[i] <= pivot) {
                i++;
            }
            while(j > low && nums[j] >= pivot) {
                j--;
            }
            if(i < j) {
                swamp(nums, i, j);
                i++;
                j--;
            }
        }

        swamp(nums, low, j);
        return j;
    }

    private void shuffle(int[] nums) {
        final Random random = new Random();
        for(int i = 1; i < nums.length; i++) {
            final int r = random.nextInt(i + 1);
            swamp(nums, i, r);
        }
    }

    private void swamp(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{3, 2, 3, 1, 2, 4, 5, 5, 6};
        int[] copyNums = Arrays.copyOf(nums, nums.length);
        LC215 obj = new LC215();
        int res = obj.findKthLargest_1(nums, 4);
        Arrays.sort(copyNums);
        PrintUtils.printArray(copyNums);
        PrintUtils.printString("res:" + res + " == " + copyNums[copyNums.length - 4]);

//        int[] nums = new int[]{5, 2, 4, 1, 3, 6, 0};
//        LC215 obj = new LC215();
//        int res = obj.findKthLargest_1(nums, 4);
//        PrintUtils.printString("res:" + res);
    }

}
