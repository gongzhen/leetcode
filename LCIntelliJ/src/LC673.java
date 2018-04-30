public class LC673 {

    public int findNumberOfLIS(int[] nums) {
        PrintUtils.printArray(nums);
        int n = nums.length, res = 0, max_len = 0;
        int[] len =  new int[n];    /// the length of sequence ended with nums[i]
        int[] cnt = new int[n];     /// the number of sequence ended with nums[i]
        for(int i = 0; i<n; i++){
            len[i] = 1;
            cnt[i] = 1;
            for(int j = 0; j <i ; j++){
                if(nums[i] > nums[j]){
                    if(len[i] == len[j] + 1) {
                        cnt[i] += cnt[j];
                    }
                    if(len[i] < len[j] + 1){
                        len[i] = len[j] + 1;
                        cnt[i] = cnt[j];
                    }
                }
            }
            if(max_len == len[i]) {
                res += cnt[i];
            }
            if(max_len < len[i]){
                max_len = len[i];
                res = cnt[i];
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] nums = new int[]{1,3,5,4,7};
        LC673 obj = new LC673();
        PrintUtils.printString("res:" + obj.findNumberOfLIS(nums));
    }
}
