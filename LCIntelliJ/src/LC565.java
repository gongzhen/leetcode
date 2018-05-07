public class LC565 {

    public int arrayNesting(int[] nums) {
        if(nums.length == 0) {
            return 0;
        }

        boolean[] visited = new boolean[nums.length];
        int max = 0;
        for(int i = 0; i < nums.length; i++) {
            if(visited[i] == true) {
                continue;
            }
            max = Math.max(max, dfs(nums, i, visited));
        }
        return max;
    }

    private int dfs(int[] nums, int start, boolean[] visited) {
        int i = start;
        int count = 0;
        while(count == 0 || i != start) {
            if(i >= nums.length) {
                break;
            }
            i = nums[i];
            visited[i] = true;
            count++;
        }
        return count;
    }

    public static void main(String[] args) {
        int[] nums = new int[] {5,4,0,3,1,6,2};
        LC565 obj = new LC565();
        obj.arrayNesting(nums);
    }
}
