public class LC689 {

    public int[] maxSumOfThreeSubarrays(int[] nums, int k) {
        int n = nums.length;
        int maxSum = 0;
        int[] sum = new int[n + 1];
        int[] posLeft = new int[n];
        int[] posRight = new int[n];
        int[] ans = new int[3];

        for(int i = 0; i < n; i++) {
            sum[i + 1] = sum[i] + nums[i];
        }

        int total = sum[k] - sum[0];
        for(int i = k; i < n; i++) {
            int current = sum[i + 1] - sum[i + 1 - k];
            if(current > total) {
                posLeft[i] = i + 1 - k;
                total = current;
            } else {
                posLeft[i] = posLeft[i - 1];
            }
        }

        posRight[n - k] = n - k;
        total = sum[n] - sum[n - k];
        for (int i = n-k-1; i >= 0; i--) {
            int current = sum[i+k]-sum[i];
            if (current >= total) {
                posRight[i] = i;
                total = current;
            }
            else {
                posRight[i] = posRight[i+1];
            }
        }
        // test all possible middle interval
        for (int i = k; i <= n-2*k; i++) {
            int l = posLeft[i-1], r = posRight[i+k];
            int tot = (sum[i+k]-sum[i]) + (sum[l+k]-sum[l]) + (sum[r+k]-sum[r]);
            if (tot > maxSum) {
                maxSum = tot;
                ans[0] = l;
                ans[1] = i;
                ans[2] = r;
            }
        }
        return ans;
    }

    private int[][] direction = new int[][]{{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

    private void printLine() {
        System.out.println("---------------------");
    }

    private void printString(String arg) {
        System.out.println(arg);
    }

    private void printList(int[] list, int length) {
        for(int i = 0; i < length; i ++ ){
            System.out.println(list[i]);
        }
    }

    public static void main(String[] args) {
        LC689 obj = new LC689();
        int[] array = new int[] {1,2,1,2,6,7,5,1};
        int[] res = obj.maxSumOfThreeSubarrays(array, 2);
        for(int i = 0; i < res.length; i++) {
            PrintUtils.printString(res[i] + ",");
        }
    }

}
