import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;

public class LC321 {

    private static class Solution1{
        public int[] maxNumber(int[] nums1, int[] nums2, int k) {
            int[] best = new int[0];
            for (int i = Math.max(0, k - nums2.length); i <= Math.min(k, nums1.length); ++i) {
                best = max(best, 0, maxNumber(maxNumber(nums1, i),  maxNumber(nums2, k - i)), 0);
            }
            return best;
        }

        private int[] maxNumber(int[] nums, int k) {
            int[] ans = new int[k];
            int j = 0;
            for (int i = 0; i < nums.length; ++i) {
                while (j > 0 && nums[i] > ans[j - 1] && nums.length - i > k - j) {
                    --j;
                }
                if (j < k) {
                    ans[j++] = nums[i];
                }
            }
            return ans;
        }

        private int[] maxNumber(int[] nums1, int[] nums2) {
            int[] ans = new int[nums1.length + nums2.length];
            int s1 = 0;
            int s2 = 0;
            int index = 0;
            while (s1 != nums1.length || s2 != nums2.length)
                ans[index++] = max(nums1, s1, nums2, s2) == nums1 ?
                        nums1[s1++] : nums2[s2++];
            PrintUtils.printArray(ans);
            return ans;
        }

        private int[] max(int[] nums1, int s1, int[] nums2, int s2) {
            for (int i = s1; i < nums1.length; ++i) {
                int j = s2 + i - s1;
                if (j >= nums2.length) return nums1;
                if (nums1[i] < nums2[j]) return nums2;
                if (nums1[i] > nums2[j]) return nums1;
            }
            return nums2;
        }
    }

    public int[] maxNumber(int[] nums1, int[] nums2, int k) {
        int[] result = new int[k];
        for(int i = 0; i <= k; i++) {
            int k2 = k - i;
            if(i > nums1.length || k2 > nums2.length) {
                continue;
            }
            int[] n1 = max(nums1, i);
            int[] n2 = max(nums2, k2);
            int[] maxArray = maxArray(n1, n2, k);
            findMax(result, maxArray);
        }
        return result;
    }

    private void findMax(int[] nums1, int[] nums2) {
        PrintUtils.printArray(nums1);
        PrintUtils.printArray(nums2);
        PrintUtils.printLine();
        int i = 0;
        int j = 0;
        while(i < nums1.length && j < nums2.length) {
            if(nums1[i] != nums2[j]) {
                if(nums1[i] > nums2[j]) {
                    break;
                }
                else if(nums1[i] < nums2[j]) {
                    copyArray(nums1, nums2);
                    return;
                }
            }
            i++;
            j++;
        }
    }

    private void copyArray(int[] array1, int[] array2) {
        int i = 0, j = 0;
        while(i < array1.length && j < array2.length) {
            array1[i++] = array2[j++];
        }
    }

    public int[] maxArray(int[] nums1, int[] nums2, int k) {
        int[] nums = new int[nums1.length + nums2.length];
        int i = 0, j = 0;
        for(int r = 0; r < k; r++) {
            if(greater(nums1, i, nums2, j) == true) {
                nums[r] = nums1[i++];
            } else {
                nums[r] = nums2[j++];
            }
        }
        return nums;
    }

    private boolean greater(int[] nums1, int i, int[] nums2, int j) {
        while(i < nums1.length && j < nums2.length && nums1[i] == nums2[j]) {
            i++; j++;
        }
        return j == nums2.length || (i < nums1.length && nums1[i] > nums2[j]);
    }

    public int[] max(int[] nums, int k) {
        if(k == 0) {
            return new int[]{};
        }
        Stack<Integer> stack = new Stack<>();
        int pop = nums.length - k; /// number of nums can be popped.
        for(int n : nums) {
            if(stack.isEmpty()) {
                stack.push(n);
            } else {
                while(!stack.isEmpty() && stack.peek() < n && pop > 0) {
                    stack.pop();
                    pop--;
                }
                stack.push(n);
            }
        }

        int i = 0;
        int[] res = new int[k];
        Iterator<Integer> itr = stack.iterator();
        while (i < k && itr.hasNext()) {
            res[i++] = itr.next();
        }

        return res;
    }

    public static void main(String[] args) {
        LC321 obj = new LC321();
//        int[] nums1 = new int[]{3, 4, 6, 5};
//        int[] nums2 = new int[]{9, 1, 2, 5, 8, 3};
//        obj.maxNumber(nums1, nums2, 5);

//        int[] nums3 = new int[]{6, 7};
//        int[] nums4 = new int[]{6, 0, 4};
//        obj.maxNumber(nums3, nums4, 5);
//
//        int[] nums5 = new int[]{3, 9};
//        int[] nums6 = new int[]{8, 9};
//        obj.maxNumber(nums5, nums6, 3);

        int[] nums7 = new int[]{2,5,6,4,4,0};
        int[] nums8 = new int[]{7,3,8,0,6,5,7,6,2};
        obj.maxNumber(nums7, nums8, 15);

//        Solution1 s1 = new Solution1();
//        s1.maxNumber(nums1, nums2, 5);
    }
}
