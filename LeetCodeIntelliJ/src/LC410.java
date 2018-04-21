public class LC410 {

    public int splitArray(int[] nums, int m) {
        int max = 0;
        long sum = 0;
        for(int n : nums) {
            sum += n;
            if(max < n) {
                max = n;
            }
        }

        if(m == 1) {
            return (int)sum;
        }

        long left = max, right = sum;
        while (left <= right) {
            long mid = left + (right - left) / 2;
            if(valid(mid, nums, m)) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }
        return (int)left;
    }

    private boolean valid(long target, int[] nums, int m) {
        int count = 1;
        int sum = 0;
        for(int n : nums) {
            sum += n;
            if(sum > target) {
                sum = n;
                count++;
                if(count > m) {
                    return false;
                }
            }
        }
        return true;
    }

    public static void main(String[] args) {
        int[] nums = new int[] {7,2,5,10,8};
        int m = 2;
        LC410 obj = new LC410();
        int res = obj.splitArray(nums, m);
        PrintUtils.printString("res:" + res);
    }
}
